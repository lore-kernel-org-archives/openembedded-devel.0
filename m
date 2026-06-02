Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7947FCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21491.1780394907734317279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SUuPBNpl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394908; x=1811930908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Na3xJIp5KfaCeOFNxzmTfjjOINn2E5Ck3n+sPslwhsw=;
  b=SUuPBNplE1HEAUz1FGKJ0PIxqy/f9nAQdBaNnIkb2KK7S0ANNY89JYUh
   gcTKP5ziECoEMsEEUru/UHf4zMalRltQG8iQY/bhzKBaTODaM5+luZXvT
   WWV7t4J9fLF3CUHT7ORU7o3jML3EUsJigm9+1BMvV/lf2Tgj8XZuzPwQ6
   iHq+QtoMlWvFxyhCG8rU46gAljcniGyrVsV8GddJ0GXGcdzwmI8q411Om
   gBHKSiZTinLG6RKP+Leprl/GNzhHtgAGx1Np3y3o5tRjMYfbLdFZv98Si
   pDxCmB6wA+wNSsLuCycss4iOBpuDRbvzY7d/6TnYFJLSfRLgQlzOJADBL
   g==;
X-CSE-ConnectionGUID: PN3DoENbSOOYjkjcExRGyw==
X-CSE-MsgGUID: ktCFS8waTEiVI7W+FKSlkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242125852"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242125852"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:26 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3BC061C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E3BFD1C1C25E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 866791800522;
	Tue,  2 Jun 2026 10:08:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/38] opencl-clhpp: upgrade 2025.07.22 -> 2026.05.29
Date: Tue,  2 Jun 2026 18:07:29 +0800
Message-ID: <20260602100755.2117-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127335

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{opencl-clhpp_2025.07.22.bb => opencl-clhpp_2026.05.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_2025.07.22.bb => opencl-clhpp_2026.05.29.bb} (91%)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2026.05.29.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2026.05.29.bb
index e1302f4963..299cb30e48 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2026.05.29.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "opencl-headers"
 
-SRCREV = "2a608428f725cad7903ef55e1ce5b995895838f5"
+SRCREV = "5661a0efc215b1e05d3b90315c64f670101fdbde"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
-- 
2.43.0


