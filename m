Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55C2A6E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 01:17:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t761Gx0G003808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Aug 2015 18:16:59 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 5 Aug 2015 18:16:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Aug 2015 09:14:06 +0800
Message-ID: <1438823646-28223-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] numactl: fix the ptest building
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
X-List-Received-Date: Thu, 06 Aug 2015 01:17:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

after upgrade, binary files are installed into test/.libs/, so
fix the install ptest.
redesign test Makefile rule

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../numactl/0001-define-run-test-target.patch      | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/numactl/numactl_2.0.10.bb  | 21 ++++++++++----
 2 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch

diff --git a/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
new file mode 100644
index 0000000..78ffb22
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
diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.10.bb b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
index 3a10ebb..8f27b15 100644
--- a/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
+++ b/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
@@ -15,6 +15,7 @@ SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
 	   file://Fix-the-test-output-format.patch \
 	   file://Makefile \
 	   file://run-ptest \
+	   file://0001-define-run-test-target.patch \
           "
 SRC_URI[md5sum] = "682c38305b2596967881f3d77bc3fc9c"
 SRC_URI[sha256sum] = "dbdac8fe74f13b2e2864bba352f1597ab1d3345c8c485d7805f58d66f414db61"
@@ -28,19 +29,29 @@ do_install() {
 	rm -r ${D}${mandir}/man2
 }
 
+do_compile_ptest() {
+	oe_runmake test
+}
+
 do_install_ptest() {
 	#install tests binaries
-        local test_binaries="checkaffinity checktopology distance	\
-		ftok mbind_mig_pages migrate_pages move_pages mynode	\
-		nodemap pagesize prefered printcpu randmap realloc_test	\
-		regress regress2 runltp shmtest tbitmap tshared bind_range"
+        local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
+		mynode	nodemap node-parse pagesize prefered randmap realloc_test \
+		tbitmap tshared"
 
 	[ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
 	for i in $test_binaries; do
+		install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
+	done
+
+	local test_scripts="checktopology checkaffinity printcpu regress regress2 \
+			shmtest  runltp bind_range"
+	for i in $test_scripts; do
 		install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
 	done
+
 	install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
-	install -m 0755 ${B}/numactl ${D}${PTEST_PATH}/
+	install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
 }
 
 RDEPENDS_${PN}-ptest = "bash"
-- 
1.9.1


