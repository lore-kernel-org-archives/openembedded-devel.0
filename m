Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3587C27C77
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.9827.1717664817027923923
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e37P3YfN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664816; x=1749200816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zkLh9n0+z3e5qbds5g5+9BXS9ZuG2pXzTdZ0axt3j8E=;
  b=e37P3YfN6cwyoK9mwMjpO6AQkaTon5qCZKbZ64A3QbtAk2FJDdHyfkLj
   9N1oxj2nT995Mzb18Ewn1bVa/Bcium9mN9WW4M4UclLw17TH9QgRjVH8v
   VVZIEF2OfYXneCTeEV9FiyW1kQOG7RdkoZoFuWHdzzK8oMltJDhhmzHac
   fqH05qwOXw6U8df80yb7yUVVR+OYHjXscuuhqQbtaFIs/YasaoV9aQxb3
   7E2DnDN3MdFSFndKjbiLynR2bXVpPFkgPQLvxiJYXVLQVxPqldqyB9iTm
   E3qJdKC+pFiiVVFpaT0WcWXieXNHGoTsrINZ9SPRHQtBCk03KJmrN3tKW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141040284"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141040284"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D98EFC2AA1
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25365D3F18
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AB69E20081324
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 590221A000A;
	Thu,  6 Jun 2024 17:06:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/36] highway: upgrade 1.1.0 -> 1.2.0
Date: Thu,  6 Jun 2024 17:06:10 +0800
Message-Id: <1717664795-13902-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--3.307000-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzhF6JfM6PB/+Bx
	X/5O7b6jO3wTUW8jWH5mYaQ4XR/HzHzh4vqEo4GEEhGH3CRdKUUjbj0krjlpbQvrbFcH4G2rXH3
	W+57nGfnrME+4JvD76WINl7u96s5fWjws5pdLmBY5ipSXnwRcMzY3ghyB7vFRlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDSFcmxL76KeOguwtqyXlE6FN8xuK8l7+FaPFj
	JEFr+olKE0Je8DR/D7kwjHXXC/4I8ZW5ai5WKlyxRWY+BouwrHRra6H6IFjlgOQIOJbtPM4e24W
	s8tpg4YKMXg2WUlGW6ICSg39vcN4UK2J8dRf9PB1nDFxneurqXV34kSupT/1/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add InterleaveEven/InterleaveOdd, BitShuffle, GatherIndexNOr
-Add IsNegative, IfNegativeThenElseZero, IfNegativeThenZeroElse
-Add NEON_BF16, HWY_VERSION_GE/LT, HWY_EXPORT_T/HWY_DYNAMIC_DISPATCH_T
-Add PromoteInRangeTo/ConvertInRangeTo/DemoteInRangeTo
-Add Rol/Ror, RotateLeft/RotateLeftSame/RotateRightSame
-Add SatWidenMulPairwiseAccumulate, SatWidenMulAccumFixedPoint
-Add stats.h, bit_set.h, IsEitherNaN
-Add UI8/UI32/UI64 MulHigh, I64 MulEven/MulOdd/Mul128
-Add WidenMulAccumulate, MulEvenAdd, MulOddAdd
-contrib/bit_pack: support 32/64-bit lanes
-contrib/math: Add Exp2, Hypot
-contrib/matvec: Add MatVecAdd
-contrib/sort: Add VQ/HeapSelect, partial sort
-contrib/topology: add affinity, detect topology/cache size/CPU name
-Enable runtime dispatch for NEON/RVV, bazel modules, abort handler
-Remove DASSERT for negative Gather indices
-Support opting out of GUnit dependency
-Use SPR/ZEN4 bf16 dot product
-Known GCC 13 RVV issue: parts of sort_test and bit_pack_test disabled
-Known Clang RVV/QEMU issue: incorrect rounding mode in upper/lower halves

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../highway/{highway_1.1.0.bb => highway_1.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/highway/{highway_1.1.0.bb => highway_1.2.0.bb} (91%)

diff --git a/meta-oe/recipes-extended/highway/highway_1.1.0.bb b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
similarity index 91%
rename from meta-oe/recipes-extended/highway/highway_1.1.0.bb
rename to meta-oe/recipes-extended/highway/highway_1.2.0.bb
index 11d9e7cdd..5d7494124 100644
--- a/meta-oe/recipes-extended/highway/highway_1.1.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master"
 
-SRCREV = "58b52a717469e62b2d9b8eaa2f5dddb44d4a4cbf"
+SRCREV = "457c891775a7397bdb0376bb1031e6e027af1c48"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
-- 
2.34.1


