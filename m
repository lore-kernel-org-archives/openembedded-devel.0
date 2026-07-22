Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4AFC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44627.1784715868678527264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QVepTprr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715869; x=1816251869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=58PbjuMIWsJSqz2OgugWoHA1pHCI4XXrpXqgutO/n64=;
  b=QVepTprrePRQvrL/QDPMiG/6WmMTl1h2aLwZd3728ZaHioSM6XjC4pHr
   MmFA8TKYw1ZUaF5gzcELVuEoRGt84XBzgypMkrak0oNqJ4Mejq6U8abpx
   LGfzPmSnEjdwGNv74ylJI3F5zIFh+vEGPGajsRcGK2mssq32RAXHJktgi
   mieZ8XfG8KgYN619odj5Ok8aV3GNU4c9BCGY8Bl1p6TeJlEqSa2E3h/ZD
   +6WK9SLuGuGeSnpnT31BrqmjSH+t4DaQCBkD3eRLwcBjF/V6o6JWAeaXG
   aYp5EgjVrq9rA+VtlOYdyaiJAfT+QaKjiEVy+XQUQOWBecOG3JKHAp1Qs
   w==;
X-CSE-ConnectionGUID: 1tP9MOI+QmmNU+gn2DQopA==
X-CSE-MsgGUID: QWPMZP93SD2/i2PBoR3CdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="235655328"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="235655328"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2753C1C0009A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:27 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C9C2AC012A9
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D4A014064B2;
	Wed, 22 Jul 2026 10:24:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/37] python3-jdatetime: upgrade 5.3.0 -> 6.0.1
Date: Wed, 22 Jul 2026 18:23:06 +0800
Message-ID: <20260722102320.1019-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128393

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add Persian short month names for %b
- Drop legacy Python 2 bytes support from strftime
- typing: align date/datetime dunder annotations with typeshed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-jdatetime_5.3.0.bb => python3-jdatetime_6.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_5.3.0.bb => python3-jdatetime_6.0.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_6.0.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_6.0.1.bb
index 90dacb8d5e..396793ac3a 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_6.0.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
 # The PyPI package omits some files for testing like tests/__init__.py
 # so use the GitHub source instead.
-SRCREV = "ea119aab729d4c48f797f3663a692680c93fb9f5"
+SRCREV = "8a5acc4aa0cef2f39a0ad089b7ca7e4b89626994"
 SRC_URI = " \
-    git://github.com/slashmili/jdatetime;branch=main;protocol=https \
+    git://github.com/slashmili/jdatetime;branch=main;protocol=https;tag=v${PV} \
     file://run-ptest \
 "
 
-- 
2.43.0


