Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA3ECCFA0D
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:57:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2391.1693965418949327869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118949341"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118949341"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:56:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EEC18E6882
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:56:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 32067BF49C
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:56:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AD4E6BF4A;
	Wed,  6 Sep 2023 10:56:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-luma-core: upgrade 2.4.0 -> 2.4.1
Date: Wed,  6 Sep 2023 09:56:46 +0800
Message-Id: <1693965406-14211-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-1.501600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrqgoQeOa2gHDfc2Xd6VJ+yun7
	ya/+V5vjMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3i4Jg
	4IB24UOgNUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtxgBqAN8xVhz6v534/8pHgzG0rZsQjbT7dkfPL6ddkTv1fIgXHnzr3hHwS
	59J6VWJnGG7aBFkyHAdjE2svZbxBoWZDmzHt9kLHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104742

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Adjust type check

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-luma-core_2.4.0.bb => python3-luma-core_2.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.4.0.bb => python3-luma-core_2.4.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.4.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.4.1.bb
index 8a7be0a30c..a50c9656ab 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.4.1.bb
@@ -2,11 +2,11 @@ SUMMARY = "A component library to support SBC display drivers"
 DESCRIPTION = "A component library to support SBC display drivers"
 HOMEPAGE = "https://github.com/rm-hull/luma.core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=71cded473ab60fdbe20edc519217f521"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b56ff1acb787606580264498947079fc"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cf5fdf3563d5ec56e2f792f3a2f432abaeac517a0b05a10a757a4c5a26bb2e5d"
+SRC_URI[sha256sum] = "175663a4b0afde86ed5359f265fbb2ed978132cac4d9b42a30a3e0f0faf3f0d7"
 
 PYPI_PACKAGE = "luma.core"
 
-- 
2.34.1


