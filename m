Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67803C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:46 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.4210.1745526885980993327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id C880F16EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSX0; Thu, 24 Apr 2025 22:34:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 05/18] openal: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:53 +0200
Message-ID: <20250424203406.2113462-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-2EFFAA5A-FDBAC02B/0/0 CLEAN NORMAL
X-TOI-MSGID: 0bd77a51-6047-446c-a6b5-7ce8a7cef937
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117117

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3=
.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
index e79efd4697..d57c9b5c64 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.24.3.bb
@@ -18,6 +18,6 @@ PACKAGECONFIG[oss] =3D "-DALSOFT_BACKEND_OSS=3DON,-DALS=
OFT_BACKEND_OSS=3DOFF"
 PACKAGECONFIG[pulseaudio] =3D "-DALSOFT_BACKEND_PULSEAUDIO=3DON,-DALSOFT=
_BACKEND_PULSEAUDIO=3DOFF,pulseaudio"
 PACKAGECONFIG[pipewire] =3D "-DALSOFT_BACKEND_PIPEWIRE=3DON,-DALSOFT_BAC=
KEND_PIPEWIRE=3DOFF,pipewire"
 PACKAGECONFIG[examples] =3D "-DALSOFT_EXAMPLES=3DON,-DALSOFT_EXAMPLES=3D=
OFF"
-PACKAGECONFIG[sdl2] =3D "-DALSOFT_BACKEND_SDL2=3DON,-DALSOFT_BACKEND_SDL=
2=3DOFF,libsdl2 ffmpeg"
+PACKAGECONFIG[sdl2] =3D "-DALSOFT_BACKEND_SDL2=3DON,-DALSOFT_BACKEND_SDL=
2=3DOFF,virtual/libsdl2 ffmpeg"
=20
 FILES:${PN} +=3D "${datadir}"
--=20
2.49.0


