Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F0FC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:32:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.115949.1698049928605255210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116019575"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116019575"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:32:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8223ADDC7A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:32:04 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CA47D5D55
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:32:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6523E2FC7F7E;
	Mon, 23 Oct 2023 17:32:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-blinker: upgrade 1.6.2 -> 1.6.3
Date: Mon, 23 Oct 2023 16:31:48 +0800
Message-Id: <1698049908-25093-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-1.455400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbystorPLNYrwZA6k
	gsLh6ViTTWoUDhivO2wNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iqbs
	+nJ/tFJHO6HlsecWxSv4snQvA+qD7eBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJQjQ4Wt/J8iaTKeNSn4gB82tHtVzk6Oen7BVhn+V2OfPKKG
	E8QtyZmb3cYthYhGgyqCRi4YeuFwGlpKSsKMY8CHTQTlHr7bqZLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105653

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix SyncWrapperType and AsyncWrapperType
-Fixed issue where signal.connected_to would not disconnect the receiver if
 an instance of BaseException was raised.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-blinker_1.6.2.bb => python3-blinker_1.6.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-blinker_1.6.2.bb => python3-blinker_1.6.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb b/meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb
index b0728e66cd..4f0dead703 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.6.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
-SRC_URI[sha256sum] = "4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213"
+SRC_URI[sha256sum] = "152090d27c1c5c722ee7e48504b02d76502811ce02e1523553b4cf8c8b3d3a8d"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


