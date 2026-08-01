Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFA8C55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 16:26:31 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8626.1785601588363302664
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 09:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=lM4spH3B;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id EF0CBE563
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Aug 2026 18:26:25 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wqCXZ-1rj78j0; Sat, 1 Aug 2026 18:26:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] fluidsynth: fix branch after recipe update
Date: Sat,  1 Aug 2026 18:26:18 +0200
Message-ID: <20260801162618.86609-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1785601585-467FBB9D-D0F11A09/0/0 CLEAN NORMAL
X-TOI-MSGID: 50ec6ed4-8616-4f32-8fc6-14273dade249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1785601585; i=f_l_k@t-online.de;
	bh=bgpQv5QJL5Q3dH0ljDRT/cmsjqgt4xapoN95hY2jGtc=;
	h=From:To:Subject:Date;
	b=lM4spH3BnrSMPRQOmvYQI1EBbMH+Ol7l+995RnAvmsbgrDdkrQUSb9a5Enw3TwpcZ
	 0ZcL2UDwJZUQhAk+HRwivgtOYpl6+1ZBA2ybIj+5Dh/Qn7WZpsMRqJef+vgz/cQ0Hy
	 3BM3dGTmBsxpDPeoXO50IDHN4DilZ5UNqTN200dEVfPCfMPXXn8WLzzo7gYT4QoSo1
	 XQ2ACdT7gPI8zqyRr7RayPPkGfAdR5uNUISKi4yAJSkwweEhtyUDGyz3545PsX7zx1
	 WZhim6hXbUcskzW8ynEmMeS/ZLfF2tL7rTWejV4KemJl3eWMUhW9+AEkSX4OnxEULU
	 977DWwxFFbKAg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 16:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128617

- use nobranch=3D1
- use tag=3Dv${PV}

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5=
.7.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
index 42f838a58c..8bf40cbb51 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4bf661c1e3793e=
55c8d1051bc5e0ae21"
 DEPENDS =3D "glib-2.0"
=20
 SRC_URI =3D " \
-    git://github.com/FluidSynth/fluidsynth.git;name=3Dfluidsynth;branch=3D=
master;protocol=3Dhttps \
+    git://github.com/FluidSynth/fluidsynth.git;name=3Dfluidsynth;nobranc=
h=3D1;protocol=3Dhttps;tag=3Dv${PV} \
     git://github.com/kthohr/gcem.git;name=3Dgcem;subdir=3D${S}/gcem;prot=
ocol=3Dhttps;nobranch=3D1 \
     git://github.com/Signalsmith-Audio/basics.git;name=3Dsignalsmith-aud=
io-basics;subdir=3D${S}/signalsmith-audio-basics;protocol=3Dhttps;nobranc=
h=3D1 \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.pat=
ch \
--=20
2.55.0


