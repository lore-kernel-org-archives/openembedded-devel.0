Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B12C44510
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3448.1784112021685138766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sRyCNN7e;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112027; x=1815648027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rYT9Z4TvsxWYobtFjJNu0ZhJZO3tSkZQddbkzvSlnSI=;
  b=sRyCNN7eFqjVSoqLcgHvZDkvAz6FvHtWaF9y6J+10MobheVEevdNNz3I
   8vOxwqfQ6ujrRyrxKvV3oRHne0kSkRmy1WVVK+KYBAI2CdStaaxwmHn5c
   80e8s/uQRhFci3CSIda6Meset+VWEu8GngOnz53yjG3S+L4j/1z7nueaE
   yawXtOGctLPBkUrqbZ5yFCgs4KUZEObSG7rSp44J81JwEpreuqQ6IIF3s
   W6C9rPZ43ZNB7Y4/mHsoPT3hV74bssvWoToF9s5ALuRdViL9lmJsSxfei
   WqVXZlhMzG9yH7X4mzANRrLVpjhi3LOxV1rZV2vdBRK7wj8PQ8t0nAqrh
   g==;
X-CSE-ConnectionGUID: XMSU2sSiSyuaCGGCWq5M2Q==
X-CSE-MsgGUID: Y4qP0z+sSGqLVCQqqBeY4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="250999064"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="250999064"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CAC0A2B88
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:24 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 78813180CCF2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8BC1B1802731;
	Wed, 15 Jul 2026 10:40:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/44] python3-tzdata: upgrade 2026.2 -> 2026.3
Date: Wed, 15 Jul 2026 18:39:01 +0800
Message-ID: <20260715103914.2120-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128204

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2026.2.bb => python3-tzdata_2026.3.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.2.bb => python3-tzdata_2026.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
index 0a94aa59ff..3284b1bb51 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
@@ -1,10 +1,11 @@
 SUMMARY = "Provider of IANA time zone data"
 HOMEPAGE = "https://github.com/python/tzdata"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
-                    file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
+                    file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    "
 
-SRC_URI[sha256sum] = "9173fde7d80d9018e02a662e168e5a2d04f87c41ea174b139fbef642eda62d10"
+SRC_URI[sha256sum] = "4a1518b8993086a7982523e071643f3c0e5f213e75b21318e78bcabfff9d1415"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


