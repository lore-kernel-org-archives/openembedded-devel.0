Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web12.4393.1603862778693641207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 22:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kV4GQv0d;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApC6emBr29JVnBCkCGmn9i/O8YlTqrDghmMRNOSAEAncTBV7jKerICwJ9X1IytgijgVfaGbIZ1rApwqjVq2nDC/9jowjbd3MPSUWsXuMmVcGjp689EhTJ2tXivDsmeXi3nW4Lc1MHaF99X2GW/JP7HsisJ+tpNuENQ8gHsmWeQZ53vl+hidTxsGv8fgRxd9FvP7LFFPOV3UYmvlgG3H7KEovC0H5Kh639iUXB6bC9k+ILhNhGuSip6fCh9lgyylRCVpAsXOUlO53GzjcQ9/sYCfsGVXATkNNu11jHgiH9C0TYpQxeRl2FZRqXJt6Cn4+4MIyscYY7zLUyy1uM3NulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/aY2PoOIJziWQ2tkQZo7m5ETm4CVg891BVgkS9bHHA=;
 b=SAXHGcaVvjWsh2E44V5ie+yYbOt8bMOh/mvmF7312JMbl2qLrLQiBBkavJU0VbgBy7ZX6mEDkKelqV6eFZayTabTmVt1EiWCIRj7ld2rWf1XwVwvgASQxxglO7oxHB+EFlVKWFK3ZH/QhJuuSMcWDrt/ixTuQvzMiQ68bKeDAXUuV5stSN+Et2mFzkvo6+nCxSPpppiUIqeHQiSiAIkqbM4uLnzFbyKDVrT+ShB51qYQlbofY9kosThzctZH2PgxLKqnfX8v2Q3vTdJKu2Qu22/tFwnFNk671cvzQ+NGvFrfPK9UVdU0htPO8Zt1G0O5b23psaRoD3vg1q15+gXVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/aY2PoOIJziWQ2tkQZo7m5ETm4CVg891BVgkS9bHHA=;
 b=kV4GQv0dqHaP5uZINRXxrjeeqSn2il1nfrdG0AAT70TBoxX2q8zuicXz8S/FH/jCMGls9ZQHS6T/8QDxYqNnSHC4h1kX9qlfYSRU+mf1z+tWT8X110hR+5wOxgWd9+OdNvDUzUcRFkcgHxBv0Imjef4G6I9bTl/v03JO/1veRKU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2351.namprd11.prod.outlook.com (2603:10b6:300:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 05:26:17 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 05:26:17 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minifi-cpp: specify GCC_AR and GCC_RANLIB
Date: Wed, 28 Oct 2020 13:26:04 +0800
Message-Id: <20201028052604.19828-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:40::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 05:26:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78873d33-523b-4f25-ba12-08d87b01fe91
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2351:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2351C4B9D9D8F2B9CA10BAB9F9170@MWHPR1101MB2351.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lR5MfZkV9p6LTLOc8wLUCeMOhSjCq93HpQdE/tsuyGSnsMyAwiDwrOt3dR/7yfI9n66V+zJbQzYZzN4ks9k+qGhavtsOsatlQfuyqnp1ponYwNOuer1CevH0Q9aUjwApNNm8Bz9exBxsFug5WswSdqmkZBrvik0vL5cOsfD/0oTYVVt0iTl3oZgZpJk2ZtBpz3KEO332Lia+bxRJWOMHdU7nfmlj7V2uP666SsVtRUvGYqwbG53mvftnbsDKXtD5O0vuXBtlrGxwjDaZbbCKzEWdbyxJV8lZm7S2QUtuMRA8co5+1hULfpGB/WBPQl/f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(346002)(366004)(136003)(376002)(186003)(26005)(16526019)(19627235002)(6506007)(2906002)(6486002)(52116002)(8936002)(6916009)(66946007)(66556008)(66476007)(8676002)(5660300002)(316002)(478600001)(86362001)(6666004)(44832011)(6512007)(2616005)(956004)(36756003)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xQTJ+E6W4vbEpwqjay9ulodJ5wZr3g/+7YjOqucp+Ud4Dk7qrRNb1w+lDqm+28zuaaA/6nRYDaH2AQl8i7YaRdFLLWfVbZK2Ve8UGepdBWH6s9Z/XC3QCef2Em616kpnN2ZPfe1ohVngJUj7ybteWaHy63FiHD4qQFbHC7h5ZZRD04J2qko3JNovNB0QmZdGObzT4Q9p5B+BR+4pLAEwUv+MAID4s97Jb1bUWiYw5i0mmf3Y/QtwZt+7yz+IOjxSQCHxoSyw0J4e59qCmKDO+s1+Q0FYgvZVupBz/1rsaTPOUxn621crJNyHV5hidKK9BfR1RXeOcoXlVwhwew4VH7In4lsUzZr3Q6vZskGJlh/rvubBXchMjkDuOVtICR+1HVzcrDhF4BIaIPS1SwQzMyn+9VYGMFqtV71oTUsSzJyjqgfYIiRt5EYo8CVBq4cnFng2B8yUGq4A8YK57huec6xFUlRoXlGH5ajYg2OYD6UIJdRlsw9u03UBe/VwYfCUwREadtxRDcgYGBJVKnRJzK87pIAHKUfiYv3iVwVmxZ19tAf9nicTGkYwhIWlb8773hIzp+QMbvjiXZLTNnnunzCTg5Q77lZaBmLh+GuoxWnWv88L2oI1os3NCjBnVEQDvxpB52B7FqJ6R52B1jobxQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78873d33-523b-4f25-ba12-08d87b01fe91
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 05:26:17.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m33/+77yDjJWd3spZ0lnp/AODmqKMp419R4fsvBZLgcaFXMn2nGBeJuJBaUG/1IClNpx8397V0yH8QMF69sNug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2351
Content-Type: text/plain

We encountered a minifi-cpp build error on a self-hosted image:
[snip]
/build/tmp-glibc/work/corei7-64-wrs-linux/minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/x86_64-wrs-linux-ranlib:
thirdparty/civetweb-1.10/src/libcivetweb-cpp.a(CivetServer.cpp.o): plugin needed to handle lto object
/build/tmp-glibc/work/corei7-64-wrs-linux/minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/x86_64-wrs-linux-ranlib:
thirdparty/civetweb-1.10/src/libcivetweb.a(civetweb.c.o): plugin needed to handle lto object
[snip]
/build/tmp-glibc/work/corei7-64-wrs-linux/minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/10.2.0/ld: DWARF error: could not find variable specification at offset c960f
/build/tmp-glibc/work/corei7-64-wrs-linux/minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/10.2.0/ld: DWARF error: could not find variable specification at offset c961d
[snip]
extensions/civetweb/libminifi-civet-extensions.a(ListenHTTP.cpp.o):
in function `org::apache::nifi::minifi::processors::ListenHTTP::WriteCallback::process(std::shared_ptr<org::apache::nifi::minifi::io::BaseStream>)':
/usr/src/debug/minifi-cpp/0.7.0-r0/git/extensions/civetweb/processors/ListenHTTP.cpp:464: undefined reference to `mg_read'
[snip]

When using GCC's link-time optimization with static linked libraries, we
should use gcc-ar and gcc-ranlib to create the static libraries. By
default, it will search gcc-ar and gcc-ranlib in the system. But if the
gcc-ranlib is not found, it will use ranlib instead which causes this
issue.
Specify GCC_AR and GCC_RANLIB in EXTRA_OECMAKE to make sure it can find
the correct gcc-ar/gcc-ranlib.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...sts.txt-do-not-search-gcc-ar-and-gcc.patch | 34 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch
new file mode 100644
index 000000000..bc480d969
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch
@@ -0,0 +1,34 @@
+From 0eee3fb85dad084b6b42f7b219d8aa3a62620a27 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 28 Oct 2020 09:52:40 +0800
+Subject: [PATCH] civetweb/CMakeLists.txt: do not search gcc-ar and gcc-ranlib
+
+Do not search gcc-ar and gcc-ranlib. Specify GCC_AR and GCC_RANLIB in
+EXTRA_OECMAKE to avoid host contamination.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ thirdparty/civetweb-1.10/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/thirdparty/civetweb-1.10/CMakeLists.txt b/thirdparty/civetweb-1.10/CMakeLists.txt
+index f559a04e..0689e3f6 100644
+--- a/thirdparty/civetweb-1.10/CMakeLists.txt
++++ b/thirdparty/civetweb-1.10/CMakeLists.txt
+@@ -246,11 +246,9 @@ set_property(CACHE CIVETWEB_CXX_STANDARD PROPERTY STRINGS auto c++14 c++11 c++98
+ 
+ # Configure the linker
+ if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
+-  find_program(GCC_AR gcc-ar)
+   if (GCC_AR)
+     set(CMAKE_AR ${GCC_AR})
+   endif()
+-  find_program(GCC_RANLIB gcc-ranlib)
+   if (GCC_RANLIB)
+     set(CMAKE_RANLIB ${GCC_RANLIB})
+   endif()
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 9113fa67a..9b66c48e3 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://0001-CMakeLists.txt-use-curl-local-source-tarball.patch \
             file://0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch \
             file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch \
+            file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
@@ -52,6 +53,8 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 EXTRA_OECMAKE += " \
     -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
     -DSKIP_TESTS=ON \
+    -DGCC_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
+    -DGCC_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
     "
 EXTRA_OECMAKE_append_toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
 LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
-- 
2.17.1

