Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19157C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:49:07 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.33639.1660765737537335206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout07.t-online.de (Postfix) with SMTP id 51203125BD
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 21:48:55 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.46.233]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oOP24-0l0XMv0; Wed, 17 Aug 2022 21:48:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update to v0.3.56
Date: Wed, 17 Aug 2022 21:48:43 +0200
Message-Id: <20220817194843.5200-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1660765732-0144C2AD-74213BC8/0/0 CLEAN NORMAL
X-TOI-MSGID: 4885bf15-77b7-49ac-a8eb-e7b88670c1ab
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 19:49:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98312

Add the configuration to make pipewire work as a drop-in replacement for =
pulseaudio-server.

Add pipewire-media-session as a standalone recipe, since pipewire would f=
etch the code as a
subproject at do_configure.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++++++++
 ...{pipewire_0.3.50.bb =3D> pipewire_0.3.56.bb} | 27 ++++++++++++-------
 2 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-=
media-session_0.4.1.bb
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb =3D=
> pipewire_0.3.56.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-me=
dia-session_0.4.1.bb
new file mode 100644
index 000000000..bec911fc5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "PipeWire Media Session is an example session manager for Pi=
peWire"
+HOMEPAGE =3D "https://gitlab.freedesktop.org/pipewire/media-session"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931=
c1a"
+
+DEPENDS =3D " \
+	pipewire \
+	alsa-lib \
+	dbus \
+"
+
+RDEPENDS:${PN} =3D "pipewire"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
+
+inherit meson pkgconfig
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index c176c6eeb..7a913d5f9 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -13,10 +13,9 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
+SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
 SRC_URI =3D " \
 	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;prot=
ocol=3Dhttps \
-	file://0001-spa-fix-c90-header-include.patch \
 "
=20
 S =3D "${WORKDIR}/git"
@@ -73,11 +72,12 @@ EXTRA_OEMESON +=3D " \
 "
=20
 PACKAGECONFIG:class-target ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'f=
fmpeg', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
-    gstreamer jack libusb pw-cat raop sndfile v4l2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-aa=
c', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa dbus vulkan pulseaudio',=
 d)} \
+    jack libusb pw-cat raop sndfile v4l2 udev volume \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -96,6 +96,7 @@ PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisa=
bled,jack,,,pipewire-jack"
 PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabl=
ed,libcamera"
 PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3D=
disabled,libcanberra"
 PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb=
"
+PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddisable=
d,pulseaudio"
 PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
 PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
,jack"
 PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
@@ -109,7 +110,10 @@ PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd=
-system-service=3Denabled,-Dsyst
 # currently lacks the feature of enabling user services.
 PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Denable=
d,-Dsystemd-user-service=3Ddisabled,systemd"
 # pw-cat needs sndfile packageconfig to be enabled
+PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddisabled,udev"
 PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
+PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled"
+PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-headers vulkan-loader"
 PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
@@ -227,10 +231,15 @@ PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-m=
odules.*"
 SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'system=
d-system-service', 'pipewire.service', '', d)}"
 CONFFILES:${PN} +=3D "${datadir}/pipewire/pipewire.conf"
 FILES:${PN} =3D " \
-    ${datadir}/pipewire/pipewire.conf \
-    ${systemd_system_unitdir}/pipewire.* \
-    ${systemd_user_unitdir}/pipewire.* \
+    ${datadir}/pipewire \
+    ${systemd_system_unitdir}/pipewire* \
+    ${systemd_user_unitdir}/pipewire* \
     ${bindir}/pipewire \
+    ${bindir}/pipewire-avb \
+"
+
+RRECOMMENDS:${PN} +=3D " \
+    ${PN}-media-session \
 "
=20
 FILES:${PN}-dev +=3D " \
--=20
2.34.1


