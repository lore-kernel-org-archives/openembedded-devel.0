Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAA7C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:09:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.85906.1749560842382182034
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 06:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1uOyhE-0007iU-Th; Tue, 10 Jun 2025 15:07:20 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][scarthgap][PATCH] canutils: use https instead of git protocol
Date: Tue, 10 Jun 2025 15:07:16 +0200
Message-Id: <20250610130716.3194276-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 15:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117878

The git server at git.pengutronix.de no longer supports the git
protocol, so switch to https.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index ab4710e81f..6989531c81 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libsocketcan"
 
 SRCREV = "299dff7f5322bf0348dcdd60071958ebedf5f09d"
-SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;branch=master \
+SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=https;branch=master \
     file://0001-canutils-candump-Add-error-frame-s-handling.patch \
 "
 
-- 
2.39.5


