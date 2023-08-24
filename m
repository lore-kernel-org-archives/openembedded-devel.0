Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5235DC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:10:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6138.1692864632257173935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129137845"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129137845"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:10:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BFE9BDB3B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:10:26 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1ADF0D67A8
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:10:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44F068888F;
	Thu, 24 Aug 2023 17:10:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.6.0 -> 5.0.0
Date: Thu, 24 Aug 2023 16:10:05 +0800
Message-Id: <1692864605-2334-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.005
X-TMASE-Result: 10--1.225100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhHw6
	H06bMgivNJKmKhBRzhVVF51vxLbfWe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQCmL
	ENVLWzfdZc2oQgpVDy1FLvGMRv53ELxEFvMLiU987Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKbdB/CxWTRRu+rAZ8KTspSztgA75VSqqsAkftlqbwBwynK2V
	0ahsWjZ+KoYy1xMdTFkLzRxWk0K2zmgKuZb2QEid9sDWaJXnKraEWbzLRzpwluhLteo7VHIiB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104565

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
============
Fix timeout retrying on pipeline execution
Fix socket garbage collection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.6.0.bb => python3-redis_5.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.6.0.bb => python3-redis_5.0.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.6.0.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-redis_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.0.0.bb
index 47eb7c2096..f04e04bbe2 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python client for Redis key-value store"
 DESCRIPTION = "The Python interface to the Redis key-value store."
 HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
-SRC_URI[sha256sum] = "585dc516b9eb042a619ef0a39c3d7d55fe81bdb4df09a52c9cdde0d07bf1aa7d"
+SRC_URI[sha256sum] = "5cea6c0d335c9a7332a460ed8729ceabb4d0c489c7285b0a86dbbf8a017bd120"
 
 inherit pypi setuptools3
 
-- 
2.34.1


