Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C10C43217
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:53:32 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.8302.1653051208990163559
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 05:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 69F3819BEA
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 14:53:27 +0200 (CEST)
Received: from localhost.localdomain ([84.154.173.254]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ns28F-1OuYO90; Fri, 20 May 2022 14:53:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCH 1/2] pipewire: fix build
Date: Fri, 20 May 2022 14:53:12 +0200
Message-Id: <20220520125313.4115361-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653051207-0000C4DD-738A1D3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 0664f86e-0f8b-4e19-96dc-168f9df41a6c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 May 2022 12:53:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97212

-after updating to poky master i get issues picking the right udev provid=
er
-add a backport patch to fix libsdl2 build with pipewire enabled
-allow native/nativesdk build

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-spa-fix-c90-header-include.patch     | 47 +++++++++++++++++++
 .../pipewire/pipewire_0.3.50.bb               | 16 +++++--
 2 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-spa-fix-c90-header-include.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-sp=
a-fix-c90-header-include.patch b/meta-multimedia/recipes-multimedia/pipew=
ire/pipewire/0001-spa-fix-c90-header-include.patch
new file mode 100644
index 000000000..ad6448a10
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c=
90-header-include.patch
@@ -0,0 +1,47 @@
+From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Wed, 13 Apr 2022 21:57:49 +0000
+Subject: [PATCH 001/154] spa: fix c90 header include
+
+placing declarations after code is invalid under ISO c90
+
+Fixes !1211
+
+Patch-Status: Backport
+---
+ spa/include/spa/utils/string.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/stri=
ng.h
+index e80434537..43d19616c 100644
+--- a/spa/include/spa/utils/string.h
++++ b/spa/include/spa/utils/string.h
+@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, size=
_t size, const char *format, .
+ static inline float spa_strtof(const char *str, char **endptr)
+ {
+ 	static locale_t locale =3D NULL;
++	locale_t prev;
+ 	float v;
+ 	if (SPA_UNLIKELY(locale =3D=3D NULL))
+ 		locale =3D newlocale(LC_ALL_MASK, "C", NULL);
+-	locale_t prev =3D uselocale(locale);
++	prev =3D uselocale(locale);
+ 	v =3D strtof(str, endptr);
+ 	uselocale(prev);
+ 	return v;
+@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, float=
 *val)
+ static inline double spa_strtod(const char *str, char **endptr)
+ {
+ 	static locale_t locale =3D NULL;
++	locale_t prev;
+ 	double v;
+ 	if (SPA_UNLIKELY(locale =3D=3D NULL))
+ 		locale =3D newlocale(LC_ALL_MASK, "C", NULL);
+-	locale_t prev =3D uselocale(locale);
++	prev =3D uselocale(locale);
+ 	v =3D strtod(str, endptr);
+ 	uselocale(prev);
+ 	return v;
+--=20
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
index 0d725b9ee..850c5a7c8 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
@@ -14,7 +14,10 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D "dbus ncurses"
=20
 SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+SRC_URI =3D " \
+	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;prot=
ocol=3Dhttps \
+	file://0001-spa-fix-c90-header-include.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -76,13 +79,14 @@ PACKAGECONFIG ??=3D "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
     gstreamer jack libusb pw-cat raop sndfile v4l2 \
 "
+UDEV_PROVIDER =3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 's=
ystemd', 'eudev', d)}"
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
 # since "jack" imports libjack, and "pipewire-jack" generates
 # libjack.so* files, thus colliding with the libpack package. This
 # is why these two are marked in their respective packageconfigs
 # as being in conflict.
-PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib ude=
v"
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib ${U=
DEV_PROVIDER}"
 PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi"
 PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
 PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Denabled,-Dbluez5-code=
c-aac=3Ddisabled,fdk-aac"
@@ -100,13 +104,13 @@ PACKAGECONFIG[raop] =3D "-Draop=3Denabled,-Draop=3D=
disabled,openssl"
 PACKAGECONFIG[sdl2] =3D "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libs=
dl2"
 PACKAGECONFIG[sndfile] =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,lib=
sndfile1"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
-PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-system-service=3Den=
abled,-Dsystemd-system-service=3Ddisabled,systemd"
+PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-system-service=3Den=
abled,-Dsystemd-system-service=3Ddisabled"
 # "systemd-user-service" packageconfig will only install service
 # files to rootfs but not enable them as systemd.bbclass
 # currently lacks the feature of enabling user services.
-PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Denable=
d,-Dsystemd-user-service=3Ddisabled,systemd"
+PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Denable=
d,-Dsystemd-user-service=3Ddisabled"
 # pw-cat needs sndfile packageconfig to be enabled
-PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
+PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,${UDEV_PROVI=
DER}"
 PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
@@ -335,3 +339,5 @@ FILES:${PN}-v4l2 +=3D " \
 FILES:gstreamer1.0-pipewire =3D " \
     ${libdir}/gstreamer-1.0/* \
 "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


