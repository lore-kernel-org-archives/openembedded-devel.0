Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6512EC8300E
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.13708.1750662713058072060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ygag73Rn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662713; x=1782198713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJk75DSpNKlFAq5rM3eeDyTiuXc42iCv0M2ft5oEZP8=;
  b=Ygag73RnbhgRfFrUAN0SDg53ycLGoK+SQCAhDngxFlN/240x8pZ59jX5
   JyybxmLI/4EyzQP5A6CeG5U+aPVSJlkX9i/qetp/mqXZYNw+oGJiB2/iG
   YiinTHUbIO2GMrmCg0yds5RPH3N9uYGnBrwPVn+m78Rta7Jgb3L/Yw7ms
   3Fx5DMwgYeSclAXXZQ8PxyPvmo+d6q0rxC0M30Yv6Oum18+McnOti4YcI
   amv5fZ2NeLUMwv2khXj7i0U5OUnbfYYMXUN3Hji7BqBdtPeA7o3yQ23nm
   cv//0h2IY1zRrsA4I54RFtp9ItnX/FoLvHxa3VGkW8oK0EqzseR3xiEXw
   g==;
X-CSE-ConnectionGUID: q4E3yr+tRK2yAyeIQgj1wA==
X-CSE-MsgGUID: arSAMGlVR+KJ/fcqdgUtew==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="183099770"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="183099770"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 73E71C68A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A6F5CFB68
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A62A71A0071;
	Mon, 23 Jun 2025 15:11:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/30] libtevent: upgrade 0.16.2 -> 0.17.0
Date: Mon, 23 Jun 2025 15:11:13 +0800
Message-ID: <20250623071138.402-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118035

From: Wang Mingyu <wangmy@fujitsu.com>

0002-Fix-pyext_PATTERN-for-cross-compilation.patch
refreshed for 0.17.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0002-Fix-pyext_PATTERN-for-cross-compilation.patch   | 9 +++------
 .../{libtevent_0.16.2.bb => libtevent_0.17.0.bb}         | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.16.2.bb => libtevent_0.17.0.bb} (95%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index f1b8f8e9b1..a3301db077 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 2bb7bf2d945d4ea0dafe3858adc6b8faae18b1e8 Mon Sep 17 00:00:00 2001
+From f8b5f542c782b235051ed39239dd32c93eb2c69c Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -25,10 +25,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index b2dd1a9..2bd3545 100644
+index 8646454..4eb8725 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
-@@ -339,7 +339,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+@@ -351,7 +351,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
  		env[x] = conf.environ[x] = str(dct[x])
@@ -37,6 +37,3 @@ index b2dd1a9..2bd3545 100644
  
  
  	# Try to get pythonX.Y-config
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.17.0.bb
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.17.0.bb
index 36364b8874..7ee044d146 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.17.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "f0bbd29dfabbcbbce9f4718fc165410cdd4f7d8ee1f3dfc54618d4c03199cea3"
+SRC_URI[sha256sum] = "7702fb373b69da2960b86134b6a9ec6fa0b949a01756fec00a4a6a43575c8361"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.43.0


