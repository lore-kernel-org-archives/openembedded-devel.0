Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2137DCCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2912.1762386260441593151
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qq1+GsCt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386260; x=1793922260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YKMRwRw57JKwFC/NcqZbevrxDGaldQ7vEcUBzSOv5zg=;
  b=qq1+GsCtHH2JfuXx7NIXknvPdh8mqMLHjyZcxjlmm/4CwQr33ak6lIA4
   jn/ULkdG2eochP+FUdouyXR0Fju3Ry3wlQbqMY0t8tH3xuYIMyNRcAqJT
   dCJ8styRlEKmKMwOCYZTpyVsCQ7BbvZlc2hFf78P2XuWKvi0QDWLJ5+U5
   nFITzZlZvm3/PcFsBwAkndmdKGiJRfPILcqg27fxnjMc3QpnJ9uIHiiTJ
   bLvzP+10+nXqi1AtwSLjyHYaN1RpR3Gg7hinQMHKUl0Qyq6kecDRuR4Dc
   pEeuHdIekhwoyodmoo093kAnFzBqPsvA86EpmdlPn/E8rGhNJuOWvrT1a
   g==;
X-CSE-ConnectionGUID: mFDMFwSCQguD/pZDsf+0JQ==
X-CSE-MsgGUID: lGN3Rx32RBagZpU+FYyAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218836890"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218836890"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:18 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BF8B3820703
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:18 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7C0D4140061D
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0AA9510001F9;
	Wed,  5 Nov 2025 23:44:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/12] python3-deprecated: upgrade 1.2.18 -> 1.3.1
Date: Thu,  6 Nov 2025 07:43:56 +0800
Message-ID: <20251105234402.423-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121345

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-deprecated_1.2.18.bb => python3-deprecated_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-deprecated_1.2.18.bb => python3-deprecated_1.3.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.18.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.3.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-deprecated_1.2.18.bb
rename to meta-python/recipes-devtools/python/python3-deprecated_1.3.1.bb
index 5f52571edd..cc5c96a7a1 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.2.18.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://deprecated.readthedocs.io/en/latest/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
 
-SRC_URI[sha256sum] = "422b6f6d859da6f2ef57857761bfb392480502a64c3028ca9bbe86085d72115d"
+SRC_URI[sha256sum] = "b1b50e0ff0c1fddaa5708a2c6b0a6588bb09b892825ab2b214ac9ea9d92a5223"
 
 inherit pypi setuptools3
 
-- 
2.43.0


