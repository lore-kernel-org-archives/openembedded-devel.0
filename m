Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A832410706CC
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 10:30:04 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7371.1773484200791206076
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 03:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=PoTtmTWp;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F38A7188001B;
	Sat, 14 Mar 2026 11:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1773484198; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9acd98bGvfl945sGy0F8+NH9W6pMhgw+je0m+Cn98wk=;
	b=PoTtmTWpSjrEisptHKzbXcSPJwJgqrAi4RSEUuVss+jd23LVdpFmerwN1sF6SGbMLdpUk5
	8An80BSOnlDJb9Ic71VMU0u12DyfSFlh2TDNtICFFHwR/EHZfxl0OeCW58Tn1nBnc5gZ+9
	0ahoo+Xp7nXdOuRELEmT0iB06URA1ms58UgOhEM9J9V8iz5kXSPdsvE73ZFz4L2n85ogaX
	DuEO138hXK7VzZYLDtqTeRD0lhbzs1NNyNEHeUMtJ2y7L1cD7d03LGrX+4bhaMa8eIwNEC
	E6AQSOz8B1hJE3Rg/wk/gIkRSMAxkyMCGsuGSHieeB4fyVlBnVMg8LKXRz7CnA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH] fastfetch: add recipe
Date: Sat, 14 Mar 2026 11:29:23 +0100
Message-ID: <20260314102923.385544-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 10:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125201

fastfetch is a customisable tool for displaying system information in a
terminal.

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../fastfetch/fastfetch_2.60.0.bb             | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
new file mode 100644
index 0000000000..dbb999969b
--- /dev/null
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
@@ -0,0 +1,66 @@
+SUMMARY =3D "A maintained, feature-rich and performance oriented, neofet=
ch like system information tool."
+DESCRIPTION =3D "Fastfetch is a neofetch-like tool for fetching system \
+information and displaying it in a visually appealing way. It is written=
 \
+mainly in C, with a focus on performance and customizability."
+HOMEPAGE =3D "https://github.com/fastfetch-cli/fastfetch"
+BUGTRACKER =3D "https://github.com/fastfetch-cli/fastfetch/issues"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2090e7d93df7ad5a3d41f6fb4226a=
c76"
+
+DEPENDS =3D "yyjson"
+
+SRC_URI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhtt=
ps;branch=3Ddev;tag=3D${PV}"
+SRCREV =3D "06ecc9c4805794ca8d632844e64950e82a6d5f7e"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE +=3D "\
+    -DENABLE_SYSTEM_YYJSON=3DON \
+    -DENABLE_DIRECTX_HEADERS=3DOFF \
+"
+
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}=
 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrandr', '', d)}=
 \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opencl pulseaudio vulkan wayl=
and', d)} \
+    dbus \
+    drm \
+    sqlite3 \
+"
+
+PACKAGECONFIG[chafa] =3D "-DENABLE_CHAFA=3DON,-DENABLE_CHAFA=3DOFF,chafa=
"
+PACKAGECONFIG[dbus] =3D "-DENABLE_DBUS=3DON,-DENABLE_DBUS=3DOFF,dbus"
+PACKAGECONFIG[dconf] =3D "-DENABLE_DCONF=3DON,-DENABLE_DCONF=3DOFF,dconf=
"
+PACKAGECONFIG[ddcutil] =3D "-DENABLE_DDCUTIL=3DON,-DENABLE_DDCUTIL=3DOFF=
,ddcutil"
+PACKAGECONFIG[drm-amdgpu] =3D "-DENABLE_DRM_AMDGPU=3DON,-DENABLE_DRM_AMD=
GPU=3DOFF,"
+PACKAGECONFIG[drm] =3D "-DENABLE_DRM=3DON,-DENABLE_DRM=3DOFF,libdrm"
+PACKAGECONFIG[egl] =3D "-DENABLE_EGL=3DON,-DENABLE_EGL=3DOFF,virtual/egl=
"
+PACKAGECONFIG[elf] =3D "-DENABLE_ELF=3DON,-DENABLE_ELF=3DOFF,elfutils"
+PACKAGECONFIG[flashfetch] =3D "-DBUILD_FLASHFETCH=3DON,-DBUILD_FLASHFETC=
H=3DOFF,"
+PACKAGECONFIG[freetype] =3D "-DENABLE_FREETYPE=3DON,-DENABLE_FREETYPE=3D=
OFF,freetype"
+PACKAGECONFIG[gio] =3D "-DENABLE_GIO=3DON,-DENABLE_GIO=3DOFF,glib-2.0"
+PACKAGECONFIG[glx] =3D "-DENABLE_GLX=3DON,-DENABLE_GLX=3DOFF,virtual/lib=
gles2"
+PACKAGECONFIG[imagemagick] =3D "-DENABLE_IMAGEMAGICK7=3DON -DENABLE_IMAG=
EMAGICK6=3DOFF,-DENABLE_IMAGEMAGICK7=3DOFF -DENABLE_IMAGEMAGICK6=3DOFF,im=
agemagick"
+PACKAGECONFIG[opencl] =3D "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,op=
encl-headers virtual/libopencl1"
+PACKAGECONFIG[pulseaudio] =3D "-DENABLE_PULSE=3DON,-DENABLE_PULSE=3DOFF,=
pulseaudio"
+PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
+PACKAGECONFIG[sqlite3] =3D "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF=
,sqlite3"
+PACKAGECONFIG[vulkan] =3D "-DENABLE_VULKAN=3DON,-DENABLE_VULKAN=3DOFF,vu=
lkan-loader"
+PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND=3DON,-DENABLE_WAYLAND=3DOFF=
,wayland"
+PACKAGECONFIG[xcb] =3D "-DENABLE_XCB_RANDR=3DON,-DENABLE_XCB_RANDR=3DOFF=
,libxcb"
+PACKAGECONFIG[xrandr] =3D "-DENABLE_XRANDR=3DON,-DENABLE_XRANDR=3DOFF,li=
bxrandr"
+PACKAGECONFIG[zfs] =3D "-DENABLE_LIBZFS=3DON,-DENABLE_LIBZFS=3DOFF,zfs"
+PACKAGECONFIG[zlib] =3D "-DENABLE_ZLIB=3DON,-DENABLE_ZLIB=3DOFF,zlib"
+
+PACKAGES =3D+ "${PN}-completions"
+
+FILES:${PN} +=3D "${datadir}/licenses"
+
+FILES:${PN}-completions =3D "\
+    ${datadir}/bash-completion \
+    ${datadir}/fish \
+    ${datadir}/zsh \
+"
+RDEPENDS:${PN}-completions +=3D "python3-json"

