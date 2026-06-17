Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E768CD98F8
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11263.1781686712526515305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CIP6Gf0U;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686719; x=1813222719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+zOGplhQSuBvEnzrQ2fd/HHiTwS0192EzzlKxiqzd5E=;
  b=CIP6Gf0UKZSXNQw143bc67/P8pAytyAQBwxaL0GzLCFVO498xGgu12zV
   mXtvgJSNyYtrPK+DxHKkqy8c45qgG37BSNQjHY6B1gMa5QrrMa9ciFLMR
   NYB4EtySo/5So748Xeqduk9RVqxQ2kXGIkfWNWs0KohNFvM1j0R49tM52
   EkE6+JphTvjkk2P0NAuGHQzv4dAFWTn8089V5VUJjpHNfoUNLIowHK4yH
   lxmqJLoPorTx4BntXK1JRXMaETUlTrIdTxJtEuGKse7Rf2gsWFHIylt0q
   pcFLmKKg1K8h6E/MjV3sbVyB/I8tjC4oSF6WALlEsB1bFrt01q33iodPM
   w==;
X-CSE-ConnectionGUID: OKvLU6guRRiYh2gwfbZHlg==
X-CSE-MsgGUID: uXiOMK+3RTms/5221vTJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="242543062"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="242543062"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:38 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4A07942A33B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:37 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id F2365100D232
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 13C9E1000A47;
	Wed, 17 Jun 2026 08:58:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/17] python3-pymodbus: upgrade 3.13.0 -> 3.13.1
Date: Wed, 17 Jun 2026 16:58:04 +0800
Message-ID: <20260617085807.542-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127651

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update CI Workflows.
- Fix dropping the next frame after a skipped one
- Correct Log repeat.
- Fix address bounds check in get_reg_block
- Fix reg_count calc
- guard short frames and validate mbap in TLS framer
- Use latest uv in CI.
- Change MIN_SIZE in ascii frame.
- Harden ASCII framer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.13.0.bb => python3-pymodbus_3.13.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.13.0.bb => python3-pymodbus_3.13.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.13.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.13.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.13.1.bb
index c59e8870b7..041898ffc8 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.13.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "da4c87afe772787620594c564cd8aa8a4c58ff9786382aba9550fe0ce8879f32"
+SRC_URI[sha256sum] = "7a74ea0a4eb4895f518b34de32915ba4fde216576e09deaf735a279a9281af4f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


