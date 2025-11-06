Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B520CCCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:39:26 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v2] imagemagick: adds ptest for imagemagick recipe
To: openembedded-devel@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: IN (1.6.138.68)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 06 Nov 2025 01:39:16 -0800
References: <116884.1762145303951599276@lists.openembedded.org> <142688.1762248598727477659@lists.openembedded.org> <193319.1762406171835153307@lists.openembedded.org> <CA+s=J=y=OWL_KfpjtZcewF5Qsb1gW4-eLAGp+Tw9CQ6mqTHSHQ@mail.gmail.com>
In-Reply-To: <CA+s=J=y=OWL_KfpjtZcewF5Qsb1gW4-eLAGp+Tw9CQ6mqTHSHQ@mail.gmail.com>
Message-ID: <193319.1762421956956925614@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8Ugu0FhD6MJ9Rlu32w9d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121362

--8Ugu0FhD6MJ9Rlu32w9d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Anuj ,

1) For scarthgap imagemagick version uses "convert" binary for its central =
operations whereas latest version of imagemagick uses "magick" [ in master =
]

master=C2=A0 =C2=A0 =C2=A0 =C2=A0: *"magick"=C2=A0 =C2=A0is central binary =
and all other supporting binaries are symlink to it*
scarthgap=C2=A0 : *"convert" is central binary and all other supporting bin=
aries are symlink to it*

2) Have created same ptest (with "magick" ) for master branch @ https://lis=
ts.openembedded.org/g/openembedded-devel/topic/meta_oe_master_patch_v2/1161=
49980
This causes same patch logic but with respective central binaries to be use=
d in their respective branches

3) I can rework on logic if any suggestion from team or if there is another=
 suggested approach for such scenario

Thanks ,

Ashish Kumar Mishra

--8Ugu0FhD6MJ9Rlu32w9d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"msgbody259079790" class=3D"user-content" style=3D"box-sizing: bo=
rder-box; color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helv=
etica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Colo=
r Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-siz=
e: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-ali=
gn: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-=
thickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;">
<div class=3D"forcebreak" dir=3D"auto" style=3D"box-sizing: border-box; ove=
rflow-wrap: break-word !important;">
<div dir=3D"ltr" style=3D"box-sizing: border-box; overflow-wrap: break-word=
 !important;">
<div class=3D"gmail_quote gmail_quote_container" style=3D"box-sizing: borde=
r-box; overflow-wrap: break-word !important;">Dear Anuj ,&nbsp;<br /><br />=
</div>
</div>
</div>
</div>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">1) For scarthgap =
imagemagick version uses "convert" binary for its central operations wherea=
s latest version of imagemagick uses "magick" [ in master ]&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp; &nbsp;mast=
er&nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; <strong>"magick"&nbsp; &nbsp;is centra=
l binary and all other supporting binaries are symlink to it</strong>&nbsp;=
<br />&nbsp; &nbsp;scarthgap&nbsp; :&nbsp; <strong>"convert" is central bin=
ary and all other supporting binaries are symlink to it&nbsp;</strong></p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">2) Have created s=
ame ptest (with "magick" ) for master branch @&nbsp; &nbsp;&nbsp;<a href=3D=
"https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_master_p=
atch_v2/116149980" target=3D"_blank" rel=3D"noopener">https://lists.openemb=
edded.org/g/openembedded-devel/topic/meta_oe_master_patch_v2/116149980</a>&=
nbsp;<br />&nbsp; &nbsp; This causes same patch logic but with respective c=
entral binaries to be used in their respective branches&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">3) I can rework o=
n logic if any suggestion from team or if there is another suggested approa=
ch for such scenario</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">Thanks ,</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">Ashish Kumar Mish=
ra&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp; &nbsp;</p>
<p style=3D"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; f=
ont-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', '=
Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',=
 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">&nbsp;&nbsp;</p>
<div class=3D"table-highlight-background-color" style=3D"box-sizing: border=
-box; background-color: #eeeeee; color: #333333; font-family: system-ui, 'S=
egoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, =
sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto=
 Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
idows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: n=
ormal; text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial; margin-left: -10px; margin-right: -10px; ma=
rgin-bottom: -10px; padding: 4px 10px 2px; border-bottom-left-radius: 4px; =
border-bottom-right-radius: 4px;">
<div class=3D"row" style=3D"box-sizing: border-box; margin-right: -15px; ma=
rgin-left: -15px;">
<div class=3D"col-xs-4 text-left" style=3D"box-sizing: border-box; text-ali=
gn: left; position: relative; min-height: 1px; padding-right: 15px; padding=
-left: 15px; float: left; width: 746.323px;">&nbsp;</div>
</div>
</div>

--8Ugu0FhD6MJ9Rlu32w9d--

