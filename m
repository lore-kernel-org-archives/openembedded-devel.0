Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCCA10A3D7F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45670.1774526290053536755
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZqyZ6+4R;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526290; x=1806062290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LwOJd56DkyoxbkA1qSESeDkPmD7QUQapV3Us9oCcYXY=;
  b=ZqyZ6+4RoYl7l3bj0GOd3qiT7CXmGCvCY/UauNiwaelq9L3FOaT5hdiW
   nCHPjfF1Wifx2IoSodYsgXR9yHbATrLu8TlUojwuSZVVT7CZ/EeHe/OTa
   VZPe2Htj2z0Vq6lYZKCpNjFy19HrStdKLRdNB+d+5WNX2eqtQ4eU4i2uC
   uaY01M26ZGYLqoRjxrm4LATH8pIq03Tt/K2q56/MYpVgNjMwgm78unzC3
   Hn8vjf8r1f8PXLDnuMFMYZtqrtRROq0oXAFP1OxK4OSCYG+D8JuLuqHLb
   7kL0e2yTkIo5F58/dAU+RwxV2nM1pVHxoRfnRCXHmWUmSP9c6XBfvJvca
   Q==;
X-CSE-ConnectionGUID: hKtrPwxdQVq8f2MionmzLA==
X-CSE-MsgGUID: pBaHXJuxTGigOrhDzYc/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234154061"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234154061"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9C1A81002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5880714003CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 078041807149;
	Thu, 26 Mar 2026 11:58:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/63] python3-uvicorn: upgrade 0.41.0 -> 0.42.0
Date: Thu, 26 Mar 2026 19:56:25 +0800
Message-ID: <20260326115634.1199-55-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use bytearray for request body accumulation to avoid O(n^2) allocation on fragmented bodies
- Escape brackets and backslash in httptools HEADER_RE regex
- Fix multiple issues in websockets sans-io implementation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-uvicorn_0.41.0.bb => python3-uvicorn_0.42.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uvicorn_0.41.0.bb => python3-uvicorn_0.42.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.41.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.42.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-uvicorn_0.41.0.bb
rename to meta-python/recipes-devtools/python/python3-uvicorn_0.42.0.bb
index 4d12f87c80..f14ba46dc6 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.41.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.42.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "09d11cf7008da33113824ee5a1c6422d89fbc2ff476540d69a34c87fab8b571a"
+SRC_URI[sha256sum] = "9b1f190ce15a2dd22e7758651d9b6d12df09a13d51ba5bf4fc33c383a48e1775"
 
 SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 
-- 
2.43.0


