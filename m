Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937B2C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3358.1787132194280790816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mypUj7/f;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132198; x=1818668198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJr513Z808m/sGzHaH0O9XCfISzYcsKDJQOC610BdWs=;
  b=mypUj7/fB9rjGT7jeoFDZg7DV3iK/GCfD/MCJQXYE5KSkPmsJariqjoX
   tiGdE7eLFk3+WGkGRnopqgXNnjR3W6lfc9LpHLI3wIbMF7DI/arTyHT2m
   AEmS4E6QosrpEWMh3C+2W0smQokjHFqVa3qzC44TgymJ8T3FhOBBrOY/3
   XMQtEU7tl9gusWIxyskkveRvxbzGEi0u76mD0vunliBtYGjfOgOP5AqHh
   4wuwpigIGQxFN+iLw1gjUBx5TQC6Yk/CTCr2bTb7RfXbbeevxOOipjxik
   n0ujtsnsmp7erGCyuSONSyHCQh8xaYymbfZ9rbL56VM7uOTeFr4LTjHuK
   w==;
X-CSE-ConnectionGUID: TPXJkVo8Sce68/D1eru7tg==
X-CSE-MsgGUID: UeJho+MiR5GWMOPtWC593g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="250051527"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="250051527"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0C42C10000C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B53171800BC2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AC9821801C0F;
	Wed, 19 Aug 2026 09:36:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/70] python3-nltk: upgrade 3.10.2 -> 3.10.3
Date: Wed, 19 Aug 2026 17:34:48 +0800
Message-ID: <20260819093514.1101-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129314

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- docs: wrap Chat-80 HOWTO output
- Sandbox Stanford JAR execution to nltk_data directories
- Harden path-traversal / file-I/O sandbox: close write-side symlink TOCTOU +
  shared-temp squat, lock the cluster with a living audit (CWE-22/59/377)
- Extend algorithmic-complexity DoS hardening: repo-wide sweep + two-string
  distances (CWE-407/CWE-400)
- Bound unbounded-work DoS in parsers and grammar transforms (CWE-407/674/835)
- fix(security): sandbox MaltParser's Java execution (CVE-2026-12252,
  CVE-2026-12841)
- fix(security): trust the system temp dir only when it is private
  (CWE-377/CWE-378)
- fix(security): validate corpus-reader roots against the data sandbox (CWE-73)
- fix(security): validate per-call java() options and replace the -XX:/-D
  allowlist with a minimal one (CWE-88)
- Additional security hardening (CWE-407, CWE-426, CWE-427, CWE-502, CWE-59,
  CWE-776, CWE-918)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nltk_3.10.2.bb => python3-nltk_3.10.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.10.2.bb => python3-nltk_3.10.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.2.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.2.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.3.bb
index 3e209a8d73..6140afdf13 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.2.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.3.bb
@@ -24,4 +24,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "fcfd80fb77931868cea8357573c79838b8abc609942ef9914d1c9f6070d4645c"
+SRC_URI[sha256sum] = "bb9327a461c3811c2fa4900e03840401f2126adfb30c0072827c433bd2444ea4"
-- 
2.43.0


