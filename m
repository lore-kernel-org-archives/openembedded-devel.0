Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91735CCFA1B
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:02:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2500.1693965760823141643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130429666"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130429666"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:02:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A6C82DDC76
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:02:36 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C595CD6155
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:02:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC470878BC;
	Wed,  6 Sep 2023 11:02:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-smbus2: upgrade 0.4.2 -> 0.4.3
Date: Wed,  6 Sep 2023 10:02:25 +0800
Message-Id: <1693965745-14774-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10--5.443600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrqgbUKyj27N9M+b8yxBqvA1E5
	i6jtS+HHvoIofhZD0NYnGM/19n4JwD13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQg0+/2gzcJhMGAVBEVDJ4+a/Z8DG6io+UPXMlJcsfvIBPAcn16NP9g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104756

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog;
===========
- Build pipeline and test updates only:
- Update deprecated Sphinx config format.
- Corrected deprecated assertEquals in the unit tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-smbus2_0.4.2.bb => python3-smbus2_0.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.4.2.bb => python3-smbus2_0.4.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.2.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
index f22a402df1..cc4802e6c7 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "634541ed794068a822fe7499f1577468b9d4641b68dd9bfb6d0eb7270f4d2a32"
+SRC_URI[sha256sum] = "36f2288a8e1a363cb7a7b2244ec98d880eb5a728a2494ac9c71e9de7bf6a803a"
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


