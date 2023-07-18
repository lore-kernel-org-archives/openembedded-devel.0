Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224F1C18E1B
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.738.1689654381964860897
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="104286659"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="104286659"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C48BBE4458
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3E9ED5E97
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 800EF2008A3EB;
	Tue, 18 Jul 2023 13:26:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.4.0 -> 4.4.1
Date: Tue, 18 Jul 2023 12:25:38 +0800
Message-Id: <1689654348-30702-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-0.516900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr5sPqcQkI8puU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLduTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDXT04
	6NObyhXxnZ8t5bPS4pLE6QdCluG5bjefv31oQgr5t83l8LuLv8U8xwfzDx3U33x0GgsgJPSK42R
	xNZn45emU8ikMoTTD2ZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103928

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed a bug where pymongo would raise a ConfigurationError
-Fixed a minor reference counting bug in the C extension (PYTHON-3798 2).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.4.0.bb => python3-pymongo_4.4.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.4.0.bb => python3-pymongo_4.4.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.4.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.4.1.bb
index a9bf31d811..b89706a566 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.4.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a1b5d286fee4b9b5a0312faede02f2ce2f56ac695685af1d25f428abdac9a22c"
+SRC_URI[sha256sum] = "a4df87dbbd03ac6372d24f2a8054b4dc33de497d5227b50ec649f436ad574284"
 
 inherit pypi setuptools3
 
-- 
2.34.1


