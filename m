Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60A2109448F
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 18:52:38 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16725.1774119151393836090
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 11:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Husr1+B5;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id 78A401D43F
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 19:52:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.8]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w41Qx-2tQgb40; Sat, 21 Mar 2026 19:52:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] libsdl3-mixer: add recipe
Date: Sat, 21 Mar 2026 19:52:19 +0100
Message-ID: <20260321185219.1746245-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321185219.1746245-1-f_l_k@t-online.de>
References: <20260321185219.1746245-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774119147-467FB9EA-1FD25BD1/0/0 CLEAN NORMAL
X-TOI-MSGID: 5178c410-b594-4db9-8578-654da297499e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774119149; i=f_l_k@t-online.de;
	bh=UdAGw2ss6WAow8k84rkJh0QzgV+knLACa99bMngAguo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Husr1+B5aby4rDzVgQZPgkFTufd39EvneFrMvsfm4NsBTB/dak4MlXYgyD8qaL9bp
	 sUVb2kYS2Gn5pKUsnUEkE1maiQCT+dLYl4CR2IwIUHrYk7UKPDkhVFYK59VZ91etES
	 Txt/U5jl7c07UvjL2EqHEDJ97hc2sOBu565AiUicAcLvF+9/1uVRroh5YltlxR5e2e
	 MhrfFRn0gc2nC3lb15agdBLRj+YY3kVFTTZ8NRoZJ8n1oP+aGEVPNZ00BYQYr+Tkoo
	 RqtseMFsc7EpPCCn/+T2LR2xUqXD27uhaLgQnC2QK8BKcOGuc0uQ1odlJOoZthPxYl
	 zG28JjFBHA9pw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 18:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125466

libsdl3-mixer has initially released

- binaries in wavpack-bin are only needed at runtime but cmake checks
  for them during compilation and fails because they are (presumably
  intentionally) not present in the target sysroot. Workround this issue
  by touching the necessary files to please cmake.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/libsdl3-mixer_3.2.0.bb            | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.=
bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
new file mode 100644
index 0000000000..8540ec55fc
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "Provides decoding of many popular audio file formats, mixin=
g, various DSP processing effects and positional audio"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Ddf8f4d887d3997f6e9cf81bb7=
f43dbf7"
+
+DEPENDS =3D "libsdl3"
+
+SRC_URI =3D "git://github.com/libsdl-org/SDL_mixer.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
+SRCREV =3D "cedfeef30e93db35eee6b25759117da63f8e5a4f"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ?=3D "flac opus wave vorbis"
+PACKAGECONFIG[opus] =3D "-DSDLMIXER_OPUS=3DON -DSDLMIXER_OPUS_SHARED=3DO=
N, -DSDLMIXER_OPUS=3DOFF,opusfile"
+PACKAGECONFIG[vorbis] =3D "-DSDLMIXER_VORBIS_VORBISFILE=3DON -DSDLMIXER_=
VORBIS_STB=3DOFF -DSDLMIXER_VORBIS_TREMOR=3DOFF, -DSDLMIXER_VORBIS_VORBIS=
FILE=3DOFF -DSDLMIXER_VORBIS_STB=3DOFF -DSDLMIXER_VORBIS_TREMOR=3DOFF,lib=
vorbis"
+PACKAGECONFIG[flac] =3D "-DSDLMIXER_FLAC_LIBFLAC=3DON -DSDLMIXER_FLAC_LI=
BFLAC_SHARED=3DON, -DSDLMIXER_FLAC_LIBFLAC=3DOFF,flac"
+PACKAGECONFIG[xmp] =3D "-DSDLMIXER_MOD=3DON -DSDLMIXER_MOD_XMP=3DON -DSD=
LMIXER_MOD_XMP_SHARED=3DON, -DSDLMIXER_MOD=3DOFF,libxmp,libxmp"
+PACKAGECONFIG[fluidsynth] =3D "-DSDLMIXER_MIDI=3DON -DSDLMIXER_MIDI_FLUI=
DSYNTH_ENABLED=3DON -DSDLMIXER_MIDI_FLUIDSYNTH_SHARED=3DON, -DSDLMIXER_MI=
DI=3DOFF,fluidsynth,fluidsynth-bin"
+PACKAGECONFIG[wave] =3D "-DSDLMIXER_WAVE=3DON -DSDLMIXER_WAVPACK=3DON -D=
SDLMIXER_WAVPACK_SHARED=3DON, -DSDLMIXER_WAVE=3DOFF,wavpack,wavpack wavpa=
ck-bin"
+PACKAGECONFIG[mpg123] =3D "-DSDLMIXER_MP3 -DSDLMIXER_MP3_MPG123_SHARED=3D=
ON -DSDLMIXER_MP3_MPG123=3DON, -DSDLMIXER_MP3=3DOFF,mpg123"
+
+do_configure:prepend() {
+	touch ${STAGING_BINDIR}/wavpack
+	touch ${STAGING_BINDIR}/wvunpack
+	touch ${STAGING_BINDIR}/wvgain
+	touch ${STAGING_BINDIR}/wvtag
+}
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.53.0


