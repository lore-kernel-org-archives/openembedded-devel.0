Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC848C9831E
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 06:34:12 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15042.1790404442592697341
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 23:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=Vt59D990;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout06.t-online.de (Postfix) with SMTP id 8209FB35;
	Sat, 26 Sep 2026 08:34:00 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.169.105]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xALyx-2bP9pw0; Sat, 26 Sep 2026 08:33:59 +0200
Date: Sat, 26 Sep 2026 08:33:52 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] ibus: upgrade 1.5.26 -> 1.5.34
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <GWKYLT.WM6P22M9DSDF@t-online>
In-Reply-To: <CAMKF1sosmYaYwcaxnhPVECKKXTJfirtO3SBSqD2DBnMJX0MKEw@mail.gmail.com>
References: <20260925092311.764729-1-f_l_k@t-online.de>
	<CAMKF1sosmYaYwcaxnhPVECKKXTJfirtO3SBSqD2DBnMJX0MKEw@mail.gmail.com>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-EHWKEW++dhBrekLkCYfi"
X-TOI-EXPURGATEID: 150726::1790404439-ED9FB9BC-E055C464/0/0 CLEAN NORMAL
X-TOI-MSGID: 768a233c-db49-40ff-8ead-f50d9f071ed9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790404440; i=f_l_k@t-online.de;
	bh=pel9VMTw7XH4ljeyrdQEV9OKSa9MmoX0BB18d5BS99U=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=Vt59D990JhXRrF5Pp4h6gLY5Af6ZAcbcPnTsMCNaifYNw2OkX9eTlw88cH3l61c/M
	 gtnJahzx3LCa9xrjne+Y0zYhHVW78NNDSgqgt+KYPRukaeSGEngolEPenJNb0hzqFI
	 Oflz7bHBathCeKf36u2nwmHRiPivQCaQZQUg7yjwOvZUBZeo/Kz+lJj8EJcFdEdAhT
	 +YB+yPF7qN9apryLVQVXg/hTSBswK3oshopSW0HLwjzzwJjkEd50WcIyYacsz1HA0v
	 TcNGI9XoTy8gyAZ8Bq8g+1jqKJUqytbkX5ACuRwBRw6WJlLerzH31MHbg3mZI96dIW
	 buuEJkGmKsy3A==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 06:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130318

--=-EHWKEW++dhBrekLkCYfi
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 25 2026 at 13:33:11 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> t stat 
> '/home/ubuntu/yoe/build/tmp/work/x86_64-linux/ibus-native/1.5.34/recipe-sysroot-

Yes. I sent out a message with this update. A change to oe-core would 
be needed.
I already sent it to the oe-core mailinglist:

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb 
b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
index c06832e35e..db176efede 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -39,4 +39,6 @@ FILES:${PN} += "${datadir}/X11/XKeysymDB 
${datadir}/X11/XErrorDB ${datadir}/X11/
 FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"

+SYSROOT_DIRS_IGNORE:remove:class-native = "${datadir}/X11/locale"
+
 BBCLASSEXTEND = "native nativesdk"




--=-EHWKEW++dhBrekLkCYfi
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"convey-body" dir=3D"auto">On Fri, Sep 25 2026 at 13:33:11 -07:00=
:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"cite=
">t stat '/home/ubuntu/yoe/build/tmp/work/x86_64-linux/ibus-native/1.5.34/r=
ecipe-sysroot-</blockquote><div><br></div><div>Yes. I sent out a message wi=
th this update. A change to oe-core would be needed.</div><div>I already se=
nt it to the oe-core mailinglist:</div><div><br></div><div><div>diff --git =
a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recipes-graphics/x=
org-lib/libx11_1.8.13.bb</div><div>index c06832e35e..db176efede 100644</div=
><div>--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb</div><div>+++ b=
/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb</div><div>@@ -39,4 +39,6 @=
@ FILES:${PN} +=3D "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${data=
dir}/X11/</div><div>&nbsp;FILES:${PN}-xcb +=3D "${libdir}/libX11-xcb.so.*"<=
/div><div>&nbsp;FILES:${PN}-locale +=3D "${datadir}/X11/locale ${libdir}/X1=
1/locale"</div><div>&nbsp;</div><div>+SYSROOT_DIRS_IGNORE:remove:class-nati=
ve =3D "${datadir}/X11/locale"</div><div>+</div><div>&nbsp;BBCLASSEXTEND =
=3D "native nativesdk"</div><div><br></div></div><div><br></div></div>
--=-EHWKEW++dhBrekLkCYfi--


