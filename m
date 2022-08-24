Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90439C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:07:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8843.1661332022072421315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=izjHEmqV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52357b15f1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27O8dqSj008336
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=KZJffdlI6iwrX8UkXZJQVZ++nnqUEQX66k3MGasvnFU=;
 b=izjHEmqVDY7XJg7xPRvQPCLBfGWqXekNS99nxcu6GrIFGiyzV01ZUqPeV3aRhS6MnrwK
 WfON938M1h1nZMZZRQdV6H94oV7rC1v8A1m5yxQFefNxiUJ0o1ES+fqbkPiYiya2KRu7
 ZeVmGmHrCbwMKJ4/O0QmBSpB1coSSK5RjuUs+rCcg/gR533nKIQWG6mlqzwg4OwxceXi
 xD6a/hZrkkJh+9pJ3DxBNjgDLpTbAeF4XCYTy52YkQJPGGPbVgYkJR0Hs7Z8BW7Y5L2a
 k6uD3maPqk8yMrZSMlS8KiLlqjD5TCowUax9DuHNiA7xA88mcpSNnrcmMUxnRFRuo4Sf Dg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53s30jv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:07:01 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Aug 2022 02:06:58 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 24 Aug 2022 02:06:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freediameter: fix buildpaths issue
Date: Wed, 24 Aug 2022 17:06:56 +0800
Message-ID: <20220824090656.104488-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IMZWXr3zvQqC-FmgcBW0kZOJEgzXVa_w
X-Proofpoint-GUID: IMZWXr3zvQqC-FmgcBW0kZOJEgzXVa_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_04,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 09:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98416

From: Mingli Yu <mingli.yu@windriver.com>

The pass-ptest-env.patch uses ${B}/extensions as the EXTENSIONS_DIR at build
time and pass the env variable EXTENSIONS_DIR as ${libdir}/${fd_pkgname} at
run time to fix the run time error. But there still exists buildpaths issue.

So rework the pass-ptest-env.patch to make sure EXTENSIONS_DIR to be
${libdir}/${fd_pkgname} both in build and run time.

Fixes:
  WARNING: freediameter-1.4.0-r0 do_package_qa: QA Issue: File /usr/lib/freeDiameter/ptest/testloadext in package freediameter-ptest contains reference to TMPDIR
  File /usr/lib/freeDiameter/ptest/testmesg_stress in package freediameter-ptest contains reference to TMPDIR
  File /usr/lib/freeDiameter/ptest/CTestTestfile.cmake in package freediameter-ptest contains reference to TMPDIR [buildpaths]
  WARNING: freediameter-1.4.0-r0 do_package_qa: QA Issue: File /usr/src/debug/freediameter/1.4.0-r0/build/libfdcore/fdd.tab.c in package freediameter-src contains reference to TMPDIR

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-tests-use-EXTENSIONS_DIR.patch | 92 +++++++++++++++++++
 .../freediameter/files/pass-ptest-env.patch   | 72 ---------------
 .../freediameter/files/run-ptest              |  1 -
 .../freediameter/freediameter_1.4.0.bb        |  7 +-
 4 files changed, 97 insertions(+), 75 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-tests-use-EXTENSIONS_DIR.patch
 delete mode 100644 meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch

diff --git a/meta-networking/recipes-protocols/freediameter/files/0001-tests-use-EXTENSIONS_DIR.patch b/meta-networking/recipes-protocols/freediameter/files/0001-tests-use-EXTENSIONS_DIR.patch
new file mode 100644
index 000000000..4cedc21ce
--- /dev/null
+++ b/meta-networking/recipes-protocols/freediameter/files/0001-tests-use-EXTENSIONS_DIR.patch
@@ -0,0 +1,92 @@
+From 935fcac46e2790e0e297ca855b8033895c1b8941 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 24 Aug 2022 13:45:32 +0800
+Subject: [PATCH] tests: use EXTENSIONS_DIR
+
+Use EXTENSIONS_DIR to replace BUILD_DIR as the BUILD_DIR is meanlingless
+on target and also fix buildpaths issue.
+
+Upstream-Status: Inappropriate [OE ptest specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/CMakeLists.txt    |  1 +
+ tests/testloadext.c     | 12 ++++++------
+ tests/testmesg_stress.c | 12 ++++++------
+ 3 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 8b698ce..2c83cbb 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -37,6 +37,7 @@ SET(TEST_LIST
+ 
+ ADD_DEFINITIONS(-DTEST_DEBUG)
+ ADD_DEFINITIONS(-DBUILD_DIR="${CMAKE_BINARY_DIR}")
++ADD_DEFINITIONS(-DEXTENSIONS_DIR="${EXTENSIONS_DIR}")
+ 
+ INCLUDE_DIRECTORIES( "../libfdproto" )
+ INCLUDE_DIRECTORIES( "../libfdcore" )
+diff --git a/tests/testloadext.c b/tests/testloadext.c
+index 452737f..3fffef5 100644
+--- a/tests/testloadext.c
++++ b/tests/testloadext.c
+@@ -35,9 +35,9 @@
+ 
+ #include "tests.h"
+ 
+-#ifndef BUILD_DIR
+-#error "Missing BUILD_DIR information"
+-#endif /* BUILD_DIR */
++#ifndef EXTENSIONS_DIR
++#error "Missing EXTENSIONS_DIR information"
++#endif /* EXTENSIONS_DIR */
+ 
+ #include <sys/types.h>
+ #include <dirent.h>
+@@ -59,9 +59,9 @@ int main(int argc, char *argv[])
+ 	CHECK( 0, fd_rtdisp_init()  );
+ 	
+ 	/* Find all extensions which have been compiled along the test */
+-	TRACE_DEBUG(INFO, "Loading from: '%s'", BUILD_DIR "/extensions");
+-	CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 : 0 );
+-	pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensions/");
++	TRACE_DEBUG(INFO, "Loading from: '%s'", EXTENSIONS_DIR);
++	CHECK( 0, (dir = opendir (EXTENSIONS_DIR)) == NULL ? 1 : 0 );
++	pathlen = snprintf(fullname, sizeof(fullname), EXTENSIONS_DIR "/");
+ 	
+ 	while ((dp = readdir (dir)) != NULL) {
+ 		char * dot = strrchr(dp->d_name, '.');
+diff --git a/tests/testmesg_stress.c b/tests/testmesg_stress.c
+index 310a9d2..97dfe07 100644
+--- a/tests/testmesg_stress.c
++++ b/tests/testmesg_stress.c
+@@ -38,9 +38,9 @@
+ #include <libgen.h>
+ #include <dlfcn.h>
+ 
+-#ifndef BUILD_DIR
+-#error "Missing BUILD_DIR information"
+-#endif /* BUILD_DIR */
++#ifndef EXTENSIONS_DIR
++#error "Missing EXTENSIONS_DIR information"
++#endif /* EXTENSIONS_DIR */
+ 
+ 
+ /* The number of times each operation is repeated to measure the average operation time */
+@@ -73,9 +73,9 @@ static void load_all_extensions(char * prefix)
+ 	struct fd_list ext_with_depends = FD_LIST_INITIALIZER(ext_with_depends);
+ 
+ 	/* Find all extensions which have been compiled along the test */
+-	LOG_D("Loading %s*.fdx from: '%s'", BUILD_DIR "/extensions", prefix ?: "");
+-	CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 : 0 );
+-	pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensions/");
++	LOG_D("Loading %s*.fdx from: '%s'", EXTENSIONS_DIR, prefix ?: "");
++	CHECK( 0, (dir = opendir (EXTENSIONS_DIR)) == NULL ? 1 : 0 );
++	pathlen = snprintf(fullname, sizeof(fullname), EXTENSIONS_DIR "/");
+ 	
+ 	while ((dp = readdir (dir)) != NULL) {
+ 		char * dot = strrchr(dp->d_name, '.');
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch b/meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch
deleted file mode 100644
index ea857af7d..000000000
--- a/meta-networking/recipes-protocols/freediameter/files/pass-ptest-env.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-freediameter ptest cases testmesg_stress.c and testloadext.c need load
-extensions both build time and runtime. Then they search extensions with
-build directory that causes runtime failures.
-
-Pass an environment variable to define runtime extension path.
-
-Upstream-Status: Inappropriate [OE ptest specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
-diff -Nur freeDiameter-1.2.0.orig/tests/testloadext.c freeDiameter-1.2.0/tests/testloadext.c
---- freeDiameter-1.2.0.orig/tests/testloadext.c	2014-02-19 17:33:24.785405032 +0800
-+++ freeDiameter-1.2.0/tests/testloadext.c	2014-02-19 20:08:03.871403924 +0800
-@@ -49,7 +49,7 @@
- {
- 	DIR *dir;
- 	struct dirent *dp;
--	char fullname[512];
-+	char fullname[1024];
- 	int pathlen;
- 
- 	/* First, initialize the daemon modules */
-@@ -57,11 +57,16 @@
- 	CHECK( 0, fd_queues_init()  );
- 	CHECK( 0, fd_msg_init()  );
- 	CHECK( 0, fd_rtdisp_init()  );
--	
-+
-+	char *ext_dir = getenv("EXTENSIONS_DIR");
-+	if (ext_dir)
-+		pathlen = snprintf(fullname, sizeof(fullname), "%s", ext_dir);
-+	else
-+		pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensions/");
-+
- 	/* Find all extensions which have been compiled along the test */
--	TRACE_DEBUG(INFO, "Loading from: '%s'", BUILD_DIR "/extensions");
--	CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 : 0 );
--	pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensions/");
-+	TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
-+	CHECK( 0, (dir = opendir (fullname)) == NULL ? 1 : 0 );
- 	
- 	while ((dp = readdir (dir)) != NULL) {
- 		char * dot = strrchr(dp->d_name, '.');
-diff -Nur freeDiameter-1.2.0.orig/tests/testmesg_stress.c freeDiameter-1.2.0/tests/testmesg_stress.c
---- freeDiameter-1.2.0.orig/tests/testmesg_stress.c	2014-02-19 17:33:24.785405032 +0800
-+++ freeDiameter-1.2.0/tests/testmesg_stress.c	2014-02-19 20:08:03.928403924 +0800
-@@ -67,15 +67,20 @@
- {
- 	DIR *dir;
- 	struct dirent *dp;
--	char fullname[512];
-+	char fullname[1024];
- 	int pathlen;
- 	struct fd_list all_extensions = FD_LIST_INITIALIZER(all_extensions);
- 	struct fd_list ext_with_depends = FD_LIST_INITIALIZER(ext_with_depends);
- 
-+	char *ext_dir = getenv("EXTENSIONS_DIR");
-+	if (ext_dir)
-+		pathlen = snprintf(fullname, sizeof(fullname), "%s", ext_dir);
-+	else
-+		pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensions/");
-+
- 	/* Find all extensions which have been compiled along the test */
--	LOG_D("Loading %s*.fdx from: '%s'", BUILD_DIR "/extensions", prefix ?: "");
--	CHECK( 0, (dir = opendir (BUILD_DIR "/extensions")) == NULL ? 1 : 0 );
--	pathlen = snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensions/");
-+	TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
-+	CHECK( 0, (dir = opendir (fullname)) == NULL ? 1 : 0 );
- 	
- 	while ((dp = readdir (dir)) != NULL) {
- 		char * dot = strrchr(dp->d_name, '.');
diff --git a/meta-networking/recipes-protocols/freediameter/files/run-ptest b/meta-networking/recipes-protocols/freediameter/files/run-ptest
index d0ca8d962..3c841644b 100644
--- a/meta-networking/recipes-protocols/freediameter/files/run-ptest
+++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
@@ -6,6 +6,5 @@ if ! lsmod | grep -q sctp && ! modprobe sctp 2>/dev/null; then
         echo
 fi
 
-export EXTENSIONS_DIR=$EXTENSIONS_DIR
 cmake  -E cmake_echo_color --cyan "Running tests..."
 ctest --force-new-ctest-process
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
index 3ec20d3ab..93a607d3c 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "\
     file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch \
     file://freediameter.service \
     file://freediameter.init \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://install_test.patch file://run-ptest file://pass-ptest-env.patch', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://install_test.patch file://run-ptest file://0001-tests-use-EXTENSIONS_DIR.patch', '', d)} \
     file://freeDiameter.conf \
     file://0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch \
     "
@@ -46,6 +46,7 @@ EXTRA_OECMAKE = " \
     -DBUILD_TEST_RT_ANY:BOOL=ON \
     -DINSTALL_LIBRARY_SUFFIX:PATH=${baselib} \
     -DINSTALL_EXTENSIONS_SUFFIX:PATH=${baselib}/${fd_pkgname} \
+    -DEXTENSIONS_DIR:PATH=${libdir}/${fd_pkgname} \
     -DINSTALL_TEST_SUFFIX:PATH=${PTEST_PATH}-tests \
     -DCMAKE_SKIP_RPATH:BOOL=ON \
 "
@@ -107,13 +108,15 @@ EOF
     openssl req -x509 -config ${STAGING_DIR_NATIVE}/etc/ssl/openssl.cnf -newkey rsa:4096 -sha256 -nodes -out ${D}${sysconfdir}/freeDiameter/${FD_PEM} -keyout ${D}${sysconfdir}/freeDiameter/${FD_KEY} -days 3650 -subj '/CN=${FD_HOSTNAME}.${FD_REALM}'
     openssl dhparam -out ${D}${sysconfdir}/freeDiameter/${FD_DH_PEM} 1024
 
+    find ${B} \( -name "*.c" -o -name "*.h" \) -exec sed -i -e 's#${WORKDIR}##g' {} \;
 }
 
 do_install_ptest() {
-    sed -i "s#\(EXTENSIONS_DIR=\).*\$#\1${libdir}/${fd_pkgname}/#" ${D}${PTEST_PATH}/run-ptest
     mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
     rmdir ${D}${PTEST_PATH}-tests
     install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}/
+    sed -i -e 's#${WORKDIR}##g' ${D}${PTEST_PATH}/CTestTestfile.cmake
+    sed -i "/^set_tests_properties/d" ${D}${PTEST_PATH}/CTestTestfile.cmake
 }
 
 FILES:${PN}-dbg += "${libdir}/${fd_pkgname}/.debug/*"
-- 
2.25.1


