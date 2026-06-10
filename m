Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DFFCD8CA8
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 01:45:12 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10912.1781055904269828758
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 18:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tTwnkdnp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781055904; x=1812591904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oX6eEetYUJEZcX/dw7spxY3jeJ8njkYa90dSMDZpBu4=;
  b=tTwnkdnpfg1+7gCyuhPnDJU6ltEduvQqJORuL5yFDHX+083P7tRgDvj7
   ecvSDSX53mKGSy9+MYYZ0CeSkOJj8kkcDV0M9q4fvxD2VZfL1StkBwAvv
   qRm+woVO/vcQQcXXCF89IdOYDDBV8hX9WS3wGeXl3HWRW0fPp6lY2BgEA
   pJm0uZP9vwztvgXwn6NUiJ02gTJKr06UTsrwEq2BqY/QI+EN/PRueQqHP
   ryK4XWCTiuj8zgklVBC7xZlR2TzMiOoSCLlTVS693K+ojiTTFsuxaBzFW
   cqis8qrXzxx9kp+AHKGZ3zf4KoQ5fsa/QXJi3KObQ5H1Poa0/vJhlqK5I
   A==;
X-CSE-ConnectionGUID: uxMtjegJSVmXKStwqYjbEQ==
X-CSE-MsgGUID: pOCESgNsRkWlqDXDK7uczw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243004123"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243004123"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 10:45:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8E7621C000CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 01:45:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3EE7E18009E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 01:45:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4188F10000AF;
	Wed, 10 Jun 2026 01:44:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-aiohttp: upgrade 3.13.5 -> 3.14.1
Date: Wed, 10 Jun 2026 09:44:57 +0800
Message-ID: <20260610014457.2246-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 01:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127503

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add full apache license

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.13.5.bb => python3-aiohttp_3.14.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.13.5.bb => python3-aiohttp_3.14.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
index f3a0fbf557..a2267ea23c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Async http client/server framework"
 DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
 HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
-SRC_URI[sha256sum] = "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1"
+SRC_URI[sha256sum] = "307f2cff90a764d329e77040603fa032db89c5c24fdad50c4c15334cba744035"
 
 CVE_PRODUCT = "aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
-- 
2.43.0


