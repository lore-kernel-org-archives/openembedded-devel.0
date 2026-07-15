Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC61C4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3413.1784111975501937191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ccGd01vZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111979; x=1815647979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E2u9HMF6swRx7/4GlUdmxY5G8GSXLM9E/70FnvrGlIQ=;
  b=ccGd01vZTLIEpSi1y1POZsYB3q1HpQr3Q4R98MOQrOi3ncB9HpSU95AQ
   l5hfyzp1zobX33qkPqgzKDW7Y5XPRy575aPgqjCA2mlw81SvpIlxV2bJf
   1BjYlIppRsqjl9RQlW0l0Jp6+oZipeEa8V+wwuz+6Yjw89nD+ZBfxUQl9
   TDBihQ+04p37XUnUn6q5q2R9nunWF9W14+CMisYVKWg/AW/7GQNbjRgoT
   UX+aUbmh9fbf20JIVHAxpvZGcJ0Vax9NkQ9aD2Zd665Vmq47hdIbodpXu
   yDw0I6+MexbPxP4ec4ql/HxEVlmPTJ3SQftJ/ofHyW0UkIwb6Yz2bWrza
   g==;
X-CSE-ConnectionGUID: 73uFUyFlQGyf8OE41GVNOQ==
X-CSE-MsgGUID: TyFo/0lxRJyuc+TkdZAwVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440345"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440345"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:39 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F1EB3100014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A20B0102095F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B16711800B81;
	Wed, 15 Jul 2026 10:39:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/44] fastfetch: upgrade 2.65.2 -> 2.66.0
Date: Wed, 15 Jul 2026 18:38:32 +0800
Message-ID: <20260715103914.2120-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128175

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:
=========
CPU package count is no longer reported in the default output.
Users can still print it in custom formats via {packages}

Bugfixes:
==========
Fixed compatibility with WSL 2.9.3 (#2433, WM, Linux)
Fixed accurate AMD GPU names are not queried in driverSpecific mode (GPU, Linux)
Fixed GPU core counting for Apple Silicon GPU on Asahi Linux (GPU, Linux)
Some internal cleanups and optimizations

Features:
=========
Added Astra Linux version detection (OS, Linux)
Improved performance of Windows PowerShell version detection (Shell, Windows)
Improved performance of Media module on macOS (Media, macOS)
Added proxmox backup server detection (#2443, OS, Linux)

Logos:
======
Added Flatcar, Azure Linux
Added Chimera_small, Chimera2, Parabola2_small, PostmarketOS2, Qubes_small
Updated linuxmint_small
Cleaned up distro names

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fastfetch/{fastfetch_2.65.2.bb => fastfetch_2.66.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.65.2.bb => fastfetch_2.66.0.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.66.0.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.66.0.bb
index fb56556ff3..8835e3d85d 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.66.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "0e90f3a7d4ac5a7857a968a6f52ea1205be5f404"
+SRCREV = "08698098579bb8b043b0a343159b8018f5cea4fc"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


