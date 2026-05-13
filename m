Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E209CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.247.1778646011511137568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VjqfE1MQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646012; x=1810182012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pxKpos73agm6IqzSwOnTorYGbJ1kejE6F3cIHYJlaOU=;
  b=VjqfE1MQMZrgVwyDWa+wBq41d4y0W7ku+ToNCFOyFLX9wES+BYTtiCR9
   VpVjS3Ua0vFCCJME1zYi/t4e8Rbdd+FPwnHB14Z7zhlH5F4ypr3m9uPjS
   nfjxHK1QlgJQNaeT3P9wTsppEYpeBqxtw3s8YqFpU2+Lme6QVENEag6qx
   yyZSA7/zPOCENxM3mQnJinkGpVJ7/UgjnVzZ6hOn1kVo2bD0XXS9v97pU
   DkQJJ36OBHA6P4y50IjgQcqOf7avxB7Mn+Id3XHujLgLMClOkIVdyHWp7
   t3cFRukTRVt4xyetxU5HvL2FStcTBV6+AUo5LrD3k1G6g9nyqik0o4bmk
   g==;
X-CSE-ConnectionGUID: ip3AFYNJSuamUJCVeHTj6A==
X-CSE-MsgGUID: qLwHLbN6QvOsByyES6RLhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240259777"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240259777"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:10 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E37E94071CE
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 8E8C7100153D
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1C05E1400247;
	Wed, 13 May 2026 04:20:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/56] python3-ujson: upgrade 5.12.0 -> 5.12.1
Date: Wed, 13 May 2026 12:19:42 +0800
Message-ID: <20260513041952.450-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126930

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix encoding ref leak with non-English character
- Fix memory leak when ujson.dump() is unable to write to its file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.12.0.bb => python3-ujson_5.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.12.0.bb => python3-ujson_5.12.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
index 14b8049f3d..8f8c6e23d4 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause & TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4"
+SRC_URI[sha256sum] = "5b7e96406c301a1366534479a7352ec40ec68bb327c0c119091635acd5925e35"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-- 
2.43.0


