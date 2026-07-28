Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2CFC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5634.1785218828680763949
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kp3GZO3h;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218828; x=1816754828;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QVe+X+13bygQHRugabQHtrCSWmDEIUq5zv5pIiCHbCs=;
  b=Kp3GZO3hrLhKLupxAU/WyWgivnb8KUBfOR2ccmIqb3LDQGi9n6V5ItSM
   TRZyuptzkrQRz+bVDvTXlLUCmMnZkvNoLO2AxmZDrL2JIfXl9ZnlC+W52
   y82P1Kv69kqMV5QY48ftlZFG9SSnQodubIraN0CM38dA52OGCd0v/o+H1
   8+hL+VLfVaZYuVvZIhWkCYwXyTsB1MlE9H1uQGLATJDi/7q26BNCTLyfa
   xp2+QJuqwFWOOwiDc2eRVoyA1RTIYAX7zB6IHmuUt+4uHiBO9pbuHQEeT
   QOEIfQWS25z5LiIDi81GhuIYtfLLP9CaE1K4YfQAMUAhh1y96Hd2plo6l
   A==;
X-CSE-ConnectionGUID: 7LHKzdR8Q8ygCnH/I9N/Zg==
X-CSE-MsgGUID: wVgq6Mw1Ti+iDMyd4zhtsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="226549436"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="226549436"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:07 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 21964C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C8AC68D29D1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:06 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3197B10005F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:04 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-filelock: upgrade 3.31.1 -> 3.32.0
Date: Tue, 28 Jul 2026 14:06:27 +0800
Message-ID: <20260728060645.819-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128484

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.31.1.bb => python3-filelock_3.32.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.31.1.bb => python3-filelock_3.32.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.31.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.32.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.31.1.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.32.0.bb
index 89dd539f2d..fc59eaedc4 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.32.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "9e0c4e88ebe90833c1beafd3a547ccbc0bf7f491cd3858c3ec7aed63efe02163"
+SRC_URI[sha256sum] = "7be2ad23a14607ccc71808e68fe30848aeace7058ace17852f68e2a68e310402"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


