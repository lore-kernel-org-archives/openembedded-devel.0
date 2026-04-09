Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF62CEA3C39
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129125.1775730836242627726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OhzbpMJP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730834; x=1807266834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UjapvwUrlFEq+/4dDWVc6h1avmsZq0WT7Oh5GN6PkA=;
  b=OhzbpMJPRNNH/IRmfYl5RRALCZwzeTxJh9BlbcCsaGEYig2dmJzAt64e
   f3I7KSfWEpDXwFxm9D1+forGqRO95GDL6itkY3NPrdgpN8rCEEvMI9f1W
   rFXisv3VJ9O9ZCC0WqWyKAQ30BKYZ1PN0yOO0X8Wtiip+CUFFQ7CIMOlb
   ISdWJBreYRxpwx9Md1x+rh48uDWi0MyfT+xmIMD+jMTuYbDAK0C7dU1hF
   J+4i/5Ul8Pvvon8Ax1ZZwVq5o5RoUMrc4SKXAuteUVO8seBg8/sXUpmmm
   DRyBVFT3esDBIsh5P+VmkyKTB7VxpkElI1ORyfrXYGKD0B2cpGpXt9er2
   w==;
X-CSE-ConnectionGUID: IFUhu0rCQXyTaFWnw3p/RQ==
X-CSE-MsgGUID: IV2PcmueQyWzyHkHNIBOyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="223865616"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="223865616"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C8C361002B85
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:54 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 820C48D29C2
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 18B324046AC;
	Thu,  9 Apr 2026 10:33:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/37] python3-eventlet: upgrade 0.40.4 -> 0.41.0
Date: Thu,  9 Apr 2026 18:32:04 +0800
Message-ID: <20260409103223.1574-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126167

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Switch to 3.14 for testing
* Drop 3.9 support
* More visible deprecation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.40.4.bb => python3-eventlet_0.41.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.4.bb => python3-eventlet_0.41.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
index 213460dc70..3c27caf968 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "69bef712b1be18b4930df6f0c495d2a882bf7b63aa111e7b6eeff461cfcaf26f"
+SRC_URI[sha256sum] = "35df85f0ccd3e73effb6fd9f1ceae46b500b966c7da1817289c323a307bd397b"
 
 CVE_PRODUCT = "eventlet"
 
-- 
2.43.0


