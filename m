Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id A80B0745D8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 21:24:19 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id n10-v6so7571672plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=GKMtkdFJvd/GStj3rfL9jnOp0DuAzsRRt+/7Tm7QGpo=;
	b=h/fcXWSm526rcPhE7Ha6ULtmS4DhusC0ppsEQdP7fSEfXWvQmYLrAY9AeSmQjoXcEO
	dtHWK5POBtg/arElv4yVpkPHXu5JOqBkMyjfCW/n9FQGkJkmRDKQ+QEdpRsXtCKnR2SH
	cOVGm+VcoLGDIMZbItep5MGdpkwtHIR1QHZvHDodDs+kyAC0++LakJlueRvwslVNMAGk
	Pkbaf++c8UhePM0sTOZlkBGI3mF4XnWkerNslSF9ZssL0EsbkFvxvsgChHNBn1IYnPeL
	FilrE67HY/UdLlLVMcMtqUJucAqJ1pCnjXyJptNoDHzXJMb6bsEmHP0kTwEARx/P2epX
	r/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GKMtkdFJvd/GStj3rfL9jnOp0DuAzsRRt+/7Tm7QGpo=;
	b=INeNam4GXP/hSW2xIwQB4x42L7r63GSFphbDF2hYYBnrLmyfL50Vz+Q1SHb2SoXqy+
	sHyKmwFaQTWdSDYpVdnKx/ZDAWmNC2Yz6tFJ5YXwjeYIK2o6+vXUb1IwjNTYdughVUr1
	ttcv0w082qb1e6s36ZFttveUjObe6LuBaszEM6tlgp+geSq7tx+AuA/G2T45E/Na+6T2
	6i3NV7YHZYXxGD8RHIQSGZpNVSf4HCrB4UFsXMQQ4gahh9AG8z8WS8eTz/odT7eJsIMJ
	mHBIzv7gOkK5emrKBgYimHzOGKLB4sG8HCC3AfcVxsd2sKQsLQyojBkI/FvaXC8hre+e
	DYLw==
X-Gm-Message-State: ALKqPweuw3bsNiKxEhnaOph3JdLfY6h6ja3vAYya9nhrB/oI/rta9NSu
	3g20Mcg/YqeNT2zkx1pFIE4SRQ==
X-Google-Smtp-Source: AB8JxZpLjVckUjJdiV6cRGqUCTrVpt91ETf3Ey0aBFcLyuB10u5DSiEPsciOXiRjY/i0tUuRqstrUQ==
X-Received: by 2002:a17:902:6f16:: with SMTP id
	w22-v6mr17653223plk.216.1526851458746; 
	Sun, 20 May 2018 14:24:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:292e:9ff2:c3a4:d8d5])
	by smtp.gmail.com with ESMTPSA id
	s2-v6sm21711754pfb.127.2018.05.20.14.24.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 20 May 2018 14:24:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2018 14:24:15 -0700
Message-Id: <1526851456-17624-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] lvm2: refresh patches
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
X-List-Received-Date: Sun, 20 May 2018 21:24:19 -0000

used quilt to refresh

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Avoid-bashisms-in-init-scripts.patch      | 83 +++++++++++-----------
 ...001-implement-libc-specific-reopen_stream.patch | 29 ++++----
 ...0002-Guard-use-of-mallinfo-with-__GLIBC__.patch | 13 ++--
 ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch | 13 ++--
 .../lvm2/files/0005-do-not-build-manual.patch      | 23 +++---
 5 files changed, 73 insertions(+), 88 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
index e86ab25..5b55111 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-Avoid-bashisms-in-init-scripts.patch
@@ -17,17 +17,17 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  scripts/lvm2_monitoring_init_rhel4            | 4 ++--
  8 files changed, 17 insertions(+), 17 deletions(-)
 
-diff --git a/scripts/blk_availability_init_red_hat.in b/scripts/blk_availability_init_red_hat.in
-index a84ffe7..6b855b7 100644
---- a/scripts/blk_availability_init_red_hat.in
-+++ b/scripts/blk_availability_init_red_hat.in
+Index: LVM2.2.02.177/scripts/blk_availability_init_red_hat.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/blk_availability_init_red_hat.in
++++ LVM2.2.02.177/scripts/blk_availability_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  #
- # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
+ # Copyright (C) 2012-2017 Red Hat, Inc. All rights reserved.
  #
-@@ -53,6 +53,6 @@ case "$1" in
+@@ -51,6 +51,6 @@ case "$1" in
    status)
  	;;
    *)
@@ -35,10 +35,10 @@ index a84ffe7..6b855b7 100644
 +	echo "Usage: $0 {start|stop|status}"
  	;;
  esac
-diff --git a/scripts/clvmd_init_red_hat.in b/scripts/clvmd_init_red_hat.in
-index d7f3392..abc8011 100644
---- a/scripts/clvmd_init_red_hat.in
-+++ b/scripts/clvmd_init_red_hat.in
+Index: LVM2.2.02.177/scripts/clvmd_init_red_hat.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/clvmd_init_red_hat.in
++++ LVM2.2.02.177/scripts/clvmd_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -63,17 +63,17 @@ index d7f3392..abc8011 100644
  	rtrn=2
  	;;
  esac
-diff --git a/scripts/cmirrord_init_red_hat.in b/scripts/cmirrord_init_red_hat.in
-index d4b7e37..d442cbc 100755
---- a/scripts/cmirrord_init_red_hat.in
-+++ b/scripts/cmirrord_init_red_hat.in
+Index: LVM2.2.02.177/scripts/cmirrord_init_red_hat.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/cmirrord_init_red_hat.in
++++ LVM2.2.02.177/scripts/cmirrord_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  #
  # chkconfig: - 22 78
  # description: Starts and stops cmirrord
-@@ -101,7 +101,7 @@ case "$1" in
+@@ -103,7 +103,7 @@ case "$1" in
  		;;
  
  	*)
@@ -82,15 +82,15 @@ index d4b7e37..d442cbc 100755
  		;;
  esac
  
-diff --git a/scripts/lvm2_cluster_activation_red_hat.sh.in b/scripts/lvm2_cluster_activation_red_hat.sh.in
-index abea026..d8cba2e 100644
---- a/scripts/lvm2_cluster_activation_red_hat.sh.in
-+++ b/scripts/lvm2_cluster_activation_red_hat.sh.in
+Index: LVM2.2.02.177/scripts/lvm2_cluster_activation_red_hat.sh.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/lvm2_cluster_activation_red_hat.sh.in
++++ LVM2.2.02.177/scripts/lvm2_cluster_activation_red_hat.sh.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
- sbindir=@sbindir@
+ sbindir="@SBINDIR@"
  
 @@ -54,7 +54,7 @@ case "$1" in
  	rtrn=$?
@@ -101,17 +101,17 @@ index abea026..d8cba2e 100644
  	rtrn=3
  	;;
  esac
-diff --git a/scripts/lvm2_lvmetad_init_red_hat.in b/scripts/lvm2_lvmetad_init_red_hat.in
-index b2f5d50..96269a9 100644
---- a/scripts/lvm2_lvmetad_init_red_hat.in
-+++ b/scripts/lvm2_lvmetad_init_red_hat.in
+Index: LVM2.2.02.177/scripts/lvm2_lvmetad_init_red_hat.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/lvm2_lvmetad_init_red_hat.in
++++ LVM2.2.02.177/scripts/lvm2_lvmetad_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  #
- # Copyright (C) 2012 Red Hat, Inc. All rights reserved.
+ # Copyright (C) 2012-2017 Red Hat, Inc. All rights reserved.
  #
-@@ -105,7 +105,7 @@ case "$1" in
+@@ -103,7 +103,7 @@ case "$1" in
  	;;
  
    *)
@@ -120,17 +120,17 @@ index b2f5d50..96269a9 100644
  	;;
  esac
  
-diff --git a/scripts/lvm2_lvmpolld_init_red_hat.in b/scripts/lvm2_lvmpolld_init_red_hat.in
-index c521955..cdbaece 100644
---- a/scripts/lvm2_lvmpolld_init_red_hat.in
-+++ b/scripts/lvm2_lvmpolld_init_red_hat.in
+Index: LVM2.2.02.177/scripts/lvm2_lvmpolld_init_red_hat.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/lvm2_lvmpolld_init_red_hat.in
++++ LVM2.2.02.177/scripts/lvm2_lvmpolld_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  #
  # Copyright (C) 2015 Red Hat, Inc. All rights reserved.
  #
-@@ -107,7 +107,7 @@ case "$1" in
+@@ -105,7 +105,7 @@ case "$1" in
  	;;
  
    *)
@@ -139,17 +139,17 @@ index c521955..cdbaece 100644
  	;;
  esac
  
-diff --git a/scripts/lvm2_monitoring_init_red_hat.in b/scripts/lvm2_monitoring_init_red_hat.in
-index de7ff0d..9ff6bb7 100644
---- a/scripts/lvm2_monitoring_init_red_hat.in
-+++ b/scripts/lvm2_monitoring_init_red_hat.in
+Index: LVM2.2.02.177/scripts/lvm2_monitoring_init_red_hat.in
+===================================================================
+--- LVM2.2.02.177.orig/scripts/lvm2_monitoring_init_red_hat.in
++++ LVM2.2.02.177/scripts/lvm2_monitoring_init_red_hat.in
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  #
  # Copyright (C) 2007-2009 Red Hat, Inc. All rights reserved.
  #
-@@ -128,7 +128,7 @@ case "$1" in
+@@ -127,7 +127,7 @@ case "$1" in
  	;;
  
    *)
@@ -158,10 +158,10 @@ index de7ff0d..9ff6bb7 100644
  	;;
  esac
  
-diff --git a/scripts/lvm2_monitoring_init_rhel4 b/scripts/lvm2_monitoring_init_rhel4
-index 8eb06c5..2e8d0f7 100644
---- a/scripts/lvm2_monitoring_init_rhel4
-+++ b/scripts/lvm2_monitoring_init_rhel4
+Index: LVM2.2.02.177/scripts/lvm2_monitoring_init_rhel4
+===================================================================
+--- LVM2.2.02.177.orig/scripts/lvm2_monitoring_init_rhel4
++++ LVM2.2.02.177/scripts/lvm2_monitoring_init_rhel4
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -177,6 +177,3 @@ index 8eb06c5..2e8d0f7 100644
  	;;
  esac
  
--- 
-2.12.0
-
diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index 5d72402..bb582ed 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -19,11 +19,11 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  tools/lvmcmdline.c | 6 +++---
  2 files changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/lib/log/log.c b/lib/log/log.c
-index c933154..3581084 100644
---- a/lib/log/log.c
-+++ b/lib/log/log.c
-@@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
+Index: LVM2.2.02.177/lib/log/log.c
+===================================================================
+--- LVM2.2.02.177.orig/lib/log/log.c
++++ LVM2.2.02.177/lib/log/log.c
+@@ -161,6 +161,7 @@ static void _check_and_replace_standard_
   * Close and reopen standard stream on file descriptor fd.
   */
  int reopen_standard_stream(FILE **stream, const char *mode)
@@ -31,7 +31,7 @@ index c933154..3581084 100644
  {
  	int fd, fd_copy, new_fd;
  	const char *name;
-@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
+@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream
  	*stream = new_stream;
  	return 1;
  }
@@ -43,11 +43,11 @@ index c933154..3581084 100644
  
  void init_log_fn(lvm2_log_fn_t log_fn)
  {
-diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 9a4deb7..f1f18e6 100644
---- a/tools/lvmcmdline.c
-+++ b/tools/lvmcmdline.c
-@@ -1818,7 +1818,7 @@ static int _check_standard_fds(void)
+Index: LVM2.2.02.177/tools/lvmcmdline.c
+===================================================================
+--- LVM2.2.02.177.orig/tools/lvmcmdline.c
++++ LVM2.2.02.177/tools/lvmcmdline.c
+@@ -3095,7 +3095,7 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -56,7 +56,7 @@ index 9a4deb7..f1f18e6 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -1828,7 +1828,7 @@ static int _check_standard_fds(void)
+@@ -3105,7 +3105,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -65,7 +65,7 @@ index 9a4deb7..f1f18e6 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -1836,7 +1836,7 @@ static int _check_standard_fds(void)
+@@ -3113,7 +3113,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
@@ -74,6 +74,3 @@ index 9a4deb7..f1f18e6 100644
  		printf("stderr stream open: %s\n",
  		       strerror(errno));
  		return 0;
--- 
-2.12.0
-
diff --git a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
index 95dcede..ce8a97a 100644
--- a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
+++ b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
@@ -12,11 +12,11 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  lib/mm/memlock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
-index da90144..f34f890 100644
---- a/lib/mm/memlock.c
-+++ b/lib/mm/memlock.c
-@@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
+Index: LVM2.2.02.177/lib/mm/memlock.c
+===================================================================
+--- LVM2.2.02.177.orig/lib/mm/memlock.c
++++ LVM2.2.02.177/lib/mm/memlock.c
+@@ -151,7 +151,7 @@ static void _touch_memory(void *mem, siz
  
  static void _allocate_memory(void)
  {
@@ -25,6 +25,3 @@ index da90144..f34f890 100644
  	void *stack_mem;
  	struct rlimit limit;
  	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
--- 
-2.12.0
-
diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index aaeaa72..425ba74 100644
--- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -21,11 +21,11 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  configure.in | 1 -
  1 file changed, 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index cc77aab..a3579f2 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1853,7 +1853,6 @@ if test "$UDEV_SYNC" = yes; then
+Index: LVM2.2.02.177/configure.in
+===================================================================
+--- LVM2.2.02.177.orig/configure.in
++++ LVM2.2.02.177/configure.in
+@@ -1870,7 +1870,6 @@ if test "$BUILD_DMFILEMAPD" = yes; then
  fi
  
  ################################################################################
@@ -33,6 +33,3 @@ index cc77aab..a3579f2 100644
  
  if test -n "$MODPROBE_CMD"; then
  	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index 15aa9f5..01477e0 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  configure.in | 1 -
  2 files changed, 2 insertions(+), 3 deletions(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 31d428d..24f89a2 100644
---- a/Makefile.in
-+++ b/Makefile.in
+Index: LVM2.2.02.177/Makefile.in
+===================================================================
+--- LVM2.2.02.177.orig/Makefile.in
++++ LVM2.2.02.177/Makefile.in
 @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -32,7 +32,7 @@ index 31d428d..24f89a2 100644
  
  ifeq ("@UDEV_RULES@", "yes")
    SUBDIRS += udev
-@@ -69,7 +69,7 @@ liblvm.device-mapper: include.device-mapper
+@@ -69,7 +69,7 @@ liblvm.device-mapper: include.device-map
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
  scripts.device-mapper: include.device-mapper
@@ -41,11 +41,11 @@ index 31d428d..24f89a2 100644
  
  ifeq ("@INTL@", "yes")
  lib.pofile: include.pofile
-diff --git a/configure.in b/configure.in
-index 1dc8819..108ace4 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2213,7 +2213,6 @@ libdm/Makefile
+Index: LVM2.2.02.177/configure.in
+===================================================================
+--- LVM2.2.02.177.orig/configure.in
++++ LVM2.2.02.177/configure.in
+@@ -2216,7 +2216,6 @@ libdm/Makefile
  libdm/libdevmapper.pc
  liblvm/Makefile
  liblvm/liblvm2app.pc
@@ -53,6 +53,3 @@ index 1dc8819..108ace4 100644
  po/Makefile
  python/Makefile
  python/setup.py
--- 
-2.8.1
-
-- 
2.7.4


