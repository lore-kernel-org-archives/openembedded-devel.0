Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1597.1586483030086587169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 18:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03A1hREb009426
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2020 18:43:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 9 Apr 2020 18:43:17 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.4.12
Date: Fri, 10 Apr 2020 09:43:16 +0800
Message-ID: <1586482996-218656-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Fixes for the following security vulnerabilities:
  CVE-2020-2574
  CVE-2020-7221

* Rework fix-arm-atomic.patch to remove fuzz warnings

* Fix the warning when pam is enabled in DISTRO_FEATURES:
  WARNING: mariadb-10.4.12-r0 do_package_qa: QA Issue: mariadb-dbg: found library in wrong location: /lib/security/.debug/pam_user_map.so
  mariadb-leftovers: found library in wrong location: /lib/security/pam_user_map.so [libdir]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ariadb-native_10.4.11.bb => mariadb-native_10.4.12.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc                     |  9 +++++++--
 meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch    | 15 ++++++++++-----
 .../mysql/{mariadb_10.4.11.bb => mariadb_10.4.12.bb}      |  0
 4 files changed, 17 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.11.bb => mariadb-native_10.4.12.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.11.bb => mariadb_10.4.12.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.11.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.11.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6888c64..5ff273e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -21,8 +21,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
           "
-SRC_URI[md5sum] = "d0de881ab8ead46928cafb7d558535c1"
-SRC_URI[sha256sum] = "4c076232b99433b09eb3c6d62f607192b3474d022703699b8f6aef4e79de3fb9"
+SRC_URI[md5sum] = "97d7c0f508c04a31c138fdb24e95dbc4"
+SRC_URI[sha256sum] = "fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb69434fcde735aa208"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
@@ -168,6 +168,9 @@ do_install() {
     if [ -f ${D}${datadir}/doc/README ]; then
         mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
     fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+        mv ${D}/lib/security ${D}/${libdir}
+    fi
 }
 
 PACKAGES = "${PN}-dbg ${PN} \
@@ -299,12 +302,14 @@ FILES_${PN}-server = "\
     ${sbindir}/ndbd \
     ${sbindir}/ndb_mgmd \
     ${libdir}/plugin/*.so \
+    ${libdir}/security/*.so \
     ${libdir}/plugin/auth_pam_tool_dir/auth_pam_tool \
     ${datadir}/mysql/ \
     ${localstatedir}/mysql/ \
     ${sysconfdir}/init.d/mysqld \
     ${sysconfdir}/my.cnf \
     ${sysconfdir}/my.cnf.d/server.cnf \
+    ${sysconfdir}/security/user_map.conf \
     ${sysconfdir}/tmpfiles.d"
 
 DESCRIPTION_${PN}-leftovers = "unpackaged and probably unneeded files for ${PN}"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
index 185b7b7..05b0cf8 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
@@ -1,6 +1,6 @@
-From ffaaf4d43ebf2ef6d0229a60f407c1f5a06e5c53 Mon Sep 17 00:00:00 2001
+From f447aca534d1a12809eeb146e8220d305cc3884d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 15 Mar 2019 01:46:05 -0700
+Date: Thu, 9 Apr 2020 14:07:19 +0800
 Subject: [PATCH] build_rocksdb.cmake: fix atomic support on arm
 
 Check to link with libatomic to enable C11 atomics support
@@ -10,14 +10,16 @@ to fix below build error on arm:
 
 Upstream-Status: Pending
 
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  storage/rocksdb/build_rocksdb.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
+diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
+index d7895b0..3bcd52a 100644
 --- a/storage/rocksdb/build_rocksdb.cmake
 +++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -470,6 +470,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINA
+@@ -470,6 +470,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
  
  ADD_CONVENIENCE_LIBRARY(rocksdblib ${SOURCES})
  target_link_libraries(rocksdblib ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
@@ -25,5 +27,8 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 +  TARGET_LINK_LIBRARIES(rocksdblib atomic)
 +ENDIF()
  IF(CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
-   set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp")
+   set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp -Wno-error")
  endif()
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.11.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.11.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
-- 
2.7.4

