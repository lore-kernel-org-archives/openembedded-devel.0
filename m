Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F059D6ACCB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37584.1766048663666178430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qXoUrwVU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048663; x=1797584663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yv0/VjaqVqwTuNHTFP+rDFocAO12/HO2+y6aPWSvEHI=;
  b=qXoUrwVUK3AO1eowSImh9yhX5NdRfY43cjiCnOrXpvFjf4c8VDJUpA78
   C9IFHBJP5hofHbd5jxsbNZ8Hlfwn9Isy3sdUzJqN6vhD5KT+V3HeMYVbg
   ucIWomngQKkYAW3DCeun+FDOFqW0UIfVW96NfvWxK5gAMCsQ560au208z
   eIs59TFgveUKSSJVTNTN+EMx7FuRAUPC3Bon5yrnUwMqP4gi91lCGbH0o
   xLZsusByRGml5ztU8zJ21iOm2oBOKw+eB12ZMolhoFl6FFTxMccHYGooY
   FbTdAq4lHoRWQ2bgKb6ERveeMg8eKtuKXTX4ZAGt3cXj01GNFDcR7YoU0
   Q==;
X-CSE-ConnectionGUID: hXvwMFurTX+L3gD1NMISig==
X-CSE-MsgGUID: KwfSCHLVRCm8BIEVIZIYSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="201929508"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="201929508"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:22 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 21DCBC020EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CAE7F18000A5
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 54A7C101E528;
	Thu, 18 Dec 2025 09:04:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/20] python3-tzdata: upgrade 2025.2 -> 2025.3
Date: Thu, 18 Dec 2025 17:03:43 +0800
Message-ID: <20251218090346.735-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122751

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2025.2.bb => python3-tzdata_2025.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2025.2.bb => python3-tzdata_2025.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
index d7bcb11364..1c313ea223 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2025.3.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b60a638fcc0daffadf82fe0f57e53d06bdec2f36c4df66280ae79bce6bd6f2b9"
+SRC_URI[sha256sum] = "de39c2ca5dc7b0344f2eba86f49d614019d29f060fc4ebc8a417896a620b56a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


