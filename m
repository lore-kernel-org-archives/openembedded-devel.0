Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2DEC433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 15:08:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.8023.1647702504332174656
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 08:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22JF8LRY031516
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 08:08:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 19 Mar 2022 08:08:20 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 19 Mar 2022 08:08:20 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] libyang: update from 2.0.7 to 2.0.164
Date: Sat, 19 Mar 2022 08:08:20 -0700
Message-ID: <20220319150820.105493-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Mar 2022 15:08:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96063

Modify the patch since the removal of pcre2-config is no long needed as
upstream now does:
   75518cf7 cmake FEATURE read pcre2 version from header
and created an upstream PR as per new Upstream-Status.

The flag for building the test code was changed from ENABLE_BUILD_TESTS to
just ENABLE_TESTS in:
   cdffdabb build REFACTOR rename test option to unify with other projects

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../libyang/libyang-add-stdint-h.patch        | 35 ++++++++++++
 ...byang-skip-pcre2-config-add-stdint-h.patch | 55 -------------------
 .../{libyang_2.0.7.bb => libyang_2.0.164.bb}  |  7 ++-
 3 files changed, 39 insertions(+), 58 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch
 delete mode 100644 meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
 rename meta-oe/recipes-extended/libyang/{libyang_2.0.7.bb => libyang_2.0.164.bb} (85%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch b/meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch
new file mode 100644
index 000000000..d35741114
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/libyang-add-stdint-h.patch
@@ -0,0 +1,35 @@
+From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
+From: Tony Tascioglu <tony.tascioglu@windriver.com>
+Date: Mon, 21 Jun 2021 12:34:22 -0400
+Subject: [PATCH] libyang: fix initial build errors
+
+This patch addresses build errors seen when integrating libyang as a
+recipe.
+
+There is a missing include statement for stdint.h in utests.h which
+causes build problems. stdint.h is required to be imported by cmocka.h
+prior to the cmocka file. Adding the stdint allows it to build the
+tests correctly
+
+Upstream-Status: Submitted [ https://github.com/CESNET/libyang/pull/1819 ]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
+---
+ tests/utests/utests.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/utests/utests.h b/tests/utests/utests.h
+index 7e85a66e..8eee26ce 100644
+--- a/tests/utests/utests.h
++++ b/tests/utests/utests.h
+@@ -22,6 +22,7 @@
+ #include <stdarg.h>
+ #include <stddef.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ 
+ #include <cmocka.h>
+ 
+-- 
+2.32.0
diff --git a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
deleted file mode 100644
index e3b2d0e02..000000000
--- a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
-From: Tony Tascioglu <tony.tascioglu@windriver.com>
-Date: Mon, 21 Jun 2021 12:34:22 -0400
-Subject: [PATCH] libyang: fix initial build errors
-
-This patch addresses build errors seen when integrating libyang as a
-recipe.
-
-The call to pcre2-config has been commented out. *-config calls are
-being replaced by pkgconfig, and we want to avoid the binary config
-calls. This call can safely be discarded since it is used to check
-the version of libpcre2 on the system, and all recent YP builds meet
-the minimum required version (v10.21).
-
-There is a missing include statement for stdint.h in utests.h which
-causes build problems. stdint.h is required to be imported by cmocka.h
-prior to the cmocka file. Adding the stdint allows it to build the
-tests correctly
-
-Upstream-Status: Pending
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- CMakeModules/FindPCRE2.cmake | 2 +-
- tests/utests/utests.h        | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeModules/FindPCRE2.cmake b/CMakeModules/FindPCRE2.cmake
-index 8f60daa2..ad014f14 100644
---- a/CMakeModules/FindPCRE2.cmake
-+++ b/CMakeModules/FindPCRE2.cmake
-@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
- FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
- 
- # Check required version
--execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
-+# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
- 
- # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to TRUE if all listed variables are TRUE.
- INCLUDE(FindPackageHandleStandardArgs)
-diff --git a/tests/utests/utests.h b/tests/utests/utests.h
-index 5bea0459..a256120c 100644
---- a/tests/utests/utests.h
-+++ b/tests/utests/utests.h
-@@ -23,6 +23,7 @@
- #include <stddef.h>
- #include <stdlib.h>
- 
-+#include <stdint.h>
- #include <cmocka.h>
- 
- #include <string.h>
--- 
-2.32.0
-
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
similarity index 85%
rename from meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
index 2f5e4615f..8f41769e0 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
@@ -6,15 +6,16 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56"
+SRCREV = "a0cc89516ab5eca84d01c85309f320a94752a64c"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
-           file://libyang-skip-pcre2-config-add-stdint-h.patch \
+           file://libyang-add-stdint-h.patch \
            file://run-ptest \
            "
 
 S = "${WORKDIR}/git"
 
+# Due to valgrind not supported on these arches:
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:armv5 = "null"
 COMPATIBLE_HOST:riscv64 = "null"
@@ -29,7 +30,7 @@ BINCONFIG = "${bindir}/pcre2-config"
 RDEPENDS:${PN}-ptest += "valgrind"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
-EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_BUILD_TESTS=ON', '', d)}"
+EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON', '', d)}"
 
 do_install_ptest () {
     cp -fR ${B}/tests/ ${D}${PTEST_PATH}/
-- 
2.31.1


