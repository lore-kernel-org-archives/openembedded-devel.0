Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by mail.openembedded.org (Postfix) with ESMTP id 2953E789BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 15:56:20 +0000 (UTC)
X-Originating-IP: 50.37.92.54
Received: from xps13.localdomain (50-37-92-54.mscw.id.frontiernet.net
	[50.37.92.54]) (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B09C31C0008;
	Sun, 13 May 2018 17:56:20 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 May 2018 08:56:03 -0700
Message-Id: <20180513155603.27888-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.1
X-Spam-Level: 
Subject: [meta-networking][PATCH] chrony: Update to version 3.3
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
X-List-Received-Date: Sun, 13 May 2018 15:56:21 -0000

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../recipes-support/chrony/chrony/arm_eabi.patch        | 17 +++++++++++++----
 .../chrony/{chrony_3.2.bb => chrony_3.3.bb}             |  4 ++--
 2 files changed, 15 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_3.2.bb => chrony_3.3.bb} (97%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 92a2dbd93..9f943cdce 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -1,4 +1,7 @@
-    chrony: fix build failure for arma9
+From 9ca48a6fef1da1bb0dd67ab94256c7e240da1834 Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Thu, 9 Mar 2017 10:58:06 -0800
+Subject: [PATCH]     chrony: fix build failure for arma9
 
     Eliminate references to syscalls not available
     for ARM_EABI.  Also add a dependency on libseccomp
@@ -16,9 +19,15 @@
 
     Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
 
+---
+ sys_linux.c | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/sys_linux.c b/sys_linux.c
+index f4b532d..d05fa24 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -465,14 +465,14 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -482,14 +482,14 @@ SYS_Linux_EnableSystemCallFilter(int level)
    const int syscalls[] = {
      /* Clock */
      SCMP_SYS(adjtimex), SCMP_SYS(clock_gettime), SCMP_SYS(gettimeofday),
@@ -36,8 +45,8 @@
      SCMP_SYS(mprotect), SCMP_SYS(mremap), SCMP_SYS(munmap), SCMP_SYS(shmdt),
      /* Filesystem */
      SCMP_SYS(access), SCMP_SYS(chmod), SCMP_SYS(chown), SCMP_SYS(chown32),
-@@ -483,14 +483,21 @@
-     SCMP_SYS(bind), SCMP_SYS(connect), SCMP_SYS(getsockname),
+@@ -500,14 +500,21 @@ SYS_Linux_EnableSystemCallFilter(int level)
+     SCMP_SYS(bind), SCMP_SYS(connect), SCMP_SYS(getsockname), SCMP_SYS(getsockopt),
      SCMP_SYS(recvfrom), SCMP_SYS(recvmmsg), SCMP_SYS(recvmsg),
      SCMP_SYS(sendmmsg), SCMP_SYS(sendmsg), SCMP_SYS(sendto),
 -    /* TODO: check socketcall arguments */
diff --git a/meta-networking/recipes-support/chrony/chrony_3.2.bb b/meta-networking/recipes-support/chrony/chrony_3.3.bb
similarity index 97%
rename from meta-networking/recipes-support/chrony/chrony_3.2.bb
rename to meta-networking/recipes-support/chrony/chrony_3.3.bb
index 8b90a354e..2586370fa 100644
--- a/meta-networking/recipes-support/chrony/chrony_3.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_3.3.bb
@@ -35,8 +35,8 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chronyd \
     file://arm_eabi.patch \
 "
-SRC_URI[md5sum] = "f4c4eb0dc92f35ee4bb7d3dcd8029ecb"
-SRC_URI[sha256sum] = "329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116"
+SRC_URI[md5sum] = "81ab62cf5d60b4b3fa8cd2c1b267ffd9"
+SRC_URI[sha256sum] = "0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128"
 
 DEPENDS = "pps-tools"
 
-- 
2.16.1


