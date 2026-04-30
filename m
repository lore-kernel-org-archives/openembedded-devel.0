Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A02CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17433.1777546184395626817
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QjyTB5g3;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546183; x=1809082183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fReIiPcox7QW6hMCo7S9TYNzON5o4FKWj7a3yyIzKVI=;
  b=QjyTB5g34iUbw4DS+WLgIU8lIh1Cnjsc2VDgCLsXQ6NzLxvWx+FOTF9y
   3vtN9KF85D3o8IHMiExC++b0lm024+qAzOAAxKuOYhYXKrIucQ3IlrhfV
   6sQANjzYz7DEU+V6RitCA5UgvyRQdli8b1yty9f8FR14mSZV1ck8WK6VF
   MBj1K6+9lSkI1bQqZTJLHLBFMmhaRFn388LVZAziBQ9CZYPu1dERcIsrY
   50DBv+vcs5G8l8c30YcRMvaFLFgdQDK4mbSdCmuYRJMhOQxwQR7Oz/Zqm
   qbva3W+JT+bS0efgCrtvrwobpfZyyQQQNMT2R022ouMRxRqtkEYE0PRT3
   w==;
X-CSE-ConnectionGUID: Fz1CKB/VRUCULuBc3BBOKg==
X-CSE-MsgGUID: 5Ad1iu5+RwWTyNlvvHDSfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636917"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636917"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DB9581002B86
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:42 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 970D8C00219
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3D0B81801130;
	Thu, 30 Apr 2026 10:49:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/64] highway: upgrade 1.3.0 -> 1.4.0
Date: Thu, 30 Apr 2026 18:48:28 +0800
Message-ID: <20260430104924.1106-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126678

From: Wang Mingyu <wangmy@fujitsu.com>

Add:
=======
- Fast* math functions, sum_array example
- HWY_ARCH_MAX_BYTES, HWY_MIN_BYTES, HWY_NATIVE_MASK, HWY_REGISTERS
- HWY_EXPORT_AND_TEST_BEST_P
- InterleaveLower/UpperBlocks, Lookup8, XorAndNot
- MinMax algo, AtomicBitSet
- RVV and LSX/LASX runtime dispatch, FreeBSD futex

Improvements:
==============
- MulByPow2, PopulationCount, SumsOfAdjQuadAbsDiff
- ReorderWidenMulAccumulate, SumOfMulQuadAccumulate
- Re-enable SVE, add i8mm for SVE/NEON_BF16

Fixes:
========
- EVEX512 compiler change workaround, Timer::start() result truncation
- BF16 dot on SVE, doc formatting, StringTable race, warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../highway/{highway_1.3.0.bb => highway_1.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/highway/{highway_1.3.0.bb => highway_1.4.0.bb} (93%)

diff --git a/meta-oe/recipes-extended/highway/highway_1.3.0.bb b/meta-oe/recipes-extended/highway/highway_1.4.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/highway/highway_1.3.0.bb
rename to meta-oe/recipes-extended/highway/highway_1.4.0.bb
index ddd684bb45..a85620710d 100644
--- a/meta-oe/recipes-extended/highway/highway_1.3.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.4.0.bb
@@ -9,7 +9,7 @@ inherit cmake
 SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master \
            file://0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch"
 
-SRCREV = "c34a36fb145de0a922a6e719b217033e1ff2eece"
+SRCREV = "2607d3b5b0113992fe84d3848859eae13b3b52c1"
 PV .= "+git"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
-- 
2.43.0


