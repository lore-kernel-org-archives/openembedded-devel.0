Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.809.1603993524548335438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 10:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MhTOnfBF;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id r10so1661899plx.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2020 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dpODtvUuoYbkXpnh2MMtogMhoDiR5xKJes1gzqrsO3w=;
        b=MhTOnfBF7xXpdZvGPwQbgGLvy1CSOafqljnKthe4xX6CNa4HbsVOWCghjpqWd9oFLb
         hu4VGvEwuczXw+ZJzt2aZhDNakHF968GgxCK+n2mgCBFijOQu0mXNN3lj4j6vS3eTSzO
         5TtRMp5W5xXowtJgTx2WuUvV16W6KzhoO40XYRA5ZSvtOs5B/DhFQgMkTko/x+IYKrgE
         RINp2mC34LO1dTVUWULZ31WEtR+c6aCg6iN4Ssbci5Xz+NEu7j86g7IDMHAlHRyMtr55
         V7npuYPsx3DEr07pLVqLdaTrq1oVVD+vwxiJKoX6QBISI+w5IdgAsoG15CKbuvFeBn2p
         qIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dpODtvUuoYbkXpnh2MMtogMhoDiR5xKJes1gzqrsO3w=;
        b=R1NOVflLgG4JfvgAGkuORpv9FiNTRNFwq8kdQt4TvfysEkUBkdB5f42levkEw2rciG
         AMh270dOOqEegBdstsxKGBcCryY8IEqY74I1L7nquZC6M0wi+mX5rSf+aROFGy+JArFN
         9VS4J74SdcxnDCq6j3h7toQLQklt1/rLXhhkwhZJTu2CRWQOxZ66ynf9epNPe6SuIX+o
         CWB4Hzt+0UJI2PaBbhr10FpTmcw8XJLR9rniu3PQD2rNR/pO1xlbdtbDhehPZRFm3Guq
         96VEtA51d7adfkE9Hf2ZC7p82q6v6GHi9Z0d3dDn/6bkA9QP2csAr2xwsuBrukZO/WZk
         tSmA==
X-Gm-Message-State: AOAM532ZAGJ6q4QJpIW48kuMv4ZQGSNGvoGyvqJ0DrR7N+nL/da+z7Pe
	6uCrD69BF2PPDTAc42oDrbfF3vfy7JypMw==
X-Google-Smtp-Source: ABdhPJyJm2DAH9/bHodk8MZIlXTfOSkhV4NkKbkS8S8/W2zmKbbz6xWAHl39uezFzJZMY6/XADSvTg==
X-Received: by 2002:a17:902:b489:b029:d6:845b:8dc4 with SMTP id y9-20020a170902b489b02900d6845b8dc4mr5099121plr.46.1603993523563;
        Thu, 29 Oct 2020 10:45:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id x29sm3516251pfp.152.2020.10.29.10.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:45:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard <richard@example.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Upgrade 1.9.4 -> 1.10.1
Date: Thu, 29 Oct 2020 10:45:18 -0700
Message-Id: <20201029174518.1779414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: richard <richard@example.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tall-non-existing-Encodings-testsuit.patch | 31 -------------------
 ...ble-operations-when-using-double-flo.patch | 28 -----------------
 .../poco/{poco_1.9.4.bb => poco_1.10.1.bb}    | 14 ++++-----
 3 files changed, 6 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch
 rename meta-oe/recipes-support/poco/{poco_1.9.4.bb => poco_1.10.1.bb} (83%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch b/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
deleted file mode 100644
index f4a358f47f..0000000000
--- a/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fa079dfc5e1d22ea35762bf4c5b09999bdc5e731 Mon Sep 17 00:00:00 2001
-From: Jochen Sprickerhof <git@jochen.sprickerhof.de>
-Date: Wed, 22 Aug 2018 21:42:09 +0200
-Subject: [PATCH] Don't try to install non existing Encodings/testsuite/data
-
-Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/2437]
----
- Encodings/testsuite/CMakeLists.txt | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/Encodings/testsuite/CMakeLists.txt b/Encodings/testsuite/CMakeLists.txt
-index 7508e5522..79495ae02 100644
---- a/Encodings/testsuite/CMakeLists.txt
-+++ b/Encodings/testsuite/CMakeLists.txt
-@@ -19,12 +19,9 @@ POCO_SOURCES_AUTO_PLAT( TEST_SRCS WINCE
- add_executable( ${TESTUNIT} ${TEST_SRCS} )
- if(ANDROID)
- 	add_test(NAME ${LIBNAME} WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
--			COMMAND ${CMAKE_COMMAND} -DANDROID_NDK=${ANDROID_NDK} "-DTEST_FILES=${CMAKE_CURRENT_SOURCE_DIR}/data;" -DLIBRARY_DIR=${CMAKE_BINARY_DIR}/lib -DUNITTEST=${CMAKE_BINARY_DIR}/bin/${TESTUNIT} -DTEST_PARAMETER=-all -P ${CMAKE_SOURCE_DIR}/cmake/ExecuteOnAndroid.cmake)
-+			COMMAND ${CMAKE_COMMAND} -DANDROID_NDK=${ANDROID_NDK} -DLIBRARY_DIR=${CMAKE_BINARY_DIR}/lib -DUNITTEST=${CMAKE_BINARY_DIR}/bin/Encodings-testrunner -DTEST_PARAMETER=-all -P ${CMAKE_SOURCE_DIR}/cmake/ExecuteOnAndroid.cmake)
- else()
- 	add_test(NAME ${LIBNAME} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} COMMAND ${TESTUNIT} -all)
--	# The test is run in the build directory. So the test data is copied there too
--	add_custom_command(TARGET ${TESTUNIT} POST_BUILD
--				   COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/data ${CMAKE_CURRENT_BINARY_DIR}/data )
- endif()
- #set_target_properties( ${TESTUNIT} PROPERTIES COMPILE_FLAGS ${RELEASE_CXX_FLAGS} )
- target_link_libraries( ${TESTUNIT}  PocoEncodings PocoFoundation CppUnit )
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch b/meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch
deleted file mode 100644
index c0de32dafe..0000000000
--- a/meta-oe/recipes-support/poco/poco/0001-riscv-Enable-double-operations-when-using-double-flo.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 589a5442a841b156a1890bc2d26e7a5103e2f672 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 1 Nov 2019 17:53:50 -0700
-Subject: [PATCH] riscv: Enable double operations when using double float abi
-
-Upstream-Status: Submitted [https://github.com/pocoproject/poco/pull/2825]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Foundation/src/utils.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index 69cea1aca..ff7a5c9ce 100644
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -63,7 +63,8 @@
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__AARCH64EL__) || \
--    defined(nios2) || defined(__nios2) || defined(__nios2__)
-+    defined(nios2) || defined(__nios2) || defined(__nios2__) || \
-+    (defined(__riscv) && defined(__riscv_float_abi_double))
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
- #if defined(_WIN32)
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-support/poco/poco_1.9.4.bb b/meta-oe/recipes-support/poco/poco_1.10.1.bb
similarity index 83%
rename from meta-oe/recipes-support/poco/poco_1.9.4.bb
rename to meta-oe/recipes-support/poco/poco_1.10.1.bb
index fcd5219759..3f51e61187 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.10.1.bb
@@ -10,11 +10,9 @@ DEPENDS = "libpcre zlib"
 
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=poco-${PV} \
-    file://0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch \
-    file://0001-riscv-Enable-double-operations-when-using-double-flo.patch \
     file://run-ptest \
    "
-SRCREV = "b95393dcc3640807838e8323b4e600e54d2e8116"
+SRCREV = "a3d827d80eb7f3329c58e73eb2906cb7ba829019"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
@@ -25,16 +23,17 @@ inherit cmake ptest
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip Encodings Redis"
+PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Redis"
 
-PACKAGECONFIG[XML] = "-DENABLE_XML=ON -DEXPAT_LIBRARY:STRING=expat,-DENABLE_XML=OFF,expat"
+PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
 PACKAGECONFIG[MongoDB] = "-DENABLE_MONGODB=ON,-DENABLE_MONGODB=OFF"
 PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,zlib"
 PACKAGECONFIG[Util] = "-DENABLE_UTIL=ON,-DENABLE_UTIL=OFF"
 PACKAGECONFIG[Net] = "-DENABLE_NET=ON,-DENABLE_NET=OFF"
-PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_NETSSL=OFF,openssl"
-PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_CRYPTO=OFF,openssl"
+PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON,-DENABLE_NETSSL=OFF,openssl"
+PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON,-DENABLE_CRYPTO=OFF,openssl"
+PACKAGECONFIG[JWT] = "-DENABLE_JWT=ON,-DENABLE_JWT=OFF,openssl"
 PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
 PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sqlite3,-DENABLE_DATA_SQLITE=OFF,sqlite3"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
@@ -53,7 +52,6 @@ PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENA
 PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
-                  -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
                   -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
 
-- 
2.29.1

