Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D05D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4213.1765274222325105688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=czoY5Paj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274222; x=1796810222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QPXqIG0j10nEKjhc6wlxs/jPGv4C1/ZSoGHm+BBIWaw=;
  b=czoY5Paj91Gv+2Dq8zfoNuH4ScHESqNOscH8obTAYYJxGyT1JTw0ANK6
   JRQENmXotDTy2iF52I+G6AfJi90hzeoN2GtxfRVVypHom0bcJKo/LNq7a
   t6Y5AFSE9Jub41M5BQaW2LNuzFWb/8+KfCZfHL83Y5MYPFnkDKtHO+iS5
   UGN2SQBRGelMQ1phR3p0cNsDW5knGkmA+4Q+H4k86kDFz7CjH9RYNC7EP
   5Zqm3dbj/mZdZRMfQbiuzKmYT0O78fM/Za6etdjDCfT/uYKL8AlboN/og
   REb/iiLZR7xVg3PKybt/txbAXZT7KGqiL844Sh0JaZ30D/Pf7ASX/doqY
   w==;
X-CSE-ConnectionGUID: gfrKhQBzT/GZ3erHJHI5vw==
X-CSE-MsgGUID: hMkx+j/IT0eYXLHfGNpFdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222031570"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222031570"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:01 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B63E142A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5DA5C1C002AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 0262620002B2;
	Tue,  9 Dec 2025 09:56:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/38] python3-txaio: upgrade 25.9.2 -> 25.12.1
Date: Tue,  9 Dec 2025 17:55:44 +0800
Message-ID: <20251209095552.690-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122434

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-txaio_25.9.2.bb => python3-txaio_25.12.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_25.9.2.bb => python3-txaio_25.12.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb b/meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
rename to meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb
index 0d5e629b33..14db5d8f89 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
 
-SRC_URI[sha256sum] = "e42004a077c02eb5819ff004a4989e49db113836708430d59cb13d31bd309099"
+SRC_URI[sha256sum] = "f0e83ffaf80a9b91bd710075cbc2bb71e879f8aa061b09f6e9dc122343dd69f2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


