Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9222ACAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:08:38 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.11672.1759417709490621579
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SSpvSX9u;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d60157747so13407817b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759417708; x=1760022508; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a8vpVEteRBgVqEbzbEdgTOx5uzBrtd2U+eSD5S6Bq28=;
        b=SSpvSX9uuvJDCZNEf2H9J5S6IirBktVTrRoKtqDe3Q1R3uWmN1/obJ/iHJqdrTOxQS
         iS82RgHCWoheMCO52oc8j2afquq6ddiCpZnAmGO7YV+hORmks+CG6EzQidTtBLPmMxTV
         snujjTtU/io50P7i9hv1KxkLaY0PuTkmqTqJdj5a171HbvETAOSxmEcCjrxsZHqv1Bpv
         Ef7esuJVp3o8y9b7AJrgDPlS7M/y38YUYstnQUf9+Jc0TSFRy7WmZ4G7HC5E4qzWgWG8
         x22Qs51/ijkdBwak1Rx1KUbXHThwWIPaue9abIKXRPvpM2QBMzVNxnMsyXzTyC2h0qsi
         9jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417708; x=1760022508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8vpVEteRBgVqEbzbEdgTOx5uzBrtd2U+eSD5S6Bq28=;
        b=tvHjZ+LA5Zu4eWcRb+RnwRmJDheQx2WkHx9nU/DUOzKUeq0RKXv9Zq47tlnLTpXA9G
         jfy0RfKDIr0HDVyRmYMIecVk0/jg//KPOCujKlRYOSoyTC2V/dZwKSxzbwCgpVKbraku
         XRTU8Tq+LKI6XtCGMJuHBKtpfRmTD5q0pKOYJz9QeadYVHcVuu0ynrxaihHutIKeL3ts
         PpVXL4ks5HO6kUu4Bsivp2x9JqaLCO6N6CbOOXNIm4W8zgwq2TPn+1IrFQcZcEI0B1CB
         Ux9cHGaQeztCK4TbpT1TZSjMooK9XEilz+P1gFUx1TIKQi7RGkhkJPRNhNDdDSq1ceen
         xHSw==
X-Forwarded-Encrypted: i=1; AJvYcCWcIE9XSR5RtI8Tjddgotdf6yKXnieCnpCoBcFNOzOrHwhAo8v6RmahSYzuLdJZHj5G3KwOTHQNWv+I5IOAnLcrRHo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7w6er4OijztDbUmzDADDn/NZk90n4IRX3PhPiWHwKtUZpWnGm
	IRZxGi7l5OkyBADg9WgG1FaN4nU/jl2PbDfNa4krWNq09RawrFY2tS62CBWD1yyetZBa+0G4EJg
	8Eulpj8pYbBsNnjK+cHUR/fsIi2sf6AY=
X-Gm-Gg: ASbGncu/aSTENFbHZt9oMqZEKK2xA7A4XFLS97nucht63QYR14BFKOYUOP+kQ62/vrH
	BFdV5XRzXxkUaEVrLn76tSBU3cuCAOZJHUnDP7/oCFQV0KBluzAIDgJKkO+/OQ8EoheI9qTuV2Z
	YoVclOr9XVsC1oMOIifRzuBmukBBOn7mvzSLw6+1Du2vd2jG1fhNfVZfmv4Iq8z5DaM15fioYVh
	UwmnPGp8RAOWuTXNJqih/siopdZku8btVcuTbYCQGoyLRC/ePvVnoRZkNzDXIkbuPbyu78dByUb
	pkE3pawb29xdQl7tHvV/dIAh27v6eqvCHmzzNe6cPjcBJIh+iFL3FLD59fLqvom3EHkbMGmnwZK
	P6Amswn80HtgsKD4I
X-Google-Smtp-Source: AGHT+IEpb9mJvHO0qoReTEzGM4XklfVsDelE145PUgSOO304DBIj8IMDjb2Is+8hfqRb7eBJTFZ5cbOjhwi/gHt7VyI=
X-Received: by 2002:a53:ab04:0:b0:635:4ed0:571a with SMTP id
 956f58d0204a3-63b6ff7a4d9mr7069201d50.52.1759417707157; Thu, 02 Oct 2025
 08:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251001130452.542-1-joao.lima@hbkworld.com> <a799cdbe-54b5-484e-84e2-4a847236aa3d@gmail.com>
 <DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7A@DB3PR09MB6202.eurprd09.prod.outlook.com>
In-Reply-To: <DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7A@DB3PR09MB6202.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Oct 2025 08:08:16 -0700
X-Gm-Features: AS18NWDB7_xhqmmlqDYntZKm2Jt2hfUqOpxevAhUt8BHxEy5lYzXOmmww6jGVD4
Message-ID: <CAMKF1sqyW6nszJFAVcpL7XXgCwbdmi7u3yiwxo8dQq-zLsn7cQ@mail.gmail.com>
Subject: Re: EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support and
 update dependencies
To: =?UTF-8?Q?Jo=C3=A3o_Lima?= <joao.lima@hbkworld.com>
Cc: =?UTF-8?B?TGltYSwgSm/Do28=?= <joao.raul.434@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000725e7006402e5b00"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 15:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120200

--000000000000725e7006402e5b00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If a change is needed in the version in master branch then it goes there
first and then back ported to releases

On Thu, Oct 2, 2025 at 12:17=E2=80=AFAM Jo=C3=A3o Lima <joao.lima@hbkworld.=
com> wrote:

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
> 256, 4485-860, Vilar do Pinheiro, Portugal
> <https://www.google.com/maps/search/Via+Jos%C3%A9+R%C3%A9gio,+256,+4485-8=
60,+Vilar+do+Pinheiro,+Portugal?entry=3Dgmail&source=3Dg>.
> Esta mensagem e eventuais anexos s=C3=A3o confidenciais e destinados
> exclusivamente ao(s) destinat=C3=A1rio(s) indicado(s). Se recebeu esta me=
nsagem
> por engano, por favor notifique o remetente e elimine-a de imediato. =C3=
=89
> proibida a divulga=C3=A7=C3=A3o, c=C3=B3pia ou utiliza=C3=A7=C3=A3o n=C3=
=A3o autorizada do seu conte=C3=BAdo.
> This message and any attachments are confidential and intended solely for
> the designated recipient(s). If you have received this message in error,
> please notify the sender and delete it immediately. Unauthorized
> disclosure, copying, or use of its contents is prohibited.
>

--000000000000725e7006402e5b00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If a change is needed in the version in master branch the=
n it goes there first and then back ported to releases=C2=A0</div><div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Oct 2, 2025 at 12:17=E2=80=AFAM Jo=C3=A3o Lima &lt;<a h=
ref=3D"mailto:joao.lima@hbkworld.com">joao.lima@hbkworld.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">




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
lowing the correct process.<br>
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks for the submission tip.</div>
<div id=3D"m_-6025526731893005885Signature">
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
<div id=3D"m_-6025526731893005885appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-6025526731893005885divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
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
HBK FiberSensing S.A. NIF: 506807312 Registered office: <a href=3D"https://=
www.google.com/maps/search/Via+Jos%C3%A9+R%C3%A9gio,+256,+4485-860,+Vilar+d=
o+Pinheiro,+Portugal?entry=3Dgmail&amp;source=3Dg">Via Jos=C3=A9 R=C3=A9gio=
, 256, 4485-860, Vilar do Pinheiro, Portugal</a>. Esta mensagem e eventuais=
 anexos s=C3=A3o confidenciais e destinados exclusivamente ao(s) destinat=
=C3=A1rio(s) indicado(s). Se recebeu esta mensagem por
 engano, por favor notifique o remetente e elimine-a de imediato. =C3=89 pr=
oibida a divulga=C3=A7=C3=A3o, c=C3=B3pia ou utiliza=C3=A7=C3=A3o n=C3=A3o =
autorizada do seu conte=C3=BAdo. This message and any attachments are confi=
dential and intended solely for the designated recipient(s). If you have
 received this message in error, please notify the sender and delete it imm=
ediately. Unauthorized disclosure, copying, or use of its contents is prohi=
bited.
</div>

</blockquote></div></div>

--000000000000725e7006402e5b00--

