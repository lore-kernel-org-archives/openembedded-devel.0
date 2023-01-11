Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575ABC54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:45:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.22411.1673440262292422195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 04:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1pFaFv-0000mO-UC; Wed, 11 Jan 2023 13:30:59 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1pFaFv-005IU2-CJ; Wed, 11 Jan 2023 13:30:59 +0100
Received: from afa by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1pFaFu-004iAi-M3; Wed, 11 Jan 2023 13:30:58 +0100
From: "Ahmad Fatoum" <a.fatoum@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [meta-java][PATCH 1/2] recipes-core: jcraft: use SPDX compatible string instead of plain BSD
Date: Wed, 11 Jan 2023 13:30:50 +0100
Message-Id: <20230111123051.1123058-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100551

Build on kirkstone now reports that the BSD LICENSE used in some recipes
is not specific enough:

  WARNING: jzlib-native-1.0.7-r0 do_populate_lic: QA Issue: jzlib-native:
  No generic license file exists for: BSD in any provider [license-exists]
  WARNING: jsch-native-0.1.40-r0 do_populate_lic: QA Issue: jsch-native:
  No generic license file exists for: BSD in any provider [license-exists]

Upon inspection, both jcraft packages are actually BSD-3-Clause, so
reflect that in the LICENSE field.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 recipes-core/jcraft/jsch_0.1.40.bb | 2 +-
 recipes-core/jcraft/jzlib_1.0.7.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index a0f70d869b2e..8ad71b492249 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -1,6 +1,6 @@
 SUMMARY = "SSH implementation in Java"
 HOMEPAGE = "http://www.jcraft.com/jsch"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55e3b6a0987ccd0c34530f3df2d206ae"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/jsch/jsch-${PV}.zip"
diff --git a/recipes-core/jcraft/jzlib_1.0.7.bb b/recipes-core/jcraft/jzlib_1.0.7.bb
index 70b521204979..1e34d2c0b15b 100644
--- a/recipes-core/jcraft/jzlib_1.0.7.bb
+++ b/recipes-core/jcraft/jzlib_1.0.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "zlib implementation in Java"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a2b2e5b95bf768dd5c4ca097c9cde9e9"
 
 HOMEPAGE = "http://www.jcraft.com/jzlib"
-- 
2.30.2


