Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D78E7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 22:22:05 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.5657.1736461319852342712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 14:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id EA87DC02
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jan 2025 23:21:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.41]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tW0ua-16aKIr0; Thu, 9 Jan 2025 23:21:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] dav1d: update 1.4.3 -> 1.5.0
Date: Thu,  9 Jan 2025 23:22:02 +0100
Message-ID: <20250109222202.377795-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736461316-6FFFC959-4FABC814/0/0 CLEAN NORMAL
X-TOI-MSGID: 44ede1ef-92db-44f9-95a7-7385ca68518c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 22:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114756

Changes for 1.5.0 'Sonic':
--------------------------

1.5.0 is a major release of dav1d, that:
 - WARNING: we removed some of the SSE2 optimizations, so if you care abo=
ut
            systems without SSSE3, you should be careful when updating!
 - Add Arm OpenBSD run-time CPU feature
 - Optimize index offset calculations for decode_coefs
 - picture: copy HDR10+ and T35 metadata only to visible frames
 - SSSE3 new optimizations for 6-tap (8bit and hbd)
 - AArch64/SVE: Add HBD subpel filters using 128-bit SVE2
 - AArch64: Add USMMLA implempentation for 6-tap H/HV
 - AArch64: Optimize Armv8.0 NEON for HBD horizontal filters and 6-tap fi=
lters
 - Power9: Optimized ITX till 16x4.
 - Loongarch: numerous optimizations
 - RISC-V optimizations for pal, cdef_filter, ipred, mc_blend, mc_bdir, i=
tx
 - Allow playing videos in full-screen mode in dav1dplay

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.4.3.bb =3D> dav1d_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.4.3.bb =3D> dav=
1d_1.5.0.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.0.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.0.bb
index 6b7f3090a3..408c6c3bfd 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
-SRCREV =3D "e9986de7f4264940af6fa1df1498fd2754077de4"
+SRCREV =3D "32cf02af50f32af108a3b281c452788dccdac648"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.47.1


