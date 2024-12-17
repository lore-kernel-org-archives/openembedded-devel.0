Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6EEE7718A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.77393.1734426114325523771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J8WyNzTP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426114; x=1765962114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NR47E36JwJFgYbwhVIWgHqnoFNe8g0a3Ps3wYOE8IuI=;
  b=J8WyNzTP6OvHZfD80FeLN5i5NdhKC17wRWiwBEfGb0CZU1qWalKuQA/E
   lvijIGDFTCOmeHbqNoYiPxina8skGQS1amhC8jY58sk2VubO/Jo8fRMkE
   p2T1x+BxyLB8J3imPGwuS7Upn/2yM6lZfrJnlf4Y/5wcS1XMjHYgpiCb6
   OO0yE3vGBmloE88nPj3meQOIPsrwweg7Ejr4Syssh7h174K7xy5oUX5Ni
   rgU9uOBLePusWUyi6dfqn1y2juVMp5SU2PWCSFoQIx/QzECJdSnfou/9n
   +oeVXwFWxCHRY4tG7nyXHXQueC3WtvdkJ77UrV3wsKA2WhNk/s3B9mjHA
   w==;
X-CSE-ConnectionGUID: IbI2qqiEQIia/YFXmcEUEQ==
X-CSE-MsgGUID: QS4negs+QGGhUaFUQQQDBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="172005676"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="172005676"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:51 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A27DDD6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 75C9CC8BF9
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 118532007C3F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A153A1A0071;
	Tue, 17 Dec 2024 17:01:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/17] libnfs: upgrade 5.0.3 -> 6.0.2
Date: Tue, 17 Dec 2024 17:01:23 +0800
Message-Id: <1734426096-18300-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--6.411600-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yaqHmm/V4M/Pfb+ZO7kHlEh/iZ1aNsYG7v44
	pYPD16CLKqrQ7lLcMnwt/DPtuO0OwdzZGrP764sO/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW71J65TSXiI7zgXVkrgweyGkto8AKCDbo66kMgL3jbYOie0Z6pse6+b+7xVqwWSwbhuyz
	doYXG7VnDdrVFgZQzKuA85Nu9niDwGMOmE2X8dBKBw6BKdk7MxUrr7Qc5WhKhD0XHWdCmZPOdO7
	UpNlcFX3cE6DYTDQbPi57j7I2IIqAdUOz+Q2Y11tw+xHnsmQjOYkAyCbA7KVws5GlXF672zo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqt5AtLqKWP8ssjmufO5FjiJLeXGp9W56gJEpdRI9nU+7H3VCQ
	/06LnSA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114356

From: Wang Mingyu <wangmy@fujitsu.com>

0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patc
refreshed for 6.0.2

0001-cmake-Test-for-sys-uio.h.patch
removed since it's included in 6.0.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...espect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 10 ++---
 .../0001-cmake-Test-for-sys-uio.h.patch       | 44 -------------------
 .../{libnfs_5.0.3.bb => libnfs_6.0.2.bb}      | 10 ++---
 3 files changed, 9 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
 rename meta-oe/recipes-connectivity/libnfs/{libnfs_5.0.3.bb => libnfs_6.0.2.bb} (55%)

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
index 978f38d019..ffb6bfbea8 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
@@ -1,4 +1,4 @@
-From 95708ff427c12b58e53fab225a08c811ca358394 Mon Sep 17 00:00:00 2001
+From 0d5d6a14f6e9c2ff8998ebb3acbefcad6221952f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 3 May 2023 22:27:10 +0200
 Subject: [PATCH] CMakeLists.txt: respect ${CMAKE_INSTALL_LIBDIR} for multilib
@@ -29,11 +29,11 @@ Upstream-Status: Pending
  2 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5be774d..6b4fd25 100644
+index 1b94d2e..a295403 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -7,11 +7,11 @@ project(libnfs
- set(SOVERSION 11.2.0 CACHE STRING "" FORCE)
+ set(SOVERSION 16.2.0 CACHE STRING "" FORCE)
  
  set(INSTALL_BIN_DIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installation directory for binaries")
 -set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installation directory for libraries")
@@ -48,10 +48,10 @@ index 5be774d..6b4fd25 100644
  option(BUILD_SHARED_LIBS "Build shared libraries" ON)
  option(ENABLE_TESTS "Build and run test programs" OFF)
 diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 88ba7b8..5ff89dc 100644
+index 987b735..9b2032f 100644
 --- a/lib/CMakeLists.txt
 +++ b/lib/CMakeLists.txt
-@@ -23,5 +23,5 @@ set_target_properties(nfs PROPERTIES
+@@ -24,5 +24,5 @@ set_target_properties(nfs PROPERTIES
  
  install(TARGETS nfs EXPORT libnfs
                      RUNTIME DESTINATION bin
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
deleted file mode 100644
index de3ab82292..0000000000
--- a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d0fa719d49f38777911a8e99717f2d4b30811080 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Feb 2024 19:24:54 -0800
-Subject: [PATCH] cmake: Test for sys/uio.h
-
-writev() API is used in few places and it will need including sys/uio.h
-for getting the funciton signature
-
-Upstream-Status: Submitted [https://github.com/sahlberg/libnfs/pull/440]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cmake/ConfigureChecks.cmake | 1 +
- cmake/config.h.cmake        | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/cmake/ConfigureChecks.cmake b/cmake/ConfigureChecks.cmake
-index 0258fc8..c26a02d 100644
---- a/cmake/ConfigureChecks.cmake
-+++ b/cmake/ConfigureChecks.cmake
-@@ -22,6 +22,7 @@ check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
- check_include_file("sys/sysmacros.h" HAVE_SYS_SYSMACROS_H)
- check_include_file("sys/time.h" HAVE_SYS_TIME_H)
- check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
-+check_include_file("sys/uio.h" HAVE_SYS_UIO_H)
- check_include_file("sys/vfs.h" HAVE_SYS_VFS_H)
- check_include_file("unistd.h" HAVE_UNISTD_H)
- check_include_file("utime.h" HAVE_UTIME_H)
-diff --git a/cmake/config.h.cmake b/cmake/config.h.cmake
-index 4016c6c..6263896 100644
---- a/cmake/config.h.cmake
-+++ b/cmake/config.h.cmake
-@@ -90,6 +90,9 @@
- /* Define to 1 if you have the <sys/types.h> header file. */
- #cmakedefine HAVE_SYS_TYPES_H
- 
-+/* Define to 1 if you have the <sys/uio.h> header file. */
-+#cmakedefine HAVE_SYS_UIO_H
-+
- /* Define to 1 if you have the <sys/vfs.h> header file. */
- #cmakedefine HAVE_SYS_VFS_H
- 
--- 
-2.43.1
-
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
similarity index 55%
rename from meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
rename to meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index a6eabc6095..bec7279a06 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -3,12 +3,10 @@ HOMEPAGE = "https://github.com/sahlberg/libnfs"
 LICENSE = "LGPL-2.1-only & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 
-SRC_URI = " \
-	git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
-	file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
-	file://0001-cmake-Test-for-sys-uio.h.patch \
-"
-SRCREV = "4379837536d9eac537810dc7b13071136049b22a"
+SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
+           file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
+           "
+SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.43.0


