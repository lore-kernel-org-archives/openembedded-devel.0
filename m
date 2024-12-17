Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D144E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.77392.1734426114321450172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dh0sOkLx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426116; x=1765962116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bRrqMKKHbggf1F2ct2THC2Fl9lnFMAOyBYmTRHCGlpI=;
  b=Dh0sOkLxxwTEgQ3fv2B/h4Hzc83Ge7uH8TFyXcSbuHjaFR9MzeAzFbLy
   IfUe7SE9A/dH5AfheqPxKmz6rJyHezTY/yN02daEJO/zSoZ/LnUs6Y3hT
   xFo5m1NZjB4yya6hQeXekDr1F+o+mPUPZGnz5U0wYitJHGq0KJWgGc1fP
   CBZFlxpXcfyehY2GwZ8wHR8UODRiHPNdPb/v0BiP4chKqKFFKR9xaR/NO
   3fD9eawpvKC9jvLeCYNr5m4IyumfMpZddE6vs55s20lJf7e3MEXuKZEai
   nrgi8yikkoGHFroYUFD/d5fw9ii2WCdqCbHKQTmzTMrjmG1Lz4nOlJE9H
   g==;
X-CSE-ConnectionGUID: /oeLs18dQqaT/lTVeEz2dg==
X-CSE-MsgGUID: Qx7hkfzTRzW+2HWsVWtdiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953821"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953821"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D8D9BD4809
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ACE42D6FED
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48BBB2007C3F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E47971A000B;
	Tue, 17 Dec 2024 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/17] lvm2: update 2.03.28 -> 2.03.29
Date: Tue, 17 Dec 2024 17:01:28 +0800
Message-Id: <1734426096-18300-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--8.204500-10.000000
X-TMASE-MatchedRID: IAz7A8n5doul1LO5A+/VNvCCu8kVj0TRltF+xW+zhUh/iZ1aNsYG7oFa
	KsEtPT2WQIx1mjEkvEHVGk64c676Zg2FaYuMfXGoqdwbW9Wx9tCn+3FyDwEJ8+Tna+alE0sL0u0
	mlMV3QjJbGM5QOQjnIJ6AzGUG6rEJSk6y+wvyFnQ5ZRbFNAl0j67YaZ2V2aJQrCVi9ZUPzOPtb2
	IIDsdQC/d++qp3fg8+cDZlFhLZz7yRmYpU4vHLUvx0ykrbAxjCRzUPAqhCjtikob0Y35+HFL8FH
	rw7frlu6wgz8PTKAFhXZr7E3iPCCSJcv5X7ObmJDDzmS9l9fYr1IQ6BgW4YCmtEzrC9eANpE0o8
	W+GU3zCBbuQ8kIeEipWsIgElkwYDTBhdFGvbKae4scQ0aX7cDxn2SJm936gEb3Wpj9NSXKyC/h2
	Na8PvsLGPvJ0fdHc79aVm/JNjZZW7Ju8OQhqUYBlxrtI3TxRkwB8CBqAcJuWbKItl61J/yZ+inT
	K0bC9eKrauXd3MZDXmZhW4HZmSUrKxuYNr88tReD0iwy4RmC11ngxxarMpw3d0Z3mq1+gq
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114360

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
removed since it's included in 2.03.29

Changelog:
===========
* Fix renaming of raid sub LVs when converting a volume to raid (2.03.28).
* Fix segfault/VG write error for raid LV 'lvextend -i|--stripes -I|--stripesize'.
* Add configure --enable/disable-sd-notify to control lvmlockd build with sd-notify.
* Allow test mode when lvmlockd is built without dlm support.
* Add a note about RAID + integrity synchronization to lvmraid(7) man page.
* Add a function for running lvconvert --repair on RAID LVs to lvmdbusd.
* Improve option section of man pages for listing commands ({pv,lv,vg}{s,display}).
* And some cleanup mostly in test code.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...mplement-libc-specific-reopen_stream.patch | 12 ++--
 ...tweak-MODPROBE_CMD-for-cross-compile.patch |  6 +-
 .../lvm2/files/0005-do-not-build-manual.patch |  6 +-
 meta-oe/recipes-support/lvm2/lvm2.bb          |  1 -
 meta-oe/recipes-support/lvm2/lvm2.inc         |  4 +-
 ...findmnt-bin-lsblk-bin-sort-not-found.patch | 70 -------------------
 6 files changed, 14 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index 196de644cc..c14c64ced6 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -1,4 +1,4 @@
-From e2f24ea066e6dfb9f13f623009034acbf4ae8818 Mon Sep 17 00:00:00 2001
+From 7c3b869e77da17a89df69671cdf069a59a93d6e4 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 25 Oct 2016 11:49:40 +0000
 Subject: [PATCH] implement libc specific reopen_stream
@@ -21,7 +21,7 @@ Upstream-Status: Pending
  2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/lib/log/log.c b/lib/log/log.c
-index eafb3ef1c..ff3d751bf 100644
+index 90905e629..ed69662d0 100644
 --- a/lib/log/log.c
 +++ b/lib/log/log.c
 @@ -165,6 +165,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
@@ -45,10 +45,10 @@ index eafb3ef1c..ff3d751bf 100644
  void init_log_fn(lvm2_log_fn_t log_fn)
  {
 diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 1b2f7f47c..e0674d42d 100644
+index be50473c8..aec6487b6 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3378,7 +3378,7 @@ static int _check_standard_fds(void)
+@@ -3393,7 +3393,7 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -57,7 +57,7 @@ index 1b2f7f47c..e0674d42d 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3388,7 +3388,7 @@ static int _check_standard_fds(void)
+@@ -3403,7 +3403,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -66,7 +66,7 @@ index 1b2f7f47c..e0674d42d 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3396,7 +3396,7 @@ static int _check_standard_fds(void)
+@@ -3411,7 +3411,7 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index 6435c3fd92..a8e1dfcb3f 100644
--- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From b30f842d5d200a8217a47465d6cdd99d3805ba76 Mon Sep 17 00:00:00 2001
+From a52b50cf47e4b7fc2a1a27d6e35a26d03e2abed6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 31 Jul 2018 15:04:29 +0800
 Subject: [PATCH] tweak MODPROBE_CMD for cross compile
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c8d81e16c..7c1c04627 100644
+index 3604fca06..167587d09 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1689,8 +1689,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
+@@ -1707,8 +1707,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
  ])
  
  ################################################################################
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index e7aaad4d0e..862cda8ed6 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -1,4 +1,4 @@
-From e0e06b77e067da6a01dd9b0d5582a0a1709c655d Mon Sep 17 00:00:00 2001
+From 0c02c24208afec03aa34839cb3e102fb1c15a9c9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 26 Nov 2018 14:59:55 +0800
 Subject: [PATCH] do not build manual
@@ -57,10 +57,10 @@ index 06c4b1823..90df7b09c 100644
  
  ifeq ("@INTL@", "yes")
 diff --git a/configure.ac b/configure.ac
-index 7c1c04627..5364dd68e 100644
+index 167587d09..557738497 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2022,7 +2022,6 @@ libdaemon/server/Makefile
+@@ -2041,7 +2041,6 @@ libdaemon/server/Makefile
  libdm/Makefile
  libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-support/lvm2/lvm2.bb
index ccf9c380fe..f569424e27 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2.bb
@@ -1,7 +1,6 @@
 require lvm2.inc
 
 SRC_URI += " \
-            file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
             file://tweak-for-lvmdbusd.patch \
            "
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 0fab88f393..030ce938cc 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,9 +18,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "f87a6ad6d6f7cde0170fd479a45ee5b0a1c63d52"
+SRCREV = "32cfcfd151d49c4e1876a455072c593ad11eaccf"
 S = "${WORKDIR}/git"
-PV = "2.03.28"
+PV = "2.03.29"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
deleted file mode 100644
index 96a3d64fdf..0000000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 2ff2a867db8d3e1c660d191a1805f9e355169c80 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 2 Mar 2021 01:33:05 -0800
-Subject: [PATCH] fix command /bin/findmnt, /bin/lsblk, /bin/sort not found
-
-In oe-core (util-linux and coreutils), the commands locates in
-${bindir} rather than /bin, add BINDIR to configure it
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac                | 3 +++
- scripts/blkdeactivate.sh.in | 7 ++++---
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d9e7964c3..9dfdcfe01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1704,6 +1704,8 @@ AS_IF([test -n "$MODPROBE_CMD"], [
- 
- SYSCONFDIR="$(eval echo $(eval echo $sysconfdir))"
- 
-+BINDIR="$(eval echo $(eval echo $bindir))"
-+
- SBINDIR="$(eval echo $(eval echo $sbindir))"
- LVM_PATH="$SBINDIR/lvm"
- AC_DEFINE_UNQUOTED(LVM_PATH, ["$LVM_PATH"], [Path to lvm binary.])
-@@ -1944,6 +1946,7 @@ AC_SUBST(PYTHON2DIR)
- AC_SUBST(PYTHON3)
- AC_SUBST(PYTHON3DIR)
- AC_SUBST(RT_LIBS)
-+AC_SUBST(BINDIR)
- AC_SUBST(SBINDIR)
- AC_SUBST(SELINUX_LIBS)
- AC_SUBST(SELINUX_PC)
-diff --git a/scripts/blkdeactivate.sh.in b/scripts/blkdeactivate.sh.in
-index 7c517b87b..7ef1bb766 100644
---- a/scripts/blkdeactivate.sh.in
-+++ b/scripts/blkdeactivate.sh.in
-@@ -42,13 +42,14 @@ VDO="/bin/vdo"
- 
- sbindir="@SBINDIR@"
- DMSETUP="$sbindir/dmsetup"
-+bindir="@BINDIR@"
- LVM="$sbindir/lvm"
- 
- if "$UMOUNT" --help | grep -- "--all-targets" >"$DEV_DIR/null"; then
- 	UMOUNT_OPTS="--all-targets "
- else
- 	UMOUNT_OPTS=""
--	FINDMNT="/bin/findmnt -r --noheadings -u -o TARGET"
-+	FINDMNT="$bindir/findmnt -r --noheadings -u -o TARGET"
- 	FINDMNT_READ="read -r mnt"
- fi
- DMSETUP_OPTS=""
-@@ -57,10 +58,10 @@ MDADM_OPTS=""
- MPATHD_OPTS=""
- VDO_OPTS=""
- 
--LSBLK="/bin/lsblk -r --noheadings -o TYPE,KNAME,NAME,MOUNTPOINT"
-+LSBLK="$bindir/lsblk -r --noheadings -o TYPE,KNAME,NAME,MOUNTPOINT"
- LSBLK_VARS="local devtype local kname local name local mnt"
- LSBLK_READ="read -r devtype kname name mnt"
--SORT_MNT="/bin/sort -r -u -k 4"
-+SORT_MNT="$bindir/sort -r -u -k 4"
- 
- # Do not show tool errors by default (only done/skipping summary
- # message provided by this script) and no verbose mode by default.
-- 
2.43.0


