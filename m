Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CC72473CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 07:43:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98809856"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2015 15:46:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6O7fQuQ011531
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 15:41:26 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 24 Jul 2015 15:43:14 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Jul 2015 15:43:05 +0800
Message-ID: <1437723785-7137-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] numactl: upgrade 2.0.9 -> 2.0.10
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
X-List-Received-Date: Fri, 24 Jul 2015 07:43:21 -0000
Content-Type: text/plain

1) Update Fix-the-test-output-format.patch,since the contents
has been changed.

2) Update the checksum, beginline and endline of LICENSE file,
but the LICENSE has not been changed.

3) Remove "libdir=${D}/${libdir}" to avoid build Warning:
QA Issue: numactl: Files/directories were installed but not shipped in any package

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../numactl/Fix-the-test-output-format.patch       | 41 ++++++++++++----------
 .../{numactl_2.0.9.bb => numactl_2.0.10.bb}        |  8 ++---
 2 files changed, 27 insertions(+), 22 deletions(-)
 rename meta-oe/recipes-support/numactl/{numactl_2.0.9.bb => numactl_2.0.10.bb} (80%)

diff --git a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 8c309a4..7d52503 100644
--- a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,26 +1,30 @@
-[PATCH] Fix the test output format
+From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Tue, 21 Jul 2015 02:01:22 +0900
+Subject: [PATCH] Fix the test output format
 
 Upstream-Status: Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
- test/regress  |    6 +++---
- test/regress2 |    9 ++++-----
- 2 files changed, 7 insertions(+), 8 deletions(-)
+ test/regress  |  6 +++---
+ test/regress2 | 11 +++++------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/test/regress b/test/regress
-index 05eff5b..10d72f7 100755
+index 2ce1705..d086a47 100755
 --- a/test/regress
 +++ b/test/regress
-@@ -73,6 +73,7 @@ probe_hardware()
+@@ -74,6 +74,7 @@ probe_hardware()
  	if [ $numnodes -lt 2 ] ; then
  	    echo "need at least two nodes with at least $NEEDPAGES each of"
  	    echo "free memory for mempolicy regression tests"
 +	    echo "FAIL: numa regress"
- 	    exit 1
+	    exit 77  # Skip test
  	fi
  }
-@@ -206,10 +207,9 @@ main()
+@@ -207,10 +208,9 @@ main()
  	rm A B
  
  	if [ "$EXIT" = 0 ] ; then
@@ -34,26 +38,27 @@ index 05eff5b..10d72f7 100755
  }
  
 diff --git a/test/regress2 b/test/regress2
-index 6a254fa..9c97943 100755
+index aa6ea41..450c510 100755
 --- a/test/regress2
 +++ b/test/regress2
-@@ -6,12 +6,11 @@ VALGRIND=${VALGRIND:-}
- export LD_LIBRARY_PATH=`pwd`/..
+@@ -9,12 +9,11 @@ testdir=`dirname "$0"`
+ export PATH=${builddir}:$PATH
  
  T() {
 -       echo "$@" 
 -       if ! $VALGRIND "$@" ;  then
 -	  echo	$1 FAILED!!!!
 -	  exit 1
-+       if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
-+	  echo	"FAIL: $1"
-+       else
-+	  echo "PASS: $1"
-        fi
+-       fi
 -       echo
++	if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
++	   echo  "FAIL: $1"
++	else
++	   echo "PASS: $1"
++	fi
  }
  
- # various tests
+ # still broken
 -- 
-1.7.10.4
+1.8.4.2
 
diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
similarity index 80%
rename from meta-oe/recipes-support/numactl/numactl_2.0.9.bb
rename to meta-oe/recipes-support/numactl/numactl_2.0.10.bb
index 29e57d9..3a10ebb 100644
--- a/meta-oe/recipes-support/numactl/numactl_2.0.9.bb
+++ b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
@@ -8,9 +8,7 @@ RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep ptest
 
-LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
-SRC_URI[md5sum] = "136685c8eaf9d6569c351fe1d453b30c"
-SRC_URI[sha256sum] = "9ca033e6c14c0f26c20379b0cf9299429fd5a354a79c3c7880fd41ef69f7751c"
+LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=00b9fb4504ff2afcb7fb2a518780f412"
 
 SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
 	   file://fix-null-pointer.patch \
@@ -18,12 +16,14 @@ SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
 	   file://Makefile \
 	   file://run-ptest \
           "
+SRC_URI[md5sum] = "682c38305b2596967881f3d77bc3fc9c"
+SRC_URI[sha256sum] = "dbdac8fe74f13b2e2864bba352f1597ab1d3345c8c485d7805f58d66f414db61"
 
 # ARM does not currently support NUMA
 COMPATIBLE_HOST = "^((?!arm).*)$"
 
 do_install() {
-        oe_runmake DESTDIR=${D} prefix=${D}/usr libdir=${D}/${libdir} install
+        oe_runmake DESTDIR=${D} prefix=${D}/usr install
 	#remove the empty man2 directory
 	rm -r ${D}${mandir}/man2
 }
-- 
1.8.4.2


