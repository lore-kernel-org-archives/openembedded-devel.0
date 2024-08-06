Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83A1C5473D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2878.1722934011958228024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rk6fWUv1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+zTYCJca6S9DVGeqsxuv7YOH2uDPl9rcsfB6BklM9Bs=;
  b=Rk6fWUv157NO3/KzNag7M1wh4uZqa9y/eAIeP1uE1+J96UznoeOZafiY
   HTBQ967MVLGieN53goTXdQycF/09AWQ689XGJaa1hAk2PlOI5/L6bdvZL
   o99BLL+y+oBVuFZYn26h7xgD/binvia1OjXQ4XaXwQfMo/Ah3RFwGeevr
   FqdfQIPgAEvykMgQDOBTF5/zHW0giExjrqKJmggb9T8a/5S7HtPOkvE0i
   WYdQH8zxSiMy69BGZTGu/MrRSc3A6/q00opiK6Yx8seFMDmzsOD1hVv4a
   cDMMdGqhRAOzztbCMW++/R1qeLHg7Im9DxD8Lc0N5LhJsiOSy8Ic/N3p8
   Q==;
X-CSE-ConnectionGUID: wYqnwJYkSquQi0UGm/HDWg==
X-CSE-MsgGUID: 5ND248azTt27CeaNeQWqvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169971735"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169971735"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84CD3E4289
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B726CCFBB0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F05820050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F1BB41A000C;
	Tue,  6 Aug 2024 16:46:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/60] icewm: upgrade 3.4.5 -> 3.6.0
Date: Tue,  6 Aug 2024 16:45:46 +0800
Message-Id: <1722933994-32549-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--3.211500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yQPZZctd3P4Ba9qiaDSLgo3+Aw16GgqpO76C
	Qr0Il9/yDCNnb8CrvNqK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxPXW
	oMDYf5eyKLU2EjRMtqXywCqIquikdD7lLiXNUhrNtN2GsBybzwpiQDIJsDspXEd+K6O5Nt51/wV
	JvMu+9/hfb3tYcCvZ73BTxUdcaKkIfE8yM4pjsDwtuKBGekqUpnH7sbImOEBRhVPMTjSkCRc4/8
	AQHdhhARFpzKSuHnw5XKqmUMJBa23uiWV3udr7fzggI4KwfKI+V6HEOl94rPSbHznN5QE4c9/+r
	ZUZrKjvsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111526

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...c-skip-running-test-program-when-cross-co.patch | 14 ++++++++------
 .../icewm/{icewm_3.4.5.bb => icewm_3.6.0.bb}       |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.4.5.bb => icewm_3.6.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
index c5e210afc..994f252a1 100644
--- a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
+++ b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
@@ -1,4 +1,4 @@
-From c2a67c1f62175ab061bc03d10dd766f968c6a097 Mon Sep 17 00:00:00 2001
+From 06207b1340963e77f2e5d08ebf9727180ad86a36 Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Fri, 2 Aug 2019 10:41:26 +0800
 Subject: [PATCH] configure.ac: skip running test program when cross-compiling
@@ -7,12 +7,14 @@ Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
 ---
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 19 ++-----------------
+ 1 file changed, 2 insertions(+), 17 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index c4a9b02..3f5a792 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -160,7 +160,7 @@ AC_CHECK_FUNCS([backtrace_symbols_fd mem
+@@ -151,7 +151,7 @@ AC_CHECK_FUNCS([backtrace_symbols_fd memrchr sysctl sysctlbyname])
  AC_FUNC_SELECT_ARGTYPES
  
  AC_MSG_CHECKING([for strlcpy])
@@ -21,7 +23,7 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
                 char a[2];
                 if (strlcpy(a, "yes", 2) != 3)
                     return 1;]])],
-@@ -176,7 +176,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#includ
+@@ -167,7 +167,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
                ])
  
  AC_MSG_CHECKING([for strlcat])
@@ -30,7 +32,7 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
                 char a[4] = "no";
                 if (strlcat(a, "yes", 4) != 5)
                     return 1;]])],
-@@ -191,21 +191,6 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#includ
+@@ -182,21 +182,6 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
                             [Define to 1 if you have the strlcat function.])
                ])
  
diff --git a/meta-oe/recipes-extended/icewm/icewm_3.4.5.bb b/meta-oe/recipes-extended/icewm/icewm_3.6.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.4.5.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.6.0.bb
index 8948da77b..c6202905d 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.4.5.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "8d1afe9a2d5e28e88261b68906337449307e53f06c08218e1a6409083998a5f1"
+SRC_URI[sha256sum] = "979fafd3a3371f73cbafe592e2be052475637ac4bb4385bb132331fd6924bc76"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


