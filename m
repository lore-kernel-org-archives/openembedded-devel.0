Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA02E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 16:29:43 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.63885.1736180981416305724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 08:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 7096F72C;
	Mon,  6 Jan 2025 17:29:39 +0100 (CET)
Received: from [192.168.178.67] ([79.219.236.190]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tUpz0-1pKLgG0; Mon, 6 Jan 2025 17:29:39 +0100
Date: Mon, 06 Jan 2025 17:29:58 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libheif: add recipe
To: raj.khem@gmail.com
Cc: f_l_k@t-online.de, "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <YTDOPS.20WRIKFYPCWR@t-online.de>
In-Reply-To: <CAMKF1so=cPOWjf7GOHL2LhR0OD_3dC5Yute1gL5nWt9gyJ=C3Q@mail.gmail.com>
References: <20250105181653.364883-1-f_l_k@t-online.de>
	<CAMKF1so=cPOWjf7GOHL2LhR0OD_3dC5Yute1gL5nWt9gyJ=C3Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-aS9CqsKiasAPjM5q7am8"
X-TOI-EXPURGATEID: 150726::1736180979-777FD9C7-7250C4D8/10/3626336762 SUSPECT URL
X-TOI-MSGID: abdea87f-54fc-47cb-9526-55848827beca
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 16:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114666

--=-aS9CqsKiasAPjM5q7am8
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Jan 6 2025 at 07:24:30 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> it fails layer compat check see


x265 is restricted to x86 systems.
I would recommend to drop the restriction. For example it also builds 
for qemuarm


In addition the libheif.bb lacks an entry for LICENSE_FLAGS_ACCEPTED = 
"commercial"


openh264 and libde265 are not added as RDEPENDS in:
 
<https://github.com/openembedded/meta-openembedded/blob/master/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb>

Is there a reason, why they are not added as RDEPENDS by default? If so 
I'll move the libheif recipe to my personal layer
If it's ok to add them, I'll send a v2 trying to fix the issues



--=-aS9CqsKiasAPjM5q7am8
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Jan 6 2025 at 07:24:30 -08:00:0=
0, Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lists.opene=
mbedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext=
" style=3D"white-space: break-spaces;">it fails layer compat check see</div=
></blockquote><div><br></div><div><br></div><div>x265 is restricted to x86 =
systems.</div><div>I would recommend to drop the restriction. For example i=
t also builds for qemuarm</div><div><br></div><div><br></div><div>In additi=
on the libheif.bb lacks an entry for LICENSE_FLAGS_ACCEPTED =3D "commercial=
"</div><div><br></div><div><br></div><div><div>openh264 and libde265 are no=
t added as RDEPENDS in:</div><div>&nbsp;<a href=3D"https://github.com/opene=
mbedded/meta-openembedded/blob/master/meta-multimedia/recipes-multimedia/pa=
ckagegroups/packagegroup-meta-multimedia.bb">https://github.com/openembedde=
d/meta-openembedded/blob/master/meta-multimedia/recipes-multimedia/packageg=
roups/packagegroup-meta-multimedia.bb</a></div></div><div><div><br></div><d=
iv>Is there a reason, why they are not added as RDEPENDS by default? If so =
I'll move the libheif recipe to my personal layer</div></div><div>If it's o=
k to add them, I'll send a v2 trying to fix the issues</div><div><br></div>=
</div>
--=-aS9CqsKiasAPjM5q7am8--


