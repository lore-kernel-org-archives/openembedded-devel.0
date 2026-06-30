Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75647C44503
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17242.1782811354103276966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aZibFU1m;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811354; x=1814347354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQPCSBPoEmPnbIALnN7gcCJFyJN+Sabw5BJtquzPbd8=;
  b=aZibFU1mB8znhbVHHAsj2aSJ4/FUgvHmdexBgMY80xBWRojduZdxrORR
   KKwqZeaEeLQ2451s7LdHnv96LHxFOx1jprh8Ap92n18IPsYaFMrUoxsoe
   nHgZQl1YbZsRbMRBKwceKD6CYHMcJQuYnp83gjKVd0TWYcgypZPWThdKD
   h8OrAXx9ovvtlTPkpd2J/87lT5CeNkbBTugHA2Y2JW7gINPSGAlQJTkFC
   48ohQ2UXOdoe4ohz8dt+ylf4LRtoxY6ZfiwmHixQBD/NU4D3OSPlJqBFR
   RzwzvyFyheRnCWibaYBIcaAh4DFEl3wk4uf0SBd04ift/BWs1wbzOzsEK
   A==;
X-CSE-ConnectionGUID: WxVNUzJzQ4m8fqA/IwUMSQ==
X-CSE-MsgGUID: p39dBZKhTvKpbr/yLKEWsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233776225"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233776225"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 72396100037A
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:32 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2ACA9188C9B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D83AE826FEE;
	Tue, 30 Jun 2026 09:22:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/37] python3-apiflask: upgrade 3.1.0 -> 3.1.1
Date: Tue, 30 Jun 2026 17:21:42 +0800
Message-ID: <20260630092206.322-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127955

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support flask-httpauth 4.8.1+
- docs(request.md): document headers location field name mapping
- feat(exceptions): add __str__ method to HTTPError
- Normalize header names in OpenAPI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apiflask_3.1.0.bb => python3-apiflask_3.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_3.1.0.bb => python3-apiflask_3.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_3.1.0.bb b/meta-python/recipes-devtools/python/python3-apiflask_3.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_3.1.1.bb
index 25b5075181..45bed8a746 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_3.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "44ac6de494054e6988afea9d1b9272c36e83ecc8a64c7fbab0b877c0d3820d0f"
+SRC_URI[sha256sum] = "f3b367d4174d8ad1df9ac3a48a63002276e9f82f7debda91314cca7a20924ada"
 
 RDEPENDS:${PN} += "\
     python3-apispec \
-- 
2.43.0


