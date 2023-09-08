Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667F7EE14D8
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 16:42:10 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.1267.1694190535486535713
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 09:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1qeeLl-0003wg-UF; Fri, 08 Sep 2023 18:28:53 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Chris Dimich <chris.dimich@boundarydevices.com>,
	Khem Raj <raj.khem@gmail.com>,
	Bastian Krause <bst@pengutronix.de>
Subject: [mickledore][PATCH v2] image_types_sparse: Fix syntax error
Date: Fri,  8 Sep 2023 18:28:50 +0200
Message-Id: <20230908162850.2390428-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 16:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104808

From: Chris Dimich <chris.dimich@boundarydevices.com>

When using the image type:

	IMAGE_FSTYPES += " wic.sparse"
	IMAGE_CLASSES += " image_types_sparse"

The following error arises:

	Syntax error: Bad function name

So need to remove function in favor of variable.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
This is a backport of dff205f5a ("image_types_sparse: Fix syntax
error"), excluding the removal of IMAGE_NAME_SUFFIX because in
mickledore, ${IMAGE_NAME_SUFFIX} is and will not be included in
${IMAGE_NAME}.

Changes since (implicit) v1:
- add missing semicolons
---
 meta-oe/classes/image_types_sparse.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 69e24cbb7..68c5dbaa1 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -8,9 +8,11 @@ inherit image_types
 SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
-CONVERSION_CMD:sparse() {
-    INPUT="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-    truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "$INPUT"
-    img2simg -s "$INPUT" "$INPUT.sparse" ${SPARSE_BLOCK_SIZE}
-}
+
+CONVERSION_CMD:sparse = " \
+    INPUT="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"; \
+    truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "$INPUT"; \
+    img2simg -s "$INPUT" "$INPUT.sparse" ${SPARSE_BLOCK_SIZE}; \
+ "
+
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.39.2


