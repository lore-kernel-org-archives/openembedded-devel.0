Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98342CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12605.1762847742201354430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l6JZ34r7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847747; x=1794383747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jcNNvER81vHoVM5035Bc4PokJFoM99QXQZm40TYy41M=;
  b=l6JZ34r7tAlaRM8CNzs0Jc4BcoXiFzpc1s4jYEqAtA7R2oAQ7VDO7r9k
   JedK91+edZ1dpfqbFsmHlUKqOacIkh+7rbcPXtbLAOmsOWBF/B5Nk8uyD
   Zar8Ixg6NmCRohKXrsJOsVBjefb4rTVZrAT98JVxBeaa+d5ZvdscePEG7
   2cFQiB2wSdwiD9M8Q43pD6T4JH/P/12Gp+jn6JXiUR7Z86shdsoTjVfbw
   aWpxAwAQR+djqgUuERKUQDksRuVob/0vrjR5WdStf0HFG0fLRV9wME9f7
   s/HviESlLKNqswy4m6TEPyv9FObDxIdMcZfYdiIdmGQXI1/1llBBtdK+1
   A==;
X-CSE-ConnectionGUID: ziy7kxbAR8qhEUGbTNMdag==
X-CSE-MsgGUID: 7mTlKtm1QmKTaN6Au01ODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218201537"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218201537"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4AB4D8203D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0564F1801FDB
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7BD3A1800D79;
	Tue, 11 Nov 2025 07:55:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/23] python3-coverage: upgrade 7.11.0 -> 7.11.3
Date: Tue, 11 Nov 2025 15:55:06 +0800
Message-ID: <20251111075517.1650-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121491

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.11.0.bb => python3-coverage_7.11.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.11.0.bb => python3-coverage_7.11.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.11.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.11.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.11.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.11.3.bb
index 6b188c727f..25f606c8f7 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.11.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "167bd504ac1ca2af7ff3b81d245dfea0292c5032ebef9d66cc08a7d28c1b8050"
+SRC_URI[sha256sum] = "0f59387f5e6edbbffec2281affb71cdc85e0776c1745150a3ab9b6c1d016106b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


