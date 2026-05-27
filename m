Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81883CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16964.1779875370657045630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XmIiEO5g;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875373; x=1811411373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZS974+0ndVFDKEZMrxC5BzEAdcW/9/lJkqtDn1FhOD4=;
  b=XmIiEO5gtN5ZmY0nxuVxxEFn65xVOrFHqwuPZ6cPo/ExkoxDUVx+d+S5
   UWSmKiMNrTaXJiGMbBZ4M615I8t5y3KNnlHxNsZPSTEYhMbbUMXmvKtBV
   wxnD2+3RhDoUKXXsdY11XjDg2qhHkwQKIxI6de+Y9d1Nfkn0mTrtg1MQM
   uWXPSpPs8dtKqA+KxHTSWp87TCz0yE4aWuvROqTRfycyGQdk7eNLCvBR+
   8JHdyJeu2YLiwKcngcCxPuSIHdtA9DLn7LPhM+x1S20iHk7xPEyI3oEKU
   BQZgrj0siSizZ3msLQDXAIxt6H6p7VGdTSDYTKLV64KxRW6BAh1F8mGHx
   g==;
X-CSE-ConnectionGUID: Y6uodQHvQy6jOJRwYMSbRg==
X-CSE-MsgGUID: UB9ASIQQTrql5CuY1K3cIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050141"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050141"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:32 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 75D908203D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:30 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2CEB68319EF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2EACA82A2C9;
	Wed, 27 May 2026 09:49:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/56] python3-starlette: upgrade 1.0.0 -> 1.1.0
Date: Wed, 27 May 2026 17:47:53 +0800
Message-ID: <20260527094805.2039-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127251

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Ignore malformed Host header when constructing request.url
- Use "application/octet-stream" as the FileResponse media type fallback
- Only dispatch standard HTTP verbs in HTTPEndpoint
- Reject absolute paths in StaticFiles.lookup_path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-starlette_1.0.0.bb => python3-starlette_1.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_1.0.0.bb => python3-starlette_1.1.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_1.0.0.bb b/meta-python/recipes-devtools/python/python3-starlette_1.1.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.1.0.bb
index 8f50678875..7bddc99f7c 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "6a4beaf1f81bb472fd19ea9b918b50dc3a77a6f2e190a12954b25e6ed5eea149"
+SRC_URI[sha256sum] = "e83c7fe0ddecd8719c5b840080325aec0260acec86e9832899e377b91d65e90f"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


