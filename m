Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FB1C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44621.1784715857274092120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f4++yINe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715857; x=1816251857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/gplDVYmuGS4nIHzdGtUqmruq03FJu3fni/na0+R2EM=;
  b=f4++yINeUaKyjk36hLkIbYueUemEg8jz5+Z++XJ9UjeXTkJvV02p3whI
   ZWfHDtVIitwoJJTbi5m6PeoQFXLUDYJa1IwD7p43Bq1J38j0V9FU15os4
   hgpm+LOu8LmT5inz16Vp5tyxR6R9RgTU6A1+McyCRl+lMM+epmDfqhHhE
   sMtI3lo3nQ3S3zyWeGDCEVt/TLk0Q4HLr/CHrXGkE3Qe3Zx6AC5Keq1JW
   iy4urECTQ902xwzFBqJ9XldKnB0B+YAT7ufRtEBJeWYRPzXbQ5WiGLLav
   8bvei2eWyihO9kURGsiNHfgMSYW4t688KJc7s9PFKxPNlg6xv6S+m+y2Q
   g==;
X-CSE-ConnectionGUID: B/yA752oQ+ylzMTpoEFqMw==
X-CSE-MsgGUID: Fakx22H9Q7ixLDjj6brO7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="234395300"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="234395300"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:15 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AF7451002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:15 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 65D70C041C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 76B634064B2;
	Wed, 22 Jul 2026 10:24:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/37] python3-filelock: upgrade 3.29.7 -> 3.31.1
Date: Wed, 22 Jul 2026 18:23:03 +0800
Message-ID: <20260722102320.1019-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128390

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.29.7.bb => python3-filelock_3.31.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.29.7.bb => python3-filelock_3.31.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.29.7.bb b/meta-python/recipes-devtools/python/python3-filelock_3.31.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.29.7.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.31.1.bb
index 4f6bca9191..89dd539f2d 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.29.7.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.31.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "5b481979797ae69e72f0b389d89a80bdd585c260c5b3f1fb9c0a5ba9bb3f195d"
+SRC_URI[sha256sum] = "9e0c4e88ebe90833c1beafd3a547ccbc0bf7f491cd3858c3ec7aed63efe02163"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


