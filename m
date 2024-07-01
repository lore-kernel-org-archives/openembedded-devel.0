Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41926C3065E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.13625.1719816264275695352
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C2y+AJ39;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816264; x=1751352264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uRDFmkNQOnMkEdCujBKJm2IvyQt7YBmGsNY6M00UNPo=;
  b=C2y+AJ39p3A2CVPgSa2n5WsT8Fcm5JJ5cY0LtBLxCwA6YQAlSRxdt2O0
   n4NmnkXnauuwSfwFzmZA7Z+78wkAnHTUCAQwV0scCz5AYvhPRu8lsYLSy
   K/+IEXzLVbv4Xr4aZHxcdeO2EAPtZA5ImgX1vn9Hrc1lBQEHVh4eeUrQJ
   7Lsxs+T8kVUM6kwN6EVtd8ByKy/aPuhIi1iOTwEvxHy2yzk5cXzlFpJ3v
   k+VCNhIb1JrE5drZepTH12p0zSrOOv3D4AftWSy6gYmF571X/RGejW4xK
   rkYsO9+/tIGG47AP/IztJKicPKW/RHoW/rzNXVN3+KjOWApDPzHC6egpX
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="153490901"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="153490901"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:21 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0785FDB3C2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DA7ED3F13
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CAF9D20071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7A8B61A000A;
	Mon,  1 Jul 2024 14:44:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/25] python3-aiofiles: upgrade 23.2.1 -> 24.1.0
Date: Mon,  1 Jul 2024 14:43:45 +0800
Message-Id: <1719816242-11839-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--2.980300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIwtVahdcU657V
	Ny7+UW/91/rLSaAmSKRu9z8ucX9YM8ocsHMOi3OlA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY5gZGm/RVVHG5x7uAXGEprZiQDIJsDspXmyiLZetSf8kffP
	BaMANhX3YJEUfDojP/J0RPnyOnrZK9TLd+xucxVufrxMJkCZ/b9siIYwCHPT+lBvK3lvmHqepkA
	cxxUyom1R6rkYMfjrfalAgaGpk1iUwgmXFJNrnVwol2Xr3KF9tLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111189

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Import os.link conditionally to fix importing on android. #175
- Remove spurious items from aiofiles.os.__all__ when running on Windows.
- Switch to more modern async idioms: Remove types.coroutine and make AiofilesContextManager an awaitable instead a coroutine.
- Add aiofiles.os.path.abspath and aiofiles.os.getcwd. #174
- aiofiles is now tested on Python 3.13 too. #184
- Dropped Python 3.7 support. If you require it, use version 23.2.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiofiles_23.2.1.bb => python3-aiofiles_24.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_23.2.1.bb => python3-aiofiles_24.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb b/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
index 73dc17423..1e9ebdf97 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_23.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a"
+SRC_URI[sha256sum] = "22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.34.1


