Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17392C0218C
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.32638.1737360858607546361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BqCJFumD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360859; x=1768896859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZDhwcVZWJGe/3jCYLXtYqHODRBoskwcyb7TFduWHtmo=;
  b=BqCJFumDbUdeDoQ+clEB6hcLG260Orj0JL8lF1zNC7gVrX1jTyLRnOV3
   CX0JyvKBIN18KIRVddfgSO9ae0s5Hs7/+ivEL8NKPaLV7w146/3lME2VA
   gJFWSDH5nkIei6f/cBP6lL8CNGb4YZY/TA344JVTVU+Lr7zdf3CK9XeU6
   J2+0DFlF2GbfEVnuKsWY2DJNCgBozK3+cynBhnNudYf+FGiWM2EZqxc7C
   B+B+bWBo6j2QzwpUpMMjFWWB0d13bGbfETvE22YsB9jFfSXgkuuOt3sbC
   T/2YJLRYM/5rKk9DBcDOBaVd06e7zHBd9Jem78ust5fhQTPvm2D72Zo0Y
   g==;
X-CSE-ConnectionGUID: zMB6mEx+TvqCCcVyp1Fb+A==
X-CSE-MsgGUID: HuHL3HZ+RgC174y1laolCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175108127"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175108127"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA1CFE076E
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0B1FD968F
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 46BA66BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EABC61A0074;
	Mon, 20 Jan 2025 16:14:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/32] lvm2: update 2.03.29 -> 2.03.30
Date: Mon, 20 Jan 2025 16:13:43 +0800
Message-Id: <1737360846-4824-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--1.586600-10.000000
X-TMASE-MatchedRID: HVm0alLuP0SK6nWX7qLKtzo39wOA02LhrkPjRjdWEVjfUZT83lbkEHU3
	oKSu0J1xCC8aAmGeO6lV00+whwxVQy/7QU2czuUNlVHM/F6YkvTNdIyS2wixbt9zZd3pUn7Kvyd
	Cq8nsegvF0OnGYU+EGD5RrJh6dRuEny8X/DSjpXx1e7Xbb6Im2n0tCKdnhB589yM15V5aWpj6C0
	ePs7A07QdNP5JHgU8AxaFO1GwGQ5CTmRVtpMrdELUZ9Ji6JUzHBJEYsE2VFvsP1SmzhJCeyBIZJ
	KwFIcJEa2gu7D+9t/oXLJfvIDiMAjXRNYYnsNHh8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114971

From: Wang Mingyu <wangmy@fujitsu.com>

0001-implement-libc-specific-reopen_stream.patch
0004-tweak-MODPROBE_CMD-for-cross-compile.patch
0005-do-not-build-manual.patch
refreshed for 2.03.30

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-implement-libc-specific-reopen_stream.patch   | 10 +++++-----
 .../0004-tweak-MODPROBE_CMD-for-cross-compile.patch    |  6 +++---
 .../lvm2/files/0005-do-not-build-manual.patch          |  6 +++---
 meta-oe/recipes-support/lvm2/lvm2.inc                  |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index c14c64ced6..087a0501e0 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -1,4 +1,4 @@
-From 7c3b869e77da17a89df69671cdf069a59a93d6e4 Mon Sep 17 00:00:00 2001
+From cfa37411fa2ebe8ade94742ee00f86d0e386a651 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 25 Oct 2016 11:49:40 +0000
 Subject: [PATCH] implement libc specific reopen_stream
@@ -45,10 +45,10 @@ index 90905e629..ed69662d0 100644
  void init_log_fn(lvm2_log_fn_t log_fn)
  {
 diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index be50473c8..aec6487b6 100644
+index 4af6adc83..fbab70988 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3393,7 +3393,7 @@ static int _check_standard_fds(void)
+@@ -3395,7 +3395,7 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -57,7 +57,7 @@ index be50473c8..aec6487b6 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3403,7 +3403,7 @@ static int _check_standard_fds(void)
+@@ -3405,7 +3405,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -66,7 +66,7 @@ index be50473c8..aec6487b6 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3411,7 +3411,7 @@ static int _check_standard_fds(void)
+@@ -3413,7 +3413,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index a8e1dfcb3f..ac5c440e4e 100644
--- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From a52b50cf47e4b7fc2a1a27d6e35a26d03e2abed6 Mon Sep 17 00:00:00 2001
+From 53a879b5a285722f0cb0ee42607c1cd1102b79be Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 31 Jul 2018 15:04:29 +0800
 Subject: [PATCH] tweak MODPROBE_CMD for cross compile
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3604fca06..167587d09 100644
+index e5e5e71ce..3af73c781 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1707,8 +1707,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
+@@ -1742,8 +1742,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
  ])
  
  ################################################################################
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index 862cda8ed6..f7a85b4b3f 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -1,4 +1,4 @@
-From 0c02c24208afec03aa34839cb3e102fb1c15a9c9 Mon Sep 17 00:00:00 2001
+From 8657541b91b4f2bd05ce14ec9899ff5f9f3b7d4c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 26 Nov 2018 14:59:55 +0800
 Subject: [PATCH] do not build manual
@@ -57,10 +57,10 @@ index 06c4b1823..90df7b09c 100644
  
  ifeq ("@INTL@", "yes")
 diff --git a/configure.ac b/configure.ac
-index 167587d09..557738497 100644
+index 3af73c781..f32d1f376 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2041,7 +2041,6 @@ libdaemon/server/Makefile
+@@ -2076,7 +2076,6 @@ libdaemon/server/Makefile
  libdm/Makefile
  libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 030ce938cc..1f608c29d0 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,9 +18,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "32cfcfd151d49c4e1876a455072c593ad11eaccf"
+SRCREV = "9f81fccd65a29030bf70417e8aca659ae536e081"
 S = "${WORKDIR}/git"
-PV = "2.03.29"
+PV = "2.03.30"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


