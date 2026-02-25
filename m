Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA89EFB7F0
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 06:38:09 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40197.1772001488371809219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 22:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout11.t-online.de (Postfix) with SMTP id 5A1DF1BDDA
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 07:38:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.44]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vv8X6-4b21570; Wed, 25 Feb 2026 07:38:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl3-image: add PACKAGECONFIG for av1
Date: Wed, 25 Feb 2026 07:37:35 +0100
Message-ID: <20260225063735.17946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1772001485-2AFF749A-F1D7AD8E/0/0 CLEAN NORMAL
X-TOI-MSGID: cca428a7-9e75-4e22-9965-37dc5858d522
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 06:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124608

- libavif is in meta-multimedia -> dont enable by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
index 5d6c1cf21b..324332eb84 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
@@ -4,13 +4,16 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e9cf81bb7=
f43dbf7"
=20
-DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp libjxl libavif"
+DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
=20
 SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.4.x"
 SRCREV =3D "ad58ecfc27a1bd09e510ceff8bbbdb1094806476"
=20
 EXTRA_OECMAKE +=3D "-DSDLIMAGE_JXL=3DON"
=20
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[av1] =3D "-DSDLIMAGE_AVIF=3DON,-DSDLIMAGE_AVIF=3DOFF,libav=
if"
+
 inherit cmake pkgconfig
=20
 FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.52.0


