Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F91CC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 14:44:52 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.4391.1643035489774836240
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 06:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1nC0aN-0003zM-8Z; Mon, 24 Jan 2022 15:44:47 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1nC0aM-00Dajr-7Z; Mon, 24 Jan 2022 15:44:46 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH] snappy: use main branch to fix fetch failure
Date: Mon, 24 Jan 2022 15:44:37 +0100
Message-Id: <20220124144437.3239395-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 14:44:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95034

The project has renamed the master branch to main.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
index 252ba9f3dc69..0d58345d7a8c 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -10,7 +10,7 @@ compression ratio."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=master \
+SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
     file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
 "
 SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
-- 
2.30.2


