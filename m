Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD83C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5628.1785218822554385634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QvuFxcp4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218823; x=1816754823;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NJ+zvyy+WMvFwm4GDcFuht+I2LS9ASA35VVzxtKRq8Q=;
  b=QvuFxcp4i9To9fCMiOL0+OGhLV9MgV//U8eTuLBXbVAFvh0YYw+JQml3
   HGoQdmf/Q1q8Cj7VVU5RtjvCCLhu5qAuh0B/90y9CQe6cQ8A19LXine+5
   hTcKtMxDvUg/n+bC2txOUR+S3JW2DLfWDQGG2CsGS6wbVGvFEHGHVRSyg
   Ot3MOwg6cCmKYIyDkbLbm2ft7FWYzmmrXhkW7QU+9r4fUkhGy4sDhO9zJ
   /Ub5O7/uzbXmcyYtO3ip7KsruKf2wEHPsixJS7M+gATBg3dUf+YUjj+UQ
   soGN4w52LwGoyzsxSRceYuwhgnHr801uD1UnzCtxmwG2h/3rrBCJrrZFt
   A==;
X-CSE-ConnectionGUID: V+XbGwZNQvW7+jnrvbkR3Q==
X-CSE-MsgGUID: UoFvnm41SQCyFbdjlZ5xeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="227717771"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="227717771"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 29F78C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:03 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D55C0C00221
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:02 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3A4AE10005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:00 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-discovery: upgrade 1.4.4 -> 1.5.0
Date: Tue, 28 Jul 2026 14:06:24 +0800
Message-ID: <20260728060645.819-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128481

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-discovery_1.4.4.bb => python3-discovery_1.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-discovery_1.4.4.bb => python3-discovery_1.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-discovery_1.4.4.bb b/meta-python/recipes-devtools/python/python3-discovery_1.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-discovery_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-discovery_1.5.0.bb
index d026dbb25c..408a08ef84 100644
--- a/meta-python/recipes-devtools/python/python3-discovery_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-discovery_1.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
 PYPI_PACKAGE = "python_discovery"
 
-SRC_URI[sha256sum] = "5cad33982d412c1f3ffb8f9ca4ea292c9680bca3942451d30b69c37fce53a4a3"
+SRC_URI[sha256sum] = "3e014c6327154d3dda27939a9a0dc9c5c000439f1906d3f303b48f984bd2ecef"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


