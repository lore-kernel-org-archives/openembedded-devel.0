Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087E4111225B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7196.1775096059394153438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bmZcasgn;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096059; x=1806632059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ZROSGOlZz06CEDgFxx5DNGHv9he7WN6Wrtzd6MrNv8=;
  b=bmZcasgnu45ov9xh/ScaB2uwmcXlHsroWk+CVWaK9SHuWMNmhndmc9mR
   lASLJFnHO+XFfP23uPidxAZrEu1GFudpmCRFVXPZDpmh1C/scMlMh58QE
   JI8V/XVkze4J65P67RYWQSwDTJ3AgUC1DrOWUnMMDi1hoXpe0yg8NhsX7
   TLrrOc7PmDSJZnQEq294W9Rq9a0RJFi5zJTb78fdUQWaEkHqjh3ApzTpn
   uIrxraXAm115PACagPF3P0WCRLeMrMftaiVGUl4krRIyVUz2kzgJRs1Yj
   7z0vBe7V/6UpEL6t+O9Qija6oNdKft1DzVXnB+muz6HR5pRy9ch2lnzMW
   g==;
X-CSE-ConnectionGUID: VkmhC2KdR8ac5hMd1ART4g==
X-CSE-MsgGUID: I6tsjgsDQaSDsuEK/fpxsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214501714"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214501714"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:17 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B4CE11C00091
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 65E51C012AC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E8DC4100008A;
	Thu,  2 Apr 2026 02:14:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/39] glaze: upgrade 7.2.1 -> 7.2.2
Date: Thu,  2 Apr 2026 10:13:23 +0800
Message-ID: <20260402021355.1324-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125923

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements
=============
error_on_missing_array_elements option
Glaze vs Boost.Beast HTTP server benchmarks and optimizations
custom optional support
Add clang-cl CI workflow
Make REST router more like a map and allow overwriting routes

Fixes
======
YAML fix for generic_u64 and generic_i64
format_context to support specifying YAML in opts format field
glz::patch support for all glz::generic_ types
Avoid erroring on nullable value types
Fix GNU-style flag passing to MSVC frontend
Nullable value write skipping

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.2.1.bb => glaze_7.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.2.1.bb => glaze_7.2.2.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.2.1.bb b/meta-oe/recipes-support/glaze/glaze_7.2.2.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.2.1.bb
rename to meta-oe/recipes-support/glaze/glaze_7.2.2.bb
index 9750253005..807f8811d1 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.2.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "527b419fecfcc19261866dcfdf62dbf6e393970c"
+SRCREV = "959c50207aa552a8de5aabfcbb6801d08fa6fb9d"
 
 inherit cmake
 
-- 
2.43.0


