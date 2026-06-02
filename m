Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A668BCD6E68
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21492.1780394911430438865
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AqdOMyOY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394912; x=1811930912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6vvjqL52umEj79tygq8YReZOBIzI32Lq6iYdijfodSQ=;
  b=AqdOMyOY8tbsS61R2WUSPH2WSERlIDVDw8x9rgDK1p341OGnvwc77oMZ
   fiXRS3xH6QYWSWc6FJWO2AUJVpELeKQ+cYH5GMywfgqJHQzait5liywjg
   Xrx0PoeGoWI2j9iDMr9BwEQ9SKrD+fIvt8x0SA3Rr2fDDsUqqUCaDfHrU
   su9rXysX+xnSiyDp6EKHHBGxb+j7hz3QCUAq5tHQBNkDkbHydg19rhLpf
   K/gG4niXW9GbSOkbgYUVLFcKcAfpwOaf7O1eBIZvesUPlG/bQewEqdlq6
   qoTZV/iyKGkdlxCeq77e8CnCLslC5L8aE6bhfZk5sAUUMn9LXa3bL+ytB
   Q==;
X-CSE-ConnectionGUID: GbhG0UHGQSKIiSXqTpI7Eg==
X-CSE-MsgGUID: N59lDvJARR+kUh5DKh00Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242660642"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242660642"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E025242A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:29 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 948301811568
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id ADC4F1800587;
	Tue,  2 Jun 2026 10:08:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/38] opencl-icd-loader: upgrade 2025.07.22 -> 2026.05.29
Date: Tue,  2 Jun 2026 18:07:31 +0800
Message-ID: <20260602100755.2117-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127337

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d-loader_2025.07.22.bb => opencl-icd-loader_2026.05.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-icd-loader_2025.07.22.bb => opencl-icd-loader_2026.05.29.bb} (94%)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2026.05.29.bb
similarity index 94%
rename from meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_2026.05.29.bb
index 1a9af62380..46f7774222 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2026.05.29.bb
@@ -12,8 +12,8 @@ DEPENDS += "opencl-headers"
 
 PROVIDES = "virtual/libopencl1"
 
-SRCREV = "ad770a1b64c6b8d5f2ed4e153f22e4f45939f27f"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
+SRCREV = "b7bd2803acc779c03d96588e9ca9e9568a18698a"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https;tag=v${PV}"
 
 EXTRA_OECMAKE:append = " \
     -DOPENCL_ICD_LOADER_HEADERS_DIR=${STAGING_INCDIR} \
-- 
2.43.0


