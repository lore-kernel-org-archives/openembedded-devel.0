Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36A6C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 15:51:55 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.12206.1699113106074479551
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id C8C421E108
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 16:51:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzIw0-1lkzJJ0; Sat, 4 Nov 2023 16:51:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] openal-soft: Upgrade 1.20.1 -> 1.23.1
Date: Sat,  4 Nov 2023 16:52:00 +0100
Message-ID: <20231104155200.397142-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699113100-D64C6D18-B16CE3AE/0/0 CLEAN NORMAL
X-TOI-MSGID: 95e3bf97-84c8-4c91-a43c-d4da061311cc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 15:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106374

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../openal/openal-soft_1.20.1.bb              | 24 -------------------
 .../openal/openal-soft_1.23.1.bb              | 23 ++++++++++++++++++
 2 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft=
_1.20.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft=
_1.23.1.bb

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1=
.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
deleted file mode 100644
index ad7000572..000000000
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "OpenAL is a cross-platform 3D audio API"
-HOMEPAGE =3D "http://kcat.strangesoft.net/openal.html"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0f159f19f9377e1895fbb477d5a79=
53e"
-
-inherit cmake pkgconfig
-
-SRCREV =3D "f5e0eef34db3a3ab94b61a2f99f84f078ba947e7"
-SRC_URI =3D "git://github.com/kcat/openal-soft;branch=3Dmaster;protocol=3D=
https \
-           file://0001-Use-BUILD_CC-to-compile-native-tools.patch \
-           file://0002-makehrtf-Disable-Wstringop-truncation.patch \
-           "
-
-S =3D "${WORKDIR}/git"
-
-PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaud=
io', d)}"
-PACKAGECONFIG[alsa] =3D "-DALSA=3DTRUE, -DALSA=3DFALSE, alsa-lib"
-PACKAGECONFIG[pulseaudio] =3D "-DPULSEAUDIO=3DTRUE, -DPULSEAUDIO=3DFALSE=
, pulseaudio"
-# currently doesn't work with libav-9
-# PKG_CHECK_MODULES(FFMPEG libavcodec>=3D53.61.100 libavformat>=3D53.32.=
100 libavutil>=3D51.35.100)
-# but alffmpeg.c:418:44: error: 'AV_CH_LAYOUT_MONO' undeclared (first us=
e in this function)
-PACKAGECONFIG[examples] =3D "-DEXAMPLES=3DTRUE, -DEXAMPLES=3DFALSE, liba=
v"
-
-FILES:${PN} +=3D "${datadir}/openal"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1=
.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
new file mode 100644
index 000000000..46c3c5610
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "OpenAL is a cross-platform 3D audio API"
+HOMEPAGE =3D "http://kcat.strangesoft.net/openal.html"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0f159f19f9377e1895fbb477d5a79=
53e"
+
+inherit cmake pkgconfig
+
+DEPENDS =3D "zlib libsndfile1"
+
+SRCREV =3D "d3875f333fb6abe2f39d82caca329414871ae53b"
+SRC_URI =3D "git://github.com/kcat/openal-soft.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pipewire=
 pulseaudio', d)}"
+PACKAGECONFIG[alsa] =3D "-DALSOFT_BACKEND_ALSA=3DON,-DALSOFT_BACKEND_ALS=
A=3DOFF,alsa-lib"
+PACKAGECONFIG[oss] =3D "-DALSOFT_BACKEND_OSS=3DON,-DALSOFT_BACKEND_OSS=3D=
OFF"
+PACKAGECONFIG[pulseaudio] =3D "-DALSOFT_BACKEND_PULSEAUDIO=3DON,-DALSOFT=
_BACKEND_PULSEAUDIO=3DOFF,pulseaudio"
+PACKAGECONFIG[pipewire] =3D "-DALSOFT_BACKEND_PIPEWIRE=3DON,-DALSOFT_BAC=
KEND_PIPEWIRE=3DOFF,pipewire"
+PACKAGECONFIG[examples] =3D "-DALSOFT_EXAMPLES=3DON,-DALSOFT_EXAMPLES=3D=
OFF,libsdl2 ffmpeg"
+PACKAGECONFIG[sdl2] =3D "-DALSOFT_BACKEND_SDL2=3DON,-DALSOFT_BACKEND_SDL=
2=3DOFF,libsdl2 ffmpeg"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.42.0


