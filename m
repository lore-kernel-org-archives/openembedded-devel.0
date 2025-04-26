Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BF2C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 19:35:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.14976.1745696109576780073
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 12:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id A9F4B9C4
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 21:35:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.126]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u8lIo-4UolYv0; Sat, 26 Apr 2025 21:35:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-mixer: drop deprecated modplug PACKAGECONFIG
Date: Sat, 26 Apr 2025 21:34:56 +0200
Message-ID: <20250426193456.8303-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745696106-35FF899B-A81115FF/10/3626336762 SUSPECT URL
X-TOI-MSGID: c67f18a7-8eff-4de9-a072-50a3ed16ede2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 19:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117153

libmodplug support has been removed in master branch
https://github.com/libsdl-org/SDL_mixer/pull/673

Remove the option as we still provide libxmp to handle .mod

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
index ecfc0b147a..b24c8782cf 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
@@ -20,14 +20,11 @@ do_configure:prepend() {
 	touch ${STAGING_BINDIR}/wvtag
 }
=20
-EXTRA_OECMAKE +=3D "${@bb.utils.contains_any('PACKAGECONFIG', 'xmp modpl=
ug', '-DSDL2MIXER_MOD=3DON', '-DSDL2MIXER_MOD=3DOFF', d)}"
-
 PACKAGECONFIG ?=3D "flac wave vorbis"
 PACKAGECONFIG[opusfile] =3D "-DSDL2MIXER_OPUS=3DON -DSDL2MIXER_OPUS_ENAB=
LED=3DON, -DSDL2MIXER_OPUS=3DOFF,opusfile"
 PACKAGECONFIG[vorbis] =3D "-DSDL2MIXER_VORBIS=3DVORBISFILE -DSDL2MIXER_V=
ORBIS_VORBISFILE=3DON, -DSDL2MIXER_VORBIS=3DOFF,libvorbis"
 PACKAGECONFIG[flac] =3D "-DSDL2MIXER_FLAC=3DON, -DSDL2MIXER_FLAC=3DOFF,f=
lac"
-PACKAGECONFIG[xmp] =3D "-DSDL2MIXER_MOD_XMP=3DON, -DSDL2MIXER_MOD_XMP=3D=
OFF,libxmp,libxmp"
-PACKAGECONFIG[modplug] =3D "-DSDL2MIXER_MOD_MODPLUG=3DON, -DSDL2MIXER_MO=
D_MODPLUG=3DOFF,libmodplug"
+PACKAGECONFIG[xmp] =3D "-DSDL2MIXER_MOD=3DON -DSDL2MIXER_MOD_XMP=3DON, -=
DSDL2MIXER_MOD=3DOFF,libxmp,libxmp"
 PACKAGECONFIG[fluidsynth] =3D "-DSDL2MIXER_MIDI=3DON -DSDL2MIXER_MIDI_FL=
UIDSYNTH_ENABLED=3DON, -DSDL2MIXER_MIDI=3DOFF,fluidsynth,fluidsynth-bin"
 PACKAGECONFIG[wave] =3D "-DSDL2MIXER_WAVE=3DON -DSDL2MIXER_WAVPACK=3DON,=
 -DSDL2MIXER_WAVE=3DOFF,wavpack,wavpack wavpack-bin"
 PACKAGECONFIG[mpg123] =3D "-DSDL2MIXER_MP3=3DON -DSDL2MIXER_MP3_MPG123=3D=
ON, -DSDL2MIXER_MP3=3DOFF,mpg123"
--=20
2.49.0


