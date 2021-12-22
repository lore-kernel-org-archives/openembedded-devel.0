Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA0AC433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 05:47:37 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.15992.1640152052771255337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 21:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BM5lUdN009289
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 21 Dec 2021 21:47:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BM5lGM6001555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Dec 2021 21:47:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Dec 2021 21:47:16 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 21 Dec 2021 21:47:15 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH] mariadb: Upgrade to 10.5.13
Date: Wed, 22 Dec 2021 13:47:14 +0800
Message-ID: <20211222054714.15132-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 05:47:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94478

From: Mingli Yu <mingli.yu@windriver.com>

Remove c11_atomics.patch as the logic is already included in the
new version [1].

[1] https://github.com/MariaDB/server/commit/f502ccbcb5dfce29067434885a23db8d1bd5f134

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e_10.5.12.bb => mariadb-native_10.5.13.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 .../mysql/mariadb/c11_atomics.patch           | 82 -------------------
 ...{mariadb_10.5.12.bb => mariadb_10.5.13.bb} |  0
 4 files changed, 1 insertion(+), 84 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.12.bb => mariadb-native_10.5.13.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.12.bb => mariadb_10.5.13.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.13.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.13.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 3ecb29256..4a7b3cac4 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -13,7 +13,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://configure.cmake-fix-valgrind.patch \
            file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
            file://0001-disable-ucontext-on-musl.patch \
-           file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
@@ -25,7 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "ab4f1ca69a30c5372e191a68e8b543a74168327680fb1f4067e8cc0a5582e4bd"
+SRC_URI[sha256sum] = "16f008c66831130e9263b2601265d566ffc4e890d37bacecd4dcecebfd0d1c58"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
deleted file mode 100644
index 1c76ab391..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vicen=C8=9Biu=20Ciorbaru?= <vicentiu@mariadb.org>
-Date: Thu, 23 Jul 2020 00:02:21 -0700
-Subject: [PATCH] Link with libatomic to enable C11 atomics support
-
-   Some architectures (mips) require libatomic to support proper
-   atomic operations. Check first if support is available without
-   linking, otherwise use the library.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.cmake      | 20 +++++++++++++++++++-
- mysys/CMakeLists.txt |  4 ++++
- sql/CMakeLists.txt   |  4 ++++
- 3 files changed, 27 insertions(+), 1 deletion(-)
-
-diff --git a/configure.cmake b/configure.cmake
-index 4fc324a9..23a2ea91 100644
---- a/configure.cmake
-+++ b/configure.cmake
-@@ -862,7 +862,25 @@ int main()
-   long long int *ptr= &var;
-   return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
- }"
--HAVE_GCC_C11_ATOMICS)
-+HAVE_GCC_C11_ATOMICS_WITHOUT_LIBATOMIC)
-+IF (HAVE_GCC_C11_ATOMICS_WITHOUT_LIBATOMIC)
-+  SET(HAVE_GCC_C11_ATOMICS True)
-+ELSE()
-+  SET(OLD_CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES})
-+  LIST(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
-+  CHECK_CXX_SOURCE_COMPILES("
-+  int main()
-+  {
-+    long long int var= 1;
-+    long long int *ptr= &var;
-+    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
-+  }"
-+  HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
-+  IF(HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
-+    SET(HAVE_GCC_C11_ATOMICS True)
-+  ENDIF()
-+  SET(CMAKE_REQUIRED_LIBRARIES ${OLD_CMAKE_REQUIRED_LIBRARIES})
-+ENDIF()
- 
- IF(WITH_VALGRIND)
-   SET(HAVE_valgrind 1)
-diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
-index 6aab788f..91b9c393 100644
---- a/mysys/CMakeLists.txt
-+++ b/mysys/CMakeLists.txt
-@@ -154,6 +154,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
-  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
- DTRACE_INSTRUMENT(mysys)
- 
-+IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
-+  TARGET_LINK_LIBRARIES(mysys atomic)
-+ENDIF()
-+
- IF(HAVE_BFD_H)
-   TARGET_LINK_LIBRARIES(mysys bfd)  
- ENDIF(HAVE_BFD_H)
-diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index b9cd418f..d42e5017 100644
---- a/sql/CMakeLists.txt
-+++ b/sql/CMakeLists.txt
-@@ -222,6 +222,10 @@ ELSE()
-   SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
- ENDIF()
- 
-+IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
-+  TARGET_LINK_LIBRARIES(sql atomic)
-+ENDIF()
-+
- IF(MSVC OR CMAKE_SYSTEM_NAME MATCHES AIX)
-   SET(libs_to_export_symbols sql mysys dbug strings)
-   # Create shared library of already compiled object
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.13.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.13.bb
-- 
2.17.1


