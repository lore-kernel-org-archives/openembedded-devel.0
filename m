Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D46C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:49:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.12051.1745228945548565895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 028EBE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJW0; Mon, 21 Apr 2025 11:48:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/9] fluidsynth: update
Date: Mon, 21 Apr 2025 11:48:25 +0200
Message-ID: <20250421094832.67450-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228919-FD7F994A-649E5B43/0/0 CLEAN NORMAL
X-TOI-MSGID: 48384f83-411d-45f0-9304-2df6fd18b1eb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116998

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../fluidsynth/{fluidsynth_2.3.4.bb =3D> fluidsynth_2.4.5.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.3.4.b=
b =3D> fluidsynth_2.4.5.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3=
.4.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.=
4.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.=
bb
index dc05832e80..672f4b1449 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
@@ -11,7 +11,7 @@ SRC_URI =3D " \
     file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.pat=
ch \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.pat=
ch \
 "
-SRCREV =3D "5ecdc4568e45123216c6888892caad07918ef127"
+SRCREV =3D "9f2edaa3cbd456997cb420fb68b6f960faaafd12"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -37,3 +37,4 @@ PACKAGECONFIG[readline] =3D "-Denable-readline=3DON,-De=
nable-readline=3DOFF,readline"
 PACKAGECONFIG[sdl] =3D "-Denable-sdl2=3DON,-Denable-sdl2=3DOFF,libsdl2"
 PACKAGECONFIG[sndfile] =3D "-Denable-libsndfile=3DON,-Denable-libsndfile=
=3DOFF,libsndfile1"
 PACKAGECONFIG[systemd] =3D "-Denable-systemd=3DON,-Denable-systemd=3DOFF=
,systemd"
+
--=20
2.49.0


