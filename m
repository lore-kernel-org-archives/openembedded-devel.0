Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9BECAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8321.1758704443465243685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UB3jVAP1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704446; x=1790240446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aNzt0rKYJ6hCDROe3DGFG8yQl2GN1gZD/Sf9NMAbOvw=;
  b=UB3jVAP1c5qlVF77KerWRLDiga+JgkLsjKhdzgYu/TJxHX5xRTljFUOb
   /OGkw5ZKHZLFhhfz7LsqJkPif9hsa8WeN2g2wUr3TPcrNGhRfxdJ4q66v
   tgrgpEp1dToWVWdgkc9qY3Dbq22XOj/vWzOBz94W2uXQ88CTWZapdAMsK
   k8p95e+ug3Ud9BZ58f/zDPm/SeOqd8kqAZ6bpxwY7aEzwX1XHB8WRNxmZ
   +ghL5nPzGgG09aHl3fjqTsN7QB++A+SILPLp0iA5iBfU+xAnrtlHcn067
   QizG26Kp+2mMSZHHFIwMocyz3pPhNNu57Hjn2FPCw3YqB/MfEwT2YbLI3
   w==;
X-CSE-ConnectionGUID: i+DatILXSbmrJznChOBNog==
X-CSE-MsgGUID: C/A9RKlXSk6vl2WH+EIPhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213764723"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213764723"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:45 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F12FE820714
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AE4581400611
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id EDA8882C0C1;
	Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD3D51A0090;
	Wed, 24 Sep 2025 17:00:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/29] python3-cantools: upgrade 40.5.0 -> 40.6.0
Date: Wed, 24 Sep 2025 17:00:16 +0800
Message-ID: <20250924090029.1786-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119783

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.5.0.bb => python3-cantools_40.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.5.0.bb => python3-cantools_40.6.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.5.0.bb b/meta-python/recipes-devtools/python/python3-cantools_40.6.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.5.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.6.0.bb
index 5b8233b737..e2d8b3ca2a 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "029706310d89e186631489d6d959608b7c6c4727eaba6eca48d49ab5bfa1b277"
+SRC_URI[sha256sum] = "adfd80f9d1704be0dfae3fde0000f748635888bcb76c1a12b8b6420f34d95834"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


