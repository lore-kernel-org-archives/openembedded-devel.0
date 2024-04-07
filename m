Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00020CD11C2
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 12:11:24 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.74797.1712491877610010771
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 05:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout09.t-online.de (Postfix) with SMTP id C460B132D4
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Apr 2024 14:11:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.221]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rtRMd-2Lu5uD0; Sun, 7 Apr 2024 14:11:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] dav1d: update 1.4.0 -> 1.4.1
Date: Sun,  7 Apr 2024 14:11:25 +0200
Message-ID: <20240407121125.470013-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712491872-E6FFA906-5D5F5624/0/0 CLEAN NORMAL
X-TOI-MSGID: 749baeb4-369c-4464-8511-713535db8a67
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 12:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109840

dav1d 1.4.1 'Road Runner'

1.4.1 is a small release of dav1d, improving notably ARM and RISC-V
speed and fixing a small security issue.

The ARM speed improvements can be significative, depening on the
samples.

Finally, the binary size of dav1d was reduced on ARM and RISC-V

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/{dav1d_1.4.0.bb =3D> dav1d_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.4.0.bb =3D> dav=
1d_1.4.1.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.1.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.1.bb
index e503af44c..08607acd8 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.1.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
 SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
-SRCREV =3D "bb645893f374ab694b10a79f1205a728e010f2c9"
+SRCREV =3D "872e470ebf3e65b0b956f3a70329e885a2df1c2a"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.44.0


