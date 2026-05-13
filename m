Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F8BCD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:17:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.217.1778645835501015912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tpPTWYAF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645836; x=1810181836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cjPMNSEGgEYl4DEVjWSOScmT+a71Y72DhffUCbAEyJ4=;
  b=tpPTWYAFVKVFVZ7gnZQT+L9Sz6vL891lK5l2jhJmXVhGcFnQMY5fZQCU
   uczjj5YZWSnEZqp2CBzbodEY61hLib46Nujcicvl4eGsrMtROdh0qW/LU
   b8WFJ7kae23fPFpJQzNdUn3aqMS+DafkDi2Os5r1S+WNmwHnYK+RFNIut
   s/BH2WNwzbt0kF8YyAdkwsh/+Xj+4Gjq3jZNnH5hQBn8kKqfR1Fn9WG51
   cI8HE4/QnsS7v3n6OlwSYBb7iin7KO4y2k5L2sMkBfDRw+fEVV3Ew7S3N
   xJjFXkhPyhxfRAcOvV44viKn1NIYs4VZRkr1HmpjhRJOQywsK5SPALIxv
   g==;
X-CSE-ConnectionGUID: wYDGg6d/QY22MoAjgZE+3Q==
X-CSE-MsgGUID: GNMgDKGSR0WNbGQTkNhUGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240259050"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240259050"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:17:14 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F18FB1000141
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A48231C00F8A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2FD32101905E;
	Wed, 13 May 2026 04:16:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/56] python3-reportlab: upgrade 4.4.10 -> 4.5.0
Date: Wed, 13 May 2026 12:16:08 +0800
Message-ID: <20260513041626.412-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041626.412-1-wangmy@fujitsu.com>
References: <20260513041626.412-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126926

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-reportlab_4.4.10.bb => python3-reportlab_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_4.4.10.bb => python3-reportlab_4.5.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.4.10.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.5.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-reportlab_4.4.10.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_4.5.0.bb
index 57e62893b3..a7e9d2fd0d 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.4.10.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.5.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "5cbbb34ac3546039d0086deb2938cdec06b12da3cdb836e813258eb33cd28487"
+SRC_URI[sha256sum] = "e595932789ab7a107ba253e83f7815622708a9fd49920d0d6a909880eb66ac75"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.43.0


