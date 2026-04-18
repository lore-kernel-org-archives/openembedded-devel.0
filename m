Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F75F99C88
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 14:35:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67968.1776522940427368127
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 07:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=TUNamebv;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id 559461C3D7
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 16:35:37 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.175.141]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wE6ll-0Toyqv0; Sat, 18 Apr 2026 16:35:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] libdvdnav: use https for fetching code
Date: Sat, 18 Apr 2026 16:35:29 +0200
Message-ID: <20260418143531.2034507-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1776522937-E67FA407-AA340D5C/0/0 CLEAN NORMAL
X-TOI-MSGID: a2376aed-a5b2-469c-bd67-58b9226aa970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1776522937; i=f_l_k@t-online.de;
	bh=vqN7q44NJJklYzDy5i/SvG0b0RF+P207nbiEeMqAk1k=;
	h=From:To:Subject:Date;
	b=TUNamebvyaxj2jRHRxy/TrXkJb7dcfYOdDLXw5lszjvmNC/J0OETzB+m0Mi2VnTzM
	 4udF7CJaFHBUbvgAv3BbuHumwaDklPS6yVaLY8x1/9/pqxlxcqVDImWPFhiOsSjEan
	 sIi1B+/2gWF2C2lHeuIzyneitiisSfSdwN/fKzu2T4Fd82KNZ19CAyDXNrWkJ2mUHk
	 mmIzSeP3QQCflE3gOf8tecgl3hlwGcIq9a3zZrL5M6gR/6zjEP4Ca74xBBdrPynuhy
	 V2/rk60XDaVqm2kLhqF2zsEaH/WgqEg+oJmRCV+w1TBaJ41O5KRIOl8yZeI5NJpAiQ
	 bCi1MUeG7d+Iw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 14:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126457

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1=
.bb b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
index 766ee02ca2..cc305f4041 100644
--- a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_6.1.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
 DEPENDS =3D "libdvdread"
=20
-SRC_URI =3D "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP=
}.tar.bz2"
+SRC_URI =3D "https://download.videolan.org/pub/videolan/${BPN}/${PV}/${B=
P}.tar.bz2"
 SRC_URI[md5sum] =3D "46c46cb0294fbd1fcb8a0181818dad15"
 SRC_URI[sha256sum] =3D "c191a7475947d323ff7680cf92c0fb1be8237701885f3765=
6c64d04e98d18d48"
=20
--=20
2.53.0


