Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A954ECE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 21:51:05 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.48692.1695592258604549570
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 14:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id EB8CDB116;
	Sun, 24 Sep 2023 23:50:56 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.34.4]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkX09-21tvKi0; Sun, 24 Sep 2023 23:50:54 +0200
Date: Sun, 24 Sep 2023 23:50:59 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/2] udisks2: Upgrade 2.9.4 -> 2.10.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <ZCFI1S.B983R3SRJX6X1@t-online.de>
In-Reply-To: <CAMKF1spaytbE+v1ufsosqbr8FNy=aTsSzL=3JVDCSeWY7xsG-A@mail.gmail.com>
References: <20230924204711.3073-1-f_l_k@t-online.de>
	<20230924204711.3073-2-f_l_k@t-online.de>
	<CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com>
	<4DEI1S.RGXZVSAXE3I31@t-online.de>
	<CAMKF1spaytbE+v1ufsosqbr8FNy=aTsSzL=3JVDCSeWY7xsG-A@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uwIyhrMj8Ywh6/Wu25Jd"
X-TOI-EXPURGATEID: 150726::1695592254-CAFF3366-3CF9CAFB/0/0 CLEAN NORMAL
X-TOI-MSGID: 3717802f-c56f-4b43-8d75-dd9b3f0b25ea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 21:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105115

--=-uwIyhrMj8Ywh6/Wu25Jd
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

It looks like BUILD_DIR is only passed for that reason
<https://github.com/search?q=3Drepo%3Astoraged-project%2Fudisks%20build_dir=
&type=3Dcode>

On Sun, Sep 24 2023 at 02:34:47 PM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
>=20
>=20
> On Sun, Sep 24, 2023 at 2:29 PM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>> On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, Khem Raj=20
>> <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>>> How does this end up in shared object perhaps that needs to be=20
>>> looked at as such specifying build dir in a makefile should be fine=20
>>> I guess
>>=20
>> <https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f=
33a13102e7b86e188/src/udisksmodulemanager.c#L192>
>>=20
>> i guess its this place
>=20
> Right so it=FFs seems it=FFs trying to load stuff from build area=20
> when it=FFs not installed. May be for developer testing or something
>=20
> So maybe we can remove that unless we need these parts during ptest=20
> then encode a path accordingly
>>=20


--=-uwIyhrMj8Ywh6/Wu25Jd
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>It looks like BUILD_DIR is only pa=
ssed for that reason</div><div><a href=3D"https://github.com/search?q=3Drep=
o%3Astoraged-project%2Fudisks%20build_dir&amp;type=3Dcode">https://github.c=
om/search?q=3Drepo%3Astoraged-project%2Fudisks%20build_dir&amp;type=3Dcode<=
/a></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sun, Sep 24 2023=
 at 02:34:47 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><b=
lockquote type=3D"cite"><div><br></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 24, 2023 at 2:29 PM Marku=
s Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-897104148646083=
7286geary-body" dir=3D"auto">On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite">How does this end =
up in shared object perhaps that needs to be looked at as such specifying b=
uild dir in a makefile should be fine I guess&nbsp;</blockquote><div><br></=
div><div><a href=3D"https://github.com/storaged-project/udisks/blob/c7027d8=
88c00381851d918f33a13102e7b86e188/src/udisksmodulemanager.c#L192" target=3D=
"_blank">https://github.com/storaged-project/udisks/blob/c7027d888c00381851=
d918f33a13102e7b86e188/src/udisksmodulemanager.c#L192</a></div><div><br></d=
iv><div>i guess its this place</div></div></blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Right so it=FFs seems it=FFs trying to load stuff=
 from build area when it=FFs not installed. May be for developer testing or=
 something&nbsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto">So mayb=
e we can remove that unless we need these parts during ptest then encode a =
path accordingly&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-89=
71041486460837286geary-body" dir=3D"auto"><div dir=3D"auto"></div></div></b=
lockquote></div></div>
</blockquote></div>
--=-uwIyhrMj8Ywh6/Wu25Jd--


