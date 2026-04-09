Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECBFEA3C25
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:32:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128809.1775730756776143494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fnub0QRI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730756; x=1807266756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yd0EEqh+23+QwhjNMgRIe0gH/WmsS4/h0Rvp4x83S0o=;
  b=fnub0QRInjFmK/qhVEAplSPYSxIX8Mj8ptK03tizVEq6Bt6a0wjl9fML
   34HIstAQQNzL5R7xcUIuhTmb5Vr9yMRvLaRL9AMEw4jG6BQiJ6kHzdjUz
   aFhhqJKvLT8tELms8DVTvjekXsZBEtFEloXwPqEM/1vXNoux1iJUKvcj8
   213Er6PzYGL2aWYFI6SOiecGgP5gpTLVUkxZ68VNM5pAwbgJrEgo0hv+s
   PobLELvL573A1D0nIBBvw14zs2aPRqCDaV2SEMGdoifYT1kJpM+ZF0xaP
   xK4e8HVMnU8MhyzWigIIcoTATkGZLXWA5lpVy5A8ygGoNOSaodjhAOSJJ
   Q==;
X-CSE-ConnectionGUID: dj8Zp3VMQlOGR1wond9wJA==
X-CSE-MsgGUID: KwR0wgqmTDyl5NhcnfdVTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="224321963"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="224321963"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D344A1C06200
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:34 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8AE7B8D29C8
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1EE3B404950;
	Thu,  9 Apr 2026 10:32:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/37] catch2: upgrade 3.13.0 -> 3.14.0
Date: Thu,  9 Apr 2026 18:31:48 +0800
Message-ID: <20260409103223.1574-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126151

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes
======
- Added missing <cstdint> includes.
- Fixed suppression of empty variadic macro arguments warning on Clang <19.
- Fixed catch_discover_tests failing during PRE_TEST discovery if a target does
  not have discoverable tests.
- Fixed build of the main library failing with CATCH_CONFIG_PREFIX_ALL defined.
- JUnit reporter outputs single failed (errored/skipped) assertion per test
  case.

Improvements =============
- The default implementation of --list-tags and --list-listeners has a quiet
  variant.
- Suppressed the new Clang warning about __COUNTER__ usage.
- Line-wrapping counts utf-8 codepoints instead of bytes.
- Combining character sequences are still miscounted, but Catch2 does not aim
  to fully support Unicode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/catch2/{catch2_3.13.0.bb => catch2_3.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.13.0.bb => catch2_3.14.0.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.13.0.bb b/meta-oe/recipes-test/catch2/catch2_3.14.0.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.13.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.14.0.bb
index c5d85ba302..2aba52e7ae 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.13.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.14.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
-SRCREV = "29c9844f688acb27c87338c39cd186ebfe41aa19"
+SRCREV = "b670de4fe12ac7c5e858b7de3a14fb4bd18c760e"
 
 
 inherit cmake python3native
-- 
2.43.0


