Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7B2C88CB9
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13437.1754296436254496950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T2bbbGVm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296442; x=1785832442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Td58AvheRRZZnDBGrGJ31P3F5lc2Lezbw5ymMXkTO7M=;
  b=T2bbbGVmd90LCvveAueRLN83v6CSkJr//VKya5fjN2yhw6cGdyhDicXl
   x6Q1qxSw2OG6Vfb5zFiKBTXAkMAKh+C2qDeKBJeTaxnHwg2Guf0Y3ga9Q
   iRvUAvdqgdVEYdgCJF3so/WfJTd0sY4aVxPQ/XKCfQpX8Uhyt1OHDWdU8
   /xgEl2QnGdj9ZNONkEdOyJFBTOjN6QNWxYKKr0OLfYR2UWj4CQaJ4hCx9
   iHoiFqqPI8EIVzNALDKCpqAOVrM95JekmcxEy8EZ8kSQ41GAN27HoTLGb
   zRkxA75t6c2woPdJxvmseE6QBUX0zfBeA6qs0w7wpBWTffpAULmSLMDNR
   A==;
X-CSE-ConnectionGUID: tiUN9QjIR2CcoAuJ46mYxw==
X-CSE-MsgGUID: qLHwbSwZTte+FVGHw4KjJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208301717"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208301717"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:34:02 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6C469C00542
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DB8DB844BEC
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9AB91A0074;
	Mon,  4 Aug 2025 16:33:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/18] python3-sqlalchemy: upgrade 2.0.41 -> 2.0.42
Date: Mon,  4 Aug 2025 16:33:38 +0800
Message-ID: <20250804083340.1649-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118847

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.41.bb => python3-sqlalchemy_2.0.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.41.bb => python3-sqlalchemy_2.0.42.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.41.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.42.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.41.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.42.bb
index c9f337946a..2859b3483d 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.41.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.42.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "edba70118c4be3c2b1f90754d308d0b79c6fe2c0fdc52d8ddf603916f83f4db9"
+SRC_URI[sha256sum] = "160bedd8a5c28765bd5be4dec2d881e109e33b34922e50a3b881a7681773ac5f"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


