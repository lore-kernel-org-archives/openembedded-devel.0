Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55077C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:45:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.22412.1673440262626339379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 04:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1pFaFw-0000mP-19; Wed, 11 Jan 2023 13:31:00 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1pFaFv-005IU5-Do; Wed, 11 Jan 2023 13:30:59 +0100
Received: from afa by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1pFaFu-004iAk-MU; Wed, 11 Jan 2023 13:30:58 +0100
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [meta-java][PATCH 2/2] recipes-core: jdepend: use SPDX compatible string instead of BSD
Date: Wed, 11 Jan 2023 13:30:51 +0100
Message-Id: <20230111123051.1123058-2-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111123051.1123058-1-a.fatoum@pengutronix.de>
References: <20230111123051.1123058-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100552

Build on kirkstone now reports that the BSD LICENSE used in jdepend
is not specific enough:

  WARNING: jdepend-native-2.9.1-r0 do_populate_lic: QA Issue:
  jdepend-native: No generic license file exists for: BSD in any provider
  [license-exists]

Upon inspection, jdepend is actually BSD-3-Clause, so reflect that in
the LICENSE field.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 recipes-core/jdepend/jdepend_2.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
index deae6a8eb74a..1fa156ca90c6 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Design quality metrics generator for each Java"
 
 # see https://github.com/clarkware/jdepend/blob/master/LICENSE
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5777d32a7709d558c2877d4a6616230"
 
 HOMEPAGE = "https://github.com/clarkware/jdepend"
-- 
2.30.2


