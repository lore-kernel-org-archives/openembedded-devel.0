Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A499FC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 06:03:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.15876.1684735405448259241
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 May 2023 23:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id 31A73169E0
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 08:03:23 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.34.41]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q0yde-1Nwbj70; Mon, 22 May 2023 08:03:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] dav1d: update 1.1.0 -> 1.2.0
Date: Mon, 22 May 2023 08:03:13 +0200
Message-Id: <20230522060313.10062-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684735402-63FE59E6-5CB61867/0/0 CLEAN NORMAL
X-TOI-MSGID: 71dbf6d8-7f6d-4b71-b7a4-4e9939a5d6bd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 06:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102695

Changes for 1.2.0 'Arctic Peregrine Falcon':
-------------------------------------------

1.2.0 is a small release of dav1d, adding more SIMD and fixes

- Improvements on attachments of props and T.35 entries on output picture=
s
- NEON z1/z3 high bit-depth optimizations and improvements for 8bpc
- SSSE3 z2/z3 8bpc and SSSE3 z1/z3 high bit-depth optimziations
- refmvs.save_tmvs optimizations in SSSE3/AVX2/AVX-512
- AVX-512 optimizations for high bit-depth itx (16x64, 32x64, 64x16, 64x3=
2, 64x64)
- AVX2 optimizations for 12bpc for 16x32, 32x16, 32x32 itx

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.1.0.bb =3D> dav1d_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.1.0.bb =3D> dav=
1d_1.2.0.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb
index 33dbef3524..5d43921b03 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.2.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
-SRCREV =3D "9593e625b75d498d1edea544da21ea764b98d507"
+SRCREV =3D "676a864a11af2c0522e1f992e770589543894686"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


