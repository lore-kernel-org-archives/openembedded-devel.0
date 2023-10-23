Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EDDCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:56:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.116556.1698051362030770726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137175356"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137175356"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:56:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8ADBDCA1EB
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:55:57 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C30FCD5D0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:55:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 968ED2FC6FD2;
	Mon, 23 Oct 2023 17:55:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycares: upgrade 4.3.0 -> 4.4.0
Date: Mon, 23 Oct 2023 16:55:18 +0800
Message-Id: <1698051318-26151-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-2.647700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr/1vXbkGjWeV7c1y+5T8A/3w6
	H06bMgiv8YraZs+DJptQfw/ZZiLyte1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtr5RtKooMtxMlaBQCa/ZInYzp719i84vFfsCR9y5EoRTJPWzcNsDS+ndL9
	BY1AKWyEPe4uiDsr6iGMve+g8SF+dh4itiZ3VaCHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105679

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bump GitHub Actions versions and fix warnings in the process
Bump versions of used GitHub Actions
Add support for 3.12, drop EOL 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.3.0.bb => python3-pycares_4.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.3.0.bb => python3-pycares_4.4.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.3.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pycares_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
index f5223913cf..5e5f0c92f5 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "c542696f6dac978e9d99192384745a65f80a7d9450501151e4a7563e06010d45"
+SRC_URI[sha256sum] = "f47579d508f2f56eddd16ce72045782ad3b1b3b678098699e2b6a1b30733e1c2"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.34.1


