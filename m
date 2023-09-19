Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82113CD549B
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:52:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2633.1695109966629581361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111998030"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111998030"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:52:42 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9786CA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:52:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E54B0BF3E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:52:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 783AD20079116;
	Tue, 19 Sep 2023 16:52:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rapidjson: upgrade 1.10 -> 1.11
Date: Tue, 19 Sep 2023 15:52:04 +0800
Message-Id: <1695109924-8057-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--1.264000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrXLILvyEBT86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzvY5YVjDruxlvkH
	r2JbVAkCZuVotYczlt7CYk7OVIvrRI62wHDAmufKuhffU2efrpbDhgeqAJZ61h9JQnsCzSGIC02
	klsHKYMiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Use current master version of rapidjson
    Use cibuildwheel 2.15.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rapidjson_1.10.bb => python3-rapidjson_1.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.10.bb => python3-rapidjson_1.11.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.10.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.10.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
index 7dac464bea..930ad34340 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
 
 SRC_URI = "git://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
-SRCREV = "e9e209553a65db3568471f32392f54549c8a9816"
+SRCREV = "e1b41f64df1705770b7b70d7221a4812909c1d0f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


