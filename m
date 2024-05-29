Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78797C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 07:07:05 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.7899.1716966400733939738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 00:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id BEFFF1DF4B
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 09:06:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.163]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sCDOO-0PtcZN0; Wed, 29 May 2024 09:06:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] dav1d: update 1.4.1 -> 1.4.2
Date: Wed, 29 May 2024 09:07:15 +0200
Message-ID: <20240529070715.76709-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716966396-463EB322-062BF769/0/0 CLEAN NORMAL
X-TOI-MSGID: c5535e32-6c0b-41a6-bc9c-fab11a5304fa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 07:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110606

Changes for 1.4.2 'Road Runner':
--------------------------------

1.4.2 is a small release of dav1d, improving notably ARM, AVX-512 and Pow=
erPC
 - AVX2 optimizations for 8-tap and new variants for 6-tap
 - AVX-512 optimizations for 8-tap and new variants for 6-tap
 - Improve entropy decoding on ARM64
 - New ARM64 optimizations for convolutions based on DotProd extension
 - New ARM64 optimizations for convolutions based on i8mm extension
 - New ARM64 optimizations for subpel and prep filters for i8mm
 - Misc improvements on existing ARM64 optimizations, notably for put/pre=
p
 - New PowerPC9 optimizations for loopfilter
 - Support for macOS kperf API for benchmarking

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.4.1.bb =3D> dav1d_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.4.1.bb =3D> dav=
1d_1.4.2.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.1.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.2.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.1.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.2.bb
index 08607acd8..4e8412303 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.2.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
-SRCREV =3D "872e470ebf3e65b0b956f3a70329e885a2df1c2a"
+SRCREV =3D "805d9e5a8ffce3ef78cebde4bfedf3642907b2d3"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.45.1


