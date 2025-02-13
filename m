Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA3CC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 07:05:19 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.5650.1739430313194645487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 23:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id F2C40148F;
	Thu, 13 Feb 2025 08:05:10 +0100 (CET)
Received: from [192.168.178.67] ([84.163.47.27]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tiTHY-2bKU0O0; Thu, 13 Feb 2025 08:05:08 +0100
Date: Thu, 13 Feb 2025 08:05:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] gegl: update 0.4.52 -> 0.4.54
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <J11MRS.2Z2Y82T4C0G1@t-online.de>
In-Reply-To: <dc7d6bd8-fdab-4550-b55d-17dfb0a4a6b2@gmail.com>
References: <20250212045238.56929-1-f_l_k@t-online.de>
	<dc7d6bd8-fdab-4550-b55d-17dfb0a4a6b2@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8G6OZAcJ1QaX+d5YTFpA"
X-TOI-EXPURGATEID: 150726::1739430308-D27FBADA-7A150CAE/0/0 CLEAN NORMAL
X-TOI-MSGID: 266f5d6a-6796-49a0-8f16-3a7664958764
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 07:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115454

--=-8G6OZAcJ1QaX+d5YTFpA
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Feb 11 2025 at 22:24:44 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> this patch is not captured by lore and I do get
> 
> strange value in author field of the patch when I grab it from mail
> and OE git refuses to accept '=' in author email address.
> 
> Please check your mail agent something is off

Thanks for the hint. I used git-send-email via the terminal as I always 
do.
The problem was probably that I carelessly updated my build host with 
up to date poky/master and got a consistency issue with glibc.
I had been able to create a rootfs without error, probably because of 
existing sstate cache, but after installing it onto my build host,
some runtime issues have arisen. Only ansi was available (what may have 
caused the broken email) and I also locked me out because the
yocto build system stopped working. After deleting sstate cache, I got 
a message that sstate-cache will be disabled due to uninative
incompatibility glibc-2.40 <-> glibc-2.41. Later, the rust installation 
aborted because cargo-native was not executable.
I had to rewind the poky master to a state before the glibc update and 
rebuilt my rootfs externally. That seems to have fixed the issues


--=-8G6OZAcJ1QaX+d5YTFpA
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Tue, Feb 11 2025 at 22:24:44 -08:00:=
00, Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lists.open=
embedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintex=
t" style=3D"white-space: break-spaces;">this patch is not captured by lore =
and I do get

strange value in author field of the patch when I grab it from mail
and OE git refuses to accept '=3D' in author email address.

Please check your mail agent something is off</div></blockquote><div><br></=
div><div><div>Thanks for the hint. I used git-send-email via the terminal a=
s I always do.</div><div>The problem was probably that I carelessly updated=
 my build host with up to date poky/master and got a consistency issue with=
 glibc.</div><div>I had been able to create a rootfs without error, probabl=
y because of existing sstate cache, but after installing it onto my build h=
ost,</div><div>some runtime issues have arisen. Only ansi was available (wh=
at may have caused the broken email) and I also locked me out because the</=
div><div>yocto build system stopped working. After deleting sstate cache, I=
 got a message that sstate-cache will be disabled due to uninative</div><di=
v>incompatibility glibc-2.40 &lt;-&gt; glibc-2.41. Later, the rust installa=
tion aborted because cargo-native was not executable.</div><div>I had to re=
wind the poky master to a state before the glibc update and rebuilt my root=
fs externally. That seems to have fixed the issues</div></div></div>
--=-8G6OZAcJ1QaX+d5YTFpA--


