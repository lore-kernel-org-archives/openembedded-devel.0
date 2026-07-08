Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B9FC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4908.1783503949514502927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ao1w/PXh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503950; x=1815039950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b28Uhbm4ZtIEmuC2iq4nWoVzZoXENQbyeKx8gqGhuKY=;
  b=ao1w/PXhl11V2zxIctFTGwKOtWtc/0fMEAAS6z4hfmgXsnnxSjFBBFn2
   DNxlrVgRwv6DNWgVy9KDfAb2nq5x+y1c1CLMf0Z05SHqXU5pcqlGHd8ZQ
   Ms0OQKExKmw9THhcO2JOHxwqfUdWg2a38P6s6TdP2ENZQJYDTfNcaUG5l
   +9b06dLMvpkzBVKPDqNFs7epl74uvZ4k+wokV3n3dpFkbXiCKUuaFf1cj
   k6SwA5587+FVh2EWGBEVwDTnfCzy0VgapTJbo6AMgc0vOGLcwumsKeBxh
   DIMuAkaT5Hk1CfNHY4lFxmp9sLgQs9RvmP9IM6O74XQLoRRpShrWqQAw8
   A==;
X-CSE-ConnectionGUID: l+xosun3QgqqsH8TA+Xr7g==
X-CSE-MsgGUID: RCUGk0JFQNaDYvng6knYSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246703370"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246703370"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CFD311002812
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:47 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8996F18578ED
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B9782180112F;
	Wed,  8 Jul 2026 09:45:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/37] python3-humanize: upgrade 4.15.0 -> 4.16.0
Date: Wed,  8 Jul 2026 17:44:31 +0800
Message-ID: <20260708094508.2060-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128092

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add Latvian language localization
- Add i18n support for naturalsize() and French translation
- Performance improvements: 1.07x - 8.4x
- Lazy imports for Python 3.15+
- Drop experimental Python 3.13 free-threaded
- Refactor: simplify scientific() and extract _SUPERSCRIPT_MAP constant
- Fix naturalsize() rounding rollover at unit boundaries
- Carry metric() to the next SI prefix when rounding reaches 1000
- Stop printing two minus signs in fractional for a negative mixed number
- Return an empty string from natural_list() for an empty list
- Handle tz-aware datetimes in naturalday() and naturaldate()
- Fix Arabic translation
- Fix Spanish large number translations to use long scale

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.15.0.bb => python3-humanize_4.16.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.15.0.bb => python3-humanize_4.16.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.15.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.16.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.15.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.16.0.bb
index 27a7cd022e..faed62db8d 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.16.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "1dd098483eb1c7ee8e32eb2e99ad1910baefa4b75c3aff3a82f4d78688993b10"
+SRC_URI[sha256sum] = "7dc2244a2f84a4bfb1d36c37bac80cd78e35cdc5c119206d87b018e1445f3a3f"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


