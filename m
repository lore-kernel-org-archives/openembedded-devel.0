Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0069110A3D69
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45654.1774526256803343488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QMLwK17g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526256; x=1806062256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o0uQ+lC9iV6KLsZUdbn5Dwh6d7g1xct7uxU9Tq4HFxU=;
  b=QMLwK17g95leBT9U1p85uwpdX4SvBymZoOQwnjSJLlufIJCGXTOrURHe
   2ou6wdFFe7ASy3btndAfjD0bvml8d1ZeKfMd5qfouIafwpL9NA5judHNX
   k7FqsC/Y3cUSSryFCVtSRmDSHW7bjgsUNcCji0iaWm4AkJeZEGfrikEFn
   uzSp2nO1XyOH3Nvz/+EoZc+vSFiUtSTY5tUAXBVTctqpX6qSpWr+iB+Lv
   SkgSyC28AigXunB0BtKJ51sxIG3n+pKmYVyl4jB6byBo0YTQoIxbJfxa5
   CEKmJ1L01VhUP/lqbYBl6u3xY73hV/vxjoZfWbiQzQILj8o0N1+E5jbTE
   A==;
X-CSE-ConnectionGUID: sZX9VdPTTSm2rKvceKrtNQ==
X-CSE-MsgGUID: DEkFB2lSRkudMN2OFNHoMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420886"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420886"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:35 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 62BCC1C1C702
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 15016C05A36
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B560D1807149;
	Thu, 26 Mar 2026 11:57:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/63] python3-google-auth-oauthlib: upgrade 1.2.3 -> 1.3.0
Date: Thu, 26 Mar 2026 19:56:04 +0800
Message-ID: <20260326115634.1199-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125689

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-oauthlib_1.2.3.bb => python3-google-auth-oauthlib_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth-oauthlib_1.2.3.bb => python3-google-auth-oauthlib_1.3.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.3.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.0.bb
index 4b2634a108..0eed90090c 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI += "file://0001-python3-google-auth-oauthlib-Skip-failing-3PI-creden.patch"
-SRC_URI[sha256sum] = "eb09e450d3cc789ecbc2b3529cb94a713673fd5f7a22c718ad91cf75aedc2ea4"
+SRC_URI[sha256sum] = "cd39e807ac7229d6b8b9c1e297321d36fcc8a9e4857dff4301870985df51a528"
 
 inherit pypi setuptools3 ptest
 PYPI_PACKAGE = "google_auth_oauthlib"
-- 
2.43.0


