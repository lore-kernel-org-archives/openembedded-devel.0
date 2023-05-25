Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EB1C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:07 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6083.1684997879764773462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105604965"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105604965"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:44 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5D9FD7733
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:41 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2505AD39C8
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6079C2FC91FB;
	Thu, 25 May 2023 15:57:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.18.0 -> 2.18.1
Date: Thu, 25 May 2023 14:57:27 +0800
Message-Id: <1684997851-2098-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-3.001800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yYL5ja7E+OhyTJDl9FKHbrnITPTa+uKHEtMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFB7ZQ/buauwYxXyeHQ/kQM7rl+
	STDC8ASmFMRynftOrRw8hOo5sVUxAirJzdwausP39PPUjdF37qssjn7aa/UPSLeaKUQwGW+ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102831

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
=========
    Self signed jwt token should be string type

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.18.0.bb => python3-google-auth_2.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.18.0.bb => python3-google-auth_2.18.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.18.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.18.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.18.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.18.1.bb
index 5b4f13a9f..70a5dfbb1 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.18.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c66b488a8b005b23ccb97b1198b6cece516c91869091ac5b7c267422db2733c7"
+SRC_URI[sha256sum] = "d7a3249027e7f464fbbfd7ee8319a08ad09d2eea51578575c4bd360ffa049ccb"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


