Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14219E9A049
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 11:35:01 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10180.1771414498740705042
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 03:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id 8907F3818A
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 12:34:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsfpX-3zBrnu0; Wed, 18 Feb 2026 12:34:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] libsdl3-image: update 3.2.6 -> 3.4.0
Date: Wed, 18 Feb 2026 12:34:49 +0100
Message-ID: <20260218113450.32876-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218113450.32876-1-f_l_k@t-online.de>
References: <20260218113450.32876-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771414496-F1FDC5A5-ECE5A02A/0/0 CLEAN NORMAL
X-TOI-MSGID: ca8d06a9-f806-43f6-888a-b32c26902ccc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 11:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124474

- Fix license checksum: Copyright year has been changed
- Add support for av1 and jxl

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/libsdl3-image_3.2.6.bb               | 15 ---------------
 .../libsdl3/libsdl3-image_3.4.0.bb               | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 15 deletions(-)
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
index 0000000000..5d6c1cf21b
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.0.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Simple DirectMedia Layer image library v2"
+SECTION =3D "libs"
+
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e9cf81bb7=
f43dbf7"
+
+DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp libjxl libavif"
+
+SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.4.x"
+SRCREV =3D "ad58ecfc27a1bd09e510ceff8bbbdb1094806476"
+
+EXTRA_OECMAKE +=3D "-DSDLIMAGE_JXL=3DON"
+
+inherit cmake pkgconfig
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.52.0


