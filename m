Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE874CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:57:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12780.1762847817717692060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UliXfrny;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847817; x=1794383817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W1+CLMZwkvU+r5dKB0cEGgwH2xm/drPIMPzE0TaQetw=;
  b=UliXfrnyC3Yqgv9cvY1KO/O4cjfH0R4UlFLzWp/96EwL38Gt0v19y+5V
   arMwvFHUyS80n41+09KjGZQuj1ZLKtNH0oG5HJIDfxU9TFQiNVtbenzOd
   uuF+//3QU4So2/Hq2dkBnW8C/4+bT3j+ZW3CDZ1Ty8d1DlqeGTb+DXf4Z
   TyLvKbisNKK222O8yoO6mhP7pq43JH3jOdPUCo2C5/lI5H1QJACloU6hD
   9MumBc7X7E95Lj4B24Bo9zE+zV0DjpbzCMksI5pkyiZCXQYrXYrvOcQ5u
   wuaI5Smyn89iDWynM83jNmpee7uA/AY6DVazA6CZ61F4VW2hc8hCIazZo
   Q==;
X-CSE-ConnectionGUID: ao92C0r8RByV5l7oh1wj+Q==
X-CSE-MsgGUID: sc8HRCxuRyGoz8hTICTPEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="206770051"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="206770051"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:56:56 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 36A001000375
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E6D8FC006C9
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7AA171800D79;
	Tue, 11 Nov 2025 07:56:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 22/23] swagger-ui: upgrade 5.30.0 -> 5.30.2
Date: Tue, 11 Nov 2025 15:55:16 +0800
Message-ID: <20251111075517.1650-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121501

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- prevent webook from crashing in case of openapi 3.0
- deps: bump react-syntax-highlighter to 16.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.30.0.bb => swagger-ui_5.30.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.30.0.bb => swagger-ui_5.30.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
index 033b53e248..3f5c8b3f32 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "9c1e7699a7ba433f66cabc7eefa18579acf58c85"
+SRCREV = "30d8f985caeca5bb9400cf21403686ec5a82c1cc"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


