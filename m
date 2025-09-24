Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE45CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8320.1758704443129004005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IDOh7tNW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704445; x=1790240445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dy6n1zY4OXdjTOPUE31Az37ei/3gE75tL3Ymzty5nrk=;
  b=IDOh7tNW5LNKOV8AlPPgilDT3nqa9RyXjm/bIyM97BMQ0cPN53FsTY1X
   /wI5luIrDZ1EvHNtW69v7PuJNnmzx6eiTvSFM3Bac8nVwsuM/1M7qzexC
   uRXp1EKAZjPAtiYMdJCVK3vsC1ujljaS88jYUgL89zxBSUNiaZBEuE4/X
   NrrWjdr9mYGfxLdS9ccRDCwjM1ti0KYUFUVz1dkfftldwS3qtnIQpiAmh
   gSkuWFzPSdcPQ5VuD8P2OQQ7x907o+E2K/ppmMphBC12RhMMrDPl6gPix
   hHX6gu1VPp7kVntk2Mx8PNxOTuQdo8VjGyuP04kmOO/oNPYb+jcbZneJR
   Q==;
X-CSE-ConnectionGUID: a8dMHGNkRcCcmjmzUefBOg==
X-CSE-MsgGUID: cJ3YE8K/SdyVEzqbMBJd2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213818432"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213818432"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E460042A321
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 99E7DC01837
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id ED6E982864D;
	Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 342E51A0096;
	Wed, 24 Sep 2025 17:00:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/29] python3-coverage: upgrade 7.10.6 -> 7.10.7
Date: Wed, 24 Sep 2025 17:00:17 +0800
Message-ID: <20250924090029.1786-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119779

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.10.6.bb => python3-coverage_7.10.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.10.6.bb => python3-coverage_7.10.7.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.10.6.bb b/meta-python/recipes-devtools/python/python3-coverage_7.10.7.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.10.6.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.10.7.bb
index 6593ecd2da..e3b7ffb7db 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.10.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f644a3ae5933a552a29dbb9aa2f90c677a875f80ebea028e5a52a4f429044b90"
+SRC_URI[sha256sum] = "f4ab143ab113be368a3e9b795f9cd7906c5ef407d6173fe9675a902e1fffc239"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


