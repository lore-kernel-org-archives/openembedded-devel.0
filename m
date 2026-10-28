Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6215.1793219228222800127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 13:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=HvKX8/4A;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FFCB2E40E9F;
	Wed, 28 Oct 2026 21:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1793219225; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=18rKgjVvAaASj7MjA0uYr7FuOpk82Muu8klGp+zEVVE=;
	b=HvKX8/4A3yfWy5Fgdg3+lv3VuByVn6C34sk4Ht1LCzBGAgGI+/nBy/vfEed/z29jUWKXdf
	z3uZHinaiUO2X2mMTq5MB2VI1Nns5FX14R6SbqmO6MuCthoH/s3kxQeza4LDA2oSSVscNh
	RhBM4ra6avzwAQW6EAX76WZdwG5GRCVQ06G7mr+ujfkuNS488YRzPtQYH5i+gDHkvjWl8l
	9rhSdiQmEgVYeS2mn6WSe7xFlFlncfEO1NImInQmGcwyFLGoQvA8lrPEXYcXzmj/yAP1PK
	oEcSonGtbRLR3bgnQdd2qJf1KyRPsmCZrbRKYL27RujvLxAHMpWdsXUVJ9LUFg==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH] fastfetch: upgrade 2.69.0 -> 2.70.0
Date: Wed, 28 Oct 2026 21:26:05 +0100
Message-ID: <20261028202605.64490-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 20:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131631
Content-Type: text/plain; charset="utf-8"

Drop quickjs packageconfig. Previously 2.69.0 marked quickjs as
deprecated and in 2.70.0 the option has been removed.

Drop pulseaudio and ddcutil packageconfig. The libraries libpulse and
libddcutil are not used in the Linux build anymore and got removed.

Full changelog: https://github.com/fastfetch-cli/fastfetch/releases/tag/2=
.70.0

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../fastfetch/{fastfetch_2.69.0.bb =3D> fastfetch_2.70.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.69.0.bb =3D> fastf=
etch_2.70.0.bb} (89%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
similarity index 89%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
index 761dafc039..c1cfa4548f 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2090e7d93df7=
ad5a3d41f6fb4226ac76"
 DEPENDS =3D "yyjson"
=20
 SRC_URI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV}"
-SRCREV =3D "0c3b852bf7bad2837a814c7a31bf332092048a2b"
+SRCREV =3D "17bb3fd2384bd814b421d73b8c8b8d08e06cfa26"
=20
 inherit cmake pkgconfig
=20
@@ -25,7 +25,7 @@ PACKAGECONFIG ??=3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}=
 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrandr', '', d)}=
 \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opencl pulseaudio vulkan wayl=
and', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opencl vulkan wayland', d)} \
     dbus \
     drm \
     sqlite3 \
@@ -34,7 +34,6 @@ PACKAGECONFIG ??=3D "\
 PACKAGECONFIG[chafa] =3D "-DENABLE_CHAFA=3DON,-DENABLE_CHAFA=3DOFF,chafa=
"
 PACKAGECONFIG[dbus] =3D "-DENABLE_DBUS=3DON,-DENABLE_DBUS=3DOFF,dbus"
 PACKAGECONFIG[dconf] =3D "-DENABLE_DCONF=3DON,-DENABLE_DCONF=3DOFF,dconf=
"
-PACKAGECONFIG[ddcutil] =3D "-DENABLE_DDCUTIL=3DON,-DENABLE_DDCUTIL=3DOFF=
,ddcutil"
 PACKAGECONFIG[drm] =3D "-DENABLE_DRM=3DON,-DENABLE_DRM=3DOFF,libdrm"
 PACKAGECONFIG[egl] =3D "-DENABLE_EGL=3DON,-DENABLE_EGL=3DOFF,virtual/egl=
"
 PACKAGECONFIG[elf] =3D "-DENABLE_ELF=3DON,-DENABLE_ELF=3DOFF,elfutils"
@@ -45,8 +44,6 @@ PACKAGECONFIG[glx] =3D "-DENABLE_GLX=3DON,-DENABLE_GLX=3D=
OFF,virtual/libgles2"
 PACKAGECONFIG[imagemagick] =3D "-DENABLE_IMAGEMAGICK7=3DON -DENABLE_IMAG=
EMAGICK6=3DOFF,-DENABLE_IMAGEMAGICK7=3DOFF -DENABLE_IMAGEMAGICK6=3DOFF,im=
agemagick"
 PACKAGECONFIG[lua] =3D "-DENABLE_LUA=3DON,-DENABLE_LUA=3DOFF,lua"
 PACKAGECONFIG[opencl] =3D "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,op=
encl-headers virtual/libopencl1"
-PACKAGECONFIG[pulseaudio] =3D "-DENABLE_PULSE=3DON,-DENABLE_PULSE=3DOFF,=
pulseaudio"
-PACKAGECONFIG[quickjs] =3D "-DENABLE_QUICKJS=3DON,-DENABLE_QUICKJS=3DOFF=
,quickjs"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
 PACKAGECONFIG[sixel] =3D "-DENABLE_SIXEL=3DON,-DENABLE_SIXEL=3DOFF,"
 PACKAGECONFIG[sqlite3] =3D "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF=
,sqlite3"
