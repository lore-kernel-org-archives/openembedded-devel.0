Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172D9C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 12:35:48 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.46102.1669379744271345290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 04:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1oyXvi-0005uS-DS; Fri, 25 Nov 2022 13:35:42 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1oyXvf-000ENA-0l; Fri, 25 Nov 2022 13:35:39 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1oyXvf-003wGf-1M; Fri, 25 Nov 2022 13:35:39 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Henning Heinold <henning@itconsulting-heinold.de>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Richard Leitner <richard.leitner@skidata.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-java][PATCH] jsch: switch to inclusive language
Date: Fri, 25 Nov 2022 13:35:32 +0100
Message-Id: <20221125123532.938920-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 12:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99730

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 recipes-core/jcraft/jsch_0.1.40.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index 07d5b9e3108e..259712661f4d 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -25,8 +25,8 @@ do_compile() {
 SRC_URI[md5sum] = "b59cec19a487e95aed68378976b4b566"
 SRC_URI[sha256sum] = "ca9d2ae08fd7a8983fb00d04f0f0c216a985218a5eb364ff9bee73870f28e097"
 
-# Whitelist the CVE because it only affects Windows platforms
-CVE_CHECK_WHITELIST += "CVE-2016-5725"
+# Ignore the CVE because it only affects Windows platforms
+CVE_CHECK_IGNORE += "CVE-2016-5725"
 
 BBCLASSEXTEND = "native"
 
-- 
2.30.2


