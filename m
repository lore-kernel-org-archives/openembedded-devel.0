Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 1427 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 Nov 2017 18:38:00 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 7E46571AC5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Nov 2017 18:38:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 39EE347F946
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Nov 2017 19:08:22 +0100 (CET)
X-Originating-IP: 50.37.84.26
Received: from xps13.bob (50-37-84-26.mscw.id.frontiernet.net [50.37.84.26])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 63990C5A5C;
	Sat, 18 Nov 2017 19:08:18 +0100 (CET)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Nov 2017 10:07:36 -0800
Message-Id: <20171118180736.6230-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-networking][PATCH] chrony: Update to version 3.2
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
X-List-Received-Date: Sat, 18 Nov 2017 18:38:00 -0000

Signed-of-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../recipes-support/chrony/chrony/arm_eabi.patch   | 36 +++++++++++++---------
 .../chrony/{chrony_2.4.bb => chrony_3.2.bb}        |  6 ++--
 2 files changed, 24 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_2.4.bb => chrony_3.2.bb} (96%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index d1586bba4..92a2dbd93 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -1,48 +1,54 @@
     chrony: fix build failure for arma9
-    
+
     Eliminate references to syscalls not available
     for ARM_EABI.  Also add a dependency on libseccomp
     which is needed for scfilter to work.
-    
+
     Set PACKAGECONFIG to not enable scfilter, since
     kernel CONFIG_SECCOMP is unlikely to be set.  This
     aligns the usage of libseccomp with that of other packages.
 
     Upstream-Status: Pending
-    
+
     Signed-off-by: Joe Slater <jslater@windriver.com>
 
+    Refresh patch for new upstream version.
+
+    Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -453,13 +453,12 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -465,14 +465,14 @@ SYS_Linux_EnableSystemCallFilter(int lev
    const int syscalls[] = {
      /* Clock */
-     SCMP_SYS(adjtimex), SCMP_SYS(gettimeofday), SCMP_SYS(settimeofday),
--    SCMP_SYS(time),
+     SCMP_SYS(adjtimex), SCMP_SYS(clock_gettime), SCMP_SYS(gettimeofday),
+-    SCMP_SYS(settimeofday), SCMP_SYS(time),
++    SCMP_SYS(settimeofday),
      /* Process */
--    SCMP_SYS(clone), SCMP_SYS(exit), SCMP_SYS(exit_group), SCMP_SYS(getrlimit),
-+    SCMP_SYS(clone), SCMP_SYS(exit), SCMP_SYS(exit_group),
-     SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn), SCMP_SYS(rt_sigprocmask),
-     SCMP_SYS(set_tid_address), SCMP_SYS(sigreturn), SCMP_SYS(wait4),
+     SCMP_SYS(clone), SCMP_SYS(exit), SCMP_SYS(exit_group), SCMP_SYS(getpid),
+-    SCMP_SYS(getrlimit), SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn),
++    SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn),
+     SCMP_SYS(rt_sigprocmask), SCMP_SYS(set_tid_address), SCMP_SYS(sigreturn),
+     SCMP_SYS(wait4),
      /* Memory */
 -    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap), SCMP_SYS(mmap2),
 +    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap2),
      SCMP_SYS(mprotect), SCMP_SYS(mremap), SCMP_SYS(munmap), SCMP_SYS(shmdt),
      /* Filesystem */
      SCMP_SYS(access), SCMP_SYS(chmod), SCMP_SYS(chown), SCMP_SYS(chown32),
-@@ -470,14 +469,21 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -483,14 +483,21 @@
      SCMP_SYS(bind), SCMP_SYS(connect), SCMP_SYS(getsockname),
-     SCMP_SYS(recvfrom), SCMP_SYS(recvmsg), SCMP_SYS(sendmmsg),
-     SCMP_SYS(sendmsg), SCMP_SYS(sendto),
+     SCMP_SYS(recvfrom), SCMP_SYS(recvmmsg), SCMP_SYS(recvmsg),
+     SCMP_SYS(sendmmsg), SCMP_SYS(sendmsg), SCMP_SYS(sendto),
 -    /* TODO: check socketcall arguments */
 -    SCMP_SYS(socketcall),
      /* General I/O */
-     SCMP_SYS(_newselect), SCMP_SYS(close), SCMP_SYS(open), SCMP_SYS(pipe),
+     SCMP_SYS(_newselect), SCMP_SYS(close), SCMP_SYS(open), SCMP_SYS(openat), SCMP_SYS(pipe),
 -    SCMP_SYS(poll), SCMP_SYS(read), SCMP_SYS(futex), SCMP_SYS(select),
 +    SCMP_SYS(poll), SCMP_SYS(read), SCMP_SYS(futex),
      SCMP_SYS(set_robust_list), SCMP_SYS(write),
      /* Miscellaneous */
-     SCMP_SYS(uname),
+     SCMP_SYS(getrandom), SCMP_SYS(sysinfo), SCMP_SYS(uname),
 +    /* not always available */
 +#if ! defined(__ARM_EABI__)
 +    SCMP_SYS(time),
diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_3.2.bb
similarity index 96%
rename from meta-networking/recipes-support/chrony/chrony_2.4.bb
rename to meta-networking/recipes-support/chrony/chrony_3.2.bb
index 71431f4b7..8b90a354e 100644
--- a/meta-networking/recipes-support/chrony/chrony_2.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_3.2.bb
@@ -25,7 +25,7 @@ This recipe produces two binary packages: 'chrony' which contains chronyd, \
 the configuration file and the init script, and 'chronyc' which contains \
 the client program only."
 
-HOMEPAGE = "http://chrony.tuxfamily.org/"
+HOMEPAGE = "https://chrony.tuxfamily.org/"
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -35,8 +35,8 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chronyd \
     file://arm_eabi.patch \
 "
-SRC_URI[md5sum] = "d0598aa8a9be8faccef9386f6fc0d5f2"
-SRC_URI[sha256sum] = "8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
+SRC_URI[md5sum] = "f4c4eb0dc92f35ee4bb7d3dcd8029ecb"
+SRC_URI[sha256sum] = "329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116"
 
 DEPENDS = "pps-tools"
 
-- 
2.13.6


