Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6FDC43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17256.1782811366616860192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d2sn1iop;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811366; x=1814347366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FNomutma5l0oWo+QTws7F5tVWiVrK5fiqh52fRZ1X/c=;
  b=d2sn1iop2Gb3qDTbp2dKcDiVacNyi7R8iPoRfpRYzn9/4Ggt//qgSDrV
   GxMXVnzQWNHKLtG3E2Y0v9z/dy0dvwM2vcJCXr5tKe0pAVFMRV04XcqU3
   A5egAntwvtD50babCJjRERDLiYUmleIWIZEvSmwIJXqnGXk8Wu/9cBVem
   2mThh4l14pLInjfi7ToepZgyTaah61/f0JTZXfaBiyNwXPlbsEJAK8gUh
   W2HvIPBGCPlyzBj4HpQFZfaJx5zvDkWSkW3auXLc9nnmDycXM1QOeTthx
   FxcTVipAvUyqKOQR23Bl0L264EPwrdmrgCqcNMQBay9+LjRjIJpkoqI/9
   Q==;
X-CSE-ConnectionGUID: gClODyaVTQa/7ezeRS4D8Q==
X-CSE-MsgGUID: kG0805vNRwS9UlQwva7gPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="231987053"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="231987053"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:45 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 174661002B94
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:45 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C39B9145AF92
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C0935826FFA;
	Tue, 30 Jun 2026 09:22:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/37] python3-httplib2: upgrade 0.31.2 -> 0.32.0
Date: Tue, 30 Jun 2026 17:21:50 +0800
Message-ID: <20260630092206.322-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127964

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Python support 3.8+ only
- decompression limited by size and ratio
- decoder foundation to support more compression algorithms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.31.2.bb => python3-httplib2_0.32.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.31.2.bb => python3-httplib2_0.32.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
index 073818a7f9..4c1d0539e4 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "385e0869d7397484f4eab426197a4c020b606edd43372492337c0b4010ae5d24"
+SRC_URI[sha256sum] = "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


