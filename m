Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8133C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44797.1784715881984985199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J6txxd1W;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715885; x=1816251885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2U3IwqmaFRSKdhPnxNCB6cVkgYbcp9Iws+GQr5gNY1c=;
  b=J6txxd1WRzLtnlFLfUt2McMy4TC82xbsEKaviOh4K5CzKtOcOU+t9D0j
   l/HsLtK66ShMsXL6kytTEifoUl2Yb4i5Lg2DArzZrKrAZADso4+2cAo8/
   A05JKH7HEBqAb3s/+yo+DYEYqnhcrdt9yXZ5u54mDSwXzavvnd0pqoOYz
   EFgSqYCLkhcz11re0NVnDjtikRkx7Vf6x/W8TjIFGwFseqFVV2qHKiEzC
   nAB2tFi8KVSk8coJTUZ/eF8+asFZnjMQgvozcWbuxnFKTZgBf74yIza7D
   QbZdtAUC5AqWLs4PxpE5OKjX4D6CCeQZ/G3mkCNLmK3uZ+ACyX7YvZB2e
   g==;
X-CSE-ConnectionGUID: 4rVXHnwFRvCC2ztr4Wu+kg==
X-CSE-MsgGUID: 6q3O/ZQ6RNCsWd4fI3pJSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248149660"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248149660"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 589D91C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 00BBDC0387A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 09A934046B3;
	Wed, 22 Jul 2026 10:24:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/37] python3-soupsieve: upgrade 2.8.4 -> 2.9
Date: Wed, 22 Jul 2026 18:23:11 +0800
Message-ID: <20260722102320.1019-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128398

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- NEW: Drop Python 3.9 support.
- NEW: Lazy compile selector patterns to improve initial import speed.
- FIX: Correct :nth-child/:nth-of-type (and -last- variants) for An+B values whose sequence steps onto
- index 0 or onto the last child (e.g. :nth-child(2n-2), :nth-child(n-1), :nth-child(n+5)), which previously
- matched the wrong elements or nothing at all
- FIX: More efficient CSS ID matching
- FIX: Fix inefficient trimming of comments and white space

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.8.4.bb => python3-soupsieve_2.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.4.bb => python3-soupsieve_2.9.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.9.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.9.bb
index ec58d0985e..f1ad4c0cc5 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "e121fd02e975c695e4e9e8774a5ee35d74714b59307868dcc5319ad2d9e3328e"
+SRC_URI[sha256sum] = "acee8417325c5653e1377dc31eccad59eb82cbc65942afe6174c53b3aaad63fc"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


