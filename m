Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EAAC28B30
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.4164.1741683327713565964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bs1jejZs;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683328; x=1773219328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9k1rdLhGKZBrAAf/3w/LVGCLLv84l3xRqcvtjiDhm1M=;
  b=bs1jejZsXtddjrRWxY1O7EyFgqmkNreGGUqsSa29lKH/AGwwhNpjWDQt
   0NK9qeXYP+rWm1EOu146+MAf2qixEze1VgVVXwWeGImVpQTMi0KblYa+K
   SYrUNMPZMjoNW/fcbHOydjY9ItTbpl7Rhnvmg5Uz+zi9RnkeyBoJXqTf3
   wKs4Z6TJDo2TJCbMP1aznr4QQF/oM/lSz+3E8VV/Psb65p7MXM/n4VDu7
   +POgwtw1ZSOK8GLC5yDT/9JJKC6p/EQcAC+l4cCgczCcRXiy/eqIln6Kt
   ZDTES4fhg/ijacd59hooM4MzE2TyQIgPGQ0ejXvK8a1TIEBN/WpM2+CDT
   g==;
X-CSE-ConnectionGUID: Rdg9Vyv/SeG6sObOaaClvg==
X-CSE-MsgGUID: /VpeE7flTsGMd2QFSsM4jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180034235"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180034235"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:25 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51E61D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1831BD8B71
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC79C1A009B;
	Tue, 11 Mar 2025 16:55:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/36] libsdl2-image: upgrade 2.8.5 -> 2.8.8
Date: Tue, 11 Mar 2025 16:54:42 +0800
Message-Id: <1741683310-8681-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115858

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* Fixed alpha in less than 32-bit ICO and CUR images
* Fixed partial alpha in ICO and CUR images

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-image_2.8.5.bb => libsdl2-image_2.8.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.8.5.bb => libsdl2-image_2.8.8.bb} (91%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.5.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
similarity index 91%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.5.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
index bbd1c83535..bcd8e35b27 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.5.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 DEPENDS = "tiff zlib libpng jpeg libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8bc4c57f41e2c0db7f9b749b253ef6cecdc6f0b689ecbe36ee97b50115fff645"
+SRC_URI[sha256sum] = "2213b56fdaff2220d0e38c8e420cbe1a83c87374190cba8c70af2156097ce30a"
 
 S = "${WORKDIR}/SDL2_image-${PV}"
 
-- 
2.43.0


