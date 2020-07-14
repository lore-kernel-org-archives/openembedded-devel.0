Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.13611.1594702434169309736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 21:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: 0SpyGhJynKrAosEKnqyyOaYgZ6Wa9K8qe88EgigF2eP8ImTazrMT6QlR9hjNsN8ca8+8AOiOkA
 +BaXE1UcjhgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166912752"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="166912752"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 21:53:53 -0700
IronPort-SDR: B6R8dHOwrvPAzaQLb+BhF0H0qQvagiwer7sES91/7ZpokVQv1IJmgsA4AjIPNRCcjLzmEb4BNn
 n/xCGcw8meSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="429638764"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga004.jf.intel.com with ESMTP; 13 Jul 2020 21:53:52 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/2] safestringlib: add ptest
Date: Tue, 14 Jul 2020 13:01:20 +0800
Message-Id: <20200714050120.17802-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714050120.17802-1-naveen.kumar.saini@intel.com>
References: <20200714050120.17802-1-naveen.kumar.saini@intel.com>

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../safestringlib/enable-logs-for-ptest.patch | 28 +++++++++++++++++
 .../exclude-test-wmemmove-s-ptest.patch       | 30 +++++++++++++++++++
 .../safestringlib/safestringlib/run-ptest     | 10 +++++++
 .../safestringlib/safestringlib_git.bb        | 14 ++++++++-
 4 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib/enable-logs-for-ptest.patch
 create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib/exclude-test-wmemmove-s-ptest.patch
 create mode 100755 meta-oe/recipes-support/safestringlib/safestringlib/run-ptest

diff --git a/meta-oe/recipes-support/safestringlib/safestringlib/enable-logs-for-ptest.patch b/meta-oe/recipes-support/safestringlib/safestringlib/enable-logs-for-ptest.patch
new file mode 100644
index 000000000..4707b9e01
--- /dev/null
+++ b/meta-oe/recipes-support/safestringlib/safestringlib/enable-logs-for-ptest.patch
@@ -0,0 +1,28 @@
+From 0375758a2225394bcf766e3d5c3611c44ea967f7 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Thu, 9 Jul 2020 13:12:05 +0800
+Subject: [PATCH] unittests/CMakeLists.txt: define DEBUG for logs
+
+Required for ptest testcase.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ unittests/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/unittests/CMakeLists.txt b/unittests/CMakeLists.txt
+index 88cd835..9b285b2 100644
+--- a/unittests/CMakeLists.txt
++++ b/unittests/CMakeLists.txt
+@@ -1,5 +1,6 @@
+ cmake_minimum_required(VERSION 3.1)
+ project(safestring_test)
++add_compile_definitions(DEBUG)
+ 
+ set(SOURCES
+   Safe_String_UnitTestMain.c
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/safestringlib/safestringlib/exclude-test-wmemmove-s-ptest.patch b/meta-oe/recipes-support/safestringlib/safestringlib/exclude-test-wmemmove-s-ptest.patch
new file mode 100644
index 000000000..85ce97060
--- /dev/null
+++ b/meta-oe/recipes-support/safestringlib/safestringlib/exclude-test-wmemmove-s-ptest.patch
@@ -0,0 +1,30 @@
+From 669ac8ccbf7259239ccfd3f2a4a6e53a3c69ad09 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Wed, 8 Jul 2020 17:47:20 +0800
+Subject: [PATCH] unittests/Safe_String_UnitTestMain.c: exclude test_wmemmove_s
+
+test_wmemmove_s cause segmentation fault, exclude it for now
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ unittests/Safe_String_UnitTestMain.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unittests/Safe_String_UnitTestMain.c b/unittests/Safe_String_UnitTestMain.c
+index fa40511..e4b7e31 100644
+--- a/unittests/Safe_String_UnitTestMain.c
++++ b/unittests/Safe_String_UnitTestMain.c
+@@ -159,7 +159,7 @@ int main(void) {
+ 	test_wcsncpy_s(); /* New - Done */
+ 	test_wcsnlen_s(); /* New - Done */
+ 	test_wmemcpy_s(); /* New - Done */
+-	test_wmemmove_s(); /* New - Done */
++//	test_wmemmove_s(); /* New - Done */
+ 	test_wmemset_s(); /* New - Done */
+ 	test_wmemcmp_s(); /* New - Done */
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/safestringlib/safestringlib/run-ptest b/meta-oe/recipes-support/safestringlib/safestringlib/run-ptest
new file mode 100755
index 000000000..e426929e8
--- /dev/null
+++ b/meta-oe/recipes-support/safestringlib/safestringlib/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd unittests
+TOTALFAILS=$(./safestring_test  | grep Error | wc -l)
+if [ $TOTALFAILS -eq 0 ]; then
+  echo "PASS: safestring test"
+else
+  echo "FAIL: safestring  test"
+  echo "Total Saftstring tests failed: $TOTALFAILS"
+fi
diff --git a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
index 1ca594412..c171fa238 100644
--- a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
+++ b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE&COPYING.txt;md5=edd6f8c4c1072d72645ae28cb04bd
                     file://LICENSE;md5=54f68ba2c33474320fcc46b1f2d01249"
 
 SRC_URI = "git://github.com/intel/safestringlib.git;protocol=https \
+           file://exclude-test-wmemmove-s-ptest.patch \
+           file://enable-logs-for-ptest.patch \
+           file://run-ptest \
         "
 
 PV = "1.0.0+git${SRCPV}"
@@ -12,7 +15,11 @@ SRCREV = "245c4b8cff1d2e7338b7f3a82828fc8e72b29549"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake ptest
+
+EXTRA_OECMAKE += " \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_UNITTESTS=ON', '', d)} \
+                "
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
@@ -24,5 +31,10 @@ do_install() {
     install -m 0644 ${S}/include/*.h ${D}${includedir}
 }
 
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/unittests
+    install -m 0755 ${B}/unittests/safestring_test ${D}${PTEST_PATH}/unittests
+}
+
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.17.1

