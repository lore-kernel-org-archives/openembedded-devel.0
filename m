Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747F5C7EE45
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6206.1684997865252162252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97363711"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97363711"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD3CBC68E1
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AA01D9682
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E5542FC91FB;
	Thu, 25 May 2023 15:57:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.15.4 -> 2.15.5
Date: Thu, 25 May 2023 14:57:22 +0800
Message-Id: <1684997851-2098-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJB8EDAcaEHo7QhJSf1tFzmYWTvfFvUJHASeH
	a07u4Y9kDdJU0docYJig8OKUX1po3vvdNnV3kuT9ZywXd7pMMeHVfV52ImFU3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102825

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Handle objects.Super in helpers.object_type().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.15.4.bb => python3-astroid_2.15.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.4.bb => python3-astroid_2.15.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.4.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.4.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
index 60537289e..7c859107c 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.4.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "c81e1c7fbac615037744d067a9bb5f9aeb655edf59b63ee8b59585475d6f80d8"
+SRC_URI[sha256sum] = "1039262575027b441137ab4a62a793a9b43defb42c32d5670f38686207cd780f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


