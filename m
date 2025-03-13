Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97350C282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:13:11 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.15799.1741875184288981248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 8AA5968B
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 15:12:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsjIU-0eVPfd0; Thu, 13 Mar 2025 15:12:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv3] libsdl3: add recipe
Date: Thu, 13 Mar 2025 15:13:09 +0100
Message-ID: <20250313141309.605889-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741875150-01FF9450-531A8331/0/0 CLEAN NORMAL
X-TOI-MSGID: e4031fc1-f9dc-4b30-8a3c-0206d66a418c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 14:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115973

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/=
recipes-graphics/libsdl3/libsdl3_3.2.8.bb
new file mode 100644
index 0000000000..63a78907b0
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
@@ -0,0 +1,79 @@
+SUMMARY =3D "Simple DirectMedia Layer"
+DESCRIPTION =3D "Simple DirectMedia Layer is a cross-platform multimedia=
 \
+library designed to provide low level access to audio, keyboard, mouse, =
\
+joystick, 3D hardware via OpenGL, and 2D video framebuffer."
+HOMEPAGE =3D "http://www.libsdl.org"
+BUGTRACKER =3D "http://bugzilla.libsdl.org/"
+
+SECTION =3D "libs"
+
+LICENSE =3D "Zlib & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "\
+    file://LICENSE.txt;md5=3Dcbf0e3161523f9a9315b6b915c5c4457 \
+    file://src/hidapi/LICENSE.txt;md5=3D7c3949a631240cb6c31c50f3eb696077=
 \
+    file://src/hidapi/LICENSE-bsd.txt;md5=3Db5fa085ce0926bb50d0621620a82=
361f \
+    file://src/video/yuv2rgb/LICENSE;md5=3D79f8f3418d91531e05f0fc94ca67e=
071 \
+"
+
+PROVIDES =3D "virtual/libsdl3"
+
+SRC_URI =3D "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
+
+S =3D "${WORKDIR}/SDL3-${PV}"
+
+SRC_URI[sha256sum] =3D "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942=
ba926e378e00db03"
+
+inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
+
+CVE_PRODUCT =3D "simple_directmedia_layer sdl"
+
+EXTRA_OECMAKE =3D " \
+	-DSDL_OSS_DEFAULT=3DOFF \
+	-DSDL_DISKAUDIO=3DOFF \
+	-DSDL_DUMMYVIDEO=3DOFF \
+	-DSDL_RPI=3DOFF \
+	-DSDL_PTHREADS=3DON \
+	-DSDL_RPATH=3DOFF \
+	-DSDL_SNDIO=3DOFF \
+	-DSDL_X11_XCURSOR=3DOFF \
+	-DSDL_X11_XDBE=3DOFF \
+	-DSDL_X11_XFIXES=3DOFF \
+	-DSDL_X11_XINPUT=3DOFF \
+	-DSDL_X11_XRANDR=3DOFF \
+	-DSDL_X11_XSCRNSAVER=3DOFF \
+	-DSDL_X11_XSHAPE=3DOFF \
+"
+
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d=
)}"
+
+PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
+PACKAGECONFIG ??=3D " \
+	${PACKAGECONFIG_GL} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio pipewire x11 vul=
kan', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '',=
 d)} \
+	${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
+"
+PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
+PACKAGECONFIG[arm-neon]   =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF"
+PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
+PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
+PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
+# The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
+#  so we'll just use libusb when it's available.
+PACKAGECONFIG[libusb] =3D "-DSDL_HIDAPI_LIBUSB=3DON,-DSDL_HIDAPI_LIBUSB=3D=
OFF,libusb1"
+PACKAGECONFIG[libdecor] =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_L=
IBDECOR=3DOFF,libdecor,libdecor"
+PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
+PACKAGECONFIG[pipewire] =3D "-DSDL_PIPEWIRE_SHARED=3DON,-DSDL_PIPEWIRE_S=
HARED=3DOFF,pipewire"
+PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
+PACKAGECONFIG[vulkan]    =3D "-DSDL_VULKAN=3DON -DSDL_RENDER_VULKAN=3DON=
,-DSDL_VULKAN=3DOFF -DSDL_RENDER_VULKAN=3DOFF"
+PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
+PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11 libxext libxrandr libxrender"
+
+CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY"
+
+FILES:${PN} +=3D "${datadir}/licenses/SDL3/LICENSE.txt"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.48.1


