Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.3666.1631684906539398300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 22:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18F5mPL1018719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 22:48:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 22:48:24 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 22:48:23 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] mariadb: Upgrade to 10.5.12
Date: Wed, 15 Sep 2021 13:43:56 +0800
Message-ID: <20210915054356.7723-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
 CVE-2021-2372
 CVE-2021-2389

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_10.5.11.bb => mariadb-native_10.5.12.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 2 +-
 .../mysql/mariadb/clang_version_header_conflict.patch         | 4 ++--
 .../mysql/{mariadb_10.5.11.bb => mariadb_10.5.12.bb}          | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.11.bb => mariadb-native_10.5.12.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.11.bb => mariadb_10.5.12.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.12.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 63ab94092..3ecb29256 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "761053605fe30ce393f324852117990350840a93b3e6305ef4d2f8c8305cc47a"
+SRC_URI[sha256sum] = "ab4f1ca69a30c5372e191a68e8b543a74168327680fb1f4067e8cc0a5582e4bd"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
index c77a86944..2b7afa34e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/clang_version_header_conflict.patch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    set(MRN_SOURCE_DIR ${CMAKE_SOURCE_DIR})
  endif()
  
--file(READ ${MRN_SOURCE_DIR}/version        MRN_VERSION)
+-file(READ ${MRN_SOURCE_DIR}/version_full   MRN_VERSION)
 +file(READ ${MRN_SOURCE_DIR}/ver            MRN_VERSION)
  file(READ ${MRN_SOURCE_DIR}/version_major  MRN_VERSION_MAJOR)
  file(READ ${MRN_SOURCE_DIR}/version_minor  MRN_VERSION_MINOR)
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 @@ -0,0 +1 @@
 +7.07
 \ No newline at end of file
---- a/storage/mroonga/version
+--- a/storage/mroonga/version_full
 +++ /dev/null
 @@ -1 +0,0 @@
 -7.07
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.12.bb
-- 
2.32.0

