Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3726AC19F4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.736.1689654380724238267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124342517"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124342517"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 90C63D29E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 843312801D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 125E7200854E2;
	Tue, 18 Jul 2023 13:26:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.8.0 -> 3.9.1
Date: Tue, 18 Jul 2023 12:25:35 +0800
Message-Id: <1689654348-30702-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--3.675800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrI3pS4zAxEQ88DTfVRLTQzBUl
	FfwzsqyWo49BSryhtV0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG231w
	l3qzgklKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzEE/L/rvCmK9HuW
	OK4ccYSBC2fabcsLLDIfTGGc/zIXPxjdZzvkjp2m2vLuTdsqlOdTj9jcdgr30VPnv8jI8UjjADC
	oonpVeViB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-unix: Optionally create the opinionated log/ in user_log_dir()
-BSD: provide a fallback for user_runtime_di

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_3.8.0.bb => python3-platformdirs_3.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.8.0.bb => python3-platformdirs_3.9.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
index 52fe07acf9..c52d9d2169 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.9.1.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "b0cabcb11063d21a0b261d557acb0a9d2126350e63b70cdf7db6347baea456dc"
+SRC_URI[sha256sum] = "1b42b450ad933e981d56e59f1b97495428c9bd60698baab9f3eb3d00d5822421"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


