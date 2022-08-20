Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB79C25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 18:02:38 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web12.9215.1661018551146911934
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Aug 2022 11:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id C4BAC106BA
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Aug 2022 20:01:47 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.39.106]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oPSn4-45vZ5t0; Sat, 20 Aug 2022 20:01:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCHv6] pipewire: update to v0.3.56
Date: Sat, 20 Aug 2022 20:01:39 +0200
Message-Id: <20220820180139.4779-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661018507-01446235-4D67B2A2/0/0 CLEAN NORMAL
X-TOI-MSGID: d43dcd32-c310-43c5-b670-e97bb78d00ec
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Aug 2022 18:02:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98339

Add the configuration to make pipewire work as a drop-in replacement for =
pulseaudio-server.

Add pipewire-media-session as a standalone recipe, since pipewire would f=
etch the code as a
subproject at do_configure.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++
 ...01-avb-fix-compilation-on-big-endian.patch | 27 +++++++++++
 .../0001-spa-fix-c90-header-include.patch     | 47 -------------------
 ...{pipewire_0.3.50.bb =3D> pipewire_0.3.56.bb} | 43 ++++++++++++-----
 4 files changed, 81 insertions(+), 58 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-=
media-session_0.4.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-avb-fix-compilation-on-big-endian.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-spa-fix-c90-header-include.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb =3D=
> pipewire_0.3.56.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-me=
dia-session_0.4.1.bb
new file mode 100644
index 000000000..5dd1eb160
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
+RRECOMMENDS:${PN} +=3D "pipewire"
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
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-av=
b-fix-compilation-on-big-endian.patch b/meta-multimedia/recipes-multimedi=
a/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
new file mode 100644
index 000000000..48a1102dc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-c=
ompilation-on-big-endian.patch
@@ -0,0 +1,27 @@
+From 1a5ec4452fa21592eaeeb823ad95a1db6eb60376 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Tue, 19 Jul 2022 13:49:42 +0200
+Subject: [PATCH 001/113] avb: fix compilation on big endian
+
+Patch-Status: Backport
+
+---
+ src/modules/module-avb/aaf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/module-avb/aaf.h b/src/modules/module-avb/aaf.h
+index cb4871ca6..b444ce251 100644
+--- a/src/modules/module-avb/aaf.h
++++ b/src/modules/module-avb/aaf.h
+@@ -35,7 +35,7 @@ struct avb_packet_aaf {
+ 	unsigned gv:1;
+ 	unsigned tv:1;
+=20
+-	uint8_t seq_number;
++	uint8_t seq_num;
+=20
+ 	unsigned _r2:7;
+ 	unsigned tu:1;
+--=20
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-sp=
a-fix-c90-header-include.patch b/meta-multimedia/recipes-multimedia/pipew=
ire/pipewire/0001-spa-fix-c90-header-include.patch
deleted file mode 100644
index ad6448a10..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c=
90-header-include.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001
-From: psykose <alice@ayaya.dev>
-Date: Wed, 13 Apr 2022 21:57:49 +0000
-Subject: [PATCH 001/154] spa: fix c90 header include
-
-placing declarations after code is invalid under ISO c90
-
-Fixes !1211
-
-Patch-Status: Backport
----
- spa/include/spa/utils/string.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/stri=
ng.h
-index e80434537..43d19616c 100644
---- a/spa/include/spa/utils/string.h
-+++ b/spa/include/spa/utils/string.h
-@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, size=
_t size, const char *format, .
- static inline float spa_strtof(const char *str, char **endptr)
- {
- 	static locale_t locale =3D NULL;
-+	locale_t prev;
- 	float v;
- 	if (SPA_UNLIKELY(locale =3D=3D NULL))
- 		locale =3D newlocale(LC_ALL_MASK, "C", NULL);
--	locale_t prev =3D uselocale(locale);
-+	prev =3D uselocale(locale);
- 	v =3D strtof(str, endptr);
- 	uselocale(prev);
- 	return v;
-@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, float=
 *val)
- static inline double spa_strtod(const char *str, char **endptr)
- {
- 	static locale_t locale =3D NULL;
-+	locale_t prev;
- 	double v;
- 	if (SPA_UNLIKELY(locale =3D=3D NULL))
- 		locale =3D newlocale(LC_ALL_MASK, "C", NULL);
--	locale_t prev =3D uselocale(locale);
-+	prev =3D uselocale(locale);
- 	v =3D strtod(str, endptr);
- 	uselocale(prev);
- 	return v;
---=20
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index c176c6eeb..fc5027938 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -6,6 +6,7 @@ AUTHOR      =3D "Wim Taymans <wtaymans@redhat.com>"
 SECTION     =3D "multimedia"
=20
 LICENSE =3D "MIT & LGPL-2.1-or-later & GPL-2.0-only"
+LICENSE_FLAGS =3D "commercial"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3D2158739e172e58dc9ab1bdd2d6ec9c72 \
     file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
@@ -13,10 +14,10 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
+SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
 SRC_URI =3D " \
 	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;prot=
ocol=3Dhttps \
-	file://0001-spa-fix-c90-header-include.patch \
+	file://0001-avb-fix-compilation-on-big-endian.patch \
 "
=20
 S =3D "${WORKDIR}/git"
@@ -62,7 +63,6 @@ EXTRA_OEMESON +=3D " \
     -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \
     -Dsystemd-system-unit-dir=3D${systemd_system_unitdir} \
     -Dsystemd-user-unit-dir=3D${systemd_user_unitdir} \
-    -Dvulkan=3Ddisabled \
     -Dman=3Ddisabled \
     -Dsession-managers=3D'[]' \
     -Dlv2=3Ddisabled \
@@ -72,12 +72,26 @@ EXTRA_OEMESON +=3D " \
     -Dlegacy-rtkit=3Dfalse \
 "
=20
-PACKAGECONFIG:class-target ??=3D "\
+# spa alsa plugin code uses typedef redefinition, which is officially a =
C11 feature.
+# Pipewire builds with 'c_std=3Dgnu99' by default. Recent versions of gc=
c don't issue this warning in gnu99
+# mode but it looks like clang still does
+CFLAGS:append =3D " -Wno-typedef-redefinition"
+
+# According to wireplumber documentation only one session manager should=
 be installed at a time
+# Possible options are media-session, which has fewer dependencies but i=
s very simple,
+# or wireplumber, which is more powerful.
+PIPEWIRE_SESSION_MANAGER ??=3D "media-session"
+
+BLUETOOTH_AAC =3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'comme=
rcial', 'bluez-aac', '', d)}"
+
+PACKAGECONFIG:class-target ??=3D " \
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
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETO=
OTH_AAC}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa dbus vulkan pulseaudio',=
 d)} \
+    ${PIPEWIRE_SESSION_MANAGER} \
+    jack libusb pw-cat raop sndfile v4l2 udev volume \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -96,6 +110,8 @@ PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddis=
abled,jack,,,pipewire-jack"
 PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabl=
ed,libcamera"
 PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3D=
disabled,libcanberra"
 PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb=
"
+PACKAGECONFIG[media-session] =3D ",,,pipewire-media-session"
+PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddisable=
d,pulseaudio"
 PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
 PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,=
,jack"
 PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
@@ -109,8 +125,12 @@ PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd=
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
+PACKAGECONFIG[wireplumber] =3D ",,,wireplumber"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
 PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
@@ -227,10 +247,11 @@ PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-m=
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
 "
=20
 FILES:${PN}-dev +=3D " \
--=20
2.34.1


