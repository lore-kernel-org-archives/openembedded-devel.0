Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDEAC369A8
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.47779.1743412321763193788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=asPKf5W3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fFSerG0qehiBNjcHo7DMXZa8ZW35xWeqlBYBm9XWalI=;
  b=asPKf5W3nCyBSoK5dM9gNI+s6vX6whaahdOVr8cTBLyHZDqPHKV9peRx
   Nwxebofx+EbxLmPSf1B7CMH1a3GmQHcx6sac1+7JAPqeCjWnGb4wprVQY
   pGG2L7sZtibB5iWqdvgNRrhiRIS2RkCzWx1WKq4jwXOXBeT6uwNyCh7Bg
   2Ao9wIJb5nqOwb2Z4wAbSXax143jYIn7bWSfVHyxTroyH+Ie5r+p66m6e
   9qvTTixMEXiWBQlcsQpuL0IRYhSZWU8eJsszwfnhoaz1bVX/6+dQd0xdM
   Xo2U04sHxnzh78ZhPmx428XqE2/dajworJgp8ine9mLlXQvh59rqSrLGk
   A==;
X-CSE-ConnectionGUID: Yp8y6iYZSgSRN5AG+JBq3w==
X-CSE-MsgGUID: UhgAsiPCTz6v9jLQwebVtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="183356919"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="183356919"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5534F14BA3
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 12EDBD968B
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C4BB61A00A2;
	Mon, 31 Mar 2025 17:11:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/26] python3-cmake: upgrade 3.31.6 -> 4.0.0
Date: Mon, 31 Mar 2025 17:11:29 +0800
Message-Id: <1743412308-21887-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116405

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.31.6.bb => python3-cmake_4.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.31.6.bb => python3-cmake_4.0.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.31.6.bb b/meta-python/recipes-devtools/python/python3-cmake_4.0.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_3.31.6.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.0.0.bb
index 67e19aa151..b2450cd46f 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.31.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.0.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "8edddfbf367fa1bcf4b9f3064470bc0e1022f70609c0cf69c863961897826205"
+SRC_URI[sha256sum] = "b929ab7d2ebd6b9a81018b0248ea75edb3dc4ad69367e8c75fb0f6774bb6e962"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


