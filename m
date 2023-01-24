Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA7EC38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 13:49:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.14951.1674568155814526717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 05:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJfm-0007tF-86; Tue, 24 Jan 2023 14:49:14 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJfm-0007j9-Hb; Tue, 24 Jan 2023 14:49:13 +0100
Received: from jlu by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKJfk-00Gclp-QY; Tue, 24 Jan 2023 14:49:12 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-oe][PATCH] opensc: fix homepage URL
Date: Tue, 24 Jan 2023 14:49:05 +0100
Message-Id: <20230124134904.3962233-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 13:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100723

The opensc-project.org domain has not been active for a long time [1],
so use the current wiki (which is also linked from the projects GitHub
landing page).

[1] https://opensc-devel.narkive.com/48b09iig/www-opensc-project-org

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/opensc/opensc_0.23.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
index 078e4e686840..b0f147c798d0 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
@@ -6,7 +6,7 @@ keys on the smart card is possible with PKCS\
 such as the FINEID (Finnish Electronic IDentity) card. Swedish Posten\
 eID cards have also been confirmed to work."
 
-HOMEPAGE = "http://www.opensc-project.org/opensc/"
+HOMEPAGE = "https://github.com/OpenSC/OpenSC/wiki"
 SECTION = "System Environment/Libraries"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
-- 
2.30.2


