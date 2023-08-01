Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ECEC05051
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7633.1690875734649116257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105920450"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105920450"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AD8AADB3C8
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E42C3D5E9F
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66EB210211;
	Tue,  1 Aug 2023 16:42:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dnspython: upgrade 2.4.0 -> 2.4.1
Date: Tue,  1 Aug 2023 15:41:41 +0800
Message-Id: <1690875717-21608-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-1.635600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29Xuce7gFxhKa2+OGVbYwYsiZtwlo64JqFBnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMO2wQxDIXXE8ECvd
	wv8LB4RmX6z9NKIRJfmejpKDKuSkLLSY61+rNHRJHw4jupUFufHYn3A8IiZ3jqse1Nba8kbQsjs
	y2O2Op6gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104181

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.4.0.bb => python3-dnspython_2.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.4.0.bb => python3-dnspython_2.4.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.4.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.4.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.4.1.bb
index bce6ccfafb..6233527dc0 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "758e691dbb454d5ccf4e1b154a19e52847f79e21a42fef17b969144af29a4e6c"
+SRC_URI[sha256sum] = "c33971c79af5be968bb897e95c2448e11a645ee84d93b265ce0b7aabe5dfdca8"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


