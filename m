Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95DDC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:32:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.1197.1705973543397826218
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="135328378"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="135328378"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:32:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AF85ED6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:32:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC21FD2168
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:32:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 780812008389D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:32:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 253231A006A;
	Tue, 23 Jan 2024 09:32:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 4.0.5 -> 4.0.6
Date: Tue, 23 Jan 2024 09:31:48 +0800
Message-Id: <1705973508-25449-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--3.511800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrStGAgmKqWuWAI7Mvq/sL59v9
	Yxcv46SL+HFUiys+kAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUgFmQHHop1m4XfVEX2wZE2RA9hr4AYdwUCf3+vsbpgZumbftTEVmUZa8gSM43E0japHM
	nZW0W9yGhiutm2y2aJgv9r/8KtDSoByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108402

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Resolve "Version bump for mirroring test"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.0.5.bb => python3-asyncinotify_4.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.0.5.bb => python3-asyncinotify_4.0.6.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.5.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.6.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.0.5.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.6.bb
index a7820c5ab..34f7187d4 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "95840eec6804797f9e8ee6d65a9d2a1159e77c5395a468dcfa4f44338ed1f8b6"
+SRC_URI[sha256sum] = "c03fdb1a7dbb6bed8ede763e4e0ac224a2a3157bdc51e4ba3832588a3c29904d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


