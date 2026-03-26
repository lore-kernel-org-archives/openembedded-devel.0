Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A27E10A3D80
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45673.1774526298348238116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Des/ebY4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526298; x=1806062298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RcBLMEyRrgkYB41BwiXE1iWw6WmLYceh7QkUkMv6pRU=;
  b=Des/ebY4O3DaLCv4LJXUR4kAu3VLQkxihZzGgQKF3/CvQX/llMVraAOl
   WJWDu7LbQ+sazA6akDtbWCzLk5f/rXP+K37tSh4yzSfgnqi3To0oGYE2x
   8aspJWG4B62BhOsEugjAW9/sZ4yA4zORI5E/WJptTHSVFjIdKOzDQmuWt
   w2fx4EI3biNes9zDMxPJ1iwl3fn978u61Son5s5CsIsGlPhZNswuYpewQ
   1GyPfUDbM6//KLDAIwFNnMsJp69eWojZqg+0wGQQksKQpvgKctG9+c2Kb
   wPARHL7ihfbjERyHJRqnbHAKIqFTa9ayOrVTMpomSIgj4XMh7JTNw4Nb6
   A==;
X-CSE-ConnectionGUID: Ur9uRd91R/KZTfA1LB1cZg==
X-CSE-MsgGUID: xs6tVnS1SdGtMJS5pPtJng==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234652679"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234652679"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:17 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D374D1000343
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:16 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7CBF61C17449
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id EFB841807148;
	Thu, 26 Mar 2026 11:58:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 60/63] swagger-ui: upgrade 5.32.0 -> 5.32.1
Date: Thu, 26 Mar 2026 19:56:30 +0800
Message-ID: <20260326115634.1199-60-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125715

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
=========
- invalidate models components cache based on location
- style: use container queries for responsive design

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.0.bb => swagger-ui_5.32.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.0.bb => swagger-ui_5.32.1.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.1.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.1.bb
index f1cf07d418..bc9b414848 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "1b33a5976d8f5e02d3bc40de1deae3a4a3642e36"
+SRCREV = "d361f5b3570b8ade67fb1c02cf7a676fcb441479"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


