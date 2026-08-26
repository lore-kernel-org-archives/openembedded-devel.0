Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1255AC61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7665.1787731808679191024
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bd9jXDDv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731812; x=1819267812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=agDDAI+eNjqrwjYARSSPeroC9YfV3TaHgTfh7z2WMrY=;
  b=bd9jXDDvGoCmpHD5/D8D2SAojdFBuvm9iqeQnEkcfcoHEmeKuRm9/Hy+
   wWjFbPjSBabypmU7EPdxlxdFvYNpvJzdec6ntxGkuJYlCm1HYXTxnY0S7
   cYv9qyFk7IubPNWnYTS6IbEAKZPI9Y+Uec6r84TrBj3mMmxoOurHl+MiD
   xudHdP0qckrp3Kcxyt0RBKLCoyzvqcpXnPL+BWHMkE/fyRuxZ/VCwlKSA
   yV9SyX1oBwoiZ6AVfmcACgOlyQYsjt61d456jYApax9VZPLd7M6qwsufl
   REikndusgQmvgLD5OeJlfZUps0SN+1L5Fq8WllrEBTAJ53o1SWMpTd3sM
   Q==;
X-CSE-ConnectionGUID: 0Nc73bN0SpmrtPMTHaGPpA==
X-CSE-MsgGUID: P8etEnsaQeWSWkz0rRVCjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252713296"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252713296"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:10:11 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 017CC10000CF
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9C39B1C04B0A
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A930D1404AFF;
	Wed, 26 Aug 2026 08:10:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/23] python3-xxhash: upgrade 4.0.0 -> 4.0.1
Date: Wed, 26 Aug 2026 16:09:25 +0800
Message-ID: <20260826080926.989-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129514

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_4.0.0.bb => python3-xxhash_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_4.0.0.bb => python3-xxhash_4.0.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_4.0.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_4.0.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_4.0.1.bb
index 52efce26db..4a9a995414 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_4.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6a4f6d709b13927e4d5e9ff13cf8956"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "6b4040b26c73c75e6c12273b0ae237f9235f39cce5fabb683a64e9f20d09df8b"
+SRC_URI[sha256sum] = "d55bf4ef10eb09b8b6866790e083d26d087d84caa3cc0946ba87c3ca7ecaf7b7"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


