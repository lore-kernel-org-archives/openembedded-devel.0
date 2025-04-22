Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C8FC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 05:27:22 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.33326.1745299633162903379
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 22:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 478EF20C
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 07:27:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.42.91]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u76A2-1PyY7t0; Tue, 22 Apr 2025 07:27:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libsdl2-mixer: update and build with cmake
Date: Tue, 22 Apr 2025 07:26:59 +0200
Message-ID: <20250422052659.86026-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745299630-E2FFA936-FD0BC8FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c220307-2af2-4b27-95f0-0e50df888e44
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 05:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117017

---
 ...figure.in-Undefine-AC_CONFIG_AUX_DIR.patch | 34 ------------------
 .../libsdl/libsdl2-mixer_2.0.4.bb             | 27 --------------
 .../libsdl/libsdl2-mixer_2.8.1.bb             | 36 +++++++++++++++++++
 3 files changed, 36 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-co=
nfigure.in-Undefine-AC_CONFIG_AUX_DIR.patch
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.b=
b
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.b=
b

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure=
.in-Undefine-AC_CONFIG_AUX_DIR.patch b/meta-oe/recipes-graphics/libsdl/li=
bsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
deleted file mode 100644
index 0605b32e30..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Und=
efine-AC_CONFIG_AUX_DIR.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9363c98528ef850235852e44f678df6b5c011ee1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Feb 2021 18:08:36 -0800
-Subject: [PATCH] configure.in: Undefine AC_CONFIG_AUX_DIR
-
-This helps reconfiguring with autotools 2.70+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.in | 5 -----
- 1 file changed, 5 deletions(-)
-
---- a/configure.in
-+++ b/configure.in
-@@ -1,7 +1,6 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT(README.txt)
- AC_CONFIG_AUX_DIR(build-scripts)
--
- dnl Set various version strings - taken gratefully from the GTk sources
-=20
- # Making releases:
-@@ -40,10 +39,6 @@ AC_SUBST(LT_CURRENT)
- AC_SUBST(LT_REVISION)
- AC_SUBST(LT_AGE)
-=20
--dnl Detect the canonical build and host environments
--AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
--dnl AC_CANONICAL_HOST
--
- dnl Check for tools
- AC_PROG_LIBTOOL
- AC_PROG_CC
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
deleted file mode 100644
index dbcb2a193b..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Simple DirectMedia Layer mixer library V2"
-SECTION =3D "libs"
-DEPENDS =3D "libsdl2 flac libmikmod libvorbis"
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D516daf7a177ad4c8874bb9efa=
1a69c1f"
-
-SRC_URI =3D "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer=
-${PV}.tar.gz \
-           file://0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch \
-          "
-SRC_URI[sha256sum] =3D "b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc=
6b6cca55bede2419"
-
-S =3D "${WORKDIR}/SDL2_mixer-${PV}"
-
-inherit autotools-brokensep pkgconfig
-
-EXTRA_OECONF =3D "--disable-music-mp3 --enable-music-ogg --disable-music=
-ogg-shared LIBS=3D-L${STAGING_LIBDIR}"
-
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[mad] =3D "--enable-music-mp3-mad-gpl,--disable-music-mp3-m=
ad-gpl,libmad"
-
-do_configure:prepend () {
-    # Remove old libtool macros.
-    MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
-    for i in ${MACROS}; do
-        rm -f acinclude/$i
-    done
-}
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
new file mode 100644
index 0000000000..3eff30f825
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
@@ -0,0 +1,36 @@
+SUMMARY =3D "Simple DirectMedia Layer mixer library V2"
+SECTION =3D "libs"
+DEPENDS =3D "libsdl2"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
+
+SRC_URI =3D "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer=
-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002=
cc1be728efd22660"
+
+S =3D "${WORKDIR}/SDL2_mixer-${PV}"
+
+inherit cmake pkgconfig
+
+do_configure:prepend() {
+	# cmake checks for these binaries. Touch them to pass the tests and add=
 RDEPENDS
+	touch ${STAGING_BINDIR}/fluidsynth
+	touch ${STAGING_BINDIR}/wavpack
+	touch ${STAGING_BINDIR}/wvunpack
+	touch ${STAGING_BINDIR}/wvgain
+	touch ${STAGING_BINDIR}/wvtag
+}
+
+EXTRA_OECMAKE +=3D "${@bb.utils.contains_any('PACKAGECONFIG', 'xmp modpl=
ug', '-DSDL2MIXER_MOD=3DON', '-DSDL2MIXER_MOD=3DOFF', d)}"
+
+PACKAGECONFIG ?=3D "flac wave vorbis"
+PACKAGECONFIG[opusfile] =3D "-DSDL2MIXER_OPUS=3DON -DSDL2MIXER_OPUS_ENAB=
LED=3DON, -DSDL2MIXER_OPUS=3DOFF,opusfile"
+PACKAGECONFIG[vorbis] =3D "-DSDL2MIXER_VORBIS=3DVORBISFILE -DSDL2MIXER_V=
ORBIS_VORBISFILE=3DON, -DSDL2MIXER_VORBIS=3DOFF,libvorbis"
+PACKAGECONFIG[flac] =3D "-DSDL2MIXER_FLAC=3DON, -DSDL2MIXER_FLAC=3DOFF,f=
lac"
+PACKAGECONFIG[xmp] =3D "-DSDL2MIXER_MOD_XMP=3DON, -DSDL2MIXER_MOD_XMP=3D=
OFF,libxmp,libxmp"
+PACKAGECONFIG[modplug] =3D "-DSDL2MIXER_MOD_MODPLUG=3DON, -DSDL2MIXER_MO=
D_MODPLUG=3DOFF,libmodplug"
+PACKAGECONFIG[fluidsynth] =3D "-DSDL2MIXER_MIDI=3DON -DSDL2MIXER_MIDI_FL=
UIDSYNTH_ENABLED=3DON, -DSDL2MIXER_MIDI=3DOFF,fluidsynth,fluidsynth-bin"
+PACKAGECONFIG[wave] =3D "-DSDL2MIXER_WAVE=3DON -DSDL2MIXER_WAVPACK=3DON,=
 -DSDL2MIXER_WAVE=3DOFF,wavpack,wavpack wavpack-bin"
+PACKAGECONFIG[mpg123] =3D "-DSDL2MIXER_MP3=3DON -DSDL2MIXER_MP3_MPG123=3D=
ON, -DSDL2MIXER_MP3=3DOFF,mpg123"
+
+FILES:${PN} +=3D "${datadir}/licenses"
+
--=20
2.49.0


