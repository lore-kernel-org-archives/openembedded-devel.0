Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D21C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3358.1787132194280790816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZbxXrmok;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132194; x=1818668194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dj4Ow8zMoNvDKhYDVkjcXQNkX5zZ6nJ6V+cObalJTUo=;
  b=ZbxXrmokrH/dx9XQYcaEjds5BZbU7mYrh3Lj3d2ySUF+jQJJDUAXLE23
   ZMRVQdLClpy2nFBF4oIR0A6wbr2GI/vTlSK6vywLkCanHIrGEyzgBAPcy
   xaAdjFXtAss5T6BAD6pbOm3ztxD75hIMy7lp+hvRRGDff8l4yzBmVepu0
   Zb3z90Lw+GQCvveVP/3pitIw/Ke77Wn/bLalMqZOT1zlHPU2S3ry4hrwZ
   nB7bNV6ZiHBUPLxqYcUXXIFmc+fZGCuTbh9YnMqrGeE7/wePMNTdZImDT
   aVcp5YidN1V3LBAElU6pjMCHF3foSOts+onV0wT91SSZXiNopbVsenJW1
   Q==;
X-CSE-ConnectionGUID: OaJqJVreQK2zLJFN//CUOw==
X-CSE-MsgGUID: uZDtzwcpTb2Easy7jsC/Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="250051511"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="250051511"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A2596C000AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5C141181ED48
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6D35D1801C0A;
	Wed, 19 Aug 2026 09:36:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/70] python3-marshmallow: upgrade 4.3.0 -> 4.3.1
Date: Wed, 19 Aug 2026 17:34:45 +0800
Message-ID: <20260819093514.1101-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129311

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- If by_value is enabled on an enum with a None value allow_none now defaults to True.
- marshmallow.validate.URL accepts a fragment that follows an empty path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.3.0.bb => python3-marshmallow_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.3.0.bb => python3-marshmallow_4.3.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.3.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.3.1.bb
index 169726e527..67263d6dd9 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "fb43c53b3fe240b8f6af37223d6ef1636f927ad9bea8ab323afad95dff090880"
+SRC_URI[sha256sum] = "fb6b8048af08d4ab061610d5b7d3696a7e4c95337dbda880edb9f95812cabc20"
 
 CVE_PRODUCT = "marshmallow"
 
-- 
2.43.0


