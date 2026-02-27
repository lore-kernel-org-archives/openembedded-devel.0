Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9E8FD533B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:13:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92726.1772187227129707086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V4lbNrli;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187227; x=1803723227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84MS/a2WXmFRRknvAquZRzpUS++RzATl2QtDwryCEAI=;
  b=V4lbNrliM2QJVafVJypbc+8B2H2HPc1SXx8mAxBRCEjStb01oe9oz5GL
   dZXqjwySm079PXVVkq2uBd3KkOzG+XRBJU1MJ71dWTCohoUV9OJDOnV5/
   4kdCmJ7aJBtYd8cOlD3arxfBwyF8CEMMrodgPvLugVsQmLS4qyByhYizn
   i7eEg4r8tXmuB1Z/3ZE0AIdQqQMXr3ogOUnki+zMMZu8PaWq2Ua8rQwps
   73sZWlbB8UDC+3FZ1Ed9pzTqg6KTuGbcwlj8Ss48a5Ymy5oHNk7n8S5aI
   X99Xo7GtugBk7su8V7zfh8KI7CY570Yrn3A1Ym3+IEm3PNN4vnCjNe4YE
   w==;
X-CSE-ConnectionGUID: BnyqZeKdR122gK6MfTjK9A==
X-CSE-MsgGUID: UHx98e7eRSKUn0OFNBhZtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219940670"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219940670"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id A578EC00354
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5B9C4C0022B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7706C180059F;
	Fri, 27 Feb 2026 10:13:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/52] python3-dateparser: upgrade 1.2.2 -> 1.3.0
Date: Fri, 27 Feb 2026 18:12:40 +0800
Message-ID: <20260227101327.1432-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124705

From: Wang Mingyu <wangmy@fujitsu.com>

New features:
--------------
- search_dates() can now detect time spans from expressions like "past
- month", "last week", etc. For details, see the "Time Span Detection" section
- and the RETURN_TIME_SPAN, DEFAULT_START_OF_WEEK and
- DEFAULT_DAYS_IN_MONTH settings in the documentation.

Fixes:
--------
- Assume the current year if not specified
- Support expressions like "yesterday +1h"
- English: Support most 2-letter day-of-the-week names
- English: Support "in N weeks' time"
- Finnish: Support dates with "klo"
- Russian: Support compound ordinals

Cleanups and internal improvements:
-------------------------------------
- Fixed year expectation issues in tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.2.2.bb => python3-dateparser_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.2.2.bb => python3-dateparser_1.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.2.2.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.3.0.bb
index b66900aebb..012c9654a4 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "986316f17cb8cdc23ea8ce563027c5ef12fc725b6fb1d137c14ca08777c5ecf7"
+SRC_URI[sha256sum] = "5bccf5d1ec6785e5be71cc7ec80f014575a09b4923e762f850e57443bddbf1a5"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.43.0


