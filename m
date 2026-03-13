Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCA4106FD6D
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 03:26:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8058.1773372417793957115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 20:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=acFr7Qr4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773372418; x=1804908418;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZCsYkW3F6EjRnNRP42db5Z65i57Qv1mFTJY9cpFI9u8=;
  b=acFr7Qr4tBUbRXUNXb7bJF3YE+ObimSa/40RpPzh0Zen/x0/6xea6utC
   smmZFaRJtspOO3rG1kZ3yq2+nratqfa8sijFmn3BzU+wlQ6ItemYlHMls
   6CcRPmO5Tqpa0607nuzqb/2022eEEKYXtA3g4d8XZT067nj+GyFqb6wgD
   qY8/82dZ9tkpvw9Judo1w0iiUdLRb995tO4GGDR/0XYPLO/6305SwznQd
   +9gV5Lee9MeTrM3fHwHTas1QMJYtoRUpoOtVjcN5lY6QiqPoLl/bfFc6s
   9a9Z4cuO+yWE+mXWe8imcklYWpoRIWxggVeUj4OTF40pv+rJYwtAO480O
   Q==;
X-CSE-ConnectionGUID: z3hC8k/PSMGSjFqHJ+uNzQ==
X-CSE-MsgGUID: OFc6ls5+SIaAF6JrqmfHmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="232507561"
X-IronPort-AV: E=Sophos;i="6.23,117,1770562800"; 
   d="scan'208";a="232507561"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 12:26:56 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B13641C06342
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 03:26:55 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5EA3B1007100
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 03:26:55 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 12D95405A85
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 03:26:52 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] sysdig: upgrade 0.28.0 -> 0.39.0
Date: Fri, 13 Mar 2026 11:26:49 +0800
Message-ID: <20260313032649.4383-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 03:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125180

Upgrade sysdig to solve build failure after upgrading valijson to 1.1.0.

1.Changelog
  https://github.com/draios/sysdig/releases/tag/0.39.0

2.Update 0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch for 0.39.0

3.Remove following patches as merged upstream
  0001-Add-cstdint-for-uintXX_t-types.patch
  0001-libsinsp-fix-build-with-gcc-15.patch

4.Add 0001-Avoid-duplicate-operations-of-add_library.patch to fix do_configure errors
  -- Existing strlcat found, will *not* use local definition
  CMake Error at falcosecurity-libs/userspace/libscap/CMakeLists.txt:64 (add_library):
    add_library cannot create target "scap_error" because another target with
    the same name already exists.  The existing target is a static library

5.Add CMAKE option -DBUILD_SYSDIG_MODERN_BPF=OFF to fix bpf header file not found issue
  sysdig/0.39.0/recipe-sysroot/usr/include/bits/syscall.h:23:10: fatal error: 'bits/syscall-32.h' file not found
  |    23 | #include <bits/syscall-32.h>

6.Add do_configure:prepend() function and CFLAGS/CXXFLAGS to fix header file not found issue
  sysdig/0.39.0/sources/sysdig-0.39.0/falcosecurity-libs/userspace/libscap/engine/kmod/scap_kmod.c:30:10: fatal error: driver_config.h: No such file or directory
  |    30 | #include <driver_config.h>

7.Add do_compile:append() function to fix do_package QA Issue

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-Add-cstdint-for-uintXX_t-types.patch | 38 ---------------
 ...-duplicate-operations-of-add_library.patch | 47 +++++++++++++++++++
 ...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch | 21 +++++----
 .../0001-libsinsp-fix-build-with-gcc-15.patch | 31 ------------
 .../{sysdig_0.28.0.bb => sysdig_0.39.0.bb}    | 43 ++++++++++++++---
 5 files changed, 95 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch
 rename meta-oe/recipes-extended/sysdig/{sysdig_0.28.0.bb => sysdig_0.39.0.bb} (56%)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch
deleted file mode 100644
index e564958dad..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3d076ea588eb3c7f334133b4c31172a14beadf5b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Feb 2023 20:18:27 -0800
-Subject: [PATCH] Add <cstdint> for uintXX_t types
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it
-for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/falcosecurity/libs/pull/862]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- userspace/libsinsp/filter/parser.h | 1 +
- userspace/libsinsp/filter_value.h  | 1 +
- 2 files changed, 2 insertions(+)
-
---- a/userspace/libsinsp/filter/parser.h
-+++ b/userspace/libsinsp/filter/parser.h
-@@ -18,6 +18,7 @@ limitations under the License.
- #pragma once
- 
- #include "ast.h"
-+#include <cstdint>
- 
- //
- // Context-free Grammar for Sinsp Filters
---- a/userspace/libsinsp/filter_value.h
-+++ b/userspace/libsinsp/filter_value.h
-@@ -18,6 +18,7 @@ limitations under the License.
- #pragma once
- 
- #include <string.h>
-+#include <cstdint>
- #include <utility>
- 
- // Used for CO_IN/CO_PMATCH filterchecks using PT_CHARBUFs to allow
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch
new file mode 100644
index 0000000000..b8ca7dd38b
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch
@@ -0,0 +1,47 @@
+From 74dec208d95821855130f6ed7b167327f1247e99 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Thu, 5 Mar 2026 09:28:03 +0000
+Subject: [PATCH] Avoid duplicate operations of add_library.
+
+To fix following configure error
+| -- Existing strlcat found, will *not* use local definition
+| CMake Error at falcosecurity-libs/userspace/libscap/CMakeLists.txt:64 (add_library):
+|   add_library cannot create target "scap_error" because another target with
+|   the same name already exists.  The existing target is a static library
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ cmake/modules/libscap.cmake  | 2 +-
+ cmake/modules/libsinsp.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/modules/libscap.cmake b/cmake/modules/libscap.cmake
+index b41b12ff3..1753598e9 100644
+--- a/cmake/modules/libscap.cmake
++++ b/cmake/modules/libscap.cmake
+@@ -14,7 +14,7 @@
+ #
+ 
+ if(NOT HAVE_LIBSCAP)
+-	set(HAVE_LIBSCAP On)
++        set(HAVE_LIBSCAP On CACHE INTERNAL "Flag to indicate libscap has been processed")
+ 
+ 	if(NOT LIBS_DIR)
+ 		get_filename_component(LIBS_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
+diff --git a/cmake/modules/libsinsp.cmake b/cmake/modules/libsinsp.cmake
+index ff336e27f..0fdd2d4a9 100644
+--- a/cmake/modules/libsinsp.cmake
++++ b/cmake/modules/libsinsp.cmake
+@@ -14,7 +14,7 @@
+ #
+ 
+ if(NOT HAVE_LIBSINSP)
+-	set(HAVE_LIBSINSP On)
++        set(HAVE_LIBSINSP On CACHE INTERNAL "Flag to indicate libsinsp has been processed")
+ 
+ 	if(NOT LIBS_DIR)
+ 		get_filename_component(LIBS_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
index 903ccdf36a..bcf5da4f2c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
@@ -1,6 +1,6 @@
-From ed8969a233adb6bf701de96d0fd0570e5ddcc787 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 21 Mar 2022 19:35:48 -0700
+From 6ff4114dcbb87f34751064249967aa96c7b8b030 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 4 Mar 2026 10:02:10 +0000
 Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS
 
 This helps compliation of driver code where its calling modprobe on the
@@ -8,22 +8,25 @@ given kernel module via system() API
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update for 0.39.0
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  CMakeLists.txt | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7dceb7ae..e156c36f 100644
+index 8e8850dbe..c6d725c05 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -149,6 +149,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
- 	if(NOT DEFINED PROBE_NAME)
- 		set(PROBE_NAME "scap")
+@@ -174,6 +174,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+ 	if(NOT DEFINED DRIVER_NAME)
+ 		set(DRIVER_NAME "scap")
  	endif()
-+	add_definitions(-DPROBE_NAME="${PROBE_NAME}")
++       add_definitions(-DPROBE_NAME="${PROBE_NAME}")
  
  	set(DRIVERS_REPO "https://download.sysdig.com/scap-drivers")
  	
 -- 
-2.35.1
+2.43.0
 
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch
deleted file mode 100644
index 9a81f1c74c..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 47a86dabd065096ffc8818a1cffca96964d18120 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Tue, 22 Apr 2025 18:43:46 +0200
-Subject: [PATCH] libsinsp: fix build with gcc-15
-
-fixes:
-http://errors.yoctoproject.org/Errors/Details/852848/
-
-In file included from TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/userspace/chisel/lua_parser.cpp:20:
-TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/userspace/libsinsp/./gen_filter.h:87:17: error: 'uint64_t' does not name a type
-   87 |         virtual uint64_t get_ts() const = 0;
-      |                 ^~~~~~~~
-
-Upstream-Status: Pending [gen_filter is removed in newer version with https://github.com/falcosecurity/libs/commit/47e245f3d343eff27ed178ec2449caa3a01faabb]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- userspace/libsinsp/gen_filter.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/userspace/libsinsp/gen_filter.h b/userspace/libsinsp/gen_filter.h
-index f4cfa08b1..79ac30dc3 100644
---- a/userspace/libsinsp/gen_filter.h
-+++ b/userspace/libsinsp/gen_filter.h
-@@ -16,6 +16,7 @@ along with Falco.  If not, see <http://www.gnu.org/licenses/>.
- 
- #pragma once
- 
-+#include <cstdint>
- #include <set>
- #include <list>
- #include <map>
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
similarity index 56%
rename from meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
rename to meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
index c988b0af59..85e687a17b 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
@@ -19,21 +19,30 @@ JIT:powerpc64le = ""
 JIT:powerpc64 = ""
 
 DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp \
-            tbb jq openssl elfutils protobuf protobuf-native jq-native valijson"
+            tbb jq openssl elfutils protobuf protobuf-native jq-native valijson \
+            uthash libbpf clang-native bpftool-native yaml-cpp nlohmann-json"
 RDEPENDS:${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig \
-           git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs \
+           git://github.com/falcosecurity/libs;protocol=https;branch=release/0.18.x;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs \
+           git://github.com/falcosecurity/libs;protocol=https;branch=release/0.18.x;name=driver;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/driver \
            file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
-           file://0001-Add-cstdint-for-uintXX_t-types.patch;patchdir=./falcosecurity-libs \
-           file://0001-libsinsp-fix-build-with-gcc-15.patch;patchdir=./falcosecurity-libs \
-           file://0001-update-cmake-Only-add-dependencies-when-we-bundle.patch;patchdir=./falcosecurity-libs \
+           file://0001-Avoid-duplicate-operations-of-add_library.patch;patchdir=./falcosecurity-libs \
           "
-SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
-SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
+SRCREV_sysdig = "6ef29110cf1add746e10ab5b38957e22730b7349"
+SRCREV_falco = "e1999d079880d10800c57e004fca794a03cd060a"
+SRCREV_driver = "d4efc80ece48174a71c1a420cb52d233fa94f946"
 
 SRCREV_FORMAT = "sysdig_falco"
 
+#Add this function to generate driver_config.h
+do_configure:prepend() {
+    mkdir -p ${WORKDIR}/driver_Make
+    cd ${WORKDIR}/driver_Make
+    cmake ${S}/driver -DMINIMAL_BUILD=ON
+    cd -
+}
+do_configure[cleandirs] = "${WORKDIR}/driver_Make"
 
 EXTRA_OECMAKE = "\
                 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
@@ -44,11 +53,31 @@ EXTRA_OECMAKE = "\
                 -DDIR_ETC=${sysconfdir} \
                 -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
                 -DFALCOSECURITY_LIBS_SOURCE_DIR=${S}/falcosecurity-libs \
+                -DDRIVER_SOURCE_DIR=${S}/driver \
                 -DVALIJSON_INCLUDE=${STAGING_INCDIR}/valijson \
+                -DUSE_BUNDLED_RE2=OFF \
+                -DUSE_BUNDLED_TBB=OFF \
+                -DUSE_BUNDLED_JSONCPP=OFF \
+                -DBUILD_SYSDIG_MODERN_BPF=OFF \
+                -DCREATE_TEST_TARGETS=OFF \
 "
 
+#Add include dir to find driver_config.h
+CXXFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
+CFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
+
+#To fix do_package QA Issue
+do_compile:append() {
+    sed -i -e "s,${WORKDIR},,g" ${B}/libsinsp/libsinsp.pc
+    sed -i -e "s,${WORKDIR},,g" ${B}/driver/libscap/libscap.pc
+    mkdir -p ${B}/driver/libsinsp
+    cp ${B}/libsinsp/libsinsp.pc ${B}/driver/libsinsp/
+}
+do_compile[cleandirs] = "${B}/driver/libsinsp"
+
 #CMAKE_VERBOSE = "VERBOSE=1"
 
+
 FILES:${PN} += " \
     ${DIR_ETC}/* \
     ${datadir}/zsh/* \
-- 
2.43.0


