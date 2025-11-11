Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE82DCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:57:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12631.1762847819438572831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ARuZSduE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847820; x=1794383820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RFwDOqbZkCsGS8uJfyFCCRjhkvxOtKbxFBbiVarTvnE=;
  b=ARuZSduES9YtQxdu6BdKcfD9+HD/l4cG8QShI/WJEqrssSfPaCTf7tSl
   f4wNMWoGGMr4hwkJBhuqGCAVPMSvBYvBKxhxikt1xQYf8d0OwQfKWccPF
   Bk2/qEMuLeaKc3KgkdA+yH3mmgkx5RTTHuUJ2UqpV1/rvcb4Q6xiOS6fo
   CTA9Gr29aSFB5IZgoVhN2LV7Vd39dEOt2hnu0lU1k138+XhDP9y34qRwF
   rCZxn4y7MHf4Z8KMJ3QQ0glp6MqQ3X3bxw/VSrZxOJBSLpESJNPQDdgoC
   Ps1zsZoH4blQP5Q71hbnZU/Zv8D81vFiAJ2XPhPp31hKc+AkqYYoZRDfs
   w==;
X-CSE-ConnectionGUID: F3P/J26vQea1liO/kKNGwA==
X-CSE-MsgGUID: IQaANMrgTYqbEjofJS+67Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="222576743"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="222576743"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:56:58 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0B2D01C0008F
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:58 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id BA42A1800E90
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5398D1800D75;
	Tue, 11 Nov 2025 07:56:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/23] tslib: upgrade 1.23 -> 1.24
Date: Tue, 11 Nov 2025 15:55:17 +0800
Message-ID: <20251111075517.1650-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121502

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* improved release procedure
* debug fixes for 32bit systems
* CMake and autoconf updates for newer versions
* fixes for minor cppcheck errors
* ts_conf test program fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/tslib/{tslib_1.23.bb => tslib_1.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tslib/{tslib_1.23.bb => tslib_1.24.bb} (97%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.23.bb b/meta-oe/recipes-graphics/tslib/tslib_1.24.bb
similarity index 97%
rename from meta-oe/recipes-graphics/tslib/tslib_1.23.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.24.bb
index 299aa2a273..6f6e8fd565 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.23.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.24.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
            file://ts.conf \
            file://tslib.sh \
            "
-SRC_URI[sha256sum] = "9b489a54d48006201f2fe955a88c3f857535ac93b6cf8e5a16c7b166c8991dac"
+SRC_URI[sha256sum] = "58d9941ffaa269c399f00d0d308184c96087f7acf69aa8e3c6645e852f993ba2"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
-- 
2.43.0


