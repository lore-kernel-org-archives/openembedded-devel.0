Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F85ECD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21220.1780394910240609966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QwjZDLJn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394910; x=1811930910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePteZwX68psfKQPv4DNl5DMzxk+0qadpv5FohGaKrn4=;
  b=QwjZDLJnM2gLpjzT3GFV4qMsagENwo87xk4yeYMO5FsbTfDkmmT5thps
   je1DToHVmB0w9aVsEX4YhP1eUUQXooAB8ia6UY04eSjIm6zQjqsXK76xF
   YG/fBcEIn7VXNibX8YTo1zgQmFIaOMGNPicaAH7e4+Ai7CA9BOK3t1I21
   51YU2/dNbQk3ZqbHXX9pmDv2mW5TvCYlnGd2G5iCZtWxf7DPNYgBM++UV
   2NT592eSOn6BuzJAoQy6pfqiSo2C+hnw6MqIMRW31D7jDKVqGWtKY1vn7
   e3ha3oOu8dH8yusivZvx9rn8uWl3F3ABYAxXHpxU+ert2b5dMQXsUAXzU
   Q==;
X-CSE-ConnectionGUID: XbAb4aQDQh+UxDRp9AGDtw==
X-CSE-MsgGUID: 529YaOroS6KoJxEriCOtKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230702031"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230702031"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6144E1002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:28 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1617A861242
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 95B2A1800107;
	Tue,  2 Jun 2026 10:08:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/38] opencl-headers: upgrade 2025.07.22 -> 2026.05.29
Date: Tue,  2 Jun 2026 18:07:30 +0800
Message-ID: <20260602100755.2117-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127336

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ncl-headers_2025.07.22.bb => opencl-headers_2026.05.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2025.07.22.bb => opencl-headers_2026.05.29.bb} (82%)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb b/meta-oe/recipes-core/opencl/opencl-headers_2026.05.29.bb
similarity index 82%
rename from meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2026.05.29.bb
index 3b5f948e7d..fbfa9ee3d3 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2026.05.29.bb
@@ -4,8 +4,8 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
-SRCREV = "8a97ebc88daa3495d6f57ec10bb515224400186f"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https \
+SRCREV = "6fe718c31a45fe25151362a72ef041c3a1047cbd"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https;tag=v${PV} \
            "
 
 inherit cmake
-- 
2.43.0


