Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3C1EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.4895.1688699654076689617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103103867"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103103867"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C6AB1C53D2
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:14 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EE27ED9A04
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 201ED87E03;
	Fri,  7 Jul 2023 12:14:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.5.5 -> 4.6.0
Date: Fri,  7 Jul 2023 11:13:44 +0800
Message-Id: <1688699627-2519-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--3.788700-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7TFu9dqRsNfODlq
	WSxu1gNP6tJOVmmMtwe9qNtfFXbMmNFMBnmJRh/JqdwbW9Wx9tCIrmqDVyayv6vWBS71/UX/9S1
	IIZo1c6uT1ANr5YOsGXgQGUGdLuSrZeKsoi0ardLwlvzzUUaf2Tqu3dM+YhFRLaKzyzWK8GQXo4
	6ROIadeyuDMkZY2k0gioKJyXThAFo9d1nHWxkekD9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlurwUHN2woBLBs00ZABHv2qHgcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqxydET58jp62St7txiRSOOUTkaL1XQVaYP7tKfqyvzX79UYAQQKyYJkNwTcL
	DxdGtLA/6K28rDAoFqK0q4jlsmNuMtDSDWNDhsH1xqnqa9wMpS7+RMq/2CK6rA4c7UV2fQpvi2P
	QO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103703

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Experimental Features
-----------------------
 Support JSON.MERGE command (#2761)
 Support JSON.MSET command (#2766)

New Features
-------------
 Extract abstract async connection class (#2734)
 Add support for WAITAOF (#2760)
 Introduce OutOfMemoryError exception for Redis write command rejections due to OOM errors (#2778)
 Add WITHSCORE argument to ZRANK (#2758)
 Add support for sharded pubsub in sync client (#2762)

Bug Fixes
-----------
 Fix dead weakref in sentinel connection causing ReferenceError (#2767) (#2771)
 Fix Key Error in parse_xinfo_stream (#2788)
 Remove unnecessary __del__ handlers (#2755)
 Added support for missing argument to SentinelManagedConnection.read_response() (#2756)
 Fixed resp3 dict parse response (#2757)

Maintenance
-------------
 Fix type hint for retry_on_error in async cluster (#2804)
 Clean up documents and fix some redirects (#2801)
 Add unit tests for the connect method of all Redis connection classes (#2631)
 Docstring formatting fix (#2796)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.5.5.bb => python3-redis_4.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.5.5.bb => python3-redis_4.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb b/meta-python/recipes-devtools/python/python3-redis_4.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.6.0.bb
index eb407a2a15..47eb7c2096 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.6.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880"
+SRC_URI[sha256sum] = "585dc516b9eb042a619ef0a39c3d7d55fe81bdb4df09a52c9cdde0d07bf1aa7d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


