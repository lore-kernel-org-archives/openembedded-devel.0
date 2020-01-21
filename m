Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 313617FD99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579618058; x=1611154058;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=rBpAhGj5cftRuAIMJKf0RIkIfSm4R8FFH/sA/hjtEfU=;
	b=Kiq3VgXqsXnhqLmo3T+NgUOxOyGESdzRTE+slMORRfTUaJ4DCQAumBWf
	iKKJnGykaTDNpxugkk9Aa1/cB1L/UWJxxmioidpUz2/6GmYr02Uw4jgMf
	HNE16uynAhxR2RiszfCsleU9xwl3GivsUg3Wm8f7nKGjfopEIKcIpo7T4
	A4q3YqeYtl3bI5H4qyVJ8IV1ecBXkxorPOMwexFRvZyNCmYlehI9ng6Nm
	cuiRpO6A72DBaz2N4cmC7uRskX9g7FLGZJq5IIGPMVtlFWHEGBKXkf8j7
	Oke0u3/gajBTAoS1GLOIFw6aeEv5mlvARZ/FsURsm9nlRfiYRaZRKCDQV A==;
IronPort-SDR: rVozB62R6Bo8sP7mAdRrc2Y1MXZievXS2JKo3vhQUYAOTwlqCBngDKQMwjbNV3qNDJ4pBTN5ar
	wMn2rAnGbSr9vt0vkMBegsZAdrQMS3exMN/+IcKpRNrUFHjbtCbapnOJ9Lg5YdtOHAKNoKoxqc
	ilRSLz+XdLQg6qG53l92gIRxA0jevVwdypdTsiP7jBvxmdKZvfjJE1MM1AqOvk/Q6gwSCZ44tA
	JzBMFuplH1DLa9T9OnPy04ImH/I/gfLy6k5Vv0nMB/PQKbgXFP2tzrrGYqWOoX4TeY0DDw4Drb
	ulU=
X-IronPort-AV: E=Sophos;i="5.70,346,1574118000"; d="scan'208";a="22162214"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jan 2020 15:47:17 +0100
Message-ID: <20200121144718.652126-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 1/2] icedtea7-native: add patch to fix xattr include path
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
X-List-Received-Date: Tue, 21 Jan 2020 14:47:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As attr dropped the <attr/xattr.h> header use <sys/xattr.h> instead.

http://git.savannah.nongnu.org/cgit/attr.git/commit/include?id=7921157890d07858d092f4003ca4c6bae9fd2c38

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../icedtea-jdk-fix-xattr-include.patch               | 11 +++++++++++
 .../icedtea-m4-fix-xattr-include-path.patch           | 11 +++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc     |  3 +++
 3 files changed, 25 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-fix-xattr-include.patch
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-m4-fix-xattr-include-path.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-fix-xattr-include.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-fix-xattr-include.patch
new file mode 100644
index 0000000..9b94dc8
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-fix-xattr-include.patch
@@ -0,0 +1,11 @@
+--- openjdk/jdk/src/solaris/native/sun/nio/fs/LinuxNativeDispatcher.c
++++ openjdk/jdk/src/solaris/native/sun/nio/fs/LinuxNativeDispatcher.c
+@@ -37,7 +37,7 @@
+ 
+ #ifdef COMPILE_AGAINST_SYSCALLS
+ #include <sys/types.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ #else
+ #include <syscalls_fp.h>
+ #endif
diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-m4-fix-xattr-include-path.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-m4-fix-xattr-include-path.patch
new file mode 100644
index 0000000..5164012
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-m4-fix-xattr-include-path.patch
@@ -0,0 +1,11 @@
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2102,7 +2102,7 @@
+     dnl Check for syscalls
+     AC_CHECK_FUNCS([openat64 fstatat64 fgetxattr fsetxattr fremovexattr flistxattr unlinkat renameat futimesat fdopendir epoll_create epoll_ctl epoll_wait],,
+       [AC_MSG_ERROR([Could not find required syscalls; check config.log and use --disable-compile-against-syscalls if necessary.])])
+-    AC_CHECK_HEADERS([sys/epoll.h attr/xattr.h],
++    AC_CHECK_HEADERS([sys/epoll.h sys/xattr.h],
+       , [AC_MSG_ERROR([Could not find required system headers; install the appropriate files from glibc-headers, libc6-dev and/or libattr-devel, libattr1-dev or use --disable-compile-against-syscalls if necessary.])])
+   fi
+   AM_CONDITIONAL(USE_SYSCALL_COMPILATION, test x"${ENABLE_SYSCALL_COMPILATION}" = "xyes")
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 2bc7065..9816c0c 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -72,6 +72,7 @@ ICEDTEA_PATCHES = " \
         file://icedtea-sane-x86-arch-name.patch \
 	file://fix-checksums.patch \
 	file://icedtea-makefile-unzip.patch \
+	file://icedtea-m4-fix-xattr-include-path.patch \
         "
 
 OPENJDK_PATCHES = " \
@@ -80,6 +81,7 @@ OPENJDK_PATCHES = " \
 	file://icedtea-corba-parallel-make.patch;apply=no \
         file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
+        file://icedtea-jdk-fix-xattr-include.patch;apply=no \
 	file://icedtea-flags.patch;apply=no \
 	file://icedtea-openjdk-remove-currency-data-generation-expi.patch;apply=no \
 	file://icedtea-change-to-gdb-debug-format.patch;apply=no \
@@ -106,6 +108,7 @@ export DISTRIBUTION_PATCHES = " \
 	patches/icedtea-corba-parallel-make.patch \
         patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
         patches/icedtea-jdk-sane-x86-arch.patch \
+        patches/icedtea-jdk-fix-xattr-include.patch \
 	patches/icedtea-flags.patch \
 	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
 	patches/icedtea-change-to-gdb-debug-format.patch \
-- 
2.24.1


