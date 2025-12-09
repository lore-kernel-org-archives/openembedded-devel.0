Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5477D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4208.1765274214358285555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ooG3EQI9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274215; x=1796810215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tVc8oTQTOSVdef7Lvbj/Gs0vvOACz1An1tdRARqoQ24=;
  b=ooG3EQI969SuhYmIIkQSHN8ApBjognDrX7SEfx/drztYaHlJiUrXqVOo
   l1yTO6Is3RLfHkuRAu4AkUIIx3OJoB2JEjSro3s5dEHOck4dVX+rAb5uG
   9aF6QZyucoGvIiQCQw/ikEg5O0byb0ws2anDMLPx5rEeIEbgURyE2ZcBc
   M4pt6oy3aA4AOs8yfwxm8IN1cXZRSXGpYBibpBgTgGB6EE68Z7/6IvuFI
   y8nghA7xj+yRuCojiCuUDPG9hdI31OU0zo+hpNEgnz6+R+zbxAc30JVU5
   kkqjVBIh1Drtc40UW0gNVSpQHj5aJOAp/KZCbK75sf07ndqR8F2WvbT2Y
   Q==;
X-CSE-ConnectionGUID: LUsGr/xkR1a8iXas6+XB5w==
X-CSE-MsgGUID: 86dB+Z89SnKMu4L3eMZvgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221968179"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221968179"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B49081C1C73A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:52 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6AE4D8D2058
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id E312320002B2;
	Tue,  9 Dec 2025 09:56:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/38] python3-psycopg: upgrade 3.2.13 -> 3.3.2
Date: Tue,  9 Dec 2025 17:55:39 +0800
Message-ID: <20251209095552.690-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122429

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.13.bb => python3-psycopg_3.3.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.13.bb => python3-psycopg_3.3.2.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.2.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.2.bb
index 49030c56fd..5ca565504a 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.2.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "309adaeda61d44556046ec9a83a93f42bbe5310120b1995f3af49ab6d9f13c1d"
+SRC_URI[sha256sum] = "707a67975ee214d200511177a6a80e56e654754c9afca06a7194ea6bbfde9ca7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


