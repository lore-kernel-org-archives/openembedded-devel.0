Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC921112269
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7224.1775096139922212124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OpzwNYpu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096140; x=1806632140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iwjYtsvzrCbKjpmO/iK9XTeWurmRlxAsps1pFj1K/zQ=;
  b=OpzwNYpuNC3DCm9CLvcDc0F8cKv78EmRtDI5wT7WzM5FEr5BbxlmI/x1
   LgaC85nZGX7JIxkiNCWJgm/C5XiCSRQMRKiGzAfICAJY3lh67oO0xwKQ4
   hSVpXqPy60G2UHRjpVVf11hKtbYVrHmJievjLl9wL/Yiz+Y/VsOtslkxu
   ynYvp2wZMIKrgWXhfgp1cfyliiI99ZA46c+a9ie1iFkw0HQH6daMdOKWp
   wZ4jnt5cKCOdjZNuP7hoKlGPrDKVqenxrUefS8YAWAPy41Z9bkeMGGx51
   D696kEx2EJRHD6GyC/FKolSXjghopnsr+jiPReYYCCUF1H1UoD7DubMXj
   g==;
X-CSE-ConnectionGUID: p0C5C97sTlakm09/j6L2MA==
X-CSE-MsgGUID: xW8wWROsSwCego9dVbutfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235432974"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235432974"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1D8691C00194
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:38 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C0B9518915CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4747F100249C;
	Thu,  2 Apr 2026 02:15:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/39] python3-dateparser: upgrade 1.3.0 -> 1.4.0
Date: Thu,  2 Apr 2026 10:13:35 +0800
Message-ID: <20260402021355.1324-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125935

From: Wang Mingyu <wangmy@fujitsu.com>

Security fixes:
=================
- Remove import-time loading of timezone offset data from pickle to prevent
  unsafe deserialization from packaged data
- Replace eval() use when parsing no_word_spacing with strict boolean
  parsing to prevent code execution from locale metadata (#1056)

New features:
=============
- Add support for expressions like "N {interval} from now" in English (#1271)
- Add support for the en-US locale (#1222)

Fixes:
========
- Honor REQUIRE_PARTS for ambiguous month-number inputs by retrying with a
  year-biased DATE_ORDER (#1298)
- Fix parsing word-number relative phrases such as "two days later" (#1316)
- Allow md5hash to work in FIPS environments (#1267)

Improvements:
=============
- Add Bosnian Cyrillic (ijekavica) date translations (#1293)
- Add a new browser-based demo to the project documentation (#1306)
- Update installation documentation to replace setup.py install guidance
- Add a project security policy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.3.0.bb => python3-dateparser_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.3.0.bb => python3-dateparser_1.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.3.0.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.4.0.bb
index 012c9654a4..27f9da83b6 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "5bccf5d1ec6785e5be71cc7ec80f014575a09b4923e762f850e57443bddbf1a5"
+SRC_URI[sha256sum] = "97a21840d5ecdf7630c584f673338a5afac5dfe84f647baf4d7e8df98f9354a4"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.43.0


