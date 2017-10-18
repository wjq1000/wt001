unit dlginfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, mylib;

type
  TinfoBox = class(TForm)
    LbInfo: TcxLabel;
    Image1: TImage;
    Panel1: TPanel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    infoClass: string;
    infotitle: string;
    infoKey: string;
  end;

function showInfoBox(pm: TParams): string;


implementation

{$R *.dfm}

{ TinfoBox }

function showInfoBox(pm: TParams): string;
var
  infoBox: TinfoBox;
begin
  infoBox := TinfoBox.Create(nil);
  infoBox.infoClass := pm.p1;
  infoBox.LbInfo.Caption := pm.p2;
  infoBox.infotitle := pm.p3;
  infoBox.infoKey := pm.p4;
  if infobox.ShowModal = mrok then
  begin
  end;
end;

procedure TinfoBox.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TinfoBox.btnSaveClick(Sender: TObject);
var
  mContent: string;
begin
  mContent := '经确认手机 ' + infoKey + ' 正常，特申请删除该号码黑名单记录 ';
  sendSiteMessage3('申请删除电话黑名单', mContent);
end;

end.

