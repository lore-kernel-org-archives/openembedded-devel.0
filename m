Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EDEEA3C42
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129141.1775730862150188582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pyi+m2kl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730862; x=1807266862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8AoYTVqIHunubCf4ObIlj0YtmfqBQxHv0/+4U0XjcN8=;
  b=pyi+m2klszJ/PEUpkMab7ZBDW+vuZUUzpUfWOUAvXZN1M0ZhIIo4r2Rv
   Upaa6KsE5RGH7AKvgbOB+/JjDOFl/PgiUe2r5v+J/vGlcV7s0zzsWQ8aO
   dMDpA6v1IucT+7cxNUSB4ewchbMPNZcFaCNJZDEymitomezFlSjLUmAcW
   J76y+U3YeC1m4B+fLkd/lYe3ZX3w72VwpWt+72hgXkLoJ+4k5OQioQqXD
   XzvkcubP3OGMKqM0pcFzgDCBs/+OfNN5WdtQt8eVMbAICcd85OFEU9fLa
   D4GZiccaRsmzbFvUZ7PVz3Jxh8loiN8QIEjBc8YeZD+j+GwPdoisU656F
   g==;
X-CSE-ConnectionGUID: 0LpSpYM8RfOh+zYegQmx2Q==
X-CSE-MsgGUID: ZYWH1OowQ/yRiPAJ6eMHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190667"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190667"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9FC6C1570
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:20 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4F7B61C002CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id AC8BA404333;
	Thu,  9 Apr 2026 10:34:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/37] python3-snagboot: upgrade 2.6 -> 2.6.1
Date: Thu,  9 Apr 2026 18:32:15 +0800
Message-ID: <20260409103223.1574-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126178

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-snagboot_2.6.bb => python3-snagboot_2.6.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.6.bb => python3-snagboot_2.6.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.6.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.6.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
index 16cc5c7882..74e6df64a9 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "8451ff4cb96f8a4dc7aca06cee8a54db900e93b4e0e946205e0856b7a4cf4632"
+SRC_URI[sha256sum] = "9800562936d21972a212e8e7c6f0f79eff8faf7f1bfb534675875bd06666f28c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


