Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D129C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:18:44 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6359.1692865121572272401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117364126"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117364126"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:18:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D92F8CD7E3
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:18:36 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D531CD6024
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:18:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 847E887E52;
	Thu, 24 Aug 2023 17:18:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.4.1 -> 4.5.0
Date: Thu, 24 Aug 2023 16:17:55 +0800
Message-Id: <1692865075-2865-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10--5.393300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrKQNhMboqZlr6HJ2dbFXCEypn
	BpzOalamFWgNODmMc19QyRMERl5by8RBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEbev
	5wFKyVv5OKi1tdfLzxJg+xMERr0NZeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSkj80Za3RRg8FmnoU1zTsYtJmrbkpOG92LJOrZOVDwqUjI7K
	wo2AnAAiup+hvrIvDc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104578

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
=========
 Added new helper methods for Atlas Search Index (requires MongoDB Server 7.0+).
 Added Database.cursor_command to support
 executing an arbitrary command that returns a cursor.
 Improved bson encoding and decoding performance by up to 134%.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.4.1.bb => python3-pymongo_4.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.4.1.bb => python3-pymongo_4.5.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.4.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.5.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.5.0.bb
index b89706a566..9ae3eef0c1 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.5.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a4df87dbbd03ac6372d24f2a8054b4dc33de497d5227b50ec649f436ad574284"
+SRC_URI[sha256sum] = "681f252e43b3ef054ca9161635f81b730f4d8cadd28b3f2b2004f5a72f853982"
 
 inherit pypi setuptools3
 
-- 
2.34.1


