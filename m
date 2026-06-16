Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664ABCD8CA8
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:54:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148636.1781592851760176279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nE8JbjzL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781592852; x=1813128852;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XKJNEjxVQ40nM4wVxkvcmByfcEbztk6D3Q0bdeUjAvc=;
  b=nE8JbjzLQuStyPltdJwCe6VWykBuwSwBicrHK5wd0PYbi+NI5YX7HsMv
   0TKlbQNAiR8FTuP6GNngj8vr9OZNNHQH69mrTarGti1yQVdSM9up359ng
   Ntzd3MfQbWChcJi9f7fdkIyIHZx3oQ1/wtnrtj0XwG2t4pY/lCUpqKFKG
   iW37sG25zZ4BtQB1cMhLtaJacQTccRSgMfU00ZyQ9s1VrLm1SbpdcR08D
   O6il87d4o1bP6ue2n9J+t5RvyeiDNAmxouQobPop5zZs4tE4Z9mcJWeSh
   573QrXnFP4d3KB2sycRMBVW9AHXCKuRUsyZuh/4Sc4k0dobhggF02OVvK
   A==;
X-CSE-ConnectionGUID: biNaMuL1RaedwLbIRgOCvw==
X-CSE-MsgGUID: Rv7s3IWNSw+2txnnn4mIMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="242394363"
X-IronPort-AV: E=Sophos;i="6.24,207,1774278000"; 
   d="scan'208";a="242394363"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:54:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E156D1000359
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 06:54:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 933321892C59
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 06:54:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9997914001FF;
	Tue, 16 Jun 2026 06:54:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] crash: build bundled GDB with GNU C++17
Date: Tue, 16 Jun 2026 14:54:05 +0800
Message-ID: <20260616065405.440-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 06:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127605

From: Wang Mingyu <wangmy@fujitsu.com>

The GDB 10.2 sources still rely on std::allocator::construct, which was
removed in C++20.

This causes the build to fail with errors such as:

default-init-alloc.h:52:12: error:
'construct' has not been declared in 'class std::allocator<...>'

Explicitly build the C++ sources with GNU C++17 to retain compatibility
with the bundled GDB sources.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-kernel/crash/crash.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 3c9a99ae4a..cd40ffb9e0 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -44,6 +44,7 @@ COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:mipsarchn32 = "null"
 
+CXXFLAGS += "-std=gnu++17"
 
 EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_TARGET="${TARGET_SYS}" \
-- 
2.43.0


