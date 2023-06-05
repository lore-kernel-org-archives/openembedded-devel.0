Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BAFC7EE2F
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2110.1685951605228143629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="119509692"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="119509692"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55C2DC3F8B
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:20 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 935E5CF7C7
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id ABED12FC80F4;
	Mon,  5 Jun 2023 16:53:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ntp: upgrade 4.2.8p15 -> 4.2.8p16
Date: Mon,  5 Jun 2023 15:52:53 +0800
Message-Id: <1685951589-29920-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10--4.533500-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/ya+/qoWUv5IZIm2Js0m7E8IPdZmyx8xAa7iR
	FJnWDxkl1jypNY0wtaZ2tzv2inTHJK9seS6bKQcjgvmNrsT46HIWjdLJd+hcy9pSUoaJ2MP7Fh6
	PQbSDQ8HcGqNrS/CXV71qVJYa44rGRY1tl9vG/AY/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bl9k8VRsVgnBqiMwzOT3Gqj0bHiXcsS9fJVRzPxemJL0MVVFhl7NwvPMB0kPsl40w4/MV
	Y+TBf96/3aZZ1IBbSHA4IYL5RT7tUwYXRRr2ymnhdD+G7U5X/SMSSRwPipYkDP3WYNhkszllfC3
	WuSrCNQg9KDk3s1y5Gflw4AzXM+a+hXRTxZ/g15vTnqYKYXTRlXgGeVUh3WdmyiLZetSf8lBgw5
	G4NYCZN9pjzubZ2rHJ0RPnyOnrZJV4eMv8lJClyPTTisrg9DalY/e4zcNRmEyOVPLDNBdiKKXco
	U+lL8+9Mo/xo2b0Qfk0oIH+vSdS5IbypB0R00wROULoh6iVyBLv5Eyr/YIrqsDhztRXZ9Cm+LY9
	A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103109

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch
refreshed for new version.

Changelog
=========
- fixes 4 vulnerabilities (3 LOW and 1 None severity),
- fixes 46 bugs
- includes 15 general improvements
- adds support for OpenSSL-3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...o-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 23 ++++++++++---------
 ...ith-new-compiler-defaults-to-fno-com.patch | 16 +++----------
 ...ducibility-fixed-path-to-posix-shell.patch | 17 +++++++++++---
 .../ntp/{ntp_4.2.8p15.bb => ntp_4.2.8p16.bb}  |  4 ++--
 4 files changed, 31 insertions(+), 29 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p15.bb => ntp_4.2.8p16.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch b/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
index 372938c6d6..d61a6e70b8 100644
--- a/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
+++ b/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
@@ -10,23 +10,24 @@ or 64Kb set by ntp should be good in glibc these days.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  libntp/work_thread.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libntp/work_thread.c b/libntp/work_thread.c
-index 03a5647..3ddd751 100644
+index c1fe5c2..21db4a0 100644
 --- a/libntp/work_thread.c
 +++ b/libntp/work_thread.c
-@@ -41,7 +41,7 @@
- #ifndef THREAD_MINSTACKSIZE
- # define THREAD_MINSTACKSIZE	(64U * 1024)
- #endif
--#ifndef __sun
-+#if !defined(__sun) && !defined(__GLIBC__)
- #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
- # undef THREAD_MINSTACKSIZE
- # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
+@@ -598,7 +598,7 @@ start_blocking_thread_internal(
+ 		/* now clamp on lower stack limit. */
+ 		if (nstacksize < THREAD_MINSTACKSIZE)
+ 			nstacksize = THREAD_MINSTACKSIZE;
+-#            ifdef PTHREAD_STACK_MIN
++#            ifdef PTHREAD_STACK_MIN && !defined(__GLIBC__)
+ 		if (nstacksize < PTHREAD_STACK_MIN)
+ 			nstacksize = PTHREAD_STACK_MIN;
+ #            endif
 -- 
-2.32.0
+2.34.1
 
diff --git a/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch b/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch
index 42e1efd8be..24019e974b 100644
--- a/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch
+++ b/meta-networking/recipes-support/ntp/ntp/0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch
@@ -5,12 +5,12 @@ Subject: [PATCH] test: Fix build with new compiler defaults to -fno-common
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  sntp/tests/run-packetHandling.c | 2 +-
  sntp/tests/run-t-log.c          | 2 +-
  sntp/tests/run-utilities.c      | 2 +-
- tests/libntp/test-libntp.h      | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/sntp/tests/run-packetHandling.c b/sntp/tests/run-packetHandling.c
 index 7790b20..c58380c 100644
@@ -51,16 +51,6 @@ index f717882..98d9bf1 100644
  
  
  //=======MAIN=====
-diff --git a/tests/libntp/test-libntp.h b/tests/libntp/test-libntp.h
-index 93050b3..60461d8 100644
---- a/tests/libntp/test-libntp.h
-+++ b/tests/libntp/test-libntp.h
-@@ -5,4 +5,4 @@
- 
- time_t timefunc(time_t *ptr);
- void settime(int y, int m, int d, int H, int M, int S);
--time_t nowtime;
-+extern time_t nowtime;
 -- 
-2.32.0
+2.34.1
 
diff --git a/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch b/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
index 571db75f7c..1961ada9b6 100644
--- a/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
+++ b/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
@@ -1,9 +1,17 @@
---- ntp-4.2.8p12.original/sntp/libopts/m4/libopts.m4	2018-11-12 17:54:57.747220846 +1300
-+++ ntp-4.2.8p12/sntp/libopts/m4/libopts.m4	2018-11-12 18:00:50.626211641 +1300
-@@ -114,12 +114,6 @@
+reproducibility fixed path to posixshell
+---
+ sntp/libopts/m4/libopts.m4 | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/sntp/libopts/m4/libopts.m4 b/sntp/libopts/m4/libopts.m4
+index 23738ca..4e18187 100644
+--- a/sntp/libopts/m4/libopts.m4
++++ b/sntp/libopts/m4/libopts.m4
+@@ -107,13 +107,6 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
    AC_PROG_SED
    [while :
    do
+-      test -x "$POSIX_SHELL" && break
 -      POSIX_SHELL=`which bash`
 -      test -x "$POSIX_SHELL" && break
 -      POSIX_SHELL=`which dash`
@@ -13,3 +21,6 @@
        POSIX_SHELL=`/bin/sh -c '
            exec 2>/dev/null
            if ! true ; then exit 1 ; fi
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p16.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p16.bb
index 5d2f05e925..8899f1254c 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p16.bb
@@ -6,7 +6,7 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "net"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4190b39435611e92a4da74e682623f19"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a8ffebbcad335abf2c39fec38671eec"
 
 DEPENDS = "libevent"
 
@@ -24,7 +24,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
+SRC_URI[sha256sum] = "5225858bfd843b080fb9daa5b7370519130e5e49ac3eb0371e334bdc06c52dd7"
 
 # CVE-2016-9312 is only for windows.
 # CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without breaking compatibility
-- 
2.34.1


