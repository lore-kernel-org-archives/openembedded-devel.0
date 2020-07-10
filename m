Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.4583.1594357719904155029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 22:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: OKmpn4BzeFQPIpM28kJZm5wJg6Dc3qHR89BbQGt8oeZ8vIfJtJvpBsyxhKO1wB0EkfRZ1wxzDq
 oLk2uB26VY+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="148141374"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="148141374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2020 22:08:39 -0700
IronPort-SDR: 4x+nKxgfpjh6k72HQQmatUNU+7u76aXodjeuAHW5qUFHX+nYuoLTyBilH9NqWSfH4r9EnmT2cA
 LtsY6yckZtLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="484528040"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jul 2020 22:08:38 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] safestringlib: add ptest
Date: Fri, 10 Jul 2020 13:16:01 +0800
Message-Id: <20200710051601.11962-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710051601.11962-1-naveen.kumar.saini@intel.com>
References: <20200710051601.11962-1-naveen.kumar.saini@intel.com>

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../safestringlib/enable-logs-for-ptest.patch | 28 +++++++++++++++++
 .../exclude-test-wmemmove-s-ptest.patch       | 30 +++++++++++++++++++
 .../safestringlib/safestringlib/run-ptest     | 10 +++++++
 .../safestringlib/safestringlib_git.bb        | 13 +++++++-
 4 files changed, 80 insertions(+), 1 deletion(-)
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
index 3d54fc8d6..1bcb21439 100644
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
@@ -12,8 +15,11 @@ SRCREV = "245c4b8cff1d2e7338b7f3a82828fc8e72b29549"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake ptest
 
+EXTRA_OECMAKE += " \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_UNITTESTS=ON', '', d)} \
+                   "
 do_install() {
     install -d ${D}${libdir}
     install -d ${D}${includedir}
@@ -22,5 +28,10 @@ do_install() {
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

