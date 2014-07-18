Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBE070617
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 07:41:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6I7fEF2002689
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 00:41:14 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 18 Jul 2014 00:41:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Jul 2014 15:41:15 +0800
Message-ID: <1405669276-4940-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] numctl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 07:41:21 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

It consists of a numactl program to run other programs with a specific NUMA
policy and a libnuma to do allocations with NUMA policy in applications.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../numactl/files/Fix-the-test-output-format.patch |   59 ++++++++++++++++++++
 meta-oe/recipes-support/numactl/files/Makefile     |    7 +++
 .../numactl/files/fix-null-pointer.patch           |   28 ++++++++++
 meta-oe/recipes-support/numactl/files/run-ptest    |    9 +++
 meta-oe/recipes-support/numactl/numactl.inc        |   40 +++++++++++++
 meta-oe/recipes-support/numactl/numactl_2.0.9.bb   |    6 ++
 6 files changed, 149 insertions(+)
 create mode 100644 meta-oe/recipes-support/numactl/files/Fix-the-test-output-format.patch
 create mode 100644 meta-oe/recipes-support/numactl/files/Makefile
 create mode 100644 meta-oe/recipes-support/numactl/files/fix-null-pointer.patch
 create mode 100755 meta-oe/recipes-support/numactl/files/run-ptest
 create mode 100644 meta-oe/recipes-support/numactl/numactl.inc
 create mode 100644 meta-oe/recipes-support/numactl/numactl_2.0.9.bb

diff --git a/meta-oe/recipes-support/numactl/files/Fix-the-test-output-format.patch b/meta-oe/recipes-support/numactl/files/Fix-the-test-output-format.patch
new file mode 100644
index 0000000..8c309a4
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/files/Fix-the-test-output-format.patch
@@ -0,0 +1,59 @@
+[PATCH] Fix the test output format
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ test/regress  |    6 +++---
+ test/regress2 |    9 ++++-----
+ 2 files changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/test/regress b/test/regress
+index 05eff5b..10d72f7 100755
+--- a/test/regress
++++ b/test/regress
+@@ -73,6 +73,7 @@ probe_hardware()
+ 	if [ $numnodes -lt 2 ] ; then
+ 	    echo "need at least two nodes with at least $NEEDPAGES each of"
+ 	    echo "free memory for mempolicy regression tests"
++	    echo "FAIL: numa regress"
+ 	    exit 1
+ 	fi
+ }
+@@ -206,10 +207,9 @@ main()
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
+index 6a254fa..9c97943 100755
+--- a/test/regress2
++++ b/test/regress2
+@@ -6,12 +6,11 @@ VALGRIND=${VALGRIND:-}
+ export LD_LIBRARY_PATH=`pwd`/..
+ 
+ T() {
+-       echo "$@" 
+-       if ! $VALGRIND "$@" ;  then
+-	  echo	$1 FAILED!!!!
+-	  exit 1
++       if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
++	  echo	"FAIL: $1"
++       else
++	  echo "PASS: $1"
+        fi
+-       echo
+ }
+ 
+ # various tests
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/numactl/files/Makefile b/meta-oe/recipes-support/numactl/files/Makefile
new file mode 100644
index 0000000..6489f83
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/files/Makefile
@@ -0,0 +1,7 @@
+.PHONY: regress1 regress2
+
+regress1:
+	cd test ; ./regress
+
+regress2:
+	cd test ; ./regress2
diff --git a/meta-oe/recipes-support/numactl/files/fix-null-pointer.patch b/meta-oe/recipes-support/numactl/files/fix-null-pointer.patch
new file mode 100644
index 0000000..6a29606
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/files/fix-null-pointer.patch
@@ -0,0 +1,28 @@
+[PATCH] return 0 if distance_table is NULL
+
+Upstream-Status: Pending
+
+read_distance_table() maybe return 0, but distance_table is not set,
+if distance_table is used, and will lead to SEGFAULT
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ distance.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/distance.c b/distance.c
+index 4a26972..c6ca021 100755
+--- a/distance.c
++++ b/distance.c
+@@ -113,6 +113,8 @@ int numa_distance(int a, int b)
+ 		int err = read_distance_table();
+ 		if (err < 0)
+ 			return 0;
++		if (!distance_table)
++			return 0;
+ 	}
+ 	return distance_table[a * distance_numnodes + b];
+ }
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/numactl/files/run-ptest b/meta-oe/recipes-support/numactl/files/run-ptest
new file mode 100755
index 0000000..6f67ec2
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/files/run-ptest
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
diff --git a/meta-oe/recipes-support/numactl/numactl.inc b/meta-oe/recipes-support/numactl/numactl.inc
new file mode 100644
index 0000000..21a8123
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl.inc
@@ -0,0 +1,40 @@
+SUMMARY = "Development package for building Applications that use numa"
+DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
+to run other programs with a specific NUMA policy and a libnuma to do \
+allocations with NUMA policy in applications."
+LICENSE = "GPL-2.0 & LGPL-2.1"
+SECTION = "apps"
+RDEPENDS_${PN} = "perl"
+
+inherit autotools-brokensep ptest
+
+SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
+	   file://fix-null-pointer.patch \
+	   file://Fix-the-test-output-format.patch \
+	   file://Makefile \
+	   file://run-ptest \
+          "
+
+# ARM does not currently support NUMA
+COMPATIBLE_HOST = "^((?!arm).*)$"
+
+do_install() {
+        oe_runmake DESTDIR=${D} prefix=${D}/usr libdir=${D}/${libdir} install
+	#remove the empty man2 directory
+	rm -r ${D}${mandir}/man2
+}
+
+do_install_ptest() {
+	#install tests binaries
+        local test_binaries="checkaffinity checktopology distance	\
+		ftok mbind_mig_pages migrate_pages move_pages mynode	\
+		nodemap pagesize prefered printcpu randmap realloc_test	\
+		regress regress2 runltp shmtest tbitmap tshared"
+
+	[ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
+	for i in $test_binaries; do
+		install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
+	done
+	install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
+}
+
diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb b/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
new file mode 100644
index 0000000..1a103cd
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
@@ -0,0 +1,6 @@
+require ${PN}.inc
+
+LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
+SRC_URI[md5sum] = "136685c8eaf9d6569c351fe1d453b30c"
+SRC_URI[sha256sum] = "9ca033e6c14c0f26c20379b0cf9299429fd5a354a79c3c7880fd41ef69f7751c"
+
-- 
1.7.10.4


