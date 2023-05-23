Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5ACC7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 08:49:48 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.17112.1684831787636352738
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 01:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout09.t-online.de (Postfix) with SMTP id 3B85377FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 10:49:45 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.41.120]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q1NiC-1gwuIL0; Tue, 23 May 2023 10:49:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] fluidsynth: update 2.2.6 -> 2.3.2
Date: Tue, 23 May 2023 10:49:28 +0200
Message-Id: <20230523084928.1109458-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1684831784-0EFFDC77-4737F879/0/0 CLEAN NORMAL
X-TOI-MSGID: ffd92db9-658d-4c81-8a7d-e15e259568f5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102730

-remove unneeded patch
-remove fluidsynth-native as it seems to be unneeded
-remove STAGING_LIBDIR from target files
-add more packageconfig options

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../fluidsynth/fluidsynth-native_git.bb       | 10 ----
 .../fluidsynth/fluidsynth.inc                 | 12 -----
 ...tables-helper-we-have-to-use-native-.patch | 49 -------------------
 .../fluidsynth/fluidsynth_git.bb              | 33 ++++++++++---
 4 files changed, 25 insertions(+), 79 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsy=
nth-native_git.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsy=
nth.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsy=
nth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-nat=
ive_git.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-nat=
ive_git.bb
deleted file mode 100644
index a95c4c42a8..0000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth-native_git=
.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-inherit native
-
-OECMAKE_SOURCEPATH =3D "${S}/src/gentables"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 755 ${B}/make_tables.exe ${D}/${bindir}/
-}
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc=
 b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
deleted file mode 100644
index a4590d61a9..0000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY =3D "Fluidsynth is a software synthesizer"
-HOMEPAGE =3D "http://www.fluidsynth.org/"
-SECTION =3D "libs/multimedia"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
-
-SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3Dmaster;=
protocol=3Dhttps"
-SRCREV =3D "8b00644751578ba67b709a827cbe5133d849d339"
-S =3D "${WORKDIR}/git"
-PV =3D "2.2.6"
-
-inherit cmake pkgconfig lib_package
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/000=
1-Do-not-build-gentables-helper-we-have-to-use-native-.patch b/meta-multi=
media/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentable=
s-helper-we-have-to-use-native-.patch
deleted file mode 100644
index cc73bdb1d9..0000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-no=
t-build-gentables-helper-we-have-to-use-native-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 81ea820b155e887b13ea5986c3407cf93b2737f6 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Wed, 2 Jan 2019 18:42:46 +0100
-Subject: [PATCH] Do not build gentables helper - we have to use native v=
ariant
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- src/CMakeLists.txt | 23 +----------------------
- 1 file changed, 1 insertion(+), 22 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 356bb734..58ff7635 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -399,25 +399,4 @@ else ( MACOSX_FRAMEWORK )
-    install ( FILES ${public_main_HEADER} DESTINATION ${INCLUDE_INSTALL_=
DIR} )
- endif ( MACOSX_FRAMEWORK )
-=20
--# ******* Auto Generated Lookup Tables ******
--
--include(ExternalProject)
--
--set (GENTAB_SDIR ${CMAKE_CURRENT_SOURCE_DIR}/gentables)
--set (GENTAB_BDIR ${CMAKE_CURRENT_BINARY_DIR}/gentables)
--
--# Use external project to ensure that cmake uses the host compiler when=
 building make_tables.exe
--# To fix cross-compiling fluidsynth from Win32 to ARM (using vcpkg), we=
 need to pass the current generator
--# on to the external project, otherwise (for some unknown reason) the t=
arget compiler will be used rather
--# than the host compiler.
--ExternalProject_Add(gentables
--    DOWNLOAD_COMMAND ""
--    SOURCE_DIR ${GENTAB_SDIR}
--    BINARY_DIR ${GENTAB_BDIR}
--    CONFIGURE_COMMAND
--        "${CMAKE_COMMAND}" -DCMAKE_VERBOSE_MAKEFILE=3D${CMAKE_VERBOSE_M=
AKEFILE} -G "${CMAKE_GENERATOR}" -B "${GENTAB_BDIR}" "${GENTAB_SDIR}"
--    BUILD_COMMAND
--        "${CMAKE_COMMAND}" --build "${GENTAB_BDIR}"
--    INSTALL_COMMAND ${GENTAB_BDIR}/make_tables.exe "${CMAKE_BINARY_DIR}=
/"
--)
--add_dependencies(libfluidsynth-OBJ gentables)
-+
---=20
-2.21.1
-
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git=
.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
index 984f37b756..a1083af56d 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_git.bb
@@ -1,23 +1,40 @@
-require ${BPN}.inc
+SUMMARY =3D "Fluidsynth is a software synthesizer"
+HOMEPAGE =3D "http://www.fluidsynth.org/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
=20
-DEPENDS =3D "${BPN}-native alsa-lib ncurses glib-2.0"
+SRC_URI =3D "git://github.com/FluidSynth/fluidsynth.git;branch=3Dmaster;=
protocol=3Dhttps"
+SRCREV =3D "4d8fe638e1a48660a4c843d493f69a86579e12f0"
+S =3D "${WORKDIR}/git"
+PV =3D "2.3.2"
+
+inherit cmake pkgconfig lib_package
+
+DEPENDS =3D "glib-2.0"
=20
 SRC_URI +=3D " \
-    file://0001-Do-not-build-gentables-helper-we-have-to-use-native-.pat=
ch \
     file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.pat=
ch \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.pat=
ch \
 "
=20
 EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('base=
lib').replace('lib', '')}"
=20
-do_configure:append() {
-    make_tables.exe ${B}/
+do_install:append() {
+    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/pkgconfig/=
fluidsynth.pc
+    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/flui=
dsynth/FluidSynthTargets.cmake
 }
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio',=
 d)}"
-PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile=3DON,-Denable-libsndfile=
=3DOFF,libsndfile1"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio p=
ipewire systemd alsa dbus', d)}"
+PACKAGECONFIG[alsa] =3D "-Denable-alsa=3DON,-Denable-alsa=3DOFF,alsa-lib=
"
+PACKAGECONFIG[dbus] =3D "-Denable-dbus=3DON,-Denable-dbus=3DOFF,dbus"
 PACKAGECONFIG[jack] =3D "-Denable-jack=3DON,-Denable-jack=3DOFF,jack"
-PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,-Denable-pulseau=
dio=3DOFF,pulseaudio"
+PACKAGECONFIG[oss] =3D "-Denable-oss=3DON,-Denable-oss=3DOFF"
+PACKAGECONFIG[pipewire] =3D "-Denable-pipewire=3DON,-Denable-pipewire=3D=
OFF,pipewire"
 PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-Denable-portaudio=
=3DOFF,portaudio-v19"
 PACKAGECONFIG[profiling] =3D "-Denable-profiling=3DON,-Denable-profiling=
=3DOFF"
+PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,-Denable-pulseau=
dio=3DOFF,pulseaudio"
 PACKAGECONFIG[readline] =3D "-Denable-readline=3DON,-Denable-readline=3D=
OFF,readline"
+PACKAGECONFIG[sdl] =3D "-Denable-sdl2=3DON,-Denable-sdl2=3DOFF,libsdl2"
+PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile=3DON,-Denable-libsndfile=
=3DOFF,libsndfile1"
+PACKAGECONFIG[systemd] =3D "-Denable-systemd=3DON,-Denable-systemd=3DOFF=
,systemd"
--=20
2.34.1


