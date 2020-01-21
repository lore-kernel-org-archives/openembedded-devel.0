Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB977FDC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579618062; x=1611154062;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=0ri59sCPfAcf+wUakw5tsjD/OUbUTjj/o/1Rke85sTI=;
	b=bPPfvbG0liWIReq8Lyci5QygcIY/SKsC0iXludJb5PaMQxzASA1fT4N1
	Z8a7wuz7VWCk4YQIVXI1tHeQndjQSjzf3jYCmU5SuPhpHT7fpzlCaAK71
	fVuBMVup/wBVjnwr+QTkGaNfIGpNRHncPGmZoi4eFDUpZvDoXCQvoAz/g
	+B7QwVpCG7WZKUFKuiQreOGNzPuf0bq6kVYt8XWXoM3rgiwpyQrKr+kNt
	qmU6W9miZGeOqct+HcYFpcuSWCtX/3eBAiD6ZT3aRSvxQWklgnCGV6SsZ
	CvtHnbm7fTw3KHdEbhW4htPHcT7Meh66YeP4idE/Zez0UQEwibxdaIr20 w==;
IronPort-SDR: y5dnI+v3Qg3btE/pqn++NOXQ99CvkEYCw+ucsl1UMnxr7quAijTu3ONDP+ThhbdJrDI9Az7sGt
	J7Em4DsivwzHMROaBqP/Upf7bd5XS3wiFe3rdy0yxIxbMInH9AIBgvxcIJGUslZWpP8mbeEsuG
	FauOu7zcMoOXhCFsEyb2zOtZgSbXhoZL+A1kG4K1MUlD2PMcqRci7DOnpQYDOfeQvqZL9IcSup
	m2aHACTpqXVCIbJyYlk/RB7aEU2va+zsJlKArQ+8eJM3Q+lXrqmRFENEKnys+Lr62QWKc91vEf
	Iks=
X-IronPort-AV: E=Sophos;i="5.70,346,1574118000"; 
   d="scan'208";a="2495764"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jan 2020 15:47:18 +0100
Message-ID: <20200121144718.652126-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200121144718.652126-1-richard.leitner@skidata.com>
References: <20200121144718.652126-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 2/2] openjdk-7: add patch to fix xattr include path
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
X-List-Received-Date: Tue, 21 Jan 2020 14:47:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As attr dropped the <attr/xattr.h> header use <sys/xattr.h> instead.

http://git.savannah.nongnu.org/cgit/attr.git/commit/include?id=7921157890d07858d092f4003ca4c6bae9fd2c38

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb         |  3 +++
 .../icedtea-jdk-fix-xattr-include.patch               | 11 +++++++++++
 .../icedtea-m4-fix-xattr-include-path.patch           | 11 +++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-fix-xattr-include.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-m4-fix-xattr-include-path.patch

diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index 87de6be..d774cc2 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -41,6 +41,7 @@ OEPATCHES = "\
     file://build-hacks.patch \
     file://fix_hotspot_crosscompile.patch \
     file://icedtea-makefile-unzip.patch \
+    file://icedtea-m4-fix-xattr-include-path.patch \
 "
 
 ICEDTEAPATCHES = "\
@@ -50,6 +51,7 @@ ICEDTEAPATCHES = "\
     file://icedtea-crosscompile-fix.patch;apply=no \
     file://icedtea-xawt-crosscompile-fix.patch;apply=no \
     file://icedtea-jdk-unzip.patch;apply=no \
+    file://icedtea-jdk-fix-xattr-include.patch;apply=no \
     file://icedtea-dtrace-std_h.patch;apply=no \
     file://icedtea-hotspot-fix-string-literal-marcos.patch;apply=no \
     file://icedtea-flags-to-compile-with-GCC-6.patch;apply=no \
@@ -63,6 +65,7 @@ DISTRIBUTION_PATCHES = "\
     patches/icedtea-crosscompile-fix.patch \
     patches/icedtea-xawt-crosscompile-fix.patch \
     patches/icedtea-jdk-unzip.patch \
+    patches/icedtea-jdk-fix-xattr-include.patch \
     patches/icedtea-dtrace-std_h.patch \
     patches/icedtea-hotspot-fix-string-literal-marcos.patch \
     patches/icedtea-flags-to-compile-with-GCC-6.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-fix-xattr-include.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-fix-xattr-include.patch
new file mode 100644
index 0000000..ef44e7e
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-fix-xattr-include.patch
@@ -0,0 +1,11 @@
+--- openjdk/jdk/src/solaris/native/sun/nio/fs/LinuxNativeDispatcher.c
++++ openjdk/jdk/src/solaris/native/sun/nio/fs/LinuxNativeDispatcher.c
+@@ -38,7 +38,7 @@
+ 
+ #ifdef COMPILE_AGAINST_SYSCALLS
+ #include <sys/types.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ #else
+ #include <syscalls_fp.h>
+ #endif
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-m4-fix-xattr-include-path.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-m4-fix-xattr-include-path.patch
new file mode 100644
index 0000000..f9b526f
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-m4-fix-xattr-include-path.patch
@@ -0,0 +1,11 @@
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2234,7 +2234,7 @@
+     dnl Check for syscalls
+     AC_CHECK_FUNCS([openat64 fstatat64 fgetxattr fsetxattr fremovexattr flistxattr unlinkat renameat futimesat fdopendir epoll_create epoll_ctl epoll_wait],,
+       [AC_MSG_ERROR([Could not find required syscalls; check config.log and use --disable-compile-against-syscalls if necessary.])])
+-    AC_CHECK_HEADERS([sys/epoll.h attr/xattr.h],
++    AC_CHECK_HEADERS([sys/epoll.h sys/xattr.h],
+       , [AC_MSG_ERROR([Could not find required system headers; install the appropriate files from glibc-headers, libc6-dev and/or libattr-devel, libattr1-dev or use --disable-compile-against-syscalls if necessary.])])
+     ENABLE_SYSCALL_COMPILATION=true
+   fi
-- 
2.24.1


