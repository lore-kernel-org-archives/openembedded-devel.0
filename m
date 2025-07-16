Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0242C83F35
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15675.1752648075776895611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GfwL83sV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648076; x=1784184076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bW1rnMaobDfM/HAkHhyy1fibSKngtoBQFMp3nYL9Rj8=;
  b=GfwL83sV59aW5ZRDuj92jr6n0Bb6p8z9JcFGQkMR5T8GqjKBO0kwNQcW
   GbNpmu2bq9pLY9mvxXTsnvLk2+l6UEDxYtVUIG0quc1sLaxw15MFcOxIj
   gcjwtfXBa2b5c23G1F9ruZNTzx6ZsQhNJsRhyZkjtfbBuyJ/2FspO2Mar
   Y7dTchTo8CudTxFCRkiDAHG7AhsU0TWg9LbHj/bYcejfaGFb6v1wLCTRR
   0i8K6MhU5qWqqE62wvPtb1ZH+rqROFC7CXaKsFdvFfB9iTKiWbDkkcNa0
   d6nToW8MNLSfZJyrpoAyw74cloRofwjoFtSgGEcn+KhMsQA68G2I0Z7tP
   Q==;
X-CSE-ConnectionGUID: nGHPottrT2eFTxh7nEZ1DQ==
X-CSE-MsgGUID: awQcc/PzRfiC+Gw5yGqH0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="193890952"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="193890952"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DB410100034C
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:15 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 375241000102
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B05DC1A0074;
	Wed, 16 Jul 2025 14:41:11 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/14] icewm: upgrade 3.8.0 -> 3.8.1
Date: Wed, 16 Jul 2025 14:40:51 +0800
Message-ID: <20250716064102.1813-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118572

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-skip-running-test-program-when-cross-co.patch
refreshed for 3.8.1

Fixes:
- Restore the previous code for calculating User Memory.
- Allow to reload the toolbar from the dialog.

Changes:
- Always keep message dialogs above the WindowList.
- Make the BrowseMenu much faster and use less memory.
- Document that a toolbar is a also a menu.
- Document that the OpenCommand is for the Start menu.
- Several small optimizations to reduce memory usage.
- Updated translations: Hungarian.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...re.ac-skip-running-test-program-when-cross-co.patch | 10 +++++-----
 .../icewm/{icewm_3.8.0.bb => icewm_3.8.1.bb}           |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.8.0.bb => icewm_3.8.1.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
index 994f252a15..0c04008b69 100644
--- a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
+++ b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
@@ -1,4 +1,4 @@
-From 06207b1340963e77f2e5d08ebf9727180ad86a36 Mon Sep 17 00:00:00 2001
+From bcf7da314d4cd1db1708d48c908ab7da797a733b Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Fri, 2 Aug 2019 10:41:26 +0800
 Subject: [PATCH] configure.ac: skip running test program when cross-compiling
@@ -11,10 +11,10 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
  1 file changed, 2 insertions(+), 17 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c4a9b02..3f5a792 100644
+index 7d16afb..65cd194 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -151,7 +151,7 @@ AC_CHECK_FUNCS([backtrace_symbols_fd memrchr sysctl sysctlbyname])
+@@ -152,7 +152,7 @@ AC_CHECK_FUNCS([backtrace_symbols_fd memrchr sysctl sysctlbyname \
  AC_FUNC_SELECT_ARGTYPES
  
  AC_MSG_CHECKING([for strlcpy])
@@ -23,7 +23,7 @@ index c4a9b02..3f5a792 100644
                 char a[2];
                 if (strlcpy(a, "yes", 2) != 3)
                     return 1;]])],
-@@ -167,7 +167,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
+@@ -168,7 +168,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
                ])
  
  AC_MSG_CHECKING([for strlcat])
@@ -32,7 +32,7 @@ index c4a9b02..3f5a792 100644
                 char a[4] = "no";
                 if (strlcat(a, "yes", 4) != 5)
                     return 1;]])],
-@@ -182,21 +182,6 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
+@@ -183,21 +183,6 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
                             [Define to 1 if you have the strlcat function.])
                ])
  
diff --git a/meta-oe/recipes-extended/icewm/icewm_3.8.0.bb b/meta-oe/recipes-extended/icewm/icewm_3.8.1.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.8.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.8.1.bb
index 1ce1114dfa..597ff3f083 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.8.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "525df5fc9d328bd3ead25f2e262d2a15bdfa8fe7828d98f111a064dd169ac18f"
+SRC_URI[sha256sum] = "3c525512b1e4f4cf7999a4687f1b82311d7448d8c174780b5efd3b8aafbfb4a2"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


