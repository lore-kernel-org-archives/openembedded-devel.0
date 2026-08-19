Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F61C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3378.1787132244610940506
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lV3Fl3yY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132245; x=1818668245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gp0s5DEjW871Bq5YqI8HBYTgm9b10i7LovIa6v2PHqI=;
  b=lV3Fl3yY4SmxJyLrzu5+zbDc2eG0doja+eoTkQ8TGteBXN5sfX+ZPk/N
   SJkPSBwncPrBVIAk06zZJTXUVsFTlh2ytgadn+UqJkSXA+pvevLQtFQPo
   Ddvt4h6oW8yFC7UZ/IDmaRL1RwqGF13kTr/eD3lg3DJZX+uIXuLe4biPF
   vl8m3nd0BIuvY+EpuWvqiuWWqyyrwVVA4ZDX6P3TADQ1PzpbuNcMYFekD
   4V+E+L1iAS1C0QFfrDDVC6mgV5P2dD+iWYif+hfrw8HiLrrRtG4cpJ5LQ
   31nLA9kEURyIw4FwM4WX5wxeqlt35GVLvTJ1gKqmEDLUwQY1Qdrvuq6VA
   A==;
X-CSE-ConnectionGUID: YQsMNXiORXK+w/s/krot1Q==
X-CSE-MsgGUID: TmFMaZM4TBiKgCzNl/nwYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251797154"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251797154"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:23 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E456A8200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:22 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9ED18148AD37
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A71541801C0A;
	Wed, 19 Aug 2026 09:37:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 69/70] swagger-ui: upgrade 5.32.12 -> 5.32.13
Date: Wed, 19 Aug 2026 17:35:13 +0800
Message-ID: <20260819093514.1101-69-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129339

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- a11y: add aria-labels to copy-to-clipboard buttons
- a11y: add skip-to-operations link, banner and main landmarks
- a11y: close Authorization popup with Escape key and backdrop click
- a11y: name and state for dark-mode toggle button
- a11y: restore icon visibility in Windows High Contrast Mode
- a11y: topbar logo and dark-mode toggle visible in HCM
- a11y: use for model titles to convey emphasis semantically
- ci: bump cycjimmy/semantic-release-action to v6.0.0
- ci: fix Trivy security scan and add dependency vulnerability scan
- style: reduce padding on inline code blocks in markdown

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.12.bb => swagger-ui_5.32.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.12.bb => swagger-ui_5.32.13.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
index bfeb75f6ca..8916b7788e 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "9b5acf38723108ac816dcb7303897e87f933ac4e"
+SRCREV = "2a33d7805eb5fff693952cebb9203ee113ab4663"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


