Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6E0C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 11:50:43 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web09.8760.1647604242332997818
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 04:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=pPPSiB91;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152,
 mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4KKj4t4Q9Qz9sV1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 12:50:38 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1647604238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AhrC3oAuEXyGzhUzvcFzkN0+VZzmcNHhFkJMYP0K/Gc=;
	b=pPPSiB91cLG64jzw89p3QQkKyfZUvS2RtUeeWLVuieY3CmHM3pU+fPspnjFpugMZC0fGN3
	Jl9OwuIQtg7hf8dRG0quAvjzfrvMfbXnMUunvMbgMjFckRM9YIoIak1CeH83XiZvuO67UR
	vpclI6ypdFBsQWZX6ELGxkY4Z1moSKP1GMM/noix2OOGK8MGagM97a2MwYSPVVJEKqXWbq
	TeZ4Aiqu6M6EI2gUWP7v0UapJYigE+Oc1PHp5p2LSoB1tnNCYmNhha4Jv1VT5wbxFtqAnR
	Qxrpl6P3rurfwMdl/lykClViVoRQ/WMV+ZK/cT1bKbAzer5APrmEZ+7HsaQ4iA==
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libopenmpt: Upgrade to version 0.6.2
Date: Fri, 18 Mar 2022 12:50:25 +0100
Message-Id: <20220318115025.479223-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 11:50:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96057

* libopenmpt-modplug got removed and now exists as a separate project.
* SDL1 is no longer supported.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...bopenmpt_0.3.10.bb =3D> libopenmpt_0.6.2.bb} | 31 +++++--------------
 1 file changed, 7 insertions(+), 24 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.3.10.=
bb =3D> libopenmpt_0.6.2.bb} (68%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3=
.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.b=
b
similarity index 68%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.=
10.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.=
bb
index b1634732c..a7b6b0007 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.3.10.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
@@ -1,41 +1,33 @@
 SUMMARY =3D "C and C++ cross-platform library for decoding tracked music=
 files (modules)"
 DESCRIPTION =3D "libopenmpt is a cross-platform C++ and C library to dec=
ode tracked \
 music files (modules) into a raw PCM audio stream. It also comes with op=
enmpt123, a \
-cross-platform command-line or terminal based module file player, and li=
bopenmpt_modplug, \
-a wrapper around libopenmpt that provides an interface that is ABI compa=
tile with \
-libmodplug. libopenmpt is based on the player code of the OpenMPT projec=
t."
+cross-platform command-line or terminal based module file player. libope=
nmpt is based \
+on the player code of the OpenMPT project."
 HOMEPAGE =3D "https://lib.openmpt.org/libopenmpt/"
 SECTION =3D "libs"
=20
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De804150573f149befef6c07e173f2=
0c3"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae09d6164bdecb499183479fd32b6=
6fb"
=20
 DEPENDS =3D "virtual/libiconv"
=20
 SRC_URI =3D "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${P=
V}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] =3D "66bbc6fbb5f27a554cb145d805e9ef9d"
-SRC_URI[sha256sum] =3D "14a137b8d1a20e1b6a5e67cbc9467ab7e5e4e67d5aa38a24=
7afc825685c53939"
+SRC_URI[md5sum] =3D "d21fb799695cbe10a1e9aeaea23ed708"
+SRC_URI[sha256sum] =3D "50c0d62ff2d9afefa36cce9f29042cb1fb8d4f0b386b81a0=
fc7734f35e21e6b6"
=20
 S =3D "${WORKDIR}/libopenmpt-${PV}+release.autotools"
=20
 inherit autotools pkgconfig ptest
=20
 PACKAGECONFIG ??=3D " \
-    libopenmpt-modplug openmpt123 \
+    openmpt123 \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
     flac mpg123 ogg sndfile vorbis vorbisfile zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
 "
=20
-# libopenmpt_modplug is a library that wraps libopenmpt calls into
-# functions that are ABI compatible with libmodplug. This allows for
-# using modplug headers and linking against libopenmpt_modplug
-# instead of against the original libmodplug library.
-# NOTE: The wrapper is compatible to the ABI from libmodplug version
-# 0.8.8 and newer.
-PACKAGECONFIG[libopenmpt-modplug] =3D "--enable-libopenmpt_modplug,--dis=
able-libopenmpt_modplug"
 PACKAGECONFIG[openmpt123]         =3D "--enable-openmpt123,--disable-ope=
nmpt123"
 PACKAGECONFIG[tests]              =3D "--enable-tests,--disable-tests"
=20
@@ -45,22 +37,15 @@ PACKAGECONFIG[mpg123]             =3D "--with-mpg123,=
--without-mpg123,mpg123"
 PACKAGECONFIG[ogg]                =3D "--with-ogg,--without-ogg,libogg"
 PACKAGECONFIG[portaudio]          =3D "--with-portaudio,--without-portau=
dio,portaudio-v19"
 PACKAGECONFIG[pulseaudio]         =3D "--with-pulseaudio,--without-pulse=
audio,pulseaudio"
-PACKAGECONFIG[sdl]                =3D "--with-sdl,--without-sdl,virtual/=
libsdl"
 PACKAGECONFIG[sdl2]               =3D "--with-sdl2,--without-sdl2,virtua=
l/libsdl2"
 PACKAGECONFIG[sndfile]            =3D "--with-sndfile,--without-sndfile,=
libsndfile1"
 PACKAGECONFIG[vorbis]             =3D "--with-vorbis,--without-vorbis,li=
bvorbis"
 PACKAGECONFIG[vorbisfile]         =3D "--with-vorbisfile,--without-vorbi=
sfile,libvorbis"
 PACKAGECONFIG[zlib]               =3D "--with-zlib,--without-zlib,zlib"
=20
-# --disable-libmodplug is necessary, since otherwise we'd
-# have a collision with the libmodplug package, because of the
-# libmodplug.so file. (libmodplug.so from libopenmpt isintended
-# to be used as a drop-in replacement, and according to the
-# documentation, is not complete.)
 EXTRA_OECONF +=3D " \
     --disable-doxygen-doc \
     --disable-examples \
-    --disable-libmodplug \
     --without-portaudiocpp \
 "
=20
@@ -85,8 +70,7 @@ python __anonymous() {
         bb.error("sdl and sdl2 packageconfigs cannot be both enabled")
 }
=20
-PACKAGES =3D+ "${PN}-modplug ${PN}-openmpt123 ${PN}-openmpt123-doc"
-FILES:${PN}-modplug =3D "${libdir}/libopenmpt_modplug.so.*"
+PACKAGES =3D+ "${PN}-openmpt123 ${PN}-openmpt123-doc"
 FILES:${PN}-openmpt123 =3D "${bindir}/openmpt123"
 FILES:${PN}-openmpt123-doc =3D "${mandir}/man1/openmpt123*"
=20
@@ -94,7 +78,6 @@ FILES:${PN}-openmpt123-doc =3D "${mandir}/man1/openmpt1=
23*"
 # The SemVer versioning scheme is incompatible with Debian/Ubuntu
 # package version names.
 DEBIAN_NOAUTONAME:${PN} =3D "1"
-DEBIAN_NOAUTONAME:${PN}-modplug =3D "1"
=20
 RDEPENDS:${PN}:libc-glibc =3D " \
     glibc-gconv-cp1252 \
--=20
2.32.0


