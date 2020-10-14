Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web12.6327.1602659852395879281
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LVD6/89F;
 spf=pass (domain: windriver.com, ip: 40.107.243.41, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZpGLqFU5jmpfKjj8PQD8ufs7lDwDSFIO9jC5Ght5L/cVZ6QiyeKgU2SqL8Bv+mNb5i19jbgFLcSNPPiMVHoBELmSysYdncKtsQDTHNAO/GYusREmlYFhwfneOfPxsa1J6Q7S0UiMW5lJSV+YJsJTG7M8CZlBrEQIuW6e1CMo7EZFB1qGjtx2a0iaTI1lnAd99atkDZczeTGO4c0Vo+2n+W1tRQZMW9CFx+ocPXt/OIEn7NofC4+d49qmKPO2IPwyS7iehwvA8fygB4jOFHbenX5EV4c/1p/vv320h7rHVLP4046xQPAW0f0GiH6Mdy+hTOjuExiIOaDBPLJREU2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq7hb+P+6vk3KKlOJpN89QPFRugYoWwTDg+htaAtj+Y=;
 b=THYMZr6kaO3NCMITvB6LZC6cEuXqOtyKuIi2raJfvbiY7p1kOQtGsfY2pZxUd5YoURCNd2xmtizFi7NkOr6rNf9LO3JaObtDXRpsGz3h8vI9MrbUbyRPZlpXAHR5esWkNZ9pH/kyhVEg6fDT41y8RsTs81xqnGZpPXC357RdgACoVWyfP0oH4K/3+qDYFzLRZ3XUNJleeKMjGPqHVsp4fvpJjbGuRkBn++vNRN/lGQBvEKZPXz6OTWylb/ou3uM/DuGVjN6ZikrvNsXIYmzktUxvtxoxOAb8xcMesrTNE6p2D/RJ1FIst8tBPYyVGGz07t+12cMCmq9WJ9AB0ZK5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq7hb+P+6vk3KKlOJpN89QPFRugYoWwTDg+htaAtj+Y=;
 b=LVD6/89FO59WBINh6kvuj4il4WXwn8oigQH3873R11RoMOk92yFdvgQl1yZz4bsHTxI0+bTMh9PTejsNE6aHm4rIC8RCU+FwOp0PUMCqK1f8mSOgGP8JEGW9VlKmW4PSFRPtY8m48G9ktLRUrkp+6WlA1gGkFWh7C7PGbDm9tlg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4273.namprd11.prod.outlook.com (2603:10b6:a03:1c9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Wed, 14 Oct
 2020 07:17:29 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b%7]) with mapi id 15.20.3455.032; Wed, 14 Oct 2020
 07:17:29 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] mariadb: Upgrade to 10.5.6
Date: Wed, 14 Oct 2020 15:17:10 +0800
Message-ID: <20201014071710.21944-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAMKF1sqKK2Q3gbRJiWM1ty+nO8qEYNeefmANmMwVGXa5O-XipA@mail.gmail.com>
References: <CAMKF1sqKK2Q3gbRJiWM1ty+nO8qEYNeefmANmMwVGXa5O-XipA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0002.apcprd03.prod.outlook.com
 (2603:1096:202::12) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0002.apcprd03.prod.outlook.com (2603:1096:202::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend Transport; Wed, 14 Oct 2020 07:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d54a050-3e83-46c3-3681-08d8701135e9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4273:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4273AB26B5A6EC66D2E7F91BF1050@BY5PR11MB4273.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wzBvY0KphIhPPIf7YEj8sw3cY0hSZuT0lqLFOgQ6qQQeZUOysvZR1S+GuiM0sJvgxAwCINZ3t7k2D8xCmzTLeFUvrJyrfZKLpX6j8+L9mgfN5rktswoXkWy3BSyTkHGdjNHBm8FGgMWFsCI+vJ/3CKOc07pgzTJqNsrTxtIBM25B6P2xtNOyXC97uzB8GJBKSGyDTnp90hlkmY69gP0nvHjUo+YhGITSyM0mqwgh8rtQWLdch6ZEqN3wl0GGh4USirjbDWnRQnXICSfFYnx9iRKgcqyIEUw+XS+DalUz9jndCzKD9XbWuBEErdR8wCjWq7AWGxew8/a6VpE5oPvDJjfDwKIBd/RDKcJShkMPkl9ZGBQyMfqq/LXp9ww0NXsc5jCifnKN17gdZIXcD/AgZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(52116002)(6486002)(66476007)(8676002)(66946007)(6506007)(36756003)(9686003)(66556008)(16526019)(83080400001)(19627235002)(26005)(478600001)(186003)(2616005)(6512007)(956004)(6666004)(83380400001)(2906002)(6916009)(86362001)(1076003)(316002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Y6l1VkxXxo1QBW5UiitMLrT5RLI1nM1wuX3m/LeDzQVh6anRfQ/Y+ItAbUQjx+Vnj4HzawGEzi9KjN8uM5ZplOzu58OavZkQyFzovle5h/O6x2ihoKS2igXj0+GK9ynns6+iSI/ioEcaqWiTjbad96NzdVSMNBWBN4tF3wIdQAUL9iPrJ4Y64KOnuo/99xM9W3KeyNX5zNZ2u16nPos/3PqnGwkqreIi80zRKErpOZNH7BtQlA9Nl0kOEAl2xAcbz3BPKS7kljkdPpTWpLrqyMVtJaeMqbJnMg1KJDtTv8HBAvKGjLSOhp9iMchLFiH2/0Qm5Jo0Uam6u2stpSnX1UNM4fk/4+9FTeDtjO7GqkAeDf+a4fG0NJIbQU7G+JwFj7QsMBCSgcqA9HUX+cFgAScucOtYKRT2GQWD00ZLWh3NP6qQDXpyksHujZFyH6z8b8xuQ9opkI31HjQsuuyRBXQv0Eza2s4PR1sn6us0HChJZCa2uglL6rLFdrSC3vr9znWUrMbbvt+35/Jp2c1ZmlvCaE/PezLCLBSn2vmtQcjw6PFcshNVaiuMbZ54Ps2egPGamd6i9xO6xfRjstWufExzU5h3yk/LB//m/BT5PUJldaDzWtxwG/rj8yTnEiXJaoi0rctH3EMCswzKjkDJbQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d54a050-3e83-46c3-3681-08d8701135e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 07:17:29.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyB3wL3wZeGmSftKjERbcerb8y7zxkBeDeYYMeiYECIYvKsmZugH9i1wvh//sFyf+NpZ+aZdwr7P0A0sSRX7YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4273
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
- CVE-2020-15180

Rebase one patch and remove one backported patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ive_10.5.4.bb =3D> mariadb-native_10.5.6.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 .../mariadb/0001-Fix-library-LZ4-lookup.patch |  4 +-
 ...DB-undefined-reference-to-crc32c_arm.patch | 48 -------------------
 .../{mariadb_10.5.4.bb =3D> mariadb_10.5.6.bb}  |  0
 5 files changed, 3 insertions(+), 52 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.4.bb =3D> mariadb-na=
tive_10.5.6.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-Rocks=
DB-undefined-reference-to-crc32c_arm.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.4.bb =3D> mariadb_10.5.6.bb=
} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb b/meta-oe/r=
ecipes-dbs/mysql/mariadb-native_10.5.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc
index 46a64006d..7c92bbaad 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,9 +19,8 @@ SRC_URI =3D "https://downloads.mariadb.org/interstitial/$=
{BP}/source/${BP}.tar.gz
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
-           file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_ar=
m.patch \
           "
-SRC_URI[sha256sum] =3D "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf110359=
f4f68b37154c72"
+SRC_URI[sha256sum] =3D "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74=
edfaf6013c45c4"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.=
patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
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
 =20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-unde=
fined-reference-to-crc32c_arm.patch b/meta-oe/recipes-dbs/mysql/mariadb/000=
1-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
deleted file mode 100644
index 1856c1af7..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-r=
eference-to-crc32c_arm.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
-From: Krunal Bauskar <krunalbauskar@gmail.com>
-Date: Mon, 27 Jul 2020 18:38:10 +0800
-Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_arm64
-
-RocksDB fails to build on arm64: undefined reference to
-            `crc32c_arm64(unsigned int, unsigned char const*, unsigned int=
)'
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
-diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_r=
ocksdb.cmake
-index 3f3dca7e990..7d2252c5f77 100644
---- a/storage/rocksdb/build_rocksdb.cmake
-+++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -442,6 +442,16 @@ else()
-       util/crc32c_ppc.c
-       util/crc32c_ppc_asm.S)
-   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
-+  # aarch
-+  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
-+    CHECK_CXX_COMPILER_FLAG("-march=3Darmv8-a+crc+crypto" HAS_ARMV8_CRC)
-+    if(HAS_ARMV8_CRC)
-+      message(STATUS " HAS_ARMV8_CRC yes")
-+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Darmv8-a+crc+crypto=
 -Wno-unused-function")
-+      list(APPEND ROCKSDB_SOURCES
-+        util/crc32c_arm64.cc)
-+    endif(HAS_ARMV8_CRC)
-+  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
- endif()
- SET(SOURCES)
- FOREACH(s ${ROCKSDB_SOURCES})
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb b/meta-oe/recipes-=
dbs/mysql/mariadb_10.5.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
--=20
2.26.2

