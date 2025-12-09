Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D696ED3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4143.1765274217349024765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mnbiZYbW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274216; x=1796810216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gL8t5594+ZUjT/eGmlrbaywF2+jGhyJw+qrnipuSlaI=;
  b=mnbiZYbWwqLQCkPK0BRh6jzSWHJNn5mhet0oOCkDoXOGMSFLUIoLBcqg
   Gk3tfewuDx39wHBe+4TvNZn7SBoxSyCoG0Uw0PxTqzlqBh0f9GhJWp1J3
   /EOXh0W83UDei66cTfQ3DYlgTEdSjPA1FZq+gDsd2Y4PE5KRLLVPvf+WL
   7BObp/cBKtO7BHcy55m+73qQ0H8uo2/zAX5IzBc2HK/ky55ClbIa3uJxU
   bc1O+rq2CfbTxK2MJfT2ZLemNZfyr2wFU5zWdYVfIy2xtekNzWaxeUdAv
   b54blD6M87h5NytidGgnqqBGNsmTJYUC1vWv6UPpA1XaMBsLwr96wLixM
   w==;
X-CSE-ConnectionGUID: Je1fJ5KJRCmX/v0G7m4cPQ==
X-CSE-MsgGUID: X9M1IdSBRlWRPlKlJf1bgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209952275"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209952275"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:55 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D5CCD100036C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:55 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8B64FC0218E
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 27B0020002B9;
	Tue,  9 Dec 2025 09:56:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/38] python3-pybase64: upgrade 1.4.2 -> 1.4.3
Date: Tue,  9 Dec 2025 17:55:41 +0800
Message-ID: <20251209095552.690-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122431

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Publish Android Python 3.14 wheels
- Publish GraalPy v25 wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pybase64_1.4.2.bb => python3-pybase64_1.4.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybase64_1.4.2.bb => python3-pybase64_1.4.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pybase64_1.4.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pybase64_1.4.3.bb
index 2246f93e8c..e4a90c3f7d 100644
--- a/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pybase64_1.4.3.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84b11fa55a5d83cf6fa202fd3b49c7e8"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "46cdefd283ed9643315d952fe44de80dc9b9a811ce6e3ec97fd1827af97692d0"
+SRC_URI[sha256sum] = "c2ed274c9e0ba9c8f9c4083cfe265e66dd679126cd9c2027965d807352f3f053"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


