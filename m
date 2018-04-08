Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5872775573
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:08 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id a39-v6so3197019pla.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=at7QcqMU+IOtxCEQ63SrtHRYsNToSJfPHPVtT40cahU=;
	b=QdEHDdW2QoV7VtzH6uiwM44i+8oL+ZnCcsihbHRw9ui03ZrEMp8TuxcRMiOqfD0kwV
	idJTQSTl+ljYL2ggyxuuINXpbPakxLRu6J0wKEao5d1Xzf66WDvc+zrK8/yBubH7qGUF
	q2TWNwi1XTEhMWWtJQ0Y5Du6Wgs4VsDByXvX1MkrEJtqivfj8m5aOl4EXBTbsgJ9CNKV
	miRvM7lwvRKlyjwOYeoe1jzA01vKiLF5iFmf1FHmEJpLpQ+oMvih1BPSOz7lqbE9ibOI
	f8HH1ZaR8ej4IQCajkMdOtX9HubOB37ckZ2pA4cyGKbAoKabP35Wr9mNJG2psZSXs6gm
	Nxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=at7QcqMU+IOtxCEQ63SrtHRYsNToSJfPHPVtT40cahU=;
	b=WVdQbKf3arPmzcT7O992xkz420f3TNGJMMvnranKRKCtcRe4eBmwgl0XAPGuKM2/p2
	yJR/lbxHVjSd2nS7kQJ5OjiZB8O2iIXvbfxDLIjIjeB45U18fzt/6CDQddHQLYuNxUAA
	gRkWaF0g3MKSj01otVHgXM5zHfJFPFPqFH6+yOwx6qvV7Sgbi8Tm0LBOJGNkMW5xvuGb
	ipIkvgEJ0eSxh2tzwG4wPEUCzl39sDvyiWT+FBzL6CfldZXGkqWAE3Hk4VhSatOp6NkQ
	4W8ga8/DVxPHs7v8rcX7tqRq3VQNlXLXhcqZAACpaYxG994A3Q7AxZ42mM8q1Me7wcH0
	kjFg==
X-Gm-Message-State: ALQs6tCNp7Bv523Nv+7D8agByFLj0GUFtOiUjgxlUfWBUe4INwZH/QeX
	oZIEmSFAb4s00UEVu4FbIRVZfg==
X-Google-Smtp-Source: AIpwx48Gxq7Pee1cIN/IDpz4MvXaAkjU7XIWpfd33Yp2OuRQmIbQ/Y7x1PFzm3QptKQ3bYUwqJVlVg==
X-Received: by 2002:a17:902:6b04:: with SMTP id
	o4-v6mr15525637plk.332.1523170749274; 
	Sat, 07 Apr 2018 23:59:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:29 -0700
Message-Id: <1523170729-26321-17-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 17/37] snort: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 06:59:08 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file configure.in
Hunk #1 succeeded at 698 with fuzz 2 (off
and others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...fix-do_package-failed-since-snort-2.9.7.0.patch |  6 ++---
 .../0001-libpcap-search-sysroot-for-headers.patch  | 12 +++++-----
 .../snort/snort/disable-dap-address-space-id.patch | 26 +++++++++++++++-------
 .../snort/snort/disable-daq-flow-id.patch          | 20 ++++++++++++-----
 .../snort/snort/disable-daq-verdict-retry.patch    | 21 ++++++++++++-----
 .../snort/snort/disable-inaddr-none.patch          | 18 +++++++++++----
 ...host-contamination-when-enable-static-daq.patch |  9 ++++++++
 7 files changed, 78 insertions(+), 34 deletions(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch b/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
index 1520553..047caec 100644
--- a/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/0001-fix-do_package-failed-since-snort-2.9.7.0.patch
@@ -1,4 +1,4 @@
-From 815e861721a9c43efddb78521147145ebc7569ca Mon Sep 17 00:00:00 2001
+From 4335c4c61877c0b65ff4ec767e8ad3ad8c73c32d Mon Sep 17 00:00:00 2001
 From: Zhiquan Li <zhiquan.li@windriver.com>
 Date: Fri, 13 Nov 2015 17:40:24 +0800
 Subject: [PATCH] fix do_package failed since snort 2.9.7.0
@@ -13,6 +13,7 @@ It's a rpm debugedit bug:
 Upstream-Status:Inappropriate [embedded specific]
 
 Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
+
 ---
  src/snort.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -30,6 +31,3 @@ index 8308e57..499d157 100644
  #include "profiler.h"
  #include "rules.h"
  #include "treenodes.h"
---
-1.9.1
-
diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-libpcap-search-sysroot-for-headers.patch b/meta-networking/recipes-connectivity/snort/snort/0001-libpcap-search-sysroot-for-headers.patch
index 54c2a95..2e28cd0 100644
--- a/meta-networking/recipes-connectivity/snort/snort/0001-libpcap-search-sysroot-for-headers.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/0001-libpcap-search-sysroot-for-headers.patch
@@ -1,4 +1,4 @@
-From 4d7ebe3ed6cee72bc7db98bd408d22c10ef5dd82 Mon Sep 17 00:00:00 2001
+From 5875dea90f71350b7205788fbc67e3759077cefe Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe@deserted.net>
 Date: Wed, 20 Nov 2013 16:06:07 -0500
 Subject: [PATCH] libpcap: search sysroot for headers
@@ -9,15 +9,16 @@ the search path at the sysroot instead.
 Upstream-Status: Pending
 
 Signed-off-by: Joe MacDonald <joe@deserted.net>
+
 ---
- configure.in |    2 +-
+ configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index e52bb6c..8ded35d 100644
+index 62573a8..fded45b 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -78,7 +78,7 @@ case "$host" in
+@@ -69,7 +69,7 @@ case "$host" in
      linux="yes"
      AC_DEFINE([LINUX],[1],[Define if Linux])
      AC_SUBST(extra_incl)
@@ -26,6 +27,3 @@ index e52bb6c..8ded35d 100644
      ;;
    *-hpux10*|*-hpux11*)
      AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
index 39e5c9c..6aa0b73 100644
--- a/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
@@ -1,17 +1,27 @@
+From 5a53260a819e2873f58165e96852529719101c53 Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <B40290@freescale.com>
+Date: Mon, 4 Nov 2013 10:39:56 +0800
+Subject: [PATCH] snort: add recipe
+
 Upstream-Status:Inappropriate [embedded specific]
 
 fix the below error:
-checking for dap address space id... configure: 
+checking for dap address space id... configure:
 configure: error: cannot run test program while cross compiling
 
-
 Signed-off-by: Chunrong Guo <B40290@freescale.com>
 
---- a/configure.in	2013-08-23 00:06:37.239361932 -0500
-+++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
-@@ -679,23 +679,23 @@
+---
+ configure.in | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 6fe5d68..e7636ce 100644
+--- a/configure.in
++++ b/configure.in
+@@ -698,23 +698,23 @@ if test "x$ac_cv_func_daq_dp_add_dc" = "xyes"; then
  
- AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
+ fi
  
 -AC_MSG_CHECKING([for daq address space ID])
 -AC_RUN_IFELSE(
@@ -48,5 +58,5 @@ Signed-off-by: Chunrong Guo <B40290@freescale.com>
 +#        [DAQ version supports address space ID in header.])
 +#fi
  
- # any sparc platform has to have this one defined.
- AC_MSG_CHECKING(for sparc)
+ AC_MSG_CHECKING([for daq flow ID])
+ AC_RUN_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
index e6afcab..04df37c 100644
--- a/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
@@ -1,16 +1,26 @@
+From 5aa42a3137c657b5eddd4608343aa1854bd7cd27 Mon Sep 17 00:00:00 2001
+From: Zhiquan Li <zhiquan.li@windriver.com>
+Date: Mon, 16 Nov 2015 10:23:00 +0800
+Subject: [PATCH] snort: 2.9.6.0 -> 2.9.7.5
+
 Upstream-Status:Inappropriate [embedded specific]
 
 fix the below error:
 checking for daq flow ID... configure:
 configure: error: cannot run test program while cross compiling
 
+---
+ configure.in | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
 
---- a/configure.in    2015-10-28 10:36:42.918512690 +0800
-+++ b/configure.in    2015-10-28 10:37:36.738510048 +0800
-@@ -716,23 +716,23 @@
+diff --git a/configure.in b/configure.in
+index e7636ce..2fbd298 100644
+--- a/configure.in
++++ b/configure.in
+@@ -716,23 +716,23 @@ have_daq_address_space_id="yes"
  #        [DAQ version supports address space ID in header.])
  #fi
-
+ 
 -AC_MSG_CHECKING([for daq flow ID])
 -AC_RUN_IFELSE(
 -[AC_LANG_PROGRAM(
@@ -45,6 +55,6 @@ configure: error: cannot run test program while cross compiling
 +#    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
 +#        [DAQ version supports flow ID in header.])
 +#fi
-
+ 
  AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
  AC_RUN_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
index 1a13298..15958a7 100644
--- a/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
@@ -1,16 +1,26 @@
+From b916443d43f2e1eeacfbed0033274a0270ef634d Mon Sep 17 00:00:00 2001
+From: Zhiquan Li <zhiquan.li@windriver.com>
+Date: Mon, 16 Nov 2015 10:23:00 +0800
+Subject: [PATCH] snort: 2.9.6.0 -> 2.9.7.5
+
 Upstream-Status:Inappropriate [embedded specific]
 
 fix the below error:
 checking for DAQ_VERDICT_RETRY... configure:
 configure: error: cannot run test program while cross compiling
 
+---
+ configure.in | 34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
 
---- a/configure.in    2015-10-28 10:45:18.174487395 +0800
-+++ b/configure.in    2015-10-28 10:45:47.586485951 +0800
-@@ -734,23 +734,23 @@
+diff --git a/configure.in b/configure.in
+index 2fbd298..62573a8 100644
+--- a/configure.in
++++ b/configure.in
+@@ -734,23 +734,23 @@ have_daq_flow_id="yes"
  #        [DAQ version supports flow ID in header.])
  #fi
-
+ 
 -AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
 -AC_RUN_IFELSE(
 -[AC_LANG_PROGRAM(
@@ -45,7 +55,6 @@ configure: error: cannot run test program while cross compiling
 +#    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
 +#        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
 +#fi
-
+ 
  # any sparc platform has to have this one defined.
  AC_MSG_CHECKING(for sparc)
-
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch b/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
index 9dafe63..79e9f07 100644
--- a/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
@@ -1,3 +1,8 @@
+From a1fdbced4166cb0f35d23b63a59312d86860485a Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <B40290@freescale.com>
+Date: Mon, 4 Nov 2013 10:39:56 +0800
+Subject: [PATCH] snort: add recipe
+
 Upstream-Status: Inappropriate [embedded specific]
 
 fix the below error:
@@ -6,10 +11,15 @@ configure: error: cannot run test program while cross compiling
 
 Signed-off-by: Chunrong Guo <B40290@freescale.com>
 
+---
+ configure.in | 50 ++++++++++++++++----------------------------------
+ 1 file changed, 16 insertions(+), 34 deletions(-)
 
---- a/configure.in	2013-08-21 03:56:17.197414789 -0500
-+++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
-@@ -281,25 +281,7 @@
+diff --git a/configure.in b/configure.in
+index 20d15eb..6fe5d68 100644
+--- a/configure.in
++++ b/configure.in
+@@ -274,25 +274,7 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
  AC_CHECK_TYPES([boolean])
  
  # In case INADDR_NONE is not defined (like on Solaris)
@@ -36,7 +46,7 @@ Signed-off-by: Chunrong Guo <B40290@freescale.com>
  
  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
  #include <stdio.h>
-@@ -397,21 +379,21 @@
+@@ -421,21 +403,21 @@ if test "x$LPCAP" = "xno"; then
    fi
  fi
  
diff --git a/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch b/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch
index 2becc06..0404ea0 100644
--- a/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch
+++ b/meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch
@@ -1,3 +1,8 @@
+From f46d096015d7402a37a59eb66b8f6b7fbf0cdff0 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 24 May 2017 17:38:53 +0800
+Subject: [PATCH] snort: enable static daq
+
 Upstream-Status: Inappropriate [embedded specific]
 
 When enable static daq for snort, it calls to daq-modules-config to get link
@@ -5,7 +10,11 @@ library and library path. Library path is useless for oe and cause host
 contamination issue. So filter it.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/configure.in b/configure.in
 index fded45b..a247bb9 100644
 --- a/configure.in
-- 
2.7.4


