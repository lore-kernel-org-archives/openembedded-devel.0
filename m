Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F49EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4895.1688699654076689617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103103849"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103103849"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DE0CC68E4
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:09 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E3FD014278
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 13D4F881D9;
	Fri,  7 Jul 2023 12:14:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aenum: upgrade 3.1.14 -> 3.1.15
Date: Fri,  7 Jul 2023 11:13:37 +0800
Message-Id: <1688699627-2519-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGGzQB0xBvE+luce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKxCPiZMTu0YFLnSnDUu8deZXWlhZodYLAxIw
	vUus7IWJFJ+ldwSutywXChNXix1cOVMcvApxY54+dyvjnte+37W4v45cYnAHH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103698

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aenum_3.1.14.bb => python3-aenum_3.1.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.14.bb => python3-aenum_3.1.15.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.14.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.14.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
index 22b3c52f2f..f9fdb6aeb6 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.14.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "7c4b04b5c9621533d6311e6ca23ea2ee213c7a992ed0be79a2b944cdaf2a45ec"
+SRC_URI[sha256sum] = "8cbd76cd18c4f870ff39b24284d3ea028fbe8731a58df3aa581e434c575b9559"
 
 inherit pypi setuptools3
 
-- 
2.34.1


