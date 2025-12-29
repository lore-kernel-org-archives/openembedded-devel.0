Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E93AE9271B
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40569.1767000600181161523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NdOS/ZGb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000600; x=1798536600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HEdnvVMf+PsrOtwQmL9x/PsgDH+Q1+25g64ieTocG9Q=;
  b=NdOS/ZGbvhtQ7J1AdWcOyB/Ce0aa1eD/h8n+qAy9/uT9R6sw8uUiXKmK
   /wkoQiOHt9+lloAMpRico5WoZBN/ZAAUbv3mwkWZhHn7aONUS1Myo1kZV
   VxTZsSgvRu8fguQ4gxeVK7wuqBcTX7tjpDceuuktdwsDCVv8leJtBYTAW
   QRGm5HEynLzNxn5F4gI1xALshxZWR1MsGb20MYcABl8WK2H8nc4OWiCIW
   GBD73q31aQt67N7Rqd+shRa1TSUVV/CwEWFSnPONl/2HUtV3hnUMIK/LT
   +RWYJe/RXVjGLdl7sUN4FMLDNZtzU0vxEhN5FSNakICJcDTnYed148ex/
   w==;
X-CSE-ConnectionGUID: 6eorPEpVRiino4xV//2yIA==
X-CSE-MsgGUID: 4lla1jWtQFaqCTNS/1odZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="224222443"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="224222443"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:58 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A6E161C00086
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 537991800338
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C5A92100035A;
	Mon, 29 Dec 2025 09:29:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/10] python3-pikepdf: upgrade 10.0.3 -> 10.1.0
Date: Mon, 29 Dec 2025 17:29:34 +0800
Message-ID: <20251229092936.1483-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122972

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pikepdf_10.0.3.bb => python3-pikepdf_10.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.0.3.bb => python3-pikepdf_10.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.1.0.bb
index f047969033..8ba10457f4 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "ff12a044d79e342eff6bc8b27dfd4c24b395943052169bb43eea4a23a4100e56"
+SRC_URI[sha256sum] = "d75778283c354580a462d31bd4334f6ba92225e41ccd8bb949ec6e98a23d4eb2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


