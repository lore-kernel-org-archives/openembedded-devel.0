Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B781094494
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 18:52:38 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16760.1774119151457935825
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 11:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=azjZ45Uj;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id 6A1E41D43E
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 19:52:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.8]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w41Qx-2tQgb30; Sat, 21 Mar 2026 19:52:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] fluidsynth: update 2.4.8 -> 2.5.3
Date: Sat, 21 Mar 2026 19:52:18 +0100
Message-ID: <20260321185219.1746245-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774119147-01FF89EA-CEBA3222/0/0 CLEAN NORMAL
X-TOI-MSGID: 6efa5d39-a989-4db2-8855-90c01d542d1f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774119149; i=f_l_k@t-online.de;
	bh=PLm91/o2fAsvU62DZKEN5xafGMzOnftgFWPYEC0tFUw=;
	h=From:To:Subject:Date;
	b=azjZ45Uj0xGxb7cjY6hUTpJewH4IAA4qDsyswJYSDWDq+TNxbo/doReeyTwn/PE9v
	 hfoam+76t2Cki5hkIR2ZygTC9EvGwrt/hs2gPicRsGhGSXqKz+nxQH0it4l2kKPlSl
	 ezuOIteXWEW/nfmyG3z11HUOuihs0Ve6pyxnjuDI7mPqyGQSdkxWPEtsdQ7/D/Kzib
	 FWxLj58ldhaK3B4UlIU0jagiEvjU6qnzUkD4XVrGKe+q48lO/fMuwdycLVNlaPfX55
	 3M9Albp6QI6CZ/u7XtoBd3hZftDXOmWeDVEUVbNbsX5u+fKp5ZADxQLJRso1ufLOpN
	 dclYGrnvu4ifA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 18:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125467

- update dependency: libsdl2 -> libsdl3
- fetch code for gcem and signalsmith-audio-basics at do_fetch
- update license file checksum [https://github.com/FluidSynth/fluidsynth/=
commit/db42fa333baf1cb7c60556ab75ad1e592c850f68]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...fluidsynth_2.4.8.bb =3D> fluidsynth_2.5.3.bb} | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.4.8.b=
b =3D> fluidsynth_2.5.3.bb} (64%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4=
.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
similarity index 64%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.=
8.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.=
bb
index 9d76546641..4dbf4d1fc7 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.8.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
@@ -2,24 +2,28 @@ SUMMARY =3D "Fluidsynth is a software synthesizer"
 HOMEPAGE =3D "http://www.fluidsynth.org/"
 SECTION =3D "libs/multimedia"
 LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9=
594"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21"
=20
 DEPENDS =3D "glib-2.0"
=20
 SRC_URI =3D " \
-    git://github.com/FluidSynth/fluidsynth.git;branch=3Dmaster;protocol=3D=
https \
+    git://github.com/FluidSynth/fluidsynth.git;name=3Dfluidsynth;branch=3D=
master;protocol=3Dhttps \
+    git://github.com/kthohr/gcem.git;name=3Dgcem;subdir=3D${S}/gcem;prot=
ocol=3Dhttps;nobranch=3D1 \
+    git://github.com/Signalsmith-Audio/basics.git;name=3Dsignalsmith-aud=
io-basics;subdir=3D${S}/signalsmith-audio-basics;protocol=3Dhttps;nobranc=
h=3D1 \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.pat=
ch \
 "
-SRCREV =3D "70a10b365c707c73bd340e28970601d52d425d8c"
-
+SRCREV_FORMAT =3D "fluidsynth"
+SRCREV_fluidsynth =3D "6b8fabbd60f0df3b6e2f5b5df8478a1b43315acd"
+SRCREV_gcem =3D "012ae73c6d0a2cb09ffe86475f5c6fba3926e200"
+SRCREV_signalsmith-audio-basics =3D "012d2be17b0eb6839628f8c73687c4ccccc=
1bb01"
=20
 inherit cmake pkgconfig lib_package
=20
-EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('base=
lib').replace('lib', '')}"
+EXTRA_OECMAKE =3D "-Denable-floats=3DON -DLIB_SUFFIX=3D${@d.getVar('base=
lib').replace('lib', '')} -DGCEM_INCLUDE_DIR=3D${S}/gcem/include"
=20
 do_install:append() {
     sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/pkgconfig/=
fluidsynth.pc
-    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/flui=
dsynth/FluidSynthTargets.cmake
+    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/flui=
dsynth/FluidSynth-shared-targets.cmake
 }
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio p=
ipewire systemd alsa dbus', d)}"
@@ -32,7 +36,7 @@ PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-=
Denable-portaudio=3DOFF,portaud
 PACKAGECONFIG[profiling] =3D "-Denable-profiling=3DON,-Denable-profiling=
=3DOFF"
 PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,-Denable-pulseau=
dio=3DOFF,pulseaudio"
 PACKAGECONFIG[readline] =3D "-Denable-readline=3DON,-Denable-readline=3D=
OFF,readline"
-PACKAGECONFIG[sdl] =3D "-Denable-sdl2=3DON,-Denable-sdl2=3DOFF,virtual/l=
ibsdl2"
+PACKAGECONFIG[sdl] =3D "-Denable-sdl3=3DON,-Denable-sdl3=3DOFF,libsdl3"
 PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile=3DON,-Denable-libsndfile=
=3DOFF,libsndfile1"
 PACKAGECONFIG[systemd] =3D "-Denable-systemd=3DON,-Denable-systemd=3DOFF=
,systemd"
=20
--=20
2.53.0


