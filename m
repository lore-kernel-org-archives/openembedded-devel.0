Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081CBC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3374.1787132233823248491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kr+3OeLM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132234; x=1818668234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uVTzG6t3lVMfefymRuFQyH43L/3oeDmdRf4pclTf8G0=;
  b=Kr+3OeLMZ83mIX9OBMKVT98DwEhQhZ9wT/iXrdL7PZGwyEXX2ws34egm
   acVHRbbJSjC8aS4W1J742sG7jdmYjxkvJkCqfWAbb3zBspyc8p35XpGsT
   1Ri7v/DgTe9lQZFKBsbb9WfSPoH4l2vnVqyRGhgQpVJXPqrv0fwS3kYMm
   gY7Qn1T5LMhe34c8UWScgg7cGpZFHrOywZkvr1RkkrwogDbW2FkDAUEFx
   brLscC+1CcgeHcrlDdmHZ2/HAYqOIEP2pu9rU/zlQcAQrjMD3ysv5lVFZ
   t+bvEnwzM+JNWVIgN5PZMWXi5eXTBgUnIwPFAhISYrYYKhVZdRMWyK0Ym
   w==;
X-CSE-ConnectionGUID: P2pP1820SH6i8+6yrGj5Mg==
X-CSE-MsgGUID: irrJtKOBQu6h7M/KpBGMqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330964"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330964"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 448561C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:12 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 00E0283CC96
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8DA451801C11;
	Wed, 19 Aug 2026 09:37:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 63/70] python3-typing-inspection: upgrade 0.4.2 -> 0.4.4
Date: Wed, 19 Aug 2026 17:35:07 +0800
Message-ID: <20260819093514.1101-63-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129333

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add typing_objects.DEPRECATED_ALIASES_ID
- Drop support for Python 3.9
- Avoid module getattr() calls in typing_objects functions
- Add Python 3.15 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...g-inspection_0.4.2.bb => python3-typing-inspection_0.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typing-inspection_0.4.2.bb => python3-typing-inspection_0.4.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.2.bb b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typing-inspection_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
index cef4156de8..7694732817 100644
--- a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dfe2d84c58973d6a532c4e7638dbb3d8"
 DEPENDS = "python3-hatchling-native"
 
 inherit pypi python_hatchling ptest-python-pytest
-SRC_URI[sha256sum] = "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
+SRC_URI[sha256sum] = "547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47"
 
 RDEPENDS:${PN}-ptest += "python3-typing-extensions"
 
-- 
2.43.0


