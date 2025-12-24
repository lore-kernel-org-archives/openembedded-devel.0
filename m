Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A27E75440
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117312.1766567672130729594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ckkr690g;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567673; x=1798103673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wIzcC174Vob/eyFCwwoStnjbrUb0cEXYYTnQAGhRnG0=;
  b=Ckkr690gNqGHkt/Ar08uHSzrG7d8RDY26dXJTFQDUPAPPoJy3lJnkltl
   inc/onzAwsBmP7/5yItod+SGTZdSqNSoS/5YJlyoEOI5//Xlyza0sO4xG
   axijfcdhfJR+FMKRa8RKYUElwsub+8L0cwiHP+7T2coYo8LD+sMkqxDuQ
   ef0Os/cjUZ/swfbauduYyyZd9P3Dl01UCb6GELq3huaG/MeC0xNFu0n2G
   Zo0PLeVG2n8ULRcH3kIAo5UWmVglqU5B4wW7c5PHCgFQYRKa3hBiy96Tl
   hJ6DiMlKP9BtfaZHQ8OeECA8EHukYnNBEdrfW/7+RmcLPHYlebXF7J6BI
   g==;
X-CSE-ConnectionGUID: oW2YuHWIQQiQsBEEYlRd9w==
X-CSE-MsgGUID: Lb2YEr5gT8aACQToeceBig==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223750198"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223750198"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7EFE9820C11
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 38DAE1800256
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 67521200074F;
	Wed, 24 Dec 2025 09:14:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/28] python3-joblib: upgrade 1.5.2 -> 1.5.3
Date: Wed, 24 Dec 2025 17:12:55 +0800
Message-ID: <20251224091304.974-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122869

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The Memory object won't overwrite an already existing .gitignore file in its
  cache directory anymore.
- Harden the safety checks in eval_expr(pre_dispatch) to prevent excessive
  memory allocation and potential crashes by limiting the allowed length of the
  expression and the maximum numeric value of sub-expressions and not evaluating
  expressions with non-numeric literals.
- Vendor cloudpickle 3.1.2 to fix a pickling problem with interactively defined
  abstract base classes and type annotations in Python 3.14+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.5.2.bb => python3-joblib_1.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.5.2.bb => python3-joblib_1.5.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.5.2.bb b/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
index cfb8357653..3dd1b57aaa 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "3faa5c39054b2f03ca547da9b2f52fde67c06240c31853f306aea97f13647b55"
+SRC_URI[sha256sum] = "8561a3269e6801106863fd0d6d84bb737be9e7631e33aaed3fb9ce5953688da3"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.43.0


