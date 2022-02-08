Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB42C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:35:01 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web08.13576.1644338100184192262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=J+FbRtGD;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JtTBV0JhHz9skX;
	Tue,  8 Feb 2022 17:34:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1644338097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/ahBK23BNmFrD+Dr8/lP2k1K+nYSy7ITyytBfq0aCs=;
	b=J+FbRtGDHnGnECRCSaFEKWK8pG1gwuAbnqISG3HbM69DVBvrqFKxR+8HvzskKCpNHuvEVk
	EZKc5wK1Gt7hkIxL4mOCA4Zht3sMZ9SpPAlkzSlfaYhUekac4JWV6xVL/FmR+s0ieyTcJf
	kbubYOpWPsU85mipsRI1Z98C9QGAPM6cOm1bCpO/4og/3dkOBw7TR14v1+IEfsjxIdj+8t
	NQermXwtcqyqhD2EjKda4YqpWY4re3NR+9EpXwiKerP2+U9AfzwNDUkznWw6I97hrxAhqZ
	GKGkUSBUvUw1RIdEq0SdOzJXDHwvVmRyWOs1+eT1t2o5fJOYtJ6xuL5easO4Rg==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: =george.kiagiadakis@collabora.com
Subject: [meta-multimedia][RFC PATCH 1/2] pipewire: Upgrade to 0.3.45
Date: Tue,  8 Feb 2022 17:34:39 +0100
Message-Id: <20220208163440.428471-2-crg7475@mailbox.org>
In-Reply-To: <20220208163440.428471-1-crg7475@mailbox.org>
References: <20220208163440.428471-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 16:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95269

Recipe changes:

* media-session is no longer built, since it is now a separate subproject=
,
  and it is considered obsolete; WirePlumber is the alternative that
  is recommended by upstream; see:
  https://gitlab.freedesktop.org/pipewire/media-session/-/blob/d2880ed23a=
a6e3df7038b311145f390e4f3428ef/README.md#pipewire-media-session
* new pipewire-v4l2 package that provides a virtual V4L2; contains
  a new "pw-v4l2" script to LD_PRELOAD libpw-v4l2.so
  device which transmits media data from/to a PipeWire graph
* pw-top needs ncurses, which is why this is added to DEPENDS
* pw-tools contains individual binary names to be able to separate
  the pw-v4l2 script from pw-tools
* libcamera and ffmpeg features are usable now
* remove unnecessary EXTRA_OEMESON switches for enabling plugins
  that are already on by default
* add avahi, libcanberra, webrtc-echo-cancelling, bluez-aac, libusb
  packageconfigs
* fix systemd-system-dir path and explicitly set systemd-user-dir path

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...{pipewire_0.3.34.bb =3D> pipewire_0.3.45.bb} | 117 ++++++++++++------
 1 file changed, 79 insertions(+), 38 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.34.bb =3D=
> pipewire_0.3.45.bb} (74%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
similarity index 74%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
index 2abc64efb..31798e47c 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
@@ -1,17 +1,19 @@
-SUMMARY =3D "Multimedia processing server for Linux"
+SUMMARY     =3D "Multimedia processing server for Linux"
 DESCRIPTION =3D "Linux server for handling and routing audio and video s=
treams between applications and multimedia I/O devices"
-HOMEPAGE =3D "https://pipewire.org/"
+HOMEPAGE    =3D "https://pipewire.org/"
 BUGTRACKER  =3D "https://gitlab.freedesktop.org/pipewire/pipewire/issues=
"
+AUTHOR      =3D "Wim Taymans <wtaymans@redhat.com>"
+SECTION     =3D "multimedia"
+
 LICENSE =3D "MIT & LGPL-2.1-or-later & GPL-2.0-only"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3D2158739e172e58dc9ab1bdd2d6ec9c72 \
     file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
 "
-SECTION =3D "multimedia"
=20
-DEPENDS =3D "dbus"
+DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "1924c2c29824955b5e763f1def6967f68e403c7c"
+SRCREV =3D "bdd407fe66cc9e46d4bc4dcc989d50679000482b"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -27,36 +29,47 @@ USERADD_PARAM:${PN} =3D "--system --home / --no-creat=
e-home \
                        --gid pipewire --groups audio,video \
                        pipewire"
=20
-SYSTEMD_PACKAGES =3D "${PN} ${PN}-media-session"
+SYSTEMD_PACKAGES =3D "${PN}"
=20
 # For "EVL", look up https://evlproject.org/ . It involves
 # a specially prepared kernel, and is currently unavailable
 # in Yocto.
 #
-# FFmpeg and Vulkan aren't really supported - at the current
-# stage (version 0.3.22), these are just experiments, not
-# actual features.
-#
-# libcamera support currently does not build successfully.
+# Vulkan support is currently (as of version 0.3.44) not functional.
 #
 # manpage generation requires xmltoman, which is not available.
+#
+# The session-managers list specifies which session managers Meson
+# shall download (via git clone) and build as subprojects. In OE,
+# this is not how a session manager should be built. Instead, they
+# should be integrated as separate OE recipes. To prevent PipeWire
+# from using this Meson feature, set an empty list.
+# This does not disable support or the need for session managers,
+# it just prevents this subproject feature.
+#
+# AptX and LDAC are not available in OE. Currently, neither
+# are lv2 and ROC.
 EXTRA_OEMESON +=3D " \
-    -Daudiotestsrc=3Denabled \
     -Devl=3Ddisabled \
     -Dtests=3Ddisabled \
     -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \
-    -Dvideotestsrc=3Denabled \
-    -Dffmpeg=3Ddisabled \
+    -Dsystemd-system-unit-dir=3D${systemd_system_unitdir} \
+    -Dsystemd-user-unit-dir=3D${systemd_user_unitdir} \
     -Dvulkan=3Ddisabled \
-    -Dlibcamera=3Ddisabled \
     -Dman=3Ddisabled \
+    -Dsession-managers=3D'[]' \
+    -Dlv2=3Ddisabled \
+    -Droc=3Ddisabled \
+    -Dbluez5-codec-aptx=3Ddisabled \
+    -Dbluez5-codec-ldac=3Ddisabled \
 "
=20
 PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
-    gstreamer jack sndfile pw-cat v4l2 \
+    gstreamer jack libusb pw-cat raop sndfile v4l2 \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -65,23 +78,31 @@ PACKAGECONFIG ??=3D "\
 # is why these two are marked in their respective packageconfigs
 # as being in conflict.
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib ude=
v"
+PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi"
 PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
-PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve"
+PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Denabled,-Dbluez5-code=
c-aac=3Ddisabled,fdk-aac"
+PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve graphviz-native"
+PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack,,,pipew=
ire-jack"
+PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabl=
ed,libcamera"
+PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3D=
disabled,libcanberra"
+PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb=
"
+PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
+PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
,jack"
+PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
+PACKAGECONFIG[raop] =3D "-Draop=3Denabled,-Draop=3Ddisabled,openssl"
 PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
 PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
 PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-system-service=3Den=
abled,-Dsystemd-system-service=3Ddisabled,systemd"
-# "systemd-user-service" packageconfig  will only install service
+# "systemd-user-service" packageconfig will only install service
 # files to rootfs but not enable them as systemd.bbclass
 # currently lacks the feature of enabling user services.
 PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Denable=
d,-Dsystemd-user-service=3Ddisabled,systemd"
 # pw-cat needs sndfile packageconfig to be enabled
-PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
 PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
-PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
-PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
,jack"
+PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
 PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
@@ -93,8 +114,11 @@ remove_unused_installed_files() {
     # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
     # Remove it if pipewire-jack is not built to avoid creating the
     # pipewire-jack package.
+    # minimal.conf is an example of how to minimally configure the
+    # daemon and is not meant to be used for production.
     if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', '=
true', d)}; then
         rm -f "${D}${datadir}/pipewire/jack.conf"
+        rm -f "${D}${datadir}/pipewire/minimal.conf"
     fi
 }
=20
@@ -179,13 +203,13 @@ PACKAGES =3D+ "\
     ${PN}-pulse \
     ${PN}-alsa \
     ${PN}-jack \
-    ${PN}-media-session \
     ${PN}-spa-plugins \
     ${PN}-spa-plugins-meta \
     ${PN}-spa-tools \
     ${PN}-modules \
     ${PN}-modules-meta \
     ${PN}-alsa-card-profile \
+    ${PN}-v4l2 \
     gstreamer1.0-pipewire \
 "
=20
@@ -195,6 +219,7 @@ SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'systemd-system-s
 CONFFILES:${PN} +=3D "${datadir}/pipewire/pipewire.conf"
 FILES:${PN} =3D " \
     ${datadir}/pipewire/pipewire.conf \
+    ${systemd_system_unitdir}/pipewire.* \
     ${systemd_user_unitdir}/pipewire.* \
     ${bindir}/pipewire \
 "
@@ -217,7 +242,23 @@ RDEPENDS:libpipewire +=3D " \
 "
=20
 FILES:${PN}-tools =3D " \
-    ${bindir}/pw-* \
+    ${bindir}/pw-cat \
+    ${bindir}/pw-cli \
+    ${bindir}/pw-dot \
+    ${bindir}/pw-dsdplay \
+    ${bindir}/pw-dump \
+    ${bindir}/pw-link \
+    ${bindir}/pw-loopback \
+    ${bindir}/pw-metadata \
+    ${bindir}/pw-mididump \
+    ${bindir}/pw-midiplay \
+    ${bindir}/pw-midirecord \
+    ${bindir}/pw-mon \
+    ${bindir}/pw-play \
+    ${bindir}/pw-profiler \
+    ${bindir}/pw-record \
+    ${bindir}/pw-reserve \
+    ${bindir}/pw-top \
 "
=20
 # This is a shim daemon that is intended to be used as a
@@ -226,6 +267,7 @@ FILES:${PN}-tools =3D " \
 CONFFILES:${PN}-pulse +=3D "${datadir}/pipewire/pipewire-pulse.conf"
 FILES:${PN}-pulse =3D " \
     ${datadir}/pipewire/pipewire-pulse.conf \
+    ${systemd_system_unitdir}/pipewire-pulse.* \
     ${systemd_user_unitdir}/pipewire-pulse.* \
     ${bindir}/pipewire-pulse \
 "
@@ -233,39 +275,32 @@ RDEPENDS:${PN}-pulse +=3D " \
     ${PN}-modules-protocol-pulse \
 "
=20
-# alsa plugin to redirect audio to pipewire
+# ALSA plugin to redirect audio to pipewire.
 FILES:${PN}-alsa =3D "\
     ${libdir}/alsa-lib/* \
     ${datadir}/alsa/alsa.conf.d/* \
 "
=20
-# jack drop-in libraries to redirect audio to pipewire
+# JACK drop-in libraries to redirect audio to pipewire.
 CONFFILES:${PN}-jack =3D "${datadir}/pipewire/jack.conf"
 FILES:${PN}-jack =3D "\
     ${datadir}/pipewire/jack.conf \
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
 "
=20
-# Example session manager. Not intended for use in production.
-CONFFILES:${PN}-media-session =3D "${datadir}/pipewire/media-session.d/*=
"
-SYSTEMD_SERVICE:${PN}-media-session =3D "${@bb.utils.contains('PACKAGECO=
NFIG', 'systemd-system-service', 'pipewire-media-session.service', '', d)=
}"
-FILES:${PN}-media-session =3D " \
-    ${bindir}/pipewire-media-session \
-    ${datadir}/pipewire/media-session.d/* \
-    ${systemd_system_unitdir}/pipewire-media-session.service \
-    ${systemd_user_unitdir}/pipewire-media-session.service \
-"
-RPROVIDES:${PN}-media-session =3D "virtual-pipewire-sessionmanager"
-
-# Dynamic packages (see set_dynamic_metapkg_rdepends).
+# Dynamic SPA plugin packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-spa-plugins =3D ""
 RRECOMMENDS:${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"
=20
+FILES:${PN}-spa-plugins-bluez5 +=3D " \
+    ${datadir}/${SPA_SUBDIR}/bluez5/* \
+"
+
 FILES:${PN}-spa-tools =3D " \
     ${bindir}/spa-* \
 "
=20
-# Dynamic packages (see set_dynamic_metapkg_rdepends).
+# Dynamic PipeWire module packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-modules =3D ""
 RRECOMMENDS:${PN}-modules +=3D "${PN}-modules-meta"
=20
@@ -284,6 +319,12 @@ FILES:${PN}-alsa-card-profile =3D " \
     ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
 "
=20
+# V4L2 interface emulator for sending/receiving data between PipeWire an=
d V4L2 applications.
+FILES:${PN}-v4l2 +=3D " \
+    ${bindir}/pw-v4l2 \
+    ${libdir}/${PW_MODULE_SUBDIR}/v4l2/libpw-v4l2.so \
+"
+
 FILES:gstreamer1.0-pipewire =3D " \
     ${libdir}/gstreamer-1.0/* \
 "
--=20
2.32.0


