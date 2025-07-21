Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1095C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:38:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.41077.1753105120874554620
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1udqj0-0008Aq-Op; Mon, 21 Jul 2025 15:38:38 +0200
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1udqj0-009Z7u-12;
	Mon, 21 Jul 2025 15:38:38 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1udqj0-00AtNg-0o;
	Mon, 21 Jul 2025 15:38:38 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH] imx-cst: update to v3.4.1
Date: Mon, 21 Jul 2025 15:38:36 +0200
Message-Id: <20250721133836.2596155-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 13:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118660

Update as the previous version's source is not available for download anymore
from the debian mirror.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 .../imx-cst/{imx-cst_3.4.0.bb => imx-cst_3.4.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imx-cst/{imx-cst_3.4.0.bb => imx-cst_3.4.1.bb} (93%)

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
similarity index 93%
rename from meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
rename to meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
index 3b57f4ed81ce..12b319843eba 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "\
     file://0001-fix-missing-makefile-rule-dependency.patch \
 "
 
-SRC_URI[sha256sum] = "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5df965c5952eba8c8d"
+SRC_URI[sha256sum] = "342c0c028658a4a859fe70578b58c3b07e17bee0c7e3a13d063d4791e82c2dee"
 
 S = "${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
 
-- 
2.39.5


