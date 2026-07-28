Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFF2C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5775.1785218830103300644
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kmJ2oaI1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218830; x=1816754830;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fJWUAVbBocP6ewX5Ennj3XFYIqLCW3PuN25xOGnHr5Y=;
  b=kmJ2oaI1EUmQolSEcrHZUqp67iZkpgJ1ZYueFQtNw0g1RgFNsfIm8Yru
   iQ9JJVHfss2kkn3Q52egGEDv7cKXFSVlyzDRIVsy1T01io7FRb1Tgwd74
   11ItOAcNMiS2mAoHiAkIZhDcn8JrD8dTL0443Kvk8YkhD3gyudLi0KKY3
   QpL6vMp2HDIyABbVhQd6zpBCCnEwH31u9U4R1vqT/bNTmafM/0VpmO2P3
   IspUSIJm8HvOWybI/ApMMYiWO/VXdbcdoWimvnnqO4wXJp1s9kWe+pqoe
   9zmZVH/FAk4+yNVtfvV8N+hfrAYu0QcVkF3SzlLkzoP1EzcCmR2ubo8WP
   A==;
X-CSE-ConnectionGUID: 19PqScUSTi6YOyjOa3Yb6A==
X-CSE-MsgGUID: 21vjzSnoQ7amCrQd+aQLgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="235013055"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="235013055"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 863011C00095
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:08 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3C1B018019A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:08 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 805D210005DA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:06 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-greenlet: upgrade 3.5.3 -> 3.5.4
Date: Tue, 28 Jul 2026 14:06:28 +0800
Message-ID: <20260728060645.819-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128485

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.5.3.bb => python3-greenlet_3.5.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.5.3.bb => python3-greenlet_3.5.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.4.bb
index e30159b8e8..3fc80fc0fd 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT AND PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "a61efc018fd3eb317eeca31aba90ee9e7f26f22884a79b6c6ec715bf71bb62f1"
+SRC_URI[sha256sum] = "0232ae1de90a8e07867bb127d7a6ba2301e859145489f25cda8a6096dabe1d20"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


