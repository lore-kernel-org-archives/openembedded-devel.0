Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0966FC3ABAB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.35399.1745311774017247261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mbb7M1Ny;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311774; x=1776847774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TSJXVn+kC5ljdj8x9GBt+f3G90kMBc1k+UH21VsEQtU=;
  b=mbb7M1Nyvaut1vzEAAeO2/QHl8XGi+P5FSSdekcHZRew0BF3xDWV0411
   p3sbELJqYubf9P0jenKI/31S/beNSCw+HcoxEW+QvK6OE7/8fJDPhBaOl
   BA1JA0UNBj14Z4SkCYXRW38/zb1LlmM/Kvp94JHAx/5v9l/KKqXfJNEaC
   J3zqDKmh7Vxz9N33HnufL1eVlvdIvYsVlFjEjUaFUNJWPXqd1thpOLudW
   pxDYDZqGUVdpPUAc3gJNiJIP7ppKJpVLF5Wes5Si5HssoTKQ5JLnGqyON
   iTMBjLuV+vn6tQyW2hI5oP9s1bxGlZzY03daLb4AluWoHRGBHA6w8T6Ll
   Q==;
X-CSE-ConnectionGUID: ZkNN4KZ0ROyFIh/ay7G0/g==
X-CSE-MsgGUID: lmmuI+hoQL6fu013s7VE3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="200132595"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="200132595"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A0600C2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E815D8AFF
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE9BD1A009A;
	Tue, 22 Apr 2025 16:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/30] python3-aiohttp: upgrade 3.11.16 -> 3.11.17
Date: Tue, 22 Apr 2025 16:49:01 +0800
Message-Id: <1745311761-1912-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Optimized web server performance when access logging is disabled by reducing time syscalls
- Improved web server performance when connection can be reused
- Improved performance of the WebSocket reader
- Improved performance of the WebSocket reader with large messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.11.16.bb => python3-aiohttp_3.11.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.16.bb => python3-aiohttp_3.11.17.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.17.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.17.bb
index 960272e9a3..eb3ecd937c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.16.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "16f8a2c9538c14a557b4d309ed4d0a7c60f0253e8ed7b6c9a2859a7582f8b1b8"
+SRC_URI[sha256sum] = "2bf3ff374c3abd7a5c6c8de3ad7ed91e0e89a8b53353314c93766c3add5a208a"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


