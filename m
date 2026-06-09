Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE887CD98C3
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:22 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76509.1781001010666241103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hLSyijB4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001014; x=1812537014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HgdMOVzK9++4UVL5pUZ9a0wubK7yCl9o+nRGKZ0vk7w=;
  b=hLSyijB444SBFIzfctL01aILMomt+hQ+ndj4lX1IHk42GBzmL3zMYaUz
   f0i5BX2JttmuaAphIyy1KiImpOCn9poo5VK0lo8Tfb9nXvR+uNy+5z9/F
   QdR9z2JHro/a+/IWNRo9T9iwEDds/hA1co1hKs29MWcTR9e1ljShsv9ra
   6JOK0HWPluY+/R5HbOSZWhVlKNv0l0QweZS/eVcPehpmTGcbXsyDxHi3i
   wm4LoFEXj29MVKea1y6dOn3A2N1lbZAbHCLJq5cEebGqqb3/QWUNabQjR
   BEYUVl2sYk3qyZjt1C91rfb+8yYtMVIajEsy5gpn/Vof1DsLMW/dA+pKz
   w==;
X-CSE-ConnectionGUID: 8PInkeszSIyOlaPKai3ypw==
X-CSE-MsgGUID: HwobGU21TAaj7sgxApKhjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="229674133"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="229674133"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:14 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 02A441000340
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:14 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AD3B6180714B
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C0F6910003CF;
	Tue,  9 Jun 2026 10:30:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/30] python3-tox: upgrade 4.55.0 -> 4.55.1
Date: Tue,  9 Jun 2026 18:29:09 +0800
Message-ID: <20260609102913.2204-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127480

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix(config): propagate overrides through config references

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.55.0.bb => python3-tox_4.55.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.55.0.bb => python3-tox_4.55.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.55.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.55.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.55.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.55.1.bb
index cbe7e1e442..64bc26afee 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.55.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.55.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "7ede1e1e70f8fe984f7985d7ca58a1e1c15fe9f8715897e38accc607c8de9f70"
+SRC_URI[sha256sum] = "0678fbf26dd5b559b1ef128fa4388325920219322ebc8cc5f3497627c00f4472"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


