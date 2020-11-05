Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.8373.1604587638052685268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 06:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GJoAL0qe;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id 33so2069774wrl.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ej7q69iYMmqFE0WlcbW3kq3CYTbqZlpkeAMwjUD8T1A=;
        b=GJoAL0qeyd2CrovKFRuW92cGoZnbtti48DCEkKItLgg5CppiQvVbODsAfrG3kRQYnl
         qlnnJYxjpvgWmwibW9qqnsg9kzBB44aQIU6P1BH0B2VxWPcJGw5zcvtDW5Ea2SRXhkRx
         K2MEWWMTfbVMVPoz/eg6nhU6NfyYIUS7SRsuMzptggK7quIPSdP8gPmj38NNOHA02gr6
         y0gRf0O/0VV4rKrybw8kPkccjIqiTqK96UijrfDiA+raCoZTA8IMWrAhIujhyxK4lVHK
         i5zLP3u5qsp2Rtj8ro9/UX3sYtnO+F8jnoThCw5cPiVYHAhbpOgKLkwaQAeEZhCpl6/1
         3e0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ej7q69iYMmqFE0WlcbW3kq3CYTbqZlpkeAMwjUD8T1A=;
        b=ZEJmu/TcidFdF0PXxbQvR0AyFESmdhM24JgVIr5wuyOrQVaNgcoVEKeq1+paQw9EgX
         ApAc7y7a+M7544LY5MhEFDxvbF39pg92bNzUkNjD6S48NdHMamoQpg5gpHQZBospPdV/
         bcdW5s1XJHEpfBbSn+6hCBI8CfnsAJesHJwP7b7AfO4OZbnqcGWIZYZWNm54EAsw9eNY
         fsLLV4tHb3BxB3uCu7T64WdSfa7nr4PJAlDkagU65yIopLIbvbDVtJoi5WmSreOsabaY
         V3Ne6G2HCX5WSzJpIsRnA8EAfqJpi8L+rkmiewr7YPGfcZjK6iM7lnE8i8wwKEpJRcbi
         t9yw==
X-Gm-Message-State: AOAM532AT6Gkf3Gc9dtfG2b0J6m8q3RcraX/o84o7hhfE24/F9Fk9twn
	JEevLR+Bp9kQcnYbrBJ0Ka0HK+iVW2o=
X-Google-Smtp-Source: ABdhPJx594krbWkOuk9d1O31dCIoGxegGi6HcNYwA2IfqhWV3sIhn5dwj4xEnKjsS5Y90X8E1+qXWw==
X-Received: by 2002:adf:f103:: with SMTP id r3mr3669729wro.153.1604587635751;
        Thu, 05 Nov 2020 06:47:15 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m22sm3141264wrb.97.2020.11.05.06.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:47:14 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [gatesgarth][meta-oe][PATCH] Revert "numactl: Remove the recipe"
Date: Thu,  5 Nov 2020 15:47:12 +0100
Message-Id: <20201105144712.1515317-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e5d9133800f5c37172a6315d42a99464f9fe1902.

It exists in oe-core/master, but not in oe-core/gatesgarth, so this shouldn't
be included in meta-oe/gatesgarth.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../numactl/0001-define-run-test-target.patch | 32 ++++++++++
 .../numactl/Fix-the-test-output-format.patch  | 64 +++++++++++++++++++
 .../recipes-support/numactl/numactl/Makefile  |  7 ++
 .../recipes-support/numactl/numactl/run-ptest |  9 +++
 .../recipes-support/numactl/numactl_git.bb    | 62 ++++++++++++++++++
 5 files changed, 174 insertions(+)
 create mode 100644 meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
 create mode 100644 meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
 create mode 100644 meta-oe/recipes-support/numactl/numactl/Makefile
 create mode 100755 meta-oe/recipes-support/numactl/numactl/run-ptest
 create mode 100644 meta-oe/recipes-support/numactl/numactl_git.bb

diff --git a/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
new file mode 100644
index 0000000000..78ffb22f89
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -0,0 +1,32 @@
+rename test target as run-test
+
+Upstream-Statue: Pending
+
+test target not only compile the test files, but also run them, which is
+not suitable for cross-compile environment, so rename it as run-test.
+
+and define test target to compile the test files.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b6db339..de176c4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
+ test_numademo: numademo
+ 	./numademo -t -e 10M
+ 
+-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
++test: all $(check_PROGRAMS)
++
++run-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
+ 
+ TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
new file mode 100644
index 0000000000..9812ecc8b3
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -0,0 +1,64 @@
+From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 21 Jul 2015 02:01:22 +0900
+Subject: [PATCH] Fix the test output format
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ test/regress  |  6 +++---
+ test/regress2 | 11 +++++------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/test/regress b/test/regress
+index 2ce1705..d086a47 100755
+--- a/test/regress
++++ b/test/regress
+@@ -74,6 +74,7 @@ probe_hardware()
+ 	if [ $numnodes -lt 2 ] ; then
+ 	    echo "need at least two nodes with at least $NEEDPAGES each of"
+ 	    echo "free memory for mempolicy regression tests"
++	    echo "FAIL: numa regress"
+	    exit 77  # Skip test
+ 	fi
+ }
+@@ -207,10 +208,9 @@ main()
+ 	rm A B
+ 
+ 	if [ "$EXIT" = 0 ] ; then
+-		echo '========SUCCESS'
++		echo 'PASS: numactl regress'
+ 	else
+-		echo '========FAILURE'
+-		exit 1
++		echo 'FAIL: numactl regress'
+ 	fi
+ }
+ 
+diff --git a/test/regress2 b/test/regress2
+index aa6ea41..450c510 100755
+--- a/test/regress2
++++ b/test/regress2
+@@ -9,12 +9,11 @@ testdir=`dirname "$0"`
+ export PATH=${builddir}:$PATH
+ 
+ T() {
+-       echo "$@" 
+-       if ! $VALGRIND "$@" ;  then
+-	  echo	$1 FAILED!!!!
+-	  exit 1
+-       fi
+-       echo
++	if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
++	   echo  "FAIL: $1"
++	else
++	   echo "PASS: $1"
++	fi
+ }
+ 
+ # still broken
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/numactl/numactl/Makefile b/meta-oe/recipes-support/numactl/numactl/Makefile
new file mode 100644
index 0000000000..9a5134c3f2
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl/Makefile
@@ -0,0 +1,7 @@
+.PHONY: regress1 regress2
+
+regress1:
+	cd test ; ./regress
+
+regress2:
+	cd test ; ./regress2
diff --git a/meta-oe/recipes-support/numactl/numactl/run-ptest b/meta-oe/recipes-support/numactl/numactl/run-ptest
new file mode 100755
index 0000000000..215f7c25b9
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+make regress1
+make regress2
+if  numademo -t -e 10M; then
+	echo "PASS: numademo"
+else
+	echo "FAIL: numademo"
+fi
+
diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
new file mode 100644
index 0000000000..504fe03275
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Development package for building Applications that use numa"
+HOMEPAGE = "http://oss.sgi.com/projects/libnuma/" 
+DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
+to run other programs with a specific NUMA policy and a libnuma to do \
+allocations with NUMA policy in applications."
+LICENSE = "GPL-2.0 & LGPL-2.1"
+SECTION = "apps"
+
+inherit autotools-brokensep ptest
+
+LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
+
+SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
+PV = "2.0.14+git${SRCPV}"
+
+SRC_URI = "git://github.com/numactl/numactl \
+    file://Fix-the-test-output-format.patch \
+    file://Makefile \
+    file://run-ptest \
+    file://0001-define-run-test-target.patch \
+"
+
+S = "${WORKDIR}/git"
+
+# ARM does not currently support NUMA
+COMPATIBLE_HOST = "^((?!arm).*)$"
+
+LDFLAGS_append_riscv64 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
+
+do_install() {
+    oe_runmake DESTDIR=${D} prefix=${D}/usr install
+    #remove the empty man2 directory
+    rm -r ${D}${mandir}/man2
+}
+
+do_compile_ptest() {
+    oe_runmake test
+}
+
+do_install_ptest() {
+    #install tests binaries
+    local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
+    mynode    nodemap node-parse pagesize prefered randmap realloc_test \
+    tbitmap tshared"
+
+    [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
+    for i in $test_binaries; do
+        install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
+    done
+
+    local test_scripts="checktopology checkaffinity printcpu regress regress2 \
+        shmtest  runltp bind_range"
+    for i in $test_scripts; do
+        install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
+    done
+
+    install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
+    install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
+}
+
+RDEPENDS_${PN}-ptest = "bash"
-- 
2.27.0

