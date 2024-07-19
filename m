Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455EDC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 10:33:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.15967.1721385192176481755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 03:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id E93D01D598
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 12:33:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.70]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sUkvC-1Nz5AP0; Fri, 19 Jul 2024 12:33:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] dav1d: update 1.4.2 -> 1.4.3
Date: Fri, 19 Jul 2024 12:34:06 +0200
Message-ID: <20240719103406.320773-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721385186-B27F7709-6DEC8F7B/0/0 CLEAN NORMAL
X-TOI-MSGID: b8f6ac01-700a-4801-9163-a6ec38b854c8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 10:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111415

- set nobranch=3D1 to fix:
This commit does not belong to any branch on this repository, and may bel=
ong to a fork outside of the repository.

Changes for 1.4.3 'Road Runner':
--------------------------------

1.4.3 is a small release focused on security issues
 - AArch64: Fix potential out of bounds access in DotProd H/HV filters
 - cli: Prevent buffer over-read

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../dav1d/{dav1d_1.4.2.bb =3D> dav1d_1.4.3.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.4.2.bb =3D> dav=
1d_1.4.3.bb} (86%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.2.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
similarity index 86%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.2.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
index 4e8412303..43056e9a4 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
@@ -6,8 +6,8 @@ LICENSE =3D "BSD-2-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
=20
-SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
-SRCREV =3D "805d9e5a8ffce3ef78cebde4bfedf3642907b2d3"
+SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;nobranch=3D1"
+SRCREV =3D "e9986de7f4264940af6fa1df1498fd2754077de4"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.45.1


