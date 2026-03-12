Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1EF105A564
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18767.1773312818335437633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oRAu7N9R;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312817; x=1804848817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sSaXc7lWheKJMKIP7RxleeaFZyRV+w2fYTjp9OjsaIw=;
  b=oRAu7N9RLxY1w3TO/cMZgqsu1QE6YGEoNxNzhz/XN/8q6KWSwXrVt/wt
   +TRJYi7mgQLAw04UpEyoh2oPbMCJ6hAxRNvF9V9/PfLwe7fshoblPdOCM
   ct3FZuCxIWBOCJZ+7fVDaO3xGckIifp5jrxjJPj+uIzq1HYxRd/KF3VPm
   q/PE27YxXpelzjMXteUaej+rVpJh4XBrIxQqcyu7QuxmE26J6XXCrVD26
   572OHiWu84Dd8+DDRxzEWf4G94PfkAJZoMrF2YXsOz5yVmNAUjhs8XenM
   YhEtYeOwDU9qJZZrksWmK7tGniWD5GGNl42tEE5ztyd/7KCn33TIsS6Eu
   g==;
X-CSE-ConnectionGUID: qkoZLiUvS8mjtHgNzucn4A==
X-CSE-MsgGUID: 7dub5AqUTVum4q/SyYUdMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950500"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950500"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:37 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 03D411000A0B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9FB1F1C0CAE4
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BD78F18029A2;
	Thu, 12 Mar 2026 10:53:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/64] python3-fastapi: upgrade 0.133.1 -> 0.135.1
Date: Thu, 12 Mar 2026 18:51:50 +0800
Message-ID: <20260312105220.1856-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125134

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.133.1.bb => python3-fastapi_0.135.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.133.1.bb => python3-fastapi_0.135.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.133.1.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.135.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.133.1.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.135.1.bb
index 88d8350b79..4eb9dced82 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.133.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.135.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "ed152a45912f102592976fde6cbce7dae1a8a1053da94202e51dd35d184fadd6"
+SRC_URI[sha256sum] = "d04115b508d936d254cea545b7312ecaa58a7b3a0f84952535b4c9afae7668cd"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


