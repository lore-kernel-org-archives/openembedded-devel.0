Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.50])
 by mx.groups.io with SMTP id smtpd.web12.7735.1602580201614131331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 02:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ikFCnZFe;
 spf=pass (domain: windriver.com, ip: 40.107.237.50, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXyEfn8kBFxRDEFsXMwc0kfj3FmSHIKcCegq7VzRNfM76Jt6Jw5BOs+X5ofQxcP5IXqnDwks5aLVub6dYLbG+pSJCyqM38beIYHmqwJFQtt8JU5vsx/6LjVUmdx0s36ezcN/X647ruBvBpUyuB0XtLqambN31YFfRkhsudaMwSvk5c0Lpb88kafRaKpMB7SDZ8fexJymCI2B/7rkjrQmU+IqriWdCEB+GjKOxA/0S43DslMgktYHukH4e4IR00XjuNiGpxZ6oi6/3Qf7HUYkh7GveTKPa5yuEtAbYuFleIhMViivZDS8/U8daXnFHtg08YggPd4QAZv/DU5U93QJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQnwJGqtd8AfYygkNck79B77/aKkUfMFlstD7e8fgO8=;
 b=bSqGXrc+KJgbYoVSJ8RDTSXzEjEOl25Tz0Wu38QIrZQXnN6QL1gR4u4E8K7CdrUGFawR/dNXH1IGTnsPR30cAWQ4qTplWEzkYoYM3NC+BCxyuw5v3UKHJvT5e62BUbjh213CXN4GYs9V4MvEPBwqF/8mdAcIdkRAZRsyZf8kGRS/XEhLzzplJ+a2N7fqrqpPGkH3iiV0UnkRaqQpvb4ril0qR5N3qUJmeiJhsK8I84DSivAwAOAF92hjpQ0Not/BttgNRKsgJqRaTsIPzbeqBJ7C49jEAiM1xPiDAM8/OBIv19RKs3lboilQcvdnkiyQ2gQAIqftGom2LvkP9/zLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQnwJGqtd8AfYygkNck79B77/aKkUfMFlstD7e8fgO8=;
 b=ikFCnZFeaHT/18asfxfeceT6IyZ7SX905/vV1zyNBvsBw+tKVdmm+QCuR29PyD4ucma2+viDEzWhY531tGEtK9sZCLVytwFCHWfvDDnzAWUmx3wBBO8q+sWTEbmVVE+OLmeTs68xtxVREKdtHd3YwLZ3DlTlzxpuvXvR9KsMEt4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3032.namprd11.prod.outlook.com (2603:10b6:a03:8f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 09:09:59 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:09:58 +0000
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.5.6
References: <20201013090826.23778-1-mingli.yu@windriver.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
X-Forwarded-Message-Id: <20201013090826.23778-1-mingli.yu@windriver.com>
Message-ID: <25212fd4-b0dd-f207-7702-2b896c78ef7a@windriver.com>
Date: Tue, 13 Oct 2020 17:07:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201013090826.23778-1-mingli.yu@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0048.apcprd04.prod.outlook.com
 (2603:1096:202:14::16) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR04CA0048.apcprd04.prod.outlook.com (2603:1096:202:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 09:09:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546d3605-b6a5-4115-1e7a-08d86f57c243
X-MS-TrafficTypeDiagnostic: BYAPR11MB3032:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3032EBFD72E05F993A2C7ECDF1040@BYAPR11MB3032.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YvpVLy5yQQwyhWQ/sxyrKU6wkxuZ6Mh5dQBtUgjbPadhF7U954EOIfWZGBW9hDKDTZlZPKjKdbqwd+5NzwaY0efXfBUFMatZb9hJEOypx91RDKDwFJcdijQVrfwO7BcU3Cy2jqG5t5CuFx/dbs2ebh4LIZvZHDaTCLJinJmGR0oZcxqw1sXHacK4wCTKTfvvbrDZDR+WxtaxrDRzNWS0f1uh6JMguKvbIyzMgHtUGMsdRp3BPOs+LjZsu29x+LTyIvo4h4vzn3y4FO6XMLy1VnyzxSOLviyi+3sJ3zvHTqQWrFezM9dm+NyropEUQ+LM99qI/Hyk6pVKUxe5gwwJyY0M1CuX9IOQBY/FRrqMcqjM+edZV5zJIv/t6wxaH1nHAQB2sXfhwdpR89FHcauujXfz8QF4Xoph3qQlp0sxQoZQY6GWgCkkzW2funx9rJrl8caWc1dsb1cNArxWLAZRXIqmny/HSbCGja2x9i/HzG4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(31696002)(316002)(16576012)(6916009)(6706004)(186003)(26005)(16526019)(6486002)(66556008)(83380400001)(478600001)(66476007)(86362001)(83080400001)(66946007)(19627235002)(956004)(2616005)(5660300002)(31686004)(6666004)(8676002)(52116002)(8936002)(36756003)(2906002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+K/Xb61CaoLM/KEI6gpDnmDmA9dzeSep+nMxwwB0VHURggHEfNE/ozYw/iIuaJaBIohWaAR9fAFhqbSzo0nZ3y+xcbRHOmqglcAZrvpCvTNWNKmMDlNO72PAPGZ01EqwcYh0SuK3xHdcgpNBCJiyGrnaeufHD1LczOTKzPJUQjmVsAdZYhvznvlU/3aTMJ07JXHSbX1nrVVXMMgAy9YjOeTxfxX/6xOdQt7mYrIHxzttjZ57Y+loqkQ6KNY3LMlcZ+tXT/U5yzpNmHaSI6lYpKKzBCqmEYCPE24JkeGVbigaR9cAl2JvNJkkbuRyRGMSJqg2LYUL1ZMGgO3oOAAwPYC3KAKUyptgNgDj3EGJ/pDrcHGequcKKPxT1l+76JLILitatx4bV+BS19dHzldzhvA+3twhBOamzGYGn+vPJ66xtvGuLv0ypFd3iWT/3bYoG+F3sQbXtkO0xCz3Yj29AaWUCyKCJr0E2VQQjEGL4BszURXTmNmQGrmh909+rcnClBYrJgdCwadtdcCuN0/G7W0vUffTgX+WgNNbThmdyC+7N7+ofMXZ6guXW9f3iZ4qjPlP5gq4qoB4hSG3OkXXxOh5CdMh0k3f8fwQFvXZUvELzR89e8uco/h68VBjcZdPpoDBkhPUeVUCY59dxckIxA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546d3605-b6a5-4115-1e7a-08d86f57c243
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 09:09:58.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMxNvgCT9IddnL7ig+mIiZY7XHo2UHB7aaspm2h9tUP8QBkDIcY08aWKO6A9b9GYz3d3FmQV4K/YltJct++YYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3032
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
- CVE-2020-15180

Rebase one patch and remove one backported patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
  ...ive_10.5.4.bb => mariadb-native_10.5.6.bb} |  0
  meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
  .../mariadb/0001-Fix-library-LZ4-lookup.patch |  4 +-
  ...DB-undefined-reference-to-crc32c_arm.patch | 48 -------------------
  .../{mariadb_10.5.4.bb => mariadb_10.5.6.bb}  |  0
  5 files changed, 3 insertions(+), 52 deletions(-)
  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.4.bb => 
mariadb-native_10.5.6.bb} (100%)
  delete mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.4.bb => 
mariadb_10.5.6.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb 
b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc 
b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 46a64006d..7c92bbaad 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,9 +19,8 @@ SRC_URI = 
"https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
             file://clang_version_header_conflict.patch \
             file://fix-arm-atomic.patch \
             file://0001-Fix-library-LZ4-lookup.patch \
- 
file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch \
            "
-SRC_URI[sha256sum] = 
"26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf110359f4f68b37154c72"
+SRC_URI[sha256sum] = 
"ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
  diff --git 
a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch 
b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
index 574dfd317..0cf0560e1 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
@@ -14,12 +14,12 @@ index e97dd63e2b0..2f4694e727c 100644
  +++ b/cmake/FindLZ4.cmake
  @@ -1,5 +1,10 @@
  -find_path(LZ4_INCLUDE_DIR NAMES lz4.h)
--find_library(LZ4_LIBRARY NAMES lz4)
+-find_library(LZ4_LIBRARIES NAMES lz4)
  +find_path(LZ4_INCLUDE_DIR
  +  NAMES	lz4.h
  +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
  +
-+find_library(LZ4_LIBRARY
++find_library(LZ4_LIBRARIES
  +  NAMES lz4
  +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
   diff --git 
a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch 
b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
deleted file mode 100644
index 1856c1af7..000000000
--- 
a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
-From: Krunal Bauskar <krunalbauskar@gmail.com>
-Date: Mon, 27 Jul 2020 18:38:10 +0800
-Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_arm64
-
-RocksDB fails to build on arm64: undefined reference to
-            `crc32c_arm64(unsigned int, unsigned char const*, unsigned 
int)'
-
-MariaDB uses storage/rocksdb/build_rocksdb.cmake to compile RocksDB.
-Said cmake missed adding crc32c_arm64 compilation target so if
-machine native architecture supported crc32 then complier would enable
-usage of function defined in crc32c_arm64 causing the listed error.
-
-Added crc32c_arm64 complition target.
-
-closes #1642
-
-Upstream-Status: Backport
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- storage/rocksdb/build_rocksdb.cmake | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/storage/rocksdb/build_rocksdb.cmake 
b/storage/rocksdb/build_rocksdb.cmake
-index 3f3dca7e990..7d2252c5f77 100644
---- a/storage/rocksdb/build_rocksdb.cmake
-+++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -442,6 +442,16 @@ else()
-       util/crc32c_ppc.c
-       util/crc32c_ppc_asm.S)
-   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
-+  # aarch
-+  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
-+    CHECK_CXX_COMPILER_FLAG("-march=armv8-a+crc+crypto" HAS_ARMV8_CRC)
-+    if(HAS_ARMV8_CRC)
-+      message(STATUS " HAS_ARMV8_CRC yes")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} 
-march=armv8-a+crc+crypto -Wno-unused-function")
-+      list(APPEND ROCKSDB_SOURCES
-+        util/crc32c_arm64.cc)
-+    endif(HAS_ARMV8_CRC)
-+  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
- endif()
- SET(SOURCES)
- FOREACH(s ${ROCKSDB_SOURCES})
--- -2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb 
b/meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
-- 
2.17.1

