Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BD2C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:37:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.151934.1692149830394720277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="116497053"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="116497053"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:37:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C3C7E8523
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:05 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A735DCFBCA
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A269C86E22;
	Wed, 16 Aug 2023 10:37:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googletest: upgrade 1.13.0 -> 1.14.0
Date: Wed, 16 Aug 2023 09:36:52 +0800
Message-Id: <1692149812-4833-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--2.758600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorbD4
	LI9c0YeiUR/tFfIsq4Tmn3xyPJAJopGZilTi8ctSOwpfLMeBwRtSHjB5Y+o5ZDBL58qLX4iuREf
	fVh/puQ7egKf/r6b46jKHYLsR4q0LHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4i0K
	P2i9s/24X8ByX2oo9vQkftIlYncIsWh8U/uYmnC3JJLRj5iPDc5Zg/sgLm47JXPI73YuHmwPZpK
	ZkI+V6qJ5bpGZMfWpWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104370

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../googletest/{googletest_1.13.0.bb => googletest_1.14.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/googletest/{googletest_1.13.0.bb => googletest_1.14.0.bb} (95%)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.13.0.bb b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
similarity index 95%
rename from meta-oe/recipes-test/googletest/googletest_1.13.0.bb
rename to meta-oe/recipes-test/googletest/googletest_1.14.0.bb
index 2327f85d46..8c75f936de 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.13.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "b796f7d44681514f58a683a3a71ff17c94edb0c1"
+SRCREV = "f8d7d77c06936315286eb55f8de22cd23c188571"
 SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
-- 
2.34.1


