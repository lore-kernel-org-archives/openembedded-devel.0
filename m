Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D897EA3C46
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128843.1775730866366408956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RTxNrsUH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730867; x=1807266867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=768XvCTJGU5D2lWfvgZFTQyN8GL1LBHdYuyP0OK2KUQ=;
  b=RTxNrsUH/GLj6pBuGBiCE8yMFWBMBORBeIi//pgHPw2jq4ylScHftkQi
   SkGC/eOKIv5hyDoe5/D3jFY9RqZFPIKHUf2EZW2T38COyUC4UQBz2h1/X
   JsLt9rEBpD1xLNaOQytMrzaytdCMzARwDUPaqb0dtbcEvC3W9AitzNJEe
   dFDr0dv6x40QzP6Zcx+fCeWdokHVyk0FmcoHL1VYuKR28Q4rJ470JCczX
   4CZa5skBx2M/yw7NgWsoxPIEGDCEDPCaXeMyV5tWumjZ6PlbzfAuzTlDY
   gqfpWMbbAC0e+r74KicDYHOFZnmyaS9StqjaN1NdARfovUXGRjIZNkFiy
   A==;
X-CSE-ConnectionGUID: y7LBR5raQQKIBjBF65JhyQ==
X-CSE-MsgGUID: lFFNP05OQhiSfa55onKKVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="240796168"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="240796168"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:25 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F033482070F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:24 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A92188D29C2
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 3A210404336;
	Thu,  9 Apr 2026 10:34:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/37] python3-types-psutil: upgrade 7.2.2.20260130 -> 7.2.2.20260408
Date: Thu,  9 Apr 2026 18:32:17 +0800
Message-ID: <20260409103223.1574-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126180

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use dashes instead of underscores for METADATA.toml field names
- Update most test/lint dependencies
- Update mypy to 1.20.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.2.2.20260130.bb => python3-types-psutil_7.2.2.20260408.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.2.20260130.bb => python3-types-psutil_7.2.2.20260408.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260130.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260408.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260130.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260408.bb
index 78e96b3122..88fff6c83d 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260130.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260408.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "15b0ab69c52841cf9ce3c383e8480c620a4d13d6a8e22b16978ebddac5590950"
+SRC_URI[sha256sum] = "e8053450685965b8cd52afb62569073d00ea9967ae78bb45dff5f606847f97f2"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


