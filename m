Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E012DD68BF7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37571.1766048639526766795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jdSr+QG4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048639; x=1797584639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=swWcP3WeXk/0PoicvLag2wZOv1O4xpICycaqQAnEem4=;
  b=jdSr+QG4i8k34rV+BWzF/Da80bumarbxuZZ6hm8X6NlbNNmJhGA0ToyG
   YwDV9m1pbxQTB6qDAP9VjgYJ8xMmycxkOv/dq4hMwK33XsnGTsP8eGcvp
   SibLRpNf0MPNB9j6vrhc2BM7zhELE0pbwg/AY61LI29opYb4wpm3ftXxv
   atVtoMghvJtEGt7fw1VNsgYZbMi1kwfSfxRDRQhU6najqjdEzhwWkSdtT
   w6+lQctLoeHDSyB0E3TXluAdYFEQYEZIi0WD6FvItjyC1QMn5iU8LiALD
   L/vQx1YUr5J4ivn9B7BW/BczaYErgMgRUiadotusuoEBHtN5m3eYt50Fb
   A==;
X-CSE-ConnectionGUID: cfLsgSMLSFqrULcTHkCJ3Q==
X-CSE-MsgGUID: S5ujAbtsTmqvu+b8x24a5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223059374"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223059374"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:03:57 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C30624071C3
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:03:57 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 744701804143
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:03:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 01454101A427;
	Thu, 18 Dec 2025 09:03:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/20] fluentbit: upgrade 4.2.0 -> 4.2.1
Date: Thu, 18 Dec 2025 17:03:28 +0800
Message-ID: <20251218090346.735-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122736

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_4.2.0.bb => fluentbit_4.2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.2.0.bb => fluentbit_4.2.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
index 2c9b874e50..4308cb3d89 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
@@ -17,9 +17,9 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "6bc014390c5485b96521c56b98369b44b9faa08b"
+SRCREV = "c06c12449f3d52a8688fb5ac8bac534c5fd1e6e0"
 SRC_URI = "\
-    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https \
+    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
-- 
2.43.0


