Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E4BCD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16945.1779875342854859811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hwGbC2pT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875343; x=1811411343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VpMMi/w/1x2C2Psus2rFq2cVVhIbaNgOpYSoci3X9+A=;
  b=hwGbC2pTBnnmDmTMwC3he5Kd/Z/voOYuVisQ+gO4gMk4s+GlX5QU/dX1
   f0VfhwhTTe3Mu0C3VKSHY9gSE+GrH4m9wqGd6QzajDYSHsG7K2/d6d9V6
   XfPTipBJ86p09KlAlljfeLk3GZ+9gjSsauZF/yicanxaloyd5E4PVJL2f
   IhzfNAJr/HcYsV4AORhL1ZPauBlwxImgJ7d6pbhwPSpTA/P9z6aF4xUAy
   3Wfjb8lAGjO/gBqdMp9YJq2YjHD6/ItNXLMWW+qZVbVCSfqcXolS8U1a+
   SgA2XRJ6SYYAudgbxcgEzRds8OFxXA13RFB/vKEgVBLdF2t5DT/uIc3qp
   g==;
X-CSE-ConnectionGUID: fxquYgFtSXiKoxwoYlG0fQ==
X-CSE-MsgGUID: L1ek5L/lTPeDxa1psx9WAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="228171195"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="228171195"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:01 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6DF981000143
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:01 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 247C118915F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3B50F82A2C9;
	Wed, 27 May 2026 09:48:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/56] python3-fastapi: upgrade 0.136.1 -> 0.136.3
Date: Wed, 27 May 2026 17:47:35 +0800
Message-ID: <20260527094805.2039-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127233

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.136.1.bb => python3-fastapi_0.136.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.136.1.bb => python3-fastapi_0.136.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.136.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.136.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.136.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.136.3.bb
index 27346415c4..660d729dd7 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.136.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.136.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f"
+SRC_URI[sha256sum] = "e487fae93ad408e6f47641ee4dfe389864fd7bec92e547ea8498fc13f43e83ab"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


