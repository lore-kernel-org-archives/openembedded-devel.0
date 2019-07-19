Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFBCE7EFFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:31:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J2V87h025561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2019 19:31:08 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 18 Jul 2019 19:31:07 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 10:29:56 +0800
Message-ID: <20190719022956.2537-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pmdk: update from 1.4.2 to 1.6
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
X-List-Received-Date: Fri, 19 Jul 2019 02:31:07 -0000
Content-Type: text/plain

1) Use git repo instead of github archive tarball.
2) PMDK libraries can be installed in lib or lib64, depending on
   host building system. If host has /usr/local/lib64, libraries will
   be installed in lib64, otherwise they will be installed in lib.
   PMDK is only for 64-bit system, so use LIB_PREFIX=lib64 to force
   the install path to be lib64.
3) Use prefix instead of PREFIX to install.
4) Remove unneeded files in /usr/lib64/pmdk_debug.
5) Add "/usr/etc" and "/usr/share" to fix package QA issue.
6) Revise patches for version 1.6. Remove upstream accepted patches.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 ...malloc.cfg-Specify-the-host-when-building.patch |  4 +--
 .../0002-Makefile-Don-t-install-the-docs.patch     | 12 ++++----
 .../0003-Makefile-Don-t-build-the-examples.patch   | 14 ++++-----
 ...nually-implement-secure_getenv-if-require.patch | 30 --------------------
 ...mempool-Remove-unused-__USE_UNIX98-define.patch | 30 --------------------
 ...file.inc-Allow-extra-libs-to-be-specified.patch | 29 -------------------
 .../pmdk/{pmdk_1.4.2.bb => pmdk_1.6.bb}            | 33 ++++++----------------
 7 files changed, 24 insertions(+), 128 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.4.2.bb => pmdk_1.6.bb} (57%)

diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
index 747538b0c..ca2a1f643 100644
--- a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
+++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
@@ -1,4 +1,4 @@
-From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
+From 231eb4c75fbfaaf90bca7702bdaf55cf701a3527 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Mon, 23 Jul 2018 11:23:39 -0700
 Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
@@ -25,5 +25,5 @@ index 196129de6..79ebbab1c 100644
  --disable-munmap
 +--host=${HOST_SYS}
 -- 
-2.17.1
+2.14.4
 
diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
index bd1b97c24..82b96cf95 100644
--- a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
+++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
@@ -1,7 +1,7 @@
-From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
+From 3863d8bd71d6a5638cf984f8d8f9cccac0c7f2a4 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Mon, 23 Jul 2018 11:31:17 -0700
-Subject: [PATCH 2/2] Makefile: Don't install the docs
+Subject: [PATCH] Makefile: Don't install the docs
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Upstream-Status: Inappropriate [disable feature]
@@ -10,17 +10,17 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 224a315f6..ce7f84afb 100644
+index 47a447f12..7c0f9848f 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
+@@ -148,7 +148,6 @@ rpm dpkg: pkg-clean
  
  install uninstall:
  	$(MAKE) -C src $@
 -	$(MAKE) -C doc $@
  
  .PHONY: all clean clobber test check cstyle check-license install uninstall\
- 	source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
+ 	source rpm dpkg pkg-clean pcheck check-remote format doc require-rpmem\
 -- 
-2.17.1
+2.14.4
 
diff --git a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
index f75d94197..dbe9c45e1 100644
--- a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
+++ b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
@@ -1,6 +1,6 @@
-From a7f07dca2468ea226d2f07fc0105166e75cadaf8 Mon Sep 17 00:00:00 2001
+From ac24c78f5aa62ba43bb87b74301b659bcc506f11 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 6 Sep 2018 16:18:50 -0700
+Date: Thu, 18 Jul 2019 15:40:22 +0800
 Subject: [PATCH] Makefile: Don't build the examples
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
@@ -10,25 +10,25 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 4b50dd8b5..e00501e31 100644
+index 773ab1387..58912f0ab 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -38,13 +38,13 @@ include $(TOP)/src/version.inc
+@@ -37,13 +37,13 @@ include $(TOP)/src/common.inc
  
  TARGETS = libpmem libvmem libpmemblk libpmemlog libpmemobj libpmempool\
- 		  libpmemcto libvmmalloc tools
+ 		  libvmmalloc tools
 -ALL_TARGETS = $(TARGETS) common librpmem examples benchmarks
 +ALL_TARGETS = $(TARGETS) common librpmem benchmarks
  
  SCOPE_DIRS = $(TARGETS) common librpmem rpmem_common
  
  DEBUG_RELEASE_TARGETS = common libpmem libvmem libpmemblk libpmemlog libpmemobj\
- 	libpmempool libvmmalloc librpmem libpmemcto
+ 	libpmempool libvmmalloc librpmem
 -RELEASE_TARGETS = tools examples benchmarks
 +RELEASE_TARGETS = tools benchmarks
  
  CLEAN_NO_JE_TARGETS = $(ALL_TARGETS) rpmem_common test
  CLEAN_TARGETS = $(CLEAN_NO_JE_TARGETS) jemalloc
 -- 
-2.17.1
+2.14.4
 
diff --git a/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
deleted file mode 100644
index 624f17bd4..000000000
--- a/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 33affa9ee97691efb73f439fcdba4adb8625a26a Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 10 Sep 2018 12:59:48 -0700
-Subject: [PATCH] os_posix: Manually implement secure_getenv() if required
-
-Manually implement the secure_getenv() if we need to, this is required
-if using musl.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Pending
----
- src/common/os_posix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/common/os_posix.c b/src/common/os_posix.c
-index 2d70a0a29..fb09b6ce0 100644
---- a/src/common/os_posix.c
-+++ b/src/common/os_posix.c
-@@ -261,7 +261,7 @@ os_setenv(const char *name, const char *value, int overwrite)
- /*
-  * secure_getenv -- provide GNU secure_getenv for FreeBSD
-  */
--#ifdef __FreeBSD__
-+#if defined(__FreeBSD__) || !HAVE___SECURE_GETENV
- static char *
- secure_getenv(const char *name)
- {
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
deleted file mode 100644
index 75c35f865..000000000
--- a/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 92e63699ea83074298971b0251f002562be4dbd3 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 10 Sep 2018 13:23:37 -0700
-Subject: [PATCH 2/3] pmempool: Remove unused __USE_UNIX98 define
-
-Remove the unused __USE_UNIX98 to fix musl build failures.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Pending
----
- src/tools/pmempool/info.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/tools/pmempool/info.c b/src/tools/pmempool/info.c
-index b4010bf35..7b890a123 100644
---- a/src/tools/pmempool/info.c
-+++ b/src/tools/pmempool/info.c
-@@ -45,9 +45,6 @@
- #include <inttypes.h>
- #include <assert.h>
- #include <sys/param.h>
--#ifndef __FreeBSD__
--#define __USE_UNIX98
--#endif
- #include <unistd.h>
- #include <sys/mman.h>
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
deleted file mode 100644
index 2042fdb25..000000000
--- a/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a88e806f9ce8cc071e81abad688643d53f393176 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 10 Sep 2018 14:18:38 -0700
-Subject: [PATCH 3/3] Makefile.inc: Allow extra libs to be specified
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Pending
----
- src/Makefile.inc       | 2 ++
- src/common.inc         | 2 ++
- src/tools/Makefile.inc | 1 +
- 3 files changed, 5 insertions(+)
-
-diff --git a/src/common.inc b/src/common.inc
-index 032cb83ea..2d5c4bedf 100644
---- a/src/common.inc
-+++ b/src/common.inc
-@@ -74,6 +74,8 @@ GCOV_CFLAGS=-fprofile-arcs -ftest-coverage --coverage
- GCOV_LDFLAGS=-fprofile-arcs -ftest-coverage
- GCOV_LIBS=-lgcov
- 
-+LIBS += $(EXTRA_LIBS)
-+
- osdep = $(1)_$(shell uname -s | tr "[:upper:]" "[:lower:]")$(2)
- get_arch = $(shell $(CC) -dumpmachine | awk -F'[/-]' '{print $$1}')
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
similarity index 57%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
index 3da22a970..a5096fdad 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
@@ -9,18 +9,15 @@ DEPENDS = "ndctl"
 # Required to have the fts.h header for musl
 DEPENDS_append_libc-musl = " fts"
 
-SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/pmem/pmdk.git \
            file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
            file://0002-Makefile-Don-t-install-the-docs.patch \
            file://0003-Makefile-Don-t-build-the-examples.patch \
-           file://0005-pmempool-Remove-unused-__USE_UNIX98-define.patch \
-           file://0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch \
           "
 
-SRC_URI_append_libc-musl = " file://0004-os_posix-Manually-implement-secure_getenv-if-require.patch"
-
-SRC_URI[md5sum] = "bde73bca9ef5b90911deb0fdcfb15ccf"
-SRC_URI[sha256sum] = "df7e658e75d28cd80f6d2ff7b9fc9ae2885d52f8923fdbacecfd46215115fb4c"
+SRCREV = "695e6eba28c53a69a0ef7bad3cc0f45c21ef3e00"
 
 inherit autotools-brokensep pkgconfig
 
@@ -29,30 +26,16 @@ inherit autotools-brokensep pkgconfig
 # | If you meant to cross compile, use `--host'.
 #
 # Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
-EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
+EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=lib64"
 
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
 
 do_install() {
-	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-
-	# Copy these into the standard directories
-	install -d ${D}${bindir}/
-	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
-	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
-
-	install -d ${D}${libdir}
-	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
-
-	install -d ${D}${libdir}/pkgconfig
-	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
-
-	install -d ${D}${includedir}
-	mv ${D}/usr/local/include/* ${D}${includedir}/
+	oe_runmake prefix=${prefix} DESTDIR=${D} install
 
 	# Remove uneeded files
-	rm -rf ${D}/usr/local/
+	rm -rf ${D}/usr/lib64/pmdk_debug
 }
 
 # Include these by default otherwise the SDK is not very useful
@@ -60,5 +43,7 @@ FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
 FILES_${PN} += "${libdir}/*so*"
 FILES_${PN} += "${libdir}/pkgconfig/*.pc"
 FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
+FILES_${PN} += "/usr/etc"
+FILES_${PN} += "/usr/share"
 
 COMPATIBLE_HOST='(x86_64).*'
-- 
2.14.4


