Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE90C28B25
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2208.1740525902713691053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sqVLAEIJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525905; x=1772061905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bWFmVNgAGQHdYLET0s5OfhXtKaBEaS2okGBRUrovGJQ=;
  b=sqVLAEIJ1ryo9Zz+82ETU1dsmIr50DvfM7+ciN+hNE4Aj+yVJh9YV+Ij
   TIPqTeGIciPllPVJOtPtYusPOU/SZ98l57K1ExWd5+2Qhrc8B2risquIY
   aPtOSdNEc8LrQyrbEnkvswFE3E9jpaDQEiyynLSBrzsOzrHcV0J8tPELC
   GbENRaa4IHgaCHPwWHjnDscRg5X/z/W/3f0rjK9Eyq8mco+R0DrBTOXb6
   4E+muD5Xl5Jc1psj5dhQutVIOFoEcmO/ZWHvTXZ2FXX8ar3I3xVJ/5bLl
   vKGexy8IZ/EbS7x32RjgElvVKvvMnhoJHhDfGQgMb1MZ1O5EgmTwZX7IX
   Q==;
X-CSE-ConnectionGUID: 3m4tSyzSSkqL+ksOMWowqA==
X-CSE-MsgGUID: PR1tq0gEQ4CLwFNrmmS6og==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179538605"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179538605"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90343C3F9A
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59C1CC8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E0EC1A000B;
	Wed, 26 Feb 2025 07:25:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/51] python3-starlette: upgrade 0.45.3 -> 0.46.0
Date: Wed, 26 Feb 2025 07:24:34 +0800
Message-Id: <1740525881-21103-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115641

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- GZipMiddleware: Make sure Vary header is always added if a response can be compressed
- Raise exception from background task on BaseHTTPMiddleware
- GZipMiddleware: Don't compress on server sent events
- MultiPartParser: Rename max_file_size to spool_max_size
- Add deprecated warning to TestClient(timeout=...)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.45.3.bb => python3-starlette_0.46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.45.3.bb => python3-starlette_0.46.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.45.3.bb b/meta-python/recipes-devtools/python/python3-starlette_0.46.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.45.3.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.46.0.bb
index e4f36baf2a..402280bdc8 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.45.3.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.46.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "2cbcba2a75806f8a41c722141486f37c28e30a0921c5f6fe4346cb0dcee1302f"
+SRC_URI[sha256sum] = "b359e4567456b28d473d0193f34c0de0ed49710d75ef183a74a5ce0499324f50"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


