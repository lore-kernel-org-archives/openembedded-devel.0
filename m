Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5467EA59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 07:50:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5S7o5Nc016786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 00:50:21 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Fri, 28 Jun 2019 00:49:59 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 15:49:57 +0800
Message-ID: <1561708197-8471-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH] snort: fix compile-host-path QA issue
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
X-List-Received-Date: Fri, 28 Jun 2019 07:50:31 -0000
Content-Type: text/plain

The Fedora 28+ does not have inbuilt SunRPC support in glibc and is
separately availble in tirpc package. So it enables tirpc checking for
fedora in configure.

Drop this piece of code since we had specify '-ltirpc' in LDFLAGS
explicitly. Otherwise it will cause a compile-host-path QA issue if the
host is Fedora 28+:
cc1: warning: include location "/usr/include/tirpc" is unsafe for
cross-compilation [-Wpoison-system-directories]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...gure.in-disable-tirpc-checking-for-fedora.patch | 60 ++++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.13.bb     |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch b/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch
new file mode 100644
index 0000000..87fd05b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/configure.in-disable-tirpc-checking-for-fedora.patch
@@ -0,0 +1,60 @@
+From 65463a7c5cb2514b1523a81911810effffb75a79 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 28 Jun 2019 15:05:31 +0800
+Subject: [PATCH] configure.in: disable tirpc checking for fedora
+
+The Fedora 28+ does not have inbuilt SunRPC support in glibc and is
+separately availble in tirpc package. So it enables tirpc checking for
+fedora in configure.
+
+Drop this piece of code since we had specify '-ltirpc' in LDFLAGS
+explicitly. Otherwise it will cause a compile-host-path QA issue if the
+host is Fedora 28+:
+cc1: warning: include location "/usr/include/tirpc" is unsafe for
+cross-compilation [-Wpoison-system-directories]
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.in | 24 ------------------------
+ 1 file changed, 24 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 8662cdd..0ff7e27 100644
+--- a/configure.in
++++ b/configure.in
+@@ -895,30 +895,6 @@ if test "x$enable_dlclose" = "xno"; then
+     AC_DEFINE([DISABLE_DLCLOSE_FOR_VALGRIND_TESTING],[1],[Don't close opened shared objects for valgrind leak testing of dynamic libraries])
+ fi
+ 
+-##################################################
+-# Fedora 28+ does not have inbuilt SunRPC support#
+-# in glibc and is separately availble in tirpc   #
+-# package. Make sure we've got the library and   #
+-# link it                                        #
+-##################################################
+-
+-if test -f /etc/fedora-release ; then
+-    DISTRO_VERSION=$(awk '{ print $3 }' /etc/fedora-release)
+-    if test $DISTRO_VERSION -ge 28 ; then
+-        TIRPC=""
+-        AC_CHECK_LIB(tirpc,bindresvport,, TIRPC="no")
+-        echo "$TIRPC"
+-        if test "x$TIRPC" = "xno"; then
+-            echo
+-            echo " ERROR! tirpc not found, get it by running "
+-            echo " yum install libtirpc-devel "
+-            exit
+-        fi
+-        LIBS="${LIBS} -ltirpc"
+-        extra_incl="-I/usr/include/tirpc"
+-    fi
+-fi
+-
+ Z_LIB=""
+ AC_CHECK_HEADERS(zlib.h,, Z_LIB="no")
+ if test "x$Z_LIB" = "xno"; then
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
index 1b10dbd..c7e47e1 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.13.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://0001-libpcap-search-sysroot-for-headers.patch \
     file://fix-host-contamination-when-enable-static-daq.patch \
     file://disable-run-test-program-while-cross-compiling.patch \
+    file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
 
 SRC_URI[md5sum] = "b61ae846af022018b05511076baad60c"
-- 
2.7.4


