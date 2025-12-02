Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72F8D11701
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4302.1764669145133369381
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gXttj/Cf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669144; x=1796205144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YshxBGPn8HYWpeINKIuTV7q9lw6SDjqivgj5/+UGTLI=;
  b=gXttj/CfKuO4WpbulDuVOplM/nIXuiw5tDIs7jzBN6Wv5Io0Z74hxe9m
   kZJzVJZe80y2tIm3nmsDDp4N6dmnIF59twh7mT8oGPayuTLSA4GTEnaeR
   C4vSIrWZnlOaIBroa8oFy72OJte9WxgyiXcv4anv4TWscG6ivRHRfMlBl
   JnzVLztqrNFDyz7K6BWwF52lKsnhL2yH95CeJpxM+iIdM5E/feCX6ygLo
   SD2PzPIc5BCUWKV5/idSYVhvll3tuTqiil7EGu/UPvzokorzGntGcxNeJ
   yYem1a+QM81DJfVoEW8l8opkMq3Rhhn6n1T/NcMZv06cwk1IuzbUWdAUB
   A==;
X-CSE-ConnectionGUID: b27dOhxkTx6Ah0pK1j0nsw==
X-CSE-MsgGUID: uxO+6JmbSfa4eDUUDwsE8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200028021"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200028021"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:23 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8B3CAC00549
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3C28F18002D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BA3E9101A438;
	Tue,  2 Dec 2025 09:52:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 23/25] swagger-ui: upgrade 5.30.2 -> 5.30.3
Date: Tue,  2 Dec 2025 17:51:30 +0800
Message-ID: <20251202095132.652-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122256

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- deps: update vulnerable @release-it/conventional-changelog to 10.0.2
- deps: update vulnerable dependencies (js-yaml & glob)
- utils: handle sanitizing multi-level relative paths

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.30.2.bb => swagger-ui_5.30.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.30.2.bb => swagger-ui_5.30.3.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
index 3f5c8b3f32..3d152e15ad 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "30d8f985caeca5bb9400cf21403686ec5a82c1cc"
+SRCREV = "199761a94d03753ec62c23bb4ba162bb73c3cfc7"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


