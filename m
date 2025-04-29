Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1D2C3ABA8
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.7614.1745900151729756690
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KSy4wIyg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900151; x=1777436151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FCoylj7boag2sQl3PJwJoPQDJ6YGEWO/y8i1QZVTFj0=;
  b=KSy4wIyg6zsvuMCRooiHCPxpJT9F9hifw2pyLZUKGJvotNmGnArl2FBQ
   R0opaT5pKHfACFcynm49OwtrpE8m/SyD6lqZWK2mjiE3eE6WTuq6zdNtY
   3Iw72NKWhIFBBWGxqo+vH6S8WToYfWVePl3h3FE5EZ9aeHqmAy4x5pY3j
   ywnRnIdDBVp3Uwqs2aPTh03NXNs1q5NRRMeFnLc3/OIbv7/W1LTl1brjZ
   ndGAGfa+kTCdlbb9mQlfpZQRb7booTzRkwwkqrXam/8t63XpJiTgUEBlO
   Mq2HhHfK3f2fNRn7vEAHnHF6Gy7QyPdUZCUXOMZQxmGEgKK4R3jc9tAdY
   Q==;
X-CSE-ConnectionGUID: ccf00s1IRxyDSWYtlli7Sw==
X-CSE-MsgGUID: 4+syK0KbSPqNC3ISdNHzEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="185959271"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="185959271"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:48 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08055DBD55
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AADC6D4BCB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C6D91A0071;
	Tue, 29 Apr 2025 12:15:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/23] debootstrap: upgrade 1.0.140 -> 1.0.141
Date: Tue, 29 Apr 2025 12:15:17 +0800
Message-Id: <1745900138-26424-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117207

From: Wang Mingyu <wangmy@fujitsu.com>

0002-support-to-override-usr-bin-arch-test.patch
0003-do-not-hardcode-the-full-path-of-dpkg.patch
refreshed for 1.0.141

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0002-support-to-override-usr-bin-arch-test.patch     | 9 +++------
 .../0003-do-not-hardcode-the-full-path-of-dpkg.patch     | 9 +++------
 .../{debootstrap_1.0.140.bb => debootstrap_1.0.141.bb}   | 2 +-
 3 files changed, 7 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.140.bb => debootstrap_1.0.141.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
index 5de65779d4..daec80f614 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
@@ -1,4 +1,4 @@
-From 3fee46c7e50f432fbd5c97c60b918d71c91f1adc Mon Sep 17 00:00:00 2001
+From b7a476cbcd507c03094811690d5497a7e9e15afc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:08:06 +0800
 Subject: [PATCH] support to override /usr/bin/arch-test
@@ -11,7 +11,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/debootstrap b/debootstrap
-index 552c8d6..11a9465 100755
+index 43a7383..0cce33e 100755
 --- a/debootstrap
 +++ b/debootstrap
 @@ -51,6 +51,10 @@ INRELEASE_PATH=""
@@ -25,7 +25,7 @@ index 552c8d6..11a9465 100755
  # set $CONTAINER
  detect_container
  
-@@ -661,12 +665,12 @@ fi
+@@ -666,12 +670,12 @@ fi
  
  ###########################################################################
  
@@ -42,6 +42,3 @@ index 552c8d6..11a9465 100755
  	else
  		ret=3
  	fi
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
index 5cd1ce88af..0c1a7a65a8 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
@@ -1,4 +1,4 @@
-From e92554e57b4aae242cb0416025883ccc2c539d2a Mon Sep 17 00:00:00 2001
+From 33c4bc9540d6d9aee6d885b89d530130d50b8052 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 2 Jun 2021 13:34:35 +0800
 Subject: [PATCH] do not hardcode the full path of dpkg
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debootstrap b/debootstrap
-index 11a9465..17ab05a 100755
+index 0cce33e..7586c58 100755
 --- a/debootstrap
 +++ b/debootstrap
-@@ -551,7 +551,7 @@ fi
+@@ -553,7 +553,7 @@ fi
  
  if in_path dpkg && \
       dpkg --print-architecture >/dev/null 2>&1; then
@@ -28,6 +28,3 @@ index 11a9465..17ab05a 100755
  elif in_path udpkg && \
       udpkg --print-architecture >/dev/null 2>&1; then
  	HOST_ARCH=$(/usr/bin/udpkg --print-architecture)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
index 468a6c13b6..5fa71896b2 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.140.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "c95eb2aeb952b3fd09f4a07859115d40c4d04a8d551b3071b0a10fcd0db7ebc4"
+SRC_URI[sha256sum] = "232ec755f4b1f445f829996885846abba6f1b6fd55d049476ab26ddd8c4b4e1b"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.43.0


