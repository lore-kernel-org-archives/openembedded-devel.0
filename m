Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101D8D6ACC4
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37580.1766048655433517852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rmFwoSu5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048656; x=1797584656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5AoOWLhCgUbGaLhnfwV4ZcNGntJXzzFDV+3k423JuQ=;
  b=rmFwoSu5RSrmrj2Yl/X6OzMF9qG9M4Ji281UZIBxUojaZS7Vj9iM1O4a
   H7WtgeddELeXfwaTC7MRXA2A600jwCtRwzwTKQ9MUF1JV9FpG02vyTSx4
   +rCkQ2v38c0STxb8BvtxplMWjWENJvWB+o1dvryUTQwQMef85xARGEkAS
   EeY/H36D1AgSQjY+zX4wNDFNYRs+IkgEQXxMdV7nbpAyzlDRu8kMHiSKj
   Vb4vHS2RVfIrsllzxcu9dI4S12SXPzvtGhE28DiABbfZUvcHPqGB35D/f
   sbK2v/9VEo4AFKe1z0PdnT2HIpSccQy7jhOgsv1nDrx8+Q/wSf5rS8mqD
   g==;
X-CSE-ConnectionGUID: 6ZIwLvU7SHa7W2ace74brQ==
X-CSE-MsgGUID: sbVkrhADR7C0Vjwktp6ucg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223081531"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223081531"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:14 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DC7381000378
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:13 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 93AF4C0040D
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 274FA101E51F;
	Thu, 18 Dec 2025 09:04:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/20] python3-fastapi: upgrade 0.124.0 -> 0.124.4
Date: Thu, 18 Dec 2025 17:03:38 +0800
Message-ID: <20251218090346.735-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122746

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.124.0.bb => python3-fastapi_0.124.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.124.0.bb => python3-fastapi_0.124.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.124.0.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.124.0.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
index af04dc0eba..bfcdaa41ab 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.124.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "260cd178ad75e6d259991f2fd9b0fee924b224850079df576a3ba604ce58f4e6"
+SRC_URI[sha256sum] = "0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6343763"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


