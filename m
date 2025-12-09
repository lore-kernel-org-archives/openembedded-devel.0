Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1A7D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4137.1765274207866328020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EcibvO7D;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274207; x=1796810207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=94D9x3CAbOTBuFeq8YMmsWOBnP5N+e69333sS0NZpMU=;
  b=EcibvO7Dm47JuOiNMmuSfAkdjQy4ci25yenOkSM0ZPPtLPhiYaA4lh25
   uh0Uo/FE1Xx/BxWmtUJInJ5Dy3nyltlk7FjaJptYVLQCPxRH3DcPS8Edw
   FsqIAuMAeMwEL/PAouebkxOxnCnMBhca1yzAha3zl85IDE7pSx990PX8d
   0m7DG2ZckQP30cEQFfcnBew21SM6Y+OdO8aZPhVjgkwjsbklsPwFwKeM2
   i0ZFjiVlshpisDSrdMxQZMrPSmPhCiojxvfiUA4Md+U+ueNqDjboeL1z3
   xt4s1plAIQj/UoGrmhvTfl0AVXwlVbFBmacgYja8Uh3mcCSjfTN8pAlIa
   g==;
X-CSE-ConnectionGUID: rE2OGOSRTSS5SQfEQRhO0w==
X-CSE-MsgGUID: 37qag5VBTO+BbA+SjgcUCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209952262"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209952262"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:45 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5862E100036C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:46 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ED5991C002F4
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 94F3420002AF;
	Tue,  9 Dec 2025 09:56:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/38] python3-greenlet: upgrade 3.2.4 -> 3.3.0
Date: Tue,  9 Dec 2025 17:55:35 +0800
Message-ID: <20251209095552.690-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop support for Python 3.9.
- Switch to distributing manylinux_2_28 wheels instead of manylinux2014
  wheels. Likewise, switch from musllinux_1_1 to 1_2.
- Add initial support for free-threaded builds of CPython 3.14.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.2.4.bb => python3-greenlet_3.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.4.bb => python3-greenlet_3.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.3.0.bb
index 1657be2b2a..b25e781c19 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.3.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "0dca0d95ff849f9a364385f36ab49f50065d76964944638be9691e1832e9f86d"
+SRC_URI[sha256sum] = "a82bb225a4e9e4d653dd2fb7b8b2d36e4fb25bc0165422a11e48b88e9e6f78fb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


