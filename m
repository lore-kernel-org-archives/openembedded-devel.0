Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A72D59F7A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 07:43:38 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1721.1765611816235577737
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 23:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 5EC9EEC24
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 08:43:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.169.98]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vUKHu-2gMaW10; Sat, 13 Dec 2025 08:43:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] dav1d: update 1.5.1 -> 1.5.2
Date: Sat, 13 Dec 2025 08:43:29 +0100
Message-ID: <20251213074329.10989-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1765611814-E67FA4C7-C44E713F/0/0 CLEAN NORMAL
X-TOI-MSGID: 68072b06-a513-401e-9b4d-a2cf7905a803
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122635

Changes for 1.5.2 'Sonic':
--------------------------

1.5.2 is a minor release of dav1d, focused on maintenance:
 - minor speed improvement in recon
 - improvements on loongarch symboles visibility and asm
 - mark C globals with small code model
 - reduce the code size of the frame header parsing (OBU)
 - minor fixes on tools and CI
 - fix compilation with nasm 3.00

Copyright year has been changed:
https://github.com/videolan/dav1d/commit/04faac69004ac951b74ac7fea331f379=
0ec043b8

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../dav1d/{dav1d_1.5.1.bb =3D> dav1d_1.5.2.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.1.bb =3D> dav=
1d_1.5.2.bb} (79%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
similarity index 79%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
index d600e3b5e3..e8f4126a9a 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.2.bb
@@ -4,11 +4,10 @@ HOMEPAGE =3D "https://code.videolan.org/videolan/dav1d"
 SECTION =3D "multimedia"
 LICENSE =3D "BSD-2-Clause"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48d9210a87a24f62609b5a4f777d8=
dfe"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
-SRCREV =3D "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
-
+SRCREV =3D "c720f4d3556a01916324aea155555d3efba842e8"
=20
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
--=20
2.52.0


