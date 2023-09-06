Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD43CCFA12
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:59:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2388.1693965536665003731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130902716"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130902716"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:58:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A913E6882
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:58:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFA7CD615F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:58:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5957320074717;
	Wed,  6 Sep 2023 10:58:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.27.2 -> 3.27.4.1
Date: Wed,  6 Sep 2023 09:58:42 +0800
Message-Id: <1693965522-14412-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.003
X-TMASE-Result: 10--2.439400-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKgr80CieZqSq1i/8UCZ5uOngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDXnH8h9UB1XCz9khjUI1gYLbtMwD4wUdhZwuPFgiOaaw6RoMiwzxSjBv/okab2jCNmUjt
	OXD67mLef4+a6RoyzJh/0Qccgi6gBiW2eA9nSDIFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104747

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cmake_3.27.2.bb => python3-cmake_3.27.4.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.27.2.bb => python3-cmake_3.27.4.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.27.2.bb b/meta-python/recipes-devtools/python/python3-cmake_3.27.4.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.27.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.27.4.1.bb
index 46a38cf9a8..6d3e81f28f 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.27.4.1.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "7cd6e2d7d5a1125f8c26c4f65214f8c942e3f276f98c16cb62ae382c35609f25"
+SRC_URI[sha256sum] = "70526bbff5eeb7d4d6b921af1b80d2d29828302882f94a2cba93ad7d469b90f6"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


