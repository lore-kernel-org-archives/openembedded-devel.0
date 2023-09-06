Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D47CCFA13
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:59:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2402.1693965575040778561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118950159"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118950159"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:59:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BE129DDC62
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:59:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04DECD60E0
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:59:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8856C6BEFF;
	Wed,  6 Sep 2023 10:59:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-diskcache: upgrade 5.6.1 -> 5.6.3
Date: Wed,  6 Sep 2023 09:59:05 +0800
Message-Id: <1693965545-14449-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--0.619700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XgyKXAUOPYkQQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMO1cMCbjdy8L7OXS
	3s0OSVj2j9681N8D/cLRzIjkJ26fgjPgDS1oFaXOy+1USlaQVzZuFEt4V/eir9TMtuX5uZveoq2
	g5sQty6gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104748

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-diskcache_5.6.1.bb => python3-diskcache_5.6.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.6.1.bb => python3-diskcache_5.6.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.6.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.6.1.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
index 447bfc440b..8bc498dc4e 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "e4c978532feff5814c4cc00fe1e11e40501985946643d73220d41ee7737c72c3"
+SRC_URI[sha256sum] = "2c3a3fa2743d8535d832ec61c2054a1641f41775aa7c556758a109941e33e4fc"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.34.1


