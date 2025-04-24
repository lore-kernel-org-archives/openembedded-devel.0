Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB42C369D8
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.4195.1745526862762126941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id C5C75C05
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H1-38CNSU0; Thu, 24 Apr 2025 22:34:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 02/18] fluidsynth: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:50 +0200
Message-ID: <20250424203406.2113462-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-0B7FDA5A-00D4E074/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a23dd55-d46f-4042-8284-b0d6493ac30d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117100

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4=
.5.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
index 672f4b1449..62900011a1 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG[portaudio] =3D "-Denable-portaudio=3DON,-=
Denable-portaudio=3DOFF,portaud
 PACKAGECONFIG[profiling] =3D "-Denable-profiling=3DON,-Denable-profiling=
=3DOFF"
 PACKAGECONFIG[pulseaudio] =3D "-Denable-pulseaudio=3DON,-Denable-pulseau=
dio=3DOFF,pulseaudio"
 PACKAGECONFIG[readline] =3D "-Denable-readline=3DON,-Denable-readline=3D=
OFF,readline"
-PACKAGECONFIG[sdl] =3D "-Denable-sdl2=3DON,-Denable-sdl2=3DOFF,libsdl2"
+PACKAGECONFIG[sdl] =3D "-Denable-sdl2=3DON,-Denable-sdl2=3DOFF,virtual/l=
ibsdl2"
 PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile=3DON,-Denable-libsndfile=
=3DOFF,libsndfile1"
 PACKAGECONFIG[systemd] =3D "-Denable-systemd=3DON,-Denable-systemd=3DOFF=
,systemd"
=20
--=20
2.49.0


