Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 945706069C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 09:34:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so12007255wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 01:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y8ZxohYp+iOyy7t8YzfWMt8jGlV8SHnjxpV2XQsWJac=;
	b=OgYhJYo7aZVZnZL9jeB+d3sFvNfxl6ayH1EOdbAAz03kKDcbnCJVswnZKJrpFSNtkX
	UHp9yyemNi65b/9I7jYcP+eikxynskglGOAAMRIW4/M/ucEaM7yPAe+FTa/dTKY+a5mq
	XJ/T6IR2jRJLgcKyHfm2w7SIFlCb00rZIVISprimaezLItPtUrB27Yp6Fz+hppPdOibs
	FJFieH5mUkMjXyvXLusno9e9RJOHd2zdT5SVONYnzqn6IpwVjBZMR865qzjQ8xLZOIph
	BvgzCe14U+R9Lr02EYjqn7rXNXHp6Y8Q7jMYv6i0W6i6GACJ1PezDOQ3WryyfEl2+nz1
	bC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y8ZxohYp+iOyy7t8YzfWMt8jGlV8SHnjxpV2XQsWJac=;
	b=l3BlLtZOOAq9GYAKEAITJ/LroEOPES3yD80JEyGo3V0u7Ev5JY10Ld6RIjT7nncnaK
	sAIShJzb7xmkdPtgS0ViKiultuThKuOMThQ4Z1P1TDDFYlapkf9PyRT0rz/0aTYQGw7G
	q6hbErYVcfpUQHyePzfKzrHJ6P7ugaUyykw5Snsm+1TydHSkuy6HLuNAT/ttKakGTUnO
	P6+hniZ8E3lHW0yhVYY7a6U+oo7E6ocsoJxktCFk3abvR+5SSi6qqz7ZyKdIPUFQetF6
	xgL4lengx9VkDvEjKYp63aLb0+evaM/VE+l2ozTYY3VtiK1LRMrl+lHiSUTXPGy8HU0r
	GHlw==
X-Gm-Message-State: APjAAAXHuVWirR9FZJmBgGHYKvVwbtQHZ3Dhgj3W1AKEa/trzhaIM/cQ
	PmrBSEqD4PoL4UBdqitU//NR8ZpO
X-Google-Smtp-Source: APXvYqw2nBWUeopYH69bMQXesP3+VjhFdH0iLIsTta9YTameGW2wGVVYUuicNokIV7jwEAlYXKKUGA==
X-Received: by 2002:a1c:9986:: with SMTP id
	b128mr17932335wme.154.1574588069759; 
	Sun, 24 Nov 2019 01:34:29 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	v20sm4758233wmj.32.2019.11.24.01.34.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2019 01:34:29 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Nov 2019 09:34:22 +0000
Message-Id: <20191124093422.40161-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] leveldb: Upgrade 1.20 -> 1.22
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
X-List-Received-Date: Sun, 24 Nov 2019 09:34:30 -0000

Upstream has moved to cmake, so drop the build patches which are no
longer relevant. Add run-ptest and PACKAGECONFIG support.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Add CMAKE_BUILD_TYPE=RelWithDebInfo

 .../0001-Makefile-Fix-parallel-build.patch    | 34 ---------------
 ...detect_platform-Check-for-__SSE4_2__.patch | 37 ----------------
 ...0002-makefile-build-SHARED_MEMENVLIB.patch | 43 -------------------
 meta-oe/recipes-dbs/leveldb/leveldb/run-ptest | 10 +++++
 meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb   | 33 ++++++++++++++
 meta-oe/recipes-dbs/leveldb/leveldb_git.bb    | 41 ------------------
 6 files changed, 43 insertions(+), 155 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
 delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
 delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
 create mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
 create mode 100644 meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
 delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb_git.bb

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
deleted file mode 100644
index 3135d4d5acbe..000000000000
--- a/meta-oe/recipes-dbs/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c85978e77725ef233543370d24e23f853f449170 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 21 Sep 2017 17:47:02 -0700
-Subject: [PATCH] Makefile: Fix parallel build
-
-Sometimes mkdir $(SHARED_OUTDIR)/db races with compiler which is
-creating .o file in the same directory $(SHARED_OUTDIR)/db/db_bench.o
-
-Fixes error like
-
-| mkdir out-static
-| mkdir out-shared/db
-| Assembler messages:
-| Fatal error: can't create out-shared/db/db_bench.o: No such file or directory
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index f7cc7d7..51a0bcd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -386,6 +386,7 @@ $(STATIC_OUTDIR)/write_batch_test:db/write_batch_test.cc $(STATIC_LIBOBJECTS) $(
- $(STATIC_OUTDIR)/memenv_test:$(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS)
- 	$(XCRUN) $(CXX) $(LDFLAGS) $(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS) -o $@ $(LIBS)
- 
-+$(SHARED_OUTDIR)/db/db_bench.o: | $(SHARED_OUTDIR)/db
- $(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
- 	$(XCRUN) $(CXX) $(LDFLAGS) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(SHARED_OUTDIR)/db/db_bench.o $(TESTUTIL) $(SHARED_OUTDIR)/$(SHARED_LIB3) -o $@ $(LIBS)
- 
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
deleted file mode 100644
index 8f93cb325b6b..000000000000
--- a/meta-oe/recipes-dbs/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5fd0918df2bb30e8f3edb2ee895d178edbf26f40 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 4 Sep 2017 22:38:03 -0700
-Subject: [PATCH 1/2] build_detect_platform: Check for __SSE4_2__
-
-just using -msse4.2 is not enough, especially with clang
-where it may accept -msse4.2 even during cross compiling
-for say arm, however the difference is that builtin defines
-wont be defined.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- build_detect_platform | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/build_detect_platform
-===================================================================
---- git.orig/build_detect_platform
-+++ git/build_detect_platform
-@@ -224,13 +224,13 @@ EOF
-     rm -f $CXXOUTPUT 2>/dev/null
- 
-     # Test if gcc SSE 4.2 is supported
--    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
-+    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null  <<EOF
-       int main() {}
- EOF
-+    eval fgrep __SSE4_2__ $CXXOUTPUT >/dev/null 2>&1
-     if [ "$?" = 0 ]; then
-         PLATFORM_SSEFLAGS="-msse4.2"
-     fi
--
-     rm -f $CXXOUTPUT 2>/dev/null
- fi
- 
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
deleted file mode 100644
index fc708b23ad00..000000000000
--- a/meta-oe/recipes-dbs/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1ed8cec1fcf666904bb3ebd29fc85e235b72d122 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 4 Sep 2017 22:40:49 -0700
-Subject: [PATCH 2/2] makefile: build SHARED_MEMENVLIB
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index f7cc7d7..cb42278 100644
---- a/Makefile
-+++ b/Makefile
-@@ -126,12 +126,12 @@ SHARED_VERSION_MINOR = 20
- SHARED_LIB1 = libleveldb.$(PLATFORM_SHARED_EXT)
- SHARED_LIB2 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR)
- SHARED_LIB3 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
--SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3)
-+SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3) $(SHARED_MEMENVLIB)
- $(SHARED_OUTDIR)/$(SHARED_LIB1): $(SHARED_OUTDIR)/$(SHARED_LIB3)
- 	ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB1)
- $(SHARED_OUTDIR)/$(SHARED_LIB2): $(SHARED_OUTDIR)/$(SHARED_LIB3)
- 	ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB2)
--SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.a
-+SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.$(PLATFORM_SHARED_EXT).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
- endif
- 
- $(SHARED_OUTDIR)/$(SHARED_LIB3): $(SHARED_LIBOBJECTS)
-@@ -294,7 +294,7 @@ endif
- 
- $(SHARED_MEMENVLIB):$(SHARED_MEMENVOBJECTS)
- 	rm -f $@
--	$(AR) -rs $@ $(SHARED_MEMENVOBJECTS)
-+	$(CXX) $(LDFLAGS) $(PLATFORM_SHARED_LDFLAGS)$(basename $(notdir $(SHARED_MEMENVLIB))) $(SHARED_MEMENVOBJECTS) -o $(SHARED_MEMENVLIB) $(LIBS)
- 
- $(STATIC_OUTDIR)/db_bench:db/db_bench.cc $(STATIC_LIBOBJECTS) $(TESTUTIL)
- 	$(CXX) $(LDFLAGS) $(CXXFLAGS) db/db_bench.cc $(STATIC_LIBOBJECTS) $(TESTUTIL) -o $@ $(LIBS)
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest b/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
new file mode 100644
index 000000000000..9ae70c1284d1
--- /dev/null
+++ b/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+for test in *_test; do
+    if ./${test}; then
+        echo "PASS: ${test}"
+    else
+        echo "FAIL: ${test}"
+    fi
+done
+
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
new file mode 100644
index 000000000000..b597ef1ea845
--- /dev/null
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
@@ -0,0 +1,33 @@
+SUMMARY = "LevelDB is a fast key-value storage library"
+DESCRIPTION = "LevelDB is a fast key-value storage library that provides an ordered mapping from string keys to string values"
+HOMEPAGE = "https://github.com/google/leveldb"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
+
+SRC_URI = "git://github.com/google/${BPN}.git \
+           file://run-ptest"
+
+SRCREV = "78b39d68c15ba020c0d60a3906fb66dbf1697595"
+S = "${WORKDIR}/git"
+
+inherit cmake ptest
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[benchmarks] = "-DLEVELDB_BUILD_BENCHMARKS=ON,-DLEVELDB_BUILD_BENCHMARKS=OFF,sqlite"
+PACKAGECONFIG[snappy] = ",,snappy"
+PACKAGECONFIG[tcmalloc] = ",,gperftools"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON \
+                 -DLEVELDB_BUILD_TESTS=${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'ON', 'OFF', d)}"
+
+do_install_append() {
+    install -D -m 0755 ${B}/leveldbutil ${D}${bindir}/leveldbutil
+}
+
+do_install_ptest() {
+    install -m 0755 ${B}/*_test ${D}${PTEST_PATH}
+}
+
+# Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb.
+#
+COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb = "null"
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
deleted file mode 100644
index 908ad3e6bcf4..000000000000
--- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "LevelDB is a fast key-value storage library"
-DESCRIPTION = "LevelDB is a fast key-value storage library that provides an ordered mapping from string keys to string values"
-HOMEPAGE = "http://leveldb.googlecode.com"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
-
-SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
-PV = "1.20+git${SRCPV}"
-
-SRC_URI = "git://github.com/google/${BPN}.git \
-           file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
-           file://0002-makefile-build-SHARED_MEMENVLIB.patch \
-           file://0001-Makefile-Fix-parallel-build.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit utils
-
-do_compile() {
-    # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
-    # leveldb makefile variable CFLAGS and broke leveldb build.
-    CFLAGS="${CFLAGS}" make ${PARALLEL_MAKE}|| die
-}
-
-do_install() {
-    install -d ${D}${libdir} ${D}${bindir} ${D}${includedir}/leveldb
-    oe_libinstall -C ${B}/out-shared libleveldb ${D}${libdir}
-    oe_libinstall -C ${S}/out-static libleveldb ${D}${libdir}
-    oe_libinstall -C ${S}/out-static libmemenv ${D}${libdir}
-    install -m 0755 ${B}/out-shared/db_bench ${D}${bindir}
-    install -m 0755 ${B}/out-static/*_test ${D}${bindir}
-    install -m 644 ${S}/include/leveldb/*.h ${D}${includedir}/leveldb/
-}
-
-PACKAGES =+ "${PN}-ptest"
-FILES_${PN}-ptest = "${bindir}"
-
-# Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb.
-#
-COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb = "null"
-- 
2.17.1


