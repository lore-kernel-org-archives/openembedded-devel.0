Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 76B3C7F9D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 11:50:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,228,1569254400"; d="scan'208";a="77476602"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 19:50:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B97C24CE150E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 19:42:37 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 25 Oct 2019 19:50:30 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 25 Oct 2019 19:50:33 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Oct 2019 03:44:45 +0800
Message-ID: <1572032685-73151-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: B97C24CE150E.A6E0C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] owfs: upgrade 3.2p2 -> 3.2p3
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
X-List-Received-Date: Fri, 25 Oct 2019 11:50:32 -0000
Content-Type: text/plain

1) Upgrade owfs from 3.2p2 to 3.2p3.

2) Update LIC_FILES_CHKSUM for COPYING and COPYING.LIB as $Id$ has been removed.

3) Remove 0001-include-sys-sysmacros.h-for-major.patch as it has been merged in new version.

4) Add 0001-Add-build-rule-for-README.patch to fix do_configure error:
   Makefile.am: required file `./README' not found

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../owfs/owfs/0001-Add-build-rule-for-README.patch | 25 ++++++++++++
 .../0001-include-sys-sysmacros.h-for-major.patch   | 46 ----------------------
 .../owfs/{owfs_3.2p2.bb => owfs_3.2p3.bb}          | 10 ++---
 3 files changed, 30 insertions(+), 51 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch
 rename meta-filesystems/recipes-filesystems/owfs/{owfs_3.2p2.bb => owfs_3.2p3.bb} (91%)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
new file mode 100644
index 0000000..e4d52a8
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
@@ -0,0 +1,25 @@
+From dfeadd4eb43e829aafb0d10f611fa22ae81bfca4 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Sun, 20 Oct 2019 17:00:45 +0900
+Subject: [PATCH] Add build rule for README.
+
+fix do_configure error:
+Makefile.am: required file `./README' not found
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index e0c4ad6..0449321 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -35,3 +35,4 @@ rpmcvs: preparerpm
+ 	@LN_S@ -f `pwd`/@PACKAGE@-@VERSION@.tar.gz ${RPMDIR}/SOURCES/@PACKAGE@-@VERSION@_cvs_`date +"%Y%m%d"`.tar.gz
+ 	cd ${RPMDIR}/SPECS && @RPMBUILD@ -ba @PACKAGE@.spec --define 'cvs 1'
+ 
++README: README.md
+-- 
+2.7.4
+
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch
deleted file mode 100644
index 0a990ac..0000000
--- a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-include-sys-sysmacros.h-for-major.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dd1af7541f18399bcdcb129a8b6618c18ebd9d63 Mon Sep 17 00:00:00 2001
-From: Tomasz Torcz <tomek@pipebreaker.pl>
-Date: Sat, 17 Mar 2018 12:56:04 +0100
-Subject: [PATCH] include <sys/sysmacros.h> for major()
-
-  Linux glibc ceased to include it in sys/types.h:
-https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac                  | 2 +-
- module/owlib/src/include/ow.h | 6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 86751bf7..d625d3f0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -180,7 +180,7 @@ m4_include([src/scripts/m4/acx_pthread.m4])
- # Checks for header files.
- AC_HEADER_DIRENT
- AC_HEADER_STDC
--AC_CHECK_HEADERS([asm/types.h arpa/inet.h sys/ioctl.h sys/mkdev.h sys/socket.h sys/time.h sys/times.h sys/types.h sys/param.h sys/uio.h feature_tests.h fcntl.h netinet/in.h stdlib.h string.h strings.h sys/file.h syslog.h termios.h unistd.h limits.h stdint.h features.h getopt.h resolv.h semaphore.h])
-+AC_CHECK_HEADERS([asm/types.h arpa/inet.h sys/ioctl.h sys/mkdev.h sys/socket.h sys/sysmacros.h sys/time.h sys/times.h sys/types.h sys/param.h sys/uio.h feature_tests.h fcntl.h netinet/in.h stdlib.h string.h strings.h sys/file.h syslog.h termios.h unistd.h limits.h stdint.h features.h getopt.h resolv.h semaphore.h])
- AC_CHECK_HEADERS([linux/limits.h linux/types.h netdb.h dlfcn.h])
- AC_CHECK_HEADERS(sys/event.h sys/inotify.h)
- 
-diff --git a/module/owlib/src/include/ow.h b/module/owlib/src/include/ow.h
-index 9dbec5f3..0a310552 100644
---- a/module/owlib/src/include/ow.h
-+++ b/module/owlib/src/include/ow.h
-@@ -188,8 +188,12 @@
- #include <netdb.h>				/* for getaddrinfo */
- #endif							/* HAVE_NETDB_H */
- 
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>			/* for major() */
-+#endif							/* HAVE_SYS_SYSMACROS_H */
-+
- #ifdef HAVE_SYS_MKDEV_H
--#include <sys/mkdev.h>			/* for major() */
-+#include <sys/mkdev.h>			/* for major() on Solaris */
- #endif							/* HAVE_SYS_MKDEV_H */
- 
- #include <stddef.h> // for offsetof()
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
similarity index 91%
rename from meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
rename to meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
index 857aaf2..4140844 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
@@ -4,16 +4,16 @@ HOMEPAGE = "http://www.owfs.org/"
 SECTION = "console/network"
 
 LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12a64df1cc87275e940cab05ee75c37d \
-                    file://COPYING.LIB;md5=16ff3ffebed582e19ea7a4f48ec77b42"
+LIC_FILES_CHKSUM = "file://COPYING;md5=628b867016631792781a8735a04760e5 \
+                    file://COPYING.LIB;md5=9021b7435efdd9fb22beef8291134099"
 
 DEPENDS = "fuse virtual/libusb0"
-# v3.2p2
-SRCREV = "93c1f36d9ac481075287da331d5184f590f8c0fa"
+# v3.2p3
+SRCREV = "3744375dfaa350e31c9b360eb1e1a517bbeb5c47"
 SRC_URI = "git://github.com/owfs/owfs \
+           file://0001-Add-build-rule-for-README.patch \
            file://owhttpd \
            file://owserver \
-           file://0001-include-sys-sysmacros.h-for-major.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4




