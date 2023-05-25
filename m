Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612B0C7EE33
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6204.1684997863447273621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117891546"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117891546"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D6BBC68E4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6369ECF7E1
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A02F02FC90BF;
	Thu, 25 May 2023 15:57:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asgiref: upgrade 3.6.0 -> 3.7.1
Date: Thu, 25 May 2023 14:57:21 +0800
Message-Id: <1684997851-2098-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10--9.146700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrC//1TMV5chMM4i3DScf0sSYi
	aX7LCuq+hAUakjByrAL9jBeR1aqoAZRSkbxKeJc4GqSG/c50XgP2/fdRbxY1gDYnGCpPrrgS3eO
	MudZ4HeHgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq7QK1
	xScp/0+GqYdTU5CpEaPbUcax9woQzlRxm3A2wKuhRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07fk39
	LXMSri6K11OvrqaIl6ghic9jJxeN6tOaY8jQB8mFzwEiGnV31g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102823

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* On Python 3.10 and below, the version of the "typing_extensions" package
  is now constrained to be at least version 4 (as we depend on functionality
  in that version and above)
* Contextvars are now required for the implementation of Local as Python 3.6
  is now no longer a supported version.
* sync_to_async and async_to_sync now pass-through
* Debug and Lifespan State extensions have resulted in a typing change for some
  request and response types. This change should be backwards-compatible.
* "asgiref" frames will now be hidden in Django tracebacks by default.
* Raw performance and garbage collection improvements in Local, SyncToAsync,
  and AsyncToSync.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.6.0.bb => python3-asgiref_3.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.6.0.bb => python3-asgiref_3.7.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.6.0.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.7.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.7.1.bb
index ac3353ce0..8eecd2d26 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.7.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 SRC_URI += "file://run-ptest \
 	    "
 
-SRC_URI[sha256sum] = "9567dfe7bd8d3c8c892227827c41cce860b368104c3431da67a0c5a65a949506"
+SRC_URI[sha256sum] = "8de379fcc383bcfe4507e229fc31209ea23d4831c850f74063b2c11639474dd2"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.34.1


