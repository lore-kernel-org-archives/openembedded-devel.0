Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BF6C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 18:47:56 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.2156.1708368466681635555
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 10:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id F39C7220FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:47:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rc8ff-1vNyUO0; Mon, 19 Feb 2024 19:47:19 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] dav1d: update 1.3.0 -> 1.4.0
Date: Mon, 19 Feb 2024 19:47:31 +0100
Message-ID: <20240219184731.3378-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219184731.3378-1-f_l_k@t-online.de>
References: <20240219184731.3378-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708368439-2D7F99FB-B9FE1BFE/0/0 CLEAN NORMAL
X-TOI-MSGID: dc101ea9-a0b2-4fe8-811c-a5a9bc2555cf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108878

Changes for 1.4.0 'Road Runner':
------------------------------------------------------

1.4.0 is a medium release of dav1d, focusing on new architecture support =
and optimizations

- AVX-512 optimizations for z1, z2, z3 in 8bit and high-bitdepth
- New architecture supported: loongarch
- Loongarch optimizations for 8bit
- New architecture supported: RISC-V
- RISC-V optimizations for itx
- Misc improvements in threading and in reducing binary size
- Fix potential integer overflow with extremely large frame sizes
---
 .../recipes-multimedia/dav1d/{dav1d_1.3.0.bb =3D> dav1d_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.3.0.bb =3D> dav=
1d_1.4.0.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.3.0.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.3.0.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
index 2d5049b9a..0eb622d03 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
-SRCREV =3D "48035599cdd4e4415732e408c407e0c1cd1c7444"
+SRCREV =3D "bb645893f374ab694b10a79f1205a728e010f2c9"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


