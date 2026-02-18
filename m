Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0853E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:27:01 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10921.1771417613781039512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout08.t-online.de (Postfix) with SMTP id AA257EDA6
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 13:26:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsgdm-2DmsPB0; Wed, 18 Feb 2026 13:26:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] dav1d: update 1.5.2 -> 1.5.3
Date: Wed, 18 Feb 2026 13:26:46 +0100
Message-ID: <20260218122646.121850-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771417610-197E78CF-879BD614/0/0 CLEAN NORMAL
X-TOI-MSGID: a8b9e379-49f7-492e-b38b-a9be76c93265
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 12:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124479

Changes for 1.5.3 'Sonic':
--------------------------

1.5.3 is a minor release of dav1d, focused on RISC-V and maintenance:
 - Misc small optimizations
 - RISC-V assembly optimizations for ipred, emu_edge and w_mask,
   and VLEN 512 for blend functions
 - Fix issue with ivf files with 0 frames in tools

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.5.2.bb =3D> dav1d_1.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.2.bb =3D> dav=
1d_1.5.3.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.3.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.3.bb
index e8f4126a9a..6c092c1649 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.3.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48d9210a87a24f62609b5a4f777d8=
dfe"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
-SRCREV =3D "c720f4d3556a01916324aea155555d3efba842e8"
+SRCREV =3D "b546257f770768b2c88258c533da38b91a06f737"
=20
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
--=20
2.52.0


