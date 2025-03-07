Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D52EC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:45:09 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.11080.1741355107641988636
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 77147A80
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Mar 2025 14:45:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.145]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqY0c-1yiUDZ0; Fri, 7 Mar 2025 14:45:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fastfloat: remove recipe
Date: Fri,  7 Mar 2025 14:45:45 +0100
Message-ID: <20250307134545.749071-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741355102-79FF8983-587525F5/10/3626336762 SUSPECT URL
X-TOI-MSGID: a42098b5-722e-4405-8601-05d50cb8a3e3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 13:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115788

fastfloat was moved to oe-core

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-devtools/fastfloat/fastfloat_6.1.6.bb | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb

diff --git a/meta-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb b/meta=
-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb
deleted file mode 100644
index 99b213c4b7..0000000000
--- a/meta-oe/recipes-devtools/fastfloat/fastfloat_6.1.6.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "fast_float number parsing library: 4x faster than strtod"
-HOMEPAGE =3D "https://github.com/fastfloat/fast_float"
-LICENSE =3D "Apache-2.0 & BSL-1.0 & MIT"
-LIC_FILES_CHKSUM =3D " \
-	file://LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a83f3e68eb \
-	file://LICENSE-APACHE;md5=3D81db248e90379bcfc0582b578b009bc3 \
-	file://LICENSE-BOOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d2 \
-"
-
-SRC_URI =3D "git://github.com/fastfloat/fast_float.git;protocol=3Dhttps;=
branch=3Dmain"
-
-SRCREV =3D "00c8c7b0d5c722d2212568d915a39ea73b08b973"
-S =3D "${WORKDIR}/git"
-
-inherit cmake
--=20
2.48.1


