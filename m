Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAB1C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:01 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3267.1787132158702910781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DmF5kh0i;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132160; x=1818668160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RBrjAZNGnUB5Kh6JZvBkXH/U30kYRbpPmwu255LgJs4=;
  b=DmF5kh0iNjZ2VLxF0G2nZL2H3mqBphU3WGKaTyZ3s0VC8iJtKYbUfrcc
   DUltpHiZrO1dYIVo/jv4YaSjsRoqrOEOLzsBuhA+olsBNU8PIwRU8hXpa
   t/Tw1G2mA53lo/SwgPv8bygZdfZcNwB3ZBX3e1NOyIyjXYrFfW52uf60a
   Gk8PGUmwIUjUa1yKdntwGPgk9CLT9IQt6dgCS7acmc1HCCccixz6+DRPQ
   PIsIbJKOVLW3KclIx3NDICfzqoEwY82FjQUt6TQIPtViSuYO0kjkObfm7
   SPReGUdlx5gnY5evovx2KyT1xDzqkabVzROn+CHOux34vPbGVUgGkmCb8
   Q==;
X-CSE-ConnectionGUID: igB5gs1wRySkyiaTrezGKw==
X-CSE-MsgGUID: dfhIWugSTOOw/Wp+djmVUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882204"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882204"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BFE78406ECA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:58 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7001A18026D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5CA091801C28;
	Wed, 19 Aug 2026 09:35:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/70] python3-cmake: upgrade 4.4.0 -> 4.4.2
Date: Wed, 19 Aug 2026 17:34:26 +0800
Message-ID: <20260819093514.1101-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129292

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.4.0.bb => python3-cmake_4.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.4.0.bb => python3-cmake_4.4.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb b/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
index acea3e4fdb..5450c33c1d 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.4.2.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "933eb5977ecc5226e47d702d1c412b69f77ca00f59a4660c80b436cf7d5472de"
+SRC_URI[sha256sum] = "6af2e0585239627f85f49a8f90761ce4560c671daae1d5e8d2b5f059dc7d22de"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


