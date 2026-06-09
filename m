Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19620CD8CBE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76504.1781000993918522406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cpgytll2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000994; x=1812536994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Ni6rduH3bR0cYr++zXwgCkIJGu4gbBarNLReHvPKv4=;
  b=cpgytll2oe8sbQAam9RCH3h6am8sniNjdpATW0C31/W+FMic2R9M+ure
   LYBYyjSnGtKjQgQhIQc9z0AxRqIMpqOlROs7LSiwxTWYzw6VVPzF5/aoz
   R3CsPfgKGNQEZ9LXzE2U7Wy+SGm+Y78dCroWIb47spfyHm/208PMysWxY
   0kbmmWuS9gvLpowLzdb6Es52jNfMPr6ojSqsQx1OyBeLidQV5dvFnJ5mG
   +RR7o4aUaiK4sjlSu/7vQ1o2lH/O9xSDJcHZQJ8REfb39V659c2o5qwFl
   KJP8oPm+3exv+IGxT+oe8jc4PTfZODYVH8V0jYCbxjUS/iplFj349MWM+
   A==;
X-CSE-ConnectionGUID: iA/jRbLcTHCWjJ9AWIg6nw==
X-CSE-MsgGUID: 1jTZj7hMS9aygaT0TBKVYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243463240"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243463240"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:52 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2324C1C000CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CA3731C0094C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id DD4CF10003C5;
	Tue,  9 Jun 2026 10:29:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/30] python3-aiohttp: upgrade 3.13.5 -> 3.14.1
Date: Tue,  9 Jun 2026 18:28:55 +0800
Message-ID: <20260609102913.2204-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127466

From: Wang Mingyu <wangmy@fujitsu.com>

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


