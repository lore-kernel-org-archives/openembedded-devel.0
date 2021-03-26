Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.13153.1616767712421324591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 07:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgY+XWU8;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id v70so5283942qkb.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GH0ERVZD4owpOnIaHFfPGM3I+ondX9uJB7/g/eVD+84=;
        b=MgY+XWU8YX3fcX1XXuvOtbisBND6S3W8gBArBWCS1Pp9VC8Cws+DPo5PmXer2oYP1N
         NHeNgZWH784OLgB+pF8qgV0jQJVjDgnJaE1urk+6a2ZhKEnPz8FMzVfQLRQgInWXmYWe
         Be3/YKpDfVfHm8AoGAgwffxgRZjBO+0bLKv1fazIpmgSV+bbx26+x1nxevq4RBsrvDkJ
         raxRGD4yxUz23dQGDOAtedP5IDVzriuXpnUM9Qeb6kPe5lIhLKXDQ/FaMK0SJPOqkQct
         TEHKkrd7bATrLWmd3R9U2mfon0PK5idg5z9r62sd+SeQ0/DBOq/pIBd/rJGKX5XSeafl
         wHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=GH0ERVZD4owpOnIaHFfPGM3I+ondX9uJB7/g/eVD+84=;
        b=JrxkqUA4It7HNcprKTYhs/fSz8UnuAPGRznfKT0E5z/gSIIRbuuzZT2nlSJte0q/bI
         VXv0V69gsQpzH021G/2o0olK16g/8lBy/1zRiz64a6YrVjW2gpnOCEDmje9BurOlSWSC
         HWRCZ3sote4Fh/EHBrOnll4Svr3c3AFqjR9bX5HBjkCSE2I9Pb/0j+r+BLVO5Szc9vGp
         SlLXmA4MJte5zsUAsVu+kR7ea5BM81erHIPoXrRI+/xwSI3EkwcnrURCVSzuj+cdJns/
         Fc9EI9EiqhbvvNAjSMRDS/oPBMvozpHNf5ou02686mN2NuFU8xiHP/ws3e7sORXp6CrI
         2vkA==
X-Gm-Message-State: AOAM532R2eh5libPXb+f1T1X6VmE8tZ6YVjdfh+FHBnqbTT+fmFgDz3x
	k5F6hBAfNnsKDyzgb2gKa64Jk7g15ZY=
X-Google-Smtp-Source: ABdhPJyzTLp8iTYqbPDope1xjVb76o4rbn2jYVfPo9RueS7bCgYtJ884HeN0owaYi5YKiA3YEt/lYw==
X-Received: by 2002:a37:9bd2:: with SMTP id d201mr13277111qke.492.1616767711192;
        Fri, 26 Mar 2021 07:08:31 -0700 (PDT)
Return-Path: <philip.balister@gmail.com>
Received: from lyon.hsd1.va.comcast.net ([2601:5c0:c200:1421:c468:1be0:eb10:978b])
        by smtp.gmail.com with ESMTPSA id b15sm5883782qtr.58.2021.03.26.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:08:30 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: "Philip Balister" <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCH] fftw: Add support for ptest.
Date: Fri, 26 Mar 2021 10:08:27 -0400
Message-Id: <20210326140827.1306061-1-philip@balister.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Philip Balister <philip@opensdr.com>

 * The bench program is installed then moved into the ptest ares so
   it links. Since we are building for all precisions, we need to build
   three versions of the bench program.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 .../fftw/fftw/club-libtool.patch              |  9 ++++
 .../fftw/fftw/install-bench.patch             | 41 +++++++++++++++++++
 meta-oe/recipes-support/fftw/fftw/run-ptest   | 30 ++++++++++++++
 meta-oe/recipes-support/fftw/fftw_3.3.8.bb    | 22 +++++++++-
 4 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/fftw/fftw/club-libtool.patch
 create mode 100644 meta-oe/recipes-support/fftw/fftw/install-bench.patch
 create mode 100644 meta-oe/recipes-support/fftw/fftw/run-ptest

diff --git a/meta-oe/recipes-support/fftw/fftw/club-libtool.patch b/meta-oe/recipes-support/fftw/fftw/club-libtool.patch
new file mode 100644
index 000000000..d4a1ef8d0
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/club-libtool.patch
@@ -0,0 +1,9 @@
+--- ./tests/Makefile.am.orig	2021-03-23 11:45:12.756371739 -0400
++++ ./tests/Makefile.am	2021-03-23 11:46:43.224132851 -0400
+@@ -1,5 +1,5 @@
+ AM_CPPFLAGS = -I $(top_srcdir)
+-noinst_PROGRAMS = bench
++bin_PROGRAMS = bench@PREC_SUFFIX@
+ EXTRA_DIST = check.pl README
+ 
+ if THREADS
diff --git a/meta-oe/recipes-support/fftw/fftw/install-bench.patch b/meta-oe/recipes-support/fftw/fftw/install-bench.patch
new file mode 100644
index 000000000..ef570b19d
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/install-bench.patch
@@ -0,0 +1,41 @@
+--- ./tests/Makefile.am.orig	2021-03-23 11:45:12.756371739 -0400
++++ ./tests/Makefile.am	2021-03-23 19:29:19.692180793 -0400
+@@ -1,21 +1,21 @@
+ AM_CPPFLAGS = -I $(top_srcdir)
+-noinst_PROGRAMS = bench
++bin_PROGRAMS = bench@PREC_SUFFIX@
+ EXTRA_DIST = check.pl README
+ 
+ if THREADS
+-bench_CFLAGS = $(PTHREAD_CFLAGS)
++bench@PREC_SUFFIX@_CFLAGS = $(PTHREAD_CFLAGS)
+ if !COMBINED_THREADS
+ LIBFFTWTHREADS = $(top_builddir)/threads/libfftw3@PREC_SUFFIX@_threads.la
+ endif
+ else
+ if OPENMP
+-bench_CFLAGS = $(OPENMP_CFLAGS)
++bench@PREC_SUFFIX@_CFLAGS = $(OPENMP_CFLAGS)
+ LIBFFTWTHREADS = $(top_builddir)/threads/libfftw3@PREC_SUFFIX@_omp.la
+ endif
+ endif
+ 
+-bench_SOURCES = bench.c hook.c fftw-bench.c fftw-bench.h
+-bench_LDADD = $(LIBFFTWTHREADS)				\
++bench@PREC_SUFFIX@_SOURCES = bench.c hook.c fftw-bench.c fftw-bench.h
++bench@PREC_SUFFIX@_LDADD = $(LIBFFTWTHREADS)				\
+ $(top_builddir)/libfftw3@PREC_SUFFIX@.la		\
+ $(top_builddir)/libbench2/libbench2.a $(THREADLIBS)
+ 
+--- ./tools/Makefile.am.orig	2021-03-24 08:22:31.845581620 -0400
++++ ./tools/Makefile.am	2021-03-24 08:24:26.454053573 -0400
+@@ -24,7 +24,7 @@
+ endif
+ 
+ fftw@PREC_SUFFIX@_wisdom_SOURCES = fftw-wisdom.c
+-fftw@PREC_SUFFIX@_wisdom_LDADD = $(top_builddir)/tests/bench-bench.o	\
+-$(top_builddir)/tests/bench-fftw-bench.o $(LIBFFTWTHREADS)	\
++fftw@PREC_SUFFIX@_wisdom_LDADD = $(top_builddir)/tests/bench@PREC_SUFFIX@-bench.o	\
++$(top_builddir)/tests/bench@PREC_SUFFIX@-fftw-bench.o $(LIBFFTWTHREADS)	\
+ $(top_builddir)/libfftw3@PREC_SUFFIX@.la			\
+ $(top_builddir)/libbench2/libbench2.a $(THREADLIBS)
diff --git a/meta-oe/recipes-support/fftw/fftw/run-ptest b/meta-oe/recipes-support/fftw/fftw/run-ptest
new file mode 100644
index 000000000..6d8dd96f0
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw/run-ptest
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+cd fftw
+/usr/bin/perl -w ./check.pl  -r -c=30 -v `pwd`/bench
+fftw_result=$?
+cd ../fftwf
+/usr/bin/perl -w ./check.pl  -r -c=30 -v `pwd`/benchf
+fftwf_result=$?
+cd ../fftwl
+/usr/bin/perl -w ./check.pl  -r -c=30 -v `pwd`/benchl
+fftwl_result=$?
+
+echo -n "fftw  test result:"
+if [ $fftw_result  = "0" ]; then
+	echo PASSED
+else
+	echo FAILED
+fi
+echo -n "fftwf test result:"
+if [ $fftwf_result = "0" ]; then
+	echo PASSED
+else
+	echo FAILED
+fi
+echo -n "fftwl test result:"
+if [ $fftwl_result = "0" ]; then
+	echo PASSED
+else
+	echo FAILED
+fi
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.8.bb b/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
index d9e0ea340..de175d629 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
@@ -6,11 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = " \
     http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
+    file://install-bench.patch \
+    file://run-ptest \
 "
 SRC_URI[md5sum] = "8aac833c943d8e90d51b697b27d4384d"
 SRC_URI[sha256sum] = "6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 # we had multiple recipes in the past
 PROVIDES = "fftwl fftwf"
@@ -65,6 +67,22 @@ do_install() {
     done
 }
 
+do_install_ptest() {
+    for lib in fftw fftwl fftwf; do
+        install -d ${D}${PTEST_PATH}/$lib
+        install -m 0755 ${S}/tests/check.pl ${D}${PTEST_PATH}/$lib
+        cd ${WORKDIR}/build-$lib
+        if [ $lib = "fftw" ]; then
+            mv ${D}${bindir}/bench ${D}${PTEST_PATH}/$lib
+        fi
+        if [ $lib = "fftwl" ]; then
+            mv ${D}${bindir}/benchl ${D}${PTEST_PATH}/$lib
+        fi
+        if [ $lib = "fftwf" ]; then
+            mv ${D}${bindir}/benchf ${D}${PTEST_PATH}/$lib
+        fi
+    done
+}
 
 PACKAGES =+ "libfftw libfftwl libfftwf"
 FILES_libfftw = "${libdir}/libfftw3.so.* ${libdir}/libfftw3_*.so.*"
@@ -79,5 +97,7 @@ FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = "libfftw libfftwl libfftwf"
+RDEPENDS_${PN}-ptest += "perl"
+RDEPENDS_${PN}-ptest_remove = "fftw"
 
 BBCLASSEXTEND = "native"
-- 
2.30.2

