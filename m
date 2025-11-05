Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6CACCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2910.1762386258623898416
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LKIQs1F8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386258; x=1793922258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Jeq4u3yfTG/SNAMwYCtNGKNatnaNdjJXfdSTtxlbAE=;
  b=LKIQs1F8poWSilCWt6/0M1BNt+LZw9zn8mehIJCZG7fZGypKOxY4+onO
   weTExKarxXnxrBI5wPR8wGMx/HZQeVe1DlreVY8BiwQ13h54x4VN6UPS0
   ZWGEp14VP5qAGisVjttBMFryqxaS9PeKCL/fqxK2o3GiHy+TosiGf0RTn
   4phrQJychj8csHVjBcyL3i7cXeWquy7hMPAV4Y8T9sTBkukHbM7hXz8DQ
   V9+eAnB2DXr72oPWKkjX5EIqHw/L0s2k+Dv/tPSOO9WJxQiQceR43V9qs
   5HKuqazRf9nTw343lTkICXclJRlwMmS/kwmIhEnDMivz/R/4AoRCmFAOE
   w==;
X-CSE-ConnectionGUID: TGbhhHhkTyakATfuxGwawA==
X-CSE-MsgGUID: B2FyFO+2R4yVLsA/0pnEQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197066931"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197066931"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:16 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id DB0CE1C0338C
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:16 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9B4A5140062C
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2FAF0100310A;
	Wed,  5 Nov 2025 23:44:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/12] python3-alembic: upgrade 1.17.0 -> 1.17.1
Date: Thu,  6 Nov 2025 07:43:55 +0800
Message-ID: <20251105234402.423-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121344

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.17.0.bb => python3-alembic_1.17.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.17.0.bb => python3-alembic_1.17.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.17.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.17.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.17.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.17.1.bb
index 34273e6807..4c3602cdd2 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.17.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4652a0b3e19616b57d652b82bfa5e38bf5dbea0813eed971612671cb9e90c0fe"
+SRC_URI[sha256sum] = "8a289f6778262df31571d29cca4c7fbacd2f0f582ea0816f4c399b6da7528486"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


