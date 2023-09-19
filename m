Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DBDCD5490
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:43:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2403.1695109427381795966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111997134"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111997134"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:43:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 30A4CD3EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:43:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 76B14D9681
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:43:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 048B440FF5;
	Tue, 19 Sep 2023 16:43:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.27.4.1 -> 3.27.5
Date: Tue, 19 Sep 2023 15:40:42 +0800
Message-Id: <1695109242-7588-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.006
X-TMASE-Result: 10--7.396800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeVmeUI2gZswJlRv
	8CguguE14CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2Vc4zbE9Zfrknpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkj80Za3RRg8N60fHGT8g07ByFlSOUuO7wu/K
	Ft1tU6JXaM2DVCjDkHTK7ELxaLNgE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104979

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 chore(deps): bump cmake from 3.27.2 to 3.27.4.1
 chore(deps): bump actions/checkout from 3 to 4
 chore(deps): update pre-commit hooks
 chore(deps): bump docker/setup-qemu-action from 2.2.0 to 3.0.0
 chore(deps): update pre-commit hooks
 Update to CMake 3.27.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cmake_3.27.4.1.bb => python3-cmake_3.27.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.27.4.1.bb => python3-cmake_3.27.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.27.4.1.bb b/meta-python/recipes-devtools/python/python3-cmake_3.27.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.27.4.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.27.5.bb
index 6d3e81f28f..ad58c6d1d9 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.27.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.27.5.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "70526bbff5eeb7d4d6b921af1b80d2d29828302882f94a2cba93ad7d469b90f6"
+SRC_URI[sha256sum] = "101d4e56154658c974e9425acd31f0fedde3ce68b47263fd14f789b028f8a13a"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


