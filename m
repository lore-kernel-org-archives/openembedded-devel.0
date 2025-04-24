Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4F0C369DE
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.4197.1745526862778358447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id C824ADED
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSW0; Thu, 24 Apr 2025 22:34:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 04/18] libopenmpt: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:52 +0200
Message-ID: <20250424203406.2113462-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-EAFFAA5A-C569E4B4/0/0 CLEAN NORMAL
X-TOI-MSGID: 1566124f-c4b1-433c-8083-e0c42d0bbbb2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117102

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7=
.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.=
bb
index fea15f04ef..f59220d0da 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
@@ -36,7 +36,7 @@ PACKAGECONFIG[mpg123]             =3D "--with-mpg123,--=
without-mpg123,mpg123"
 PACKAGECONFIG[ogg]                =3D "--with-ogg,--without-ogg,libogg"
 PACKAGECONFIG[portaudio]          =3D "--with-portaudio,--without-portau=
dio,portaudio-v19"
 PACKAGECONFIG[pulseaudio]         =3D "--with-pulseaudio,--without-pulse=
audio,pulseaudio"
-PACKAGECONFIG[sdl2]               =3D "--with-sdl2,--without-sdl2,libsdl=
2"
+PACKAGECONFIG[sdl2]               =3D "--with-sdl2,--without-sdl2,virtua=
l/libsdl2"
 PACKAGECONFIG[sndfile]            =3D "--with-sndfile,--without-sndfile,=
libsndfile1"
 PACKAGECONFIG[vorbis]             =3D "--with-vorbis,--without-vorbis,li=
bvorbis"
 PACKAGECONFIG[vorbisfile]         =3D "--with-vorbisfile,--without-vorbi=
sfile,libvorbis"
--=20
2.49.0


