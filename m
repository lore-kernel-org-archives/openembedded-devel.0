Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301F5E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.30516.1735032451597067792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tVvgLH5v;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032451; x=1766568451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5ucjK77hYdpmCF9SCsfC1VQLwDjUu4s/tFW+ddlzRkM=;
  b=tVvgLH5vAgMwGOYq/56f1+NDRFOzCDkX2omJCIcNxZRYnno1QHZEJqZQ
   lI4L61D5lAR3ZUOt9z5NsP2oesarVuqa20p1gIevPPdxLxsSNNkUAB1vs
   H/FE9OxjfjlJ2rsnUgfmSIa9hOj6r/6RyyJR4vvWxkmHiEqfQCmQXcycK
   tJ0EFviEQ5vI/ti679AaoqfyyEPhNRh7QKfrXDR7J/GQ6xpV7qZtz9s0P
   5EX+NkBP+Icfj3W1ko1Ryayh9pojMSsb3CUekuynQTJI2zWrdlQAbOhZm
   Ec76x3W8moTVcp1XCTYKV+pw5HurxO8XQ6eC/F4ONv+bsTsvzBqhk0tmT
   Q==;
X-CSE-ConnectionGUID: sIYdJLMvQpulRe8Wkd4lmA==
X-CSE-MsgGUID: xvB1lrBwTM2jh47zweCqrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163714083"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163714083"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B5D496749
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 297BDCF7EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1F2C6B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A5B81A0071;
	Tue, 24 Dec 2024 17:27:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/67] python3-robotframework: upgrade 7.1 -> 7.1.1
Date: Tue, 24 Dec 2024 17:26:49 +0800
Message-Id: <1735032421-13513-55-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.086800-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJouVHGbcDbAq6FEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtiN2
	nYwbbDKwPTWYWVfq/kUQiV0GefjXZiOFR4+yMyXhkYwA8AqM6PFazsFo7CfzdLnNBE+T/0rG3Sx
	6d06NWd0BMP6uiz3hWJVpLwQk/tXPyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114530

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  python3-robotframework

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_7.1.bb => python3-robotframework_7.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.1.bb => python3-robotframework_7.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.1.1.bb
index 979aba6812..06a2a931a7 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.1.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "34796d387e182b36f05d82f3bbc802bd6a30192ebf1e03c76d2086d0d04faaff"
+SRC_URI[sha256sum] = "f85919c68c4d0837006e5f09dde1ef689f082eba2e7e64d5758753f9ee8bfea9"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


