%Guitar

function varargout = tunner(varargin)
% TUNNER MATLAB code for tunner.fig
%      TUNNER, by itself, creates a new TUNNER or raises the existing
%      singleton*.
%
%      H = TUNNER returns the handle to a new TUNNER or the handle to
%      the existing singleton*.
%
%      TUNNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUNNER.M with the given input arguments.
%
%      TUNNER('Property','Value',...) creates a new TUNNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tunner_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tunner_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tunner

% Last Modified by GUIDE v2.5 07-Jan-2020 22:29:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tunner_OpeningFcn, ...
                   'gui_OutputFcn',  @tunner_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before tunner is made visible.
function tunner_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tunner (see VARARGIN)

% Choose default command line output for tunner
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global audio1fs;
global audio1;
global audio2fs;
global audio2;

[audio1,audio1fs] = audioread('media/cangday.m4a');
[audio2,audio2fs] = audioread('media/noilong.m4a');
% UIWAIT makes tunner wait for user response (see UIRESUME)
% uiwait(handles.figure1);
lg = imread('media/logo.png');
axes(handles.logo);
imshow(lg);


% --- Outputs from this function are returned to the command line.
function varargout = tunner_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','On');
set(handles.uipanel2,'Visible','Off');
set(handles.text5,'Visible','Off');
set(handles.text6,'Visible','Off');
set(handles.text1,'Visible','On');
set(handles.mensaje,'Visible','On');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','Off');
set(handles.uipanel2,'Visible','On');
set(handles.text1,'Visible','Off');
set(handles.mensaje,'Visible','Off');
set(handles.text5,'Visible','On');
set(handles.text6,'Visible','On');

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global audio1fs;
global audio1;
global audio2fs;
global audio2;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text11, 'Visible', 'off');
set(handles.text8, 'Visible', 'off');
set(handles.text14, 'Visible', 'off');
set(handles.text15, 'Visible', 'off');
set(handles.mensaje,'String','');
handles.String='Grababdo';
set(handles.pushbutton1,'String','Ghi âm trong 3s....');
set(handles.pushbutton1,'ForegroundColor','red');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Tan so cac not theo Hz%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

E2 = 82.407;  %Mi
A2 = 110.00;  %LA
D3 = 146.832; %RE
G3 = 195.998; %SOL
B3 = 246.942; %SI
E4 = 329.628; %MI


%%%Thong so ghi am%%%%

Fs=1000;                                % Ti le lay mau
nBits = 16;                             % 
nChannels = 1;                          % So luong kenh: 1-Mono, 2-Stereo
timeRecord = 3;                         % Thoi gian lay mau bang giây


%%%%%%%%%%%Ghi âm...%%%%%%%%%%%

recObj = audiorecorder(Fs, nBits, nChannels);   %Tao mot ham ghi lai am thanh ben ngoai
recordblocking(recObj, timeRecord);             % Ghi lai âm thanh trong recObj trong 5 giây
myRecordingBeforeFilter = getaudiodata(recObj); %Ham myRecordingBeforeFilter nhan am thanh recObj duoi dang so va luu tru no.

%Filtro BandPass
order    = 10;
fcutlow  = 70;
fcuthigh = 450;
[b,a]    = butter(order,[fcutlow fcuthigh]/(Fs/2), 'bandpass');
myRecording = filter(b,a,myRecordingBeforeFilter);



%%Chuyen doi mien cua tan so%%

[i j] = size(myRecording);              % i: So hàng trong vector MyRecording(kích thuoc tín hi?u) - j: So luong cot(kênh duocc su dung trong ghi âm)
NFFT = 2^nextpow2(i);                   % Toi uu hóa fft
fastFT = fft(myRecording, NFFT)/i;      % Hàm fft (fast fouriertransform) duoc su dung de chuyen doi sang mien tan so
f = Fs/2*linspace(0,1,NFFT/2+1);        % Các mau tuong duong duoc lay de mô hình truc x theo tan so
Y = 2*abs(fastFT(1:NFFT/2+1));          % Tuong ung voi truc | Y (f) | cua bieu do fft


%%%%%%%%%%%Ve do thi%%%%%%%%%%%%


handles.axes1=plot(handles.axes1,myRecording);

handles.axes2=plot(handles.axes2,f,Y);           % Ve do thi tin hieu do thi dau vao trong mien Fourier                              % Tên c?a tr?c và bi?u ?? ???c t?o

    musicalNoteFrequency = f(Y == max(Y));           % Tan so co ban cua âm thanh duocc luu tru

chord = get(handles.popupmenu1,'Value');         % Mang lai giá tri cua popupmenu do nguoi dùng chon.
tensar=imread('media/cangday.png');
destensar=imread('media/noilong.png');
ok = imread('media/ok.png');

axes(handles.logo);
%set(gca,'visible','off')
%set(get(gca,'children'),'visible','off')


set(handles.text12, 'Visible', 'on');
set(handles.text13, 'Visible', 'on');
set(handles.mensaje, 'Visible', 'on');

set(handles.text11, 'Visible', 'on');
set(handles.text8, 'Visible', 'on');
set(handles.text14, 'Visible', 'on');
set(handles.text15, 'Visible', 'on');


axes(handles.afinarImg);
switch chord                                                                %So sanh voi cac tan so co ban
    case 1                                                                  % 
        set(handles.text8,'String',musicalNoteFrequency);
        set(handles.text15,'String','329.628');
        if abs(musicalNoteFrequency - E4) < 2                               % Dung sai 2Hz 
            imshow(ok);
            set(handles.mensaje,'String','Da tinh chinh dây MI');         % Các thông báo duoc hien thi trong hop van ban tinh nam trên nút "Tinh chinh!". 
        elseif (musicalNoteFrequency - E4) < 0                              % Neu tan so co ban cua chuoi nho hon lý tuong
            imshow(tensar);
            imshow(tensar);                                                 
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tiep tuc cang day dan');
        elseif (musicalNoteFrequency - E4) > 0                              % Neu tan so co ban cua chuoi lon hon lý tuong
            imshow(destensar);                                              
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','N?i l?ng dây ?àn');
        
        end
      
    case 2                                                                 % Dây 2 (SI)
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','246.942');
        if abs(musicalNoteFrequency - B3) < 2                              
            imshow(ok);
            set(handles.mensaje,'String','Da tinh chinh dây SI');         %  Các thông báo duoc hien thi trong hop van ban tinh nam trên nút "Tinh chinh!". 
        elseif (musicalNoteFrequency - B3) < 0                             % Neu tan so co ban cua chuoi nho hon lý tuong
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tiep tuc cang day dan');
        elseif (musicalNoteFrequency - B3) > 0                             % Neu tan so co ban cua chuoi lon hon lý tuong
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Noi long day dan');
        end
        
    case 3                                                                 
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','195.998');
        if abs(musicalNoteFrequency - G3) < 2                              
            imshow(ok);
            set(handles.mensaje,'String','Da tinh chinh dây SOL');         
        elseif (musicalNoteFrequency - G3) < 0                             
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tiep tuc cang day dan');
        elseif (musicalNoteFrequency - G3) > 0                             
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Noi long day dan');
        end
         
    case 4                                                                 
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','146.832');
        if abs( musicalNoteFrequency - D3) < 2                              
            imshow(ok);
            set(handles.mensaje,'String','Da tinh chinh dây RE');          
        elseif ( musicalNoteFrequency - D3) < 0                            
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tiep tuc cang day dan');
        elseif ( musicalNoteFrequency - D3) > 0                             
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Noi long day dan');
        end
         
    case 5                                                                 
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','110.00');
        if abs(musicalNoteFrequency - A2) < 2                              
            imshow(ok);
            set(handles.mensaje,'String','Da tinh chinh dây LA');         
        elseif (musicalNoteFrequency - A2) < 0                             
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tiep tuc cang day dan');
        elseif (musicalNoteFrequency - A2) > 0                             
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Noi long day dan');
        end
         
    case 6                                                                
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','82.407');
        if abs(musicalNoteFrequency - E2) < 2                              
            imshow(ok);
            set(handles.mensaje,'String','Da tinh chinh dây MI');        
        elseif (musicalNoteFrequency - E2) < 0                             
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tiep tuc cang day dan');
        elseif (musicalNoteFrequency - E2) > 0                            
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Noi long day dan');
        end                 
end


set(handles.pushbutton1,'ForegroundColor','red');
set(handles.pushbutton1,'String','Tiep tuc tinh chinh...');




% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
