Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D306C369CB
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14424.1744794155551803557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r1iBuy+k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794158; x=1776330158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uIfLkEOQTw70LqLknGswuWgB7sU9vkqE1j9c50x9+ps=;
  b=r1iBuy+k9JtwuNJ6j2uNtwWt6GWV2KOV+f/6L1lX7rnMzLmxNw9otR/y
   kemaCpwRdXI77ely1CwjyRvmr2l2VCBh2OpqvO0z67tsprQb6Qioo82rr
   +mNxQrCAb/4qQHSvHZsSU0SlSXXVVq7Ec+aGUM3oWUyxdShbbw/1JpDjp
   wRGdpAduxUEaJsBH1UHrPi21pdyTeHPwlU5fCAndM+BMEdpAaHjCJmZOF
   iCKCrjhN0GAvUQPMHPrPUFYXRQVf5K6j/qJ5mk1IlgSKMvTc5xznplTqN
   5mj05t5LcCVDpt2OlMUphUCmE5WawoODajyVLoGLp84nLe/dXK/ydZrRs
   g==;
X-CSE-ConnectionGUID: DYrxB+EHQqK/C9Xb7OtpeA==
X-CSE-MsgGUID: NM2s/ceNSBqsAUOSjbkHpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="195806410"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="195806410"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F1C1DD4807
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B4A2ED8B87
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4EF3D1A00A0;
	Wed, 16 Apr 2025 17:02:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/31] python3-sdbus: upgrade 0.13.0 -> 0.14.0
Date: Wed, 16 Apr 2025 17:02:11 +0800
Message-Id: <1744794136-908-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116892

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sdbus_0.13.0.bb => python3-sdbus_0.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.13.0.bb => python3-sdbus_0.14.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.13.0.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.14.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.14.0.bb
index 0a84f2d8b2..848a6ac01c 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "801bd46608ee82614d42960c8ba8ae9300edb1bf5bbeb534bc8fd21f13d2c20e"
+SRC_URI[sha256sum] = "41d61b76cc05a9ea41d10d70a11e9f9a86ed95f40f713630c5e18340e0e4c76f"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"
-- 
2.43.0


