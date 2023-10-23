Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9236CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 09:00:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.116629.1698051649372297910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 02:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138663678"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138663678"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 18:00:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 170F6CA1ED
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 18:00:36 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 537BAD9470
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 18:00:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF4922FC7AED;
	Mon, 23 Oct 2023 18:00:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rapidjson: upgrade 1.11 -> 1.12
Date: Mon, 23 Oct 2023 17:00:07 +0800
Message-Id: <1698051607-26356-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--1.082000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mryHdfpwipSH6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzd1EwgmRYaXvCOI
	2F1na2JqdqyH0KWe0iNnGy3Jj2shibNAX/etAvk4Fb4dbGhnkhLSbclVRkR/VnsCiXEcrTXu5cP
	IRVFk2RiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 09:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105684

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Generate wheels on PyPI using final Python 3.12 release, thanks to cibuildwheel 2.16.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rapidjson_1.11.bb => python3-rapidjson_1.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.11.bb => python3-rapidjson_1.12.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb
index 3ea5594887..fe2506a9d8 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.12.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
 
 SRC_URI = "git://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
-SRCREV = "e1b41f64df1705770b7b70d7221a4812909c1d0f"
+SRCREV = "5063cc63008b41e129344b012fc59b114cacd5c9"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


