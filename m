Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07B7C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 13:58:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.9175.1739627881686905108
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 05:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id 9CD70A5C
	for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 14:57:52 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.164.129]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tjIg4-0UOSA50; Sat, 15 Feb 2025 14:57:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] dav1d: update 1.5.0 -> 1.5.1
Date: Sat, 15 Feb 2025 14:58:27 +0100
Message-ID: <20250215135827.7505-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1739627872-A6FFAA89-6E5BC37E/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a78e557-4d27-4a5a-a742-98c5b477cfa8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 13:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115494

Changes for 1.5.1 'Sonic':
--------------------------
1.5.1 is a minor release of dav1d, focusing on optimizations and stack re=
duction:
 - Rewrite of the looprestoration (SGR, wiener) to reduce stack usage
 - Rewrite of {put,prep}_scaled functions
Now, the required stack space for dav1d should be: 62 KB on x86_64 and
58KB on arm and aarch64.
 - Improvements on the SSSE3 SGR
 - Improvements on ARM32/ARM64 looprestoration optimizations
 - RISC-V: blend optimizations for high bitdepth
 - Power9: blend optimizations for 8bpc
 - Port RISC-V to POSIX/non-Linux OS
 - AArch64: Add Neon implementation of load_tmvs
 - Fix a rare, but possible deadlock, in flush()

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.5.0.bb =3D> dav1d_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.0.bb =3D> dav=
1d_1.5.1.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.0.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.0.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
index 408c6c3bfd..47341e2106 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.0.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.1.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
-SRCREV =3D "32cf02af50f32af108a3b281c452788dccdac648"
+SRCREV =3D "42b2b24fb8819f1ed3643aa9cf2a62f03868e3aa"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.48.1


