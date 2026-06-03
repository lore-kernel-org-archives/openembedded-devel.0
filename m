Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBADCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 13:25:49 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20205.1780493147163376213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 06:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=bhGVv2wc;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 777DB1880D57;
	Wed,  3 Jun 2026 15:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1780493144; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6hKL/IIu6ntWPwh+cK2uwGUz1mqlt6+jZo3AmSm/hzM=;
	b=bhGVv2wc01lg6Lp9heb6T0/V35s6NZTW9jKerRutpOoJfpqe9EK8Gdbxg2iv6Wzpa+TPAg
	BIcZ+7Rt2o4XDWGe41Ihxq+m1OnxPhOL8rwxHHMXBedvCKlRnQxaIPavHPEv+0xAEk6YXy
	ts+AMDuZWkuR0EUXrsOEbThMrAK7XxtPpHdYEJqU4I6+V6k4QBPam0zhz5aOLYtJKiAtUm
	p8APnhJo2WDl+EfhFZNZ6lvr+vZQ4c3QW4yZy9f8VYAFnrBIIwdrN5X9FYkV7zIMBQCa1M
	ioKidRVfuZ81H2caATBay6FFg486s1Oi8+N+vtOxjVtQ0G/yxOPvtDbeMG4M4g==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH] fastfetch: upgrade 2.63.1 -> 2.64.0
Date: Wed,  3 Jun 2026 15:25:23 +0200
Message-ID: <20260603132523.100251-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 13:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127381

Add PACKAGECONFIG entries for new optional build dependencies:
- libva for new Codec module
- libvdpau for new Codec module
- lua for Lua scripting support

Disable following CMake options explicitly:
- ENABLE_QUICKJS: no recipe exists for this yet
- ENABLE_EET: no recipe exists for this yet (introduced previously in 2.6=
3.0)

Changelog: https://github.com/fastfetch-cli/fastfetch/releases/tag/2.64.0

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../fastfetch/{fastfetch_2.63.1.bb =3D> fastfetch_2.64.0.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.63.1.bb =3D> fastf=
etch_2.64.0.bb} (91%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.63.1.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.64.0.bb
similarity index 91%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.63.1.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.64.0.bb
index bb4db47a49..951aa50ce4 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.63.1.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.64.0.bb
@@ -11,12 +11,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2090e7d93d=
f7ad5a3d41f6fb4226ac76"
 DEPENDS =3D "yyjson"
=20
 SRC_URI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV}"
-SRCREV =3D "acf610416c2d5bb1438f723699aca47647fbeba5"
+SRCREV =3D "d48bd733f062f374c382d67b59023c08925b0f40"
=20
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "\
     -DENABLE_SYSTEM_YYJSON=3DON \
+    -DENABLE_EET=3DOFF \
+    -DENABLE_QUICKJS=3DOFF \
 "
=20
 PACKAGECONFIG ??=3D "\
@@ -42,10 +44,13 @@ PACKAGECONFIG[freetype] =3D "-DENABLE_FREETYPE=3DON,-=
DENABLE_FREETYPE=3DOFF,freetype"
 PACKAGECONFIG[gio] =3D "-DENABLE_GIO=3DON,-DENABLE_GIO=3DOFF,glib-2.0"
 PACKAGECONFIG[glx] =3D "-DENABLE_GLX=3DON,-DENABLE_GLX=3DOFF,virtual/lib=
gles2"
 PACKAGECONFIG[imagemagick] =3D "-DENABLE_IMAGEMAGICK7=3DON -DENABLE_IMAG=
EMAGICK6=3DOFF,-DENABLE_IMAGEMAGICK7=3DOFF -DENABLE_IMAGEMAGICK6=3DOFF,im=
agemagick"
+PACKAGECONFIG[lua] =3D "-DENABLE_LUA=3DON,-DENABLE_LUA=3DOFF,lua"
 PACKAGECONFIG[opencl] =3D "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,op=
encl-headers virtual/libopencl1"
 PACKAGECONFIG[pulseaudio] =3D "-DENABLE_PULSE=3DON,-DENABLE_PULSE=3DOFF,=
pulseaudio"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
 PACKAGECONFIG[sqlite3] =3D "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF=
,sqlite3"
+PACKAGECONFIG[vaapi] =3D "-DENABLE_VA=3DON,-DENABLE_VA=3DOFF,libva"
+PACKAGECONFIG[vdpau] =3D "-DENABLE_VDPAU=3DON,-DENABLE_VDPAU=3DOFF,libvd=
pau"
 PACKAGECONFIG[vulkan] =3D "-DENABLE_VULKAN=3DON,-DENABLE_VULKAN=3DOFF,vu=
lkan-loader"
 PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND=3DON,-DENABLE_WAYLAND=3DOFF=
,wayland"
 PACKAGECONFIG[xcb] =3D "-DENABLE_XCB_RANDR=3DON,-DENABLE_XCB_RANDR=3DOFF=
,libxcb"

