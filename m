Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E87ACAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:05:48 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.9911.1759413943477973050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dwz6JjSp;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso1981366a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759413942; x=1760018742; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4Zfg/wQrwmYgBSOdncR/GoZxoIs4YDXF4DheoeYuQY=;
        b=Dwz6JjSp+Z4c5Ce5WFNQy5uWUM/16bQQEH3DVQlkon+B/dayFoPFR07K31XJegQaYR
         tz5ft6fMl6ai9zzKuk9JS70h+oQPZGUHGJ6vYRWCvT2DGVLKSuOmgQmrFeu4Ctw+7PR4
         jv+HrmhCBGar4x9nXSnbQm+TL3btCmKoL9PrXjSBWqy/h+hTPVbDP84ME/1AQejkBO+6
         R5UnSTDYXyKYIDYOVPXBbQ5Q+z/vTEE8seXi2NwFiepvEUnhbU/mCcNPB8FSa6VSJZgv
         Dj0hB1La8+Gl6BrzSPBhXQILFVUD2Dp7W/M17dH+/O+pykIRxVL6PMDAtgl+B+acJflj
         v0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759413942; x=1760018742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4Zfg/wQrwmYgBSOdncR/GoZxoIs4YDXF4DheoeYuQY=;
        b=oePgDJLQP2+pBq0sRkNGzGoY4GyLVxEOVZkROtoPEFLnalXC8cHQMe0MDK6/++qHSP
         Do48Uci+6Wc0Ym9xcopQk/KHWBSlBBAuejh4M+vqTN/gFfDfoMAlESY4lgozAHqC40y5
         wMdEwESylPXRXUp1uk/ueLOhI9dMuz4ffHe2SPVW/ychgmJvSbhJ26zWlSTT6s+j86q3
         HA8GmIRUh2Bm/4886WXhELcz4xhgYdebPaVS8Ewg0fkh+y017c3D0MdEHw1do2efUAdL
         X6m+GP2oIwqepeDGBsr90gLaSr+9xHbQuzlvMGvGsIqnOZ6MSu0dWHeq9dqFaI7+EvBQ
         JujA==
X-Forwarded-Encrypted: i=1; AJvYcCUcWZweoBJoacnSVS9zhpxc4HRC/GFmInLDCQiI/PVcMMwHiSNqx/1EBiJrahwTQ5rdqxTo0FKKXnt+CpdH9iTDQWY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy625u+bHq6f/Lflpht2XL8QBSg13cRnhDw1tmFMTirSmbouupW
	ZU11l/xPp2SWRl4A+8VyHYq+1GqnS+IbXC0QZJ0PWtAmMXxyHnIXuX/RSs+FrXC2Npm0i3pLVzs
	pJrL0LYMsQjX0ZPcGv6yEOIQJoNeYoDuHQpxDMMU=
X-Gm-Gg: ASbGnctXFTRv1OI21cBdkqbSYGVVBjNk0VZB3OZgXBMG5Gq8xXgFcZFeAHl2p6y5NXk
	UK+JLt9w5vHclLI02B2YQQcv64r6EDT5GBfkBWOq+EhzdsxNeN7LjPhZ/eIAucuuVGi+I0912Ss
	nspIUW+bIqh74OES4PruEeVzblmRtuGRu7K0f3M2f3Zq8L5/gmW1pcitR0b1g9i4QlM79qgWuxE
	ImWVrB+fG7D0GITCNqie4mbZvbyRzWLqZE6/CRAvvs=
X-Google-Smtp-Source: AGHT+IG/9pzEH4KRvQ5JXAvcfRBzxaXUpAB3mVUN2qbZRY1ah5N7hdCjPsQZiAclI2CMUopX8c6F4UW8L9sJH5IdrkE=
X-Received: by 2002:a17:907:c22:b0:b3a:e4b3:eeb9 with SMTP id
 a640c23a62f3a-b46e78cd108mr983261266b.55.1759413941411; Thu, 02 Oct 2025
 07:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251001130452.542-1-joao.lima@hbkworld.com> <a799cdbe-54b5-484e-84e2-4a847236aa3d@gmail.com>
 <DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7A@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7A@DB3PR09MB6202.eurprd09.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 2 Oct 2025 15:05:29 +0100
X-Gm-Features: AS18NWBQB551xCDzM67RisHfyAN3R469fevbF-r02ikgjfBIO7kcv2h8WEyJ91Q
Message-ID: <CANPvuR=Hu-4KYs7CjHTab4_sFVC_vah1J+b=K+aw57b3Bs6P7w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
To: joao.lima@hbkworld.com
Cc: Khem Raj <raj.khem@gmail.com>, =?UTF-8?B?TGltYSwgSm/Do28=?= <joao.raul.434@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fda3eb06402d7a28"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 14:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120196

--000000000000fda3eb06402d7a28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jo=C3=A3o

Jo=C3=A3o Lima via lists.openembedded.org <joao.lima=3D
hbkworld.com@lists.openembedded.org> escreveu (quinta, 2/10/2025 =C3=A0(s)
12:50):

> Thanks for the feedback.
>
> I'm currently working on top of:
> URI:    https://git.openembedded.org/meta-openembedded
> Branch: scarthgap
> Commit: e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943
>
> Should I rebase my patch series on top of the latest master (or
> master-next) branch, even though I'm targeting the scarthgap branch?
> As this is my first submission to the project, I want to ensure I'm
> following the correct process.
>

Yes you are right and should send on top of master or even master-next.

If the patchset does not include breaking changes they can be backported to
the stable branch,
this last criterion will be the responsibility of the maintainer.
For example, major bumps in the version are generally not accepted to be
backported.

Jose


>
> Thanks for the submission tip.
>
> Cumprimentos */*Kind regards
>
>
>
> *Jo=C3=A3o Lima*
>
> Embedded Software Developer, Genesis High Speed
>
> UNRESTRICTED
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Wednesday, October 1, 2025 5:22 PM
> *To:* Lima, Jo=C3=A3o <joao.raul.434@gmail.com>;
> openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>; Jo=C3=A3o Lima <
> joao.lima@hbkworld.com>
> *Subject:* EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support
> and update dependencies
>
> CAUTION! External Email. Do not click links or open attachments unless yo=
u
> recognize the sender and are sure the content is safe.
> If you think this is a phishing email, please report it by using the
> "Phish Alert Report" button in Outlook.
>
> On 10/1/25 6:04 AM, Lima, Jo=C3=A3o wrote:
> > From: Joao Lima <joao.lima@hbkworld.com>
> >
> > This patch series updates OpenOCD to support direct memory access (dmem=
)
> > via SWD emulation for Texas Instruments AM64x and J784s4 platforms.
> >
> > Changes include:
> > 1. Version bumps:
> >     - openocd: 91bd431 -> 66ea461
> >     - jimtcl: fcbb449 -> f160866
> >     - libjaylink: 9aa7a59 -> 0d23921
> >
> > 2. Platform support patches:
> >     - Add SWD native configuration files for AM64x and J784s4 boards
> >     - Configure DMEM access parameters in ti_k3.cfg for direct memory
> operations
> >     - Set up DAPBUS debugger and emulated AP descriptions
> >
> > 3. Build configuration:
> >     - Enable dmem adapter driver (--enable-dmem)
> >     - Enable internal jimtcl (--enable-internal-jimtcl)
> >     - Add both features to default PACKAGECONFIG
> >
> > This enables self-hosted debug configurations where OpenOCD runs on one
> of
> > the CPUs inside the SoC.
> >
> > Upstream-Status: Submitted
> > -
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenoc=
d.zylin.com%2F%23%2Fc%2F9020%2F&data=3D05%7C02%7Cjoao.lima%40hbkworld.com%7=
C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%7C=
0%7C638949326829662188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%7C=
%7C%7C&sdata=3Dmr0knEMNTixqKo20WB6sAP3w0Os3PC%2FHaEMGG%2F3SDjw%3D&reserved=
=3D0
> <http://openocd.zylin.com/#/c/9020/>
> > -
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenoc=
d.zylin.com%2F%23%2Fc%2F9021%2F&data=3D05%7C02%7Cjoao.lima%40hbkworld.com%7=
C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%7C=
0%7C638949326829712748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%7C=
%7C%7C&sdata=3D%2F%2Fc%2BmSu3HrA%2F2IWn9jqFAo4x2bNR54ABpO0mSZEZ%2FCM%3D&res=
erved=3D0
> <http://openocd.zylin.com/#/c/9021/>
> >
> > Joao Lima (3):
> >    openocd: bump the openocd, jimtcl versions
> >    openocd: add dmem support to am64xx and j784s4 platforms
> >    openocd: enable dmem and jimtcl
> >
> >   ...wd_native.cfg-Add-support-for-direct.patch | 77 ++++++++++++++++++=
+
> >   ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
> >   .../recipes-devtools/openocd/openocd_git.bb   | 13 +++-
> >   3 files changed, 151 insertions(+), 4 deletions(-)
> >   create mode 100644
> meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.c=
fg-Add-support-for-direct.patch
> >   create mode 100644
> meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-su=
pport-for-direct-memory-a.patch
> >
>
>
> Thanks for the patchset, Please rebase it on latest master branch or
> master-next branch and resend. While resending send the whole series
> together with git send-email *.patch or something so tools like
> patchwork and lore can record this as a series.
>
> HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=C3=A9 R=
=C3=A9gio,
> 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais
> anexos s=C3=A3o confidenciais e destinados exclusivamente ao(s) destinat=
=C3=A1rio(s)
> indicado(s). Se recebeu esta mensagem por engano, por favor notifique o
> remetente e elimine-a de imediato. =C3=89 proibida a divulga=C3=A7=C3=A3o=
, c=C3=B3pia ou
> utiliza=C3=A7=C3=A3o n=C3=A3o autorizada do seu conte=C3=BAdo. This messa=
ge and any attachments
> are confidential and intended solely for the designated recipient(s). If
> you have received this message in error, please notify the sender and
> delete it immediately. Unauthorized disclosure, copying, or use of its
> contents is prohibited.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120168):
> https://lists.openembedded.org/g/openembedded-devel/message/120168
> Mute This Topic: https://lists.openembedded.org/mt/115529554/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fda3eb06402d7a28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jo=C3=A3o</div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jo=C3=A3o Lima via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;jo=
ao.lima=3D<a href=3D"mailto:hbkworld.com@lists.openembedded.org">hbkworld.c=
om@lists.openembedded.org</a>&gt; escreveu (quinta, 2/10/2025 =C3=A0(s) 12:=
50):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg6719625025468944186">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks for the feedback.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I&#39;m currently working on top of:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
URI: =C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded=
" target=3D"_blank">https://git.openembedded.org/meta-openembedded</a> =C2=
=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Branch: scarthgap =C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Commit: e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Should I rebase my patch series on top of the latest master (or master-next=
) branch, even though I&#39;m targeting the scarthgap branch?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
As this is my first submission to the project, I want to ensure I&#39;m fol=
lowing the correct process.<br></div></div></div></blockquote><div><br></di=
v><div>Yes you are right=C2=A0and should send on top of master or even mast=
er-next.</div><div><br>If the patchset does not include breaking changes th=
ey can be backported to the stable branch,</div><div>this last criterion wi=
ll be the responsibility of the maintainer.</div><div>For example, major bu=
mps in the version are generally not accepted to=C2=A0be backported.</div><=
div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D"msg6719625025468944186"><div dir=3D"ltr"=
><div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks for the submission tip.</div>
<div id=3D"m_-1372481023642229588Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:11pt">
<span style=3D"font-family:Arial,sans-serif;font-size:9pt;color:black">Cump=
rimentos
<i>/</i>Kind regards=C2=A0</span></p>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:11pt">
<span style=3D"font-family:Arial,sans-serif;font-size:9pt;color:black"><b>=
=C2=A0</b></span></p>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:11pt">
<span style=3D"font-family:Arial,sans-serif;font-size:9pt;color:black"><b>J=
o=C3=A3o Lima</b>=C2=A0</span></p>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:11pt">
<span style=3D"font-family:Arial,sans-serif;font-size:9pt;color:black">Embe=
dded Software Developer, Genesis High Speed=C2=A0</span></p>
<div><br>
</div>
<div style=3D"text-align:center;margin-left:5pt;font-family:Calibri;font-si=
ze:7pt;color:rgb(0,0,0)">
UNRESTRICTED</div>
</div>
<div id=3D"m_-1372481023642229588appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-1372481023642229588divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, October 1, 2025 5:22 PM<br>
<b>To:</b> Lima, Jo=C3=A3o &lt;<a href=3D"mailto:joao.raul.434@gmail.com" t=
arget=3D"_blank">joao.raul.434@gmail.com</a>&gt;; <a href=3D"mailto:openemb=
edded-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@li=
sts.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org<=
/a>&gt;; Jo=C3=A3o Lima &lt;<a href=3D"mailto:joao.lima@hbkworld.com" targe=
t=3D"_blank">joao.lima@hbkworld.com</a>&gt;<br>
<b>Subject:</b> EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem suppor=
t and update dependencies</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION! External Email. Do not click links or open attachments unless=
 you recognize the sender and are sure the content is safe.<br>
If you think this is a phishing email, please report it by using the &quot;=
Phish Alert Report&quot; button in Outlook.<br>
<br>
On 10/1/25 6:04 AM, Lima, Jo=C3=A3o wrote:<br>
&gt; From: Joao Lima &lt;<a href=3D"mailto:joao.lima@hbkworld.com" target=
=3D"_blank">joao.lima@hbkworld.com</a>&gt;<br>
&gt;<br>
&gt; This patch series updates OpenOCD to support direct memory access (dme=
m)<br>
&gt; via SWD emulation for Texas Instruments AM64x and J784s4 platforms.<br=
>
&gt;<br>
&gt; Changes include:<br>
&gt; 1. Version bumps:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - openocd: 91bd431 -&gt; 66ea461<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - jimtcl: fcbb449 -&gt; f160866<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - libjaylink: 9aa7a59 -&gt; 0d23921<br>
&gt;<br>
&gt; 2. Platform support patches:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - Add SWD native configuration files for AM64x=
 and J784s4 boards<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - Configure DMEM access parameters in ti_k3.cf=
g for direct memory operations<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - Set up DAPBUS debugger and emulated AP descr=
iptions<br>
&gt;<br>
&gt; 3. Build configuration:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - Enable dmem adapter driver (--enable-dmem)<b=
r>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - Enable internal jimtcl (--enable-internal-ji=
mtcl)<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 - Add both features to default PACKAGECONFIG<b=
r>
&gt;<br>
&gt; This enables self-hosted debug configurations where OpenOCD runs on on=
e of<br>
&gt; the CPUs inside the SoC.<br>
&gt;<br>
&gt; Upstream-Status: Submitted<br>
&gt; - <a href=3D"http://openocd.zylin.com/#/c/9020/" target=3D"_blank">htt=
ps://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenocd.zyl=
in.com%2F%23%2Fc%2F9020%2F&amp;data=3D05%7C02%7Cjoao.lima%40hbkworld.com%7C=
0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%7C0=
%7C638949326829662188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO=
iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%7C%=
7C%7C&amp;sdata=3Dmr0knEMNTixqKo20WB6sAP3w0Os3PC%2FHaEMGG%2F3SDjw%3D&amp;re=
served=3D0</a><br>
&gt; - <a href=3D"http://openocd.zylin.com/#/c/9021/" target=3D"_blank">htt=
ps://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenocd.zyl=
in.com%2F%23%2Fc%2F9021%2F&amp;data=3D05%7C02%7Cjoao.lima%40hbkworld.com%7C=
0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%7C0=
%7C638949326829712748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO=
iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%7C%=
7C%7C&amp;sdata=3D%2F%2Fc%2BmSu3HrA%2F2IWn9jqFAo4x2bNR54ABpO0mSZEZ%2FCM%3D&=
amp;reserved=3D0</a><br>
&gt;<br>
&gt; Joao Lima (3):<br>
&gt;=C2=A0=C2=A0=C2=A0 openocd: bump the openocd, jimtcl versions<br>
&gt;=C2=A0=C2=A0=C2=A0 openocd: add dmem support to am64xx and j784s4 platf=
orms<br>
&gt;=C2=A0=C2=A0=C2=A0 openocd: enable dmem and jimtcl<br>
&gt;<br>
&gt;=C2=A0=C2=A0 ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++=
++++++++++++<br>
&gt;=C2=A0=C2=A0 ....cfg-Add-support-for-direct-memory-a.patch | 65 +++++++=
+++++++++<br>
&gt;=C2=A0=C2=A0 .../recipes-devtools/openocd/<a href=3D"http://openocd_git=
.bb" target=3D"_blank">openocd_git.bb</a>=C2=A0=C2=A0 | 13 +++-<br>
&gt;=C2=A0=C2=A0 3 files changed, 151 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-devtools/openocd/openoc=
d/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch<br>
&gt;=C2=A0=C2=A0 create mode 100644 meta-oe/recipes-devtools/openocd/openoc=
d/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch<br>
&gt;<br>
<br>
<br>
Thanks for the patchset, Please rebase it on latest master branch or<br>
master-next branch and resend. While resending send the whole series<br>
together with git send-email *.patch or something so tools like<br>
patchwork and lore can record this as a series.<br>
</div>
</span></font></div>
<br>
HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=C3=A9 R=C3=
=A9gio, 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventua=
is anexos s=C3=A3o confidenciais e destinados exclusivamente ao(s) destinat=
=C3=A1rio(s) indicado(s). Se recebeu esta mensagem por
 engano, por favor notifique o remetente e elimine-a de imediato. =C3=89 pr=
oibida a divulga=C3=A7=C3=A3o, c=C3=B3pia ou utiliza=C3=A7=C3=A3o n=C3=A3o =
autorizada do seu conte=C3=BAdo. This message and any attachments are confi=
dential and intended solely for the designated recipient(s). If you have
 received this message in error, please notify the sender and delete it imm=
ediately. Unauthorized disclosure, copying, or use of its contents is prohi=
bited.
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#120168): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/120168" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/120168</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115529554/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115529554/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</d=
iv></div></div></div>

--000000000000fda3eb06402d7a28--

