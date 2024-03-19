Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EAFC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:27:48 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.10828.1710840459696427811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 02:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id C9C0710155
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 10:27:37 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmVks-1vHNJZ0; Tue, 19 Mar 2024 10:27:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] freerdp3: add recipe
Date: Tue, 19 Mar 2024 10:27:58 +0100
Message-ID: <20240319092758.338386-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710840454-E5219957-1D9FCFB3/0/0 CLEAN NORMAL
X-TOI-MSGID: 63b10249-bdfa-4188-92ba-475928d10983
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 09:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109476

freerdp3 is required to build gnome-remote-desktop-46.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/freerdp/freerdp3_3.4.0.bb | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/=
recipes-support/freerdp/freerdp3_3.4.0.bb
new file mode 100644
index 000000000..f04be56c6
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -0,0 +1,59 @@
+DESCRIPTION =3D "FreeRDP RDP client & server library"
+HOMEPAGE =3D "http://www.freerdp.com"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+DEPENDS =3D "openssl ffmpeg libusb1 uriparser cairo icu pkcs11-helper zl=
ib jpeg"
+
+inherit pkgconfig cmake
+
+SRCREV =3D "708f3764897e06297469a7b0507b3c9ecc041ad7"
+SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protoc=
ol=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ??=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', =
d)} \
+    gstreamer cups pcsc \
+"
+
+EXTRA_OECMAKE =3D " \
+    -DRDTK_FORCE_STATIC_BUILD=3DON \
+    -DUWAC_FORCE_STATIC_BUILD=3DON \
+    -DWITH_ADD=3DON \
+    -DWITH_BINARY_VERSIONING=3DON \
+    -DWITH_CHANNELS=3DON \
+    -DWITH_CLIENT_CHANNELS=3DON \
+    -DWITH_JPEG=3DON \
+    -DWITH_PKCS11=3DON \
+    -DWITH_SERVER_CHANNELS=3DON \
+    -DWITH_SERVER=3DON \
+    -DPKG_CONFIG_RELOCATABLE=3DOFF \
+    -DWITH_ALSA=3DOFF \
+    -DWITH_CLIENT_SDL=3DOFF \
+    -DWITH_SAMPLE=3DOFF \
+ "
+
+X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi =
libxrender libxfixes libxdamage libxrandr libxkbfile"
+PACKAGECONFIG[x11] =3D "-DWITH_X11=3DON -DWITH_XINERAMA=3DON -DWITH_XEXT=
=3DON -DWITH_XCURSOR=3DON -DWITH_XV=3DON -DWITH_XI=3DON -DWITH_XRENDER=3D=
ON -DWITH_XFIXES=3DON -DWITH_XDAMAGE=3DON -DWITH_XRANDR=3DON -DWITH_XKBFI=
LE=3DON,-DWITH_X11=3DOFF,${X11_DEPS}"
+PACKAGECONFIG[wayland] =3D "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,way=
land wayland-native libxkbcommon"
+PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-DWITH_PAM=3DOFF,libpam"
+PACKAGECONFIG[pulseaudio] =3D "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=3D=
OFF,pulseaudio"
+PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER_1_0=3DON,-DWITH_GSTREAMER=
_1_0=3DOFF,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,cups"
+PACKAGECONFIG[fuse] =3D "-DWITH_FUSE=3DON,-DWITH_FUSE=3DOFF,fuse3,fuse3"
+PACKAGECONFIG[pcsc] =3D "-DWITH_PCSC=3DON,-DWITH_PCSC=3DOFF,pcsc-lite"
+PACKAGECONFIG[manpages] =3D "-DWITH_MANPAGES=3DON,-DWITH_MANPAGES=3DOFF,=
 libxslt-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[ffmpeg] =3D "-DWITH_DSP_FFMPEG=3DON -DWITH_FFMPEG=3DON, -D=
WITH_DSP_FFMPEG=3DOFF -DWITH_FFMPEG=3DOFF"
+PACKAGECONFIG[openh264] =3D "-DWITH_OPENH264=3DON,-DWITH_OPENH264=3DOFF,=
openh264"
+PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-icd-loader"
+PACKAGECONFIG[lame] =3D "-DWITH_LAME=3DON,-DWITH_LAME=3DOFF,lame"
+PACKAGECONFIG[faad] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faad2"
+PACKAGECONFIG[faac] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DOFF,faac"
+
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
+    sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
+}
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.44.0


