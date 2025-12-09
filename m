Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F320CD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4146.1765274220642638531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pVBXIomA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274226; x=1796810226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtiH8FvwV5yc8reE5XCRq5K4RqxlXqdTIPB1/ZGr04U=;
  b=pVBXIomAIZIYMNbghH9W8YOvAbtxVyywxmmoUoKM2NRoQXdYpP975PTa
   LB5aWBq55J5z19OVlyeW4WVoPby0OGhlk0jDEX6Oz25f+an7wUaR9asUU
   /MnF25ZPGCf475j8sFGRqJ9XTnvqJWwqgok3g3KPEqy20yc5D/b/kGorJ
   /NM956RiXL2P6ozrefXnc+4uKNdIaHGEOnCJH91y7m0wTufG1juo1o0eF
   aL6BLLWj5arYRTjuj6x+qmBvUY12oCo2o35ihYS/Nl5LwtP6V6XcbdOVs
   1SEoh/fPVp4H7IZrUKFVq0f2U9TWt3y0pRMVWzI/i+Kisk1whFkPI5IUa
   g==;
X-CSE-ConnectionGUID: rWcyS7LcQs6y8MzkMhu7lg==
X-CSE-MsgGUID: bflBgasKSeu4H5AvQVdFCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209421578"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209421578"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id AA09B42A328
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5243F1C0014D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DC73720002B9;
	Tue,  9 Dec 2025 09:57:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 33/38] sip: upgrade 6.14.0 -> 6.15.0
Date: Tue,  9 Dec 2025 17:55:47 +0800
Message-ID: <20251209095552.690-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122437

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.14.0.bb => sip_6.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.14.0.bb => sip_6.15.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.14.0.bb b/meta-oe/recipes-devtools/sip/sip_6.15.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.14.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.15.0.bb
index 6b091c5e47..1cce35db9a 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.14.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.15.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "20c086aba387707b34cf47fd96d1a978d01e2b95807e86f8aaa960081f163b28"
+SRC_URI[sha256sum] = "3920f26515456ee21114a1f8282144f8c156b1aabc3b44424155d5f81396025f"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


