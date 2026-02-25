Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D642FF357DA
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 06:59:59 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40395.1772002795630335185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 22:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 1D98B1DD3;
	Wed, 25 Feb 2026 07:59:52 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.44]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vv8s3-2xq1D70; Wed, 25 Feb 2026 07:59:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCHv3] libsdl3-image: update 3.2.6 -> 3.4.0
Date: Wed, 25 Feb 2026 07:59:37 +0100
Message-ID: <20260225065937.61703-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1772002783-F0FDD697-3DC9B939/0/0 CLEAN NORMAL
X-TOI-MSGID: a619d916-c586-4bf1-85eb-185bc47c2817
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 06:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124611

- Fix license checksum: Copyright year has been changed
- Add support for av1 and jxl
- libavif is in meta-multimedia -> disable av1 by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libsdl3/libsdl3-image_3.2.6.bb            | 15 ---------------
 .../libsdl3/libsdl3-image_3.4.0.bb            | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 15 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.=
bb
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.=
bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
deleted file mode 100644
index 7c2f4026f2..0000000000
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Simple DirectMedia Layer image library v2"
-SECTION =3D "libs"
-
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
-
-DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp"
-
-SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
-SRCREV =3D "d78dd65454f442bfdbc373201165f1ef579484ab"
-
-
-inherit cmake pkgconfig
-
-FILES:${PN} +=3D "${datadir}/licenses"
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
new file mode 100644
index 0000000000..324332eb84
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Simple DirectMedia Layer image library v2"
+SECTION =3D "libs"
+
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e9cf81bb7=
f43dbf7"
+
+DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
+
+SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.4.x"
+SRCREV =3D "ad58ecfc27a1bd09e510ceff8bbbdb1094806476"
+
+EXTRA_OECMAKE +=3D "-DSDLIMAGE_JXL=3DON"
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[av1] =3D "-DSDLIMAGE_AVIF=3DON,-DSDLIMAGE_AVIF=3DOFF,libav=
if"
+
+inherit cmake pkgconfig
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.52.0


