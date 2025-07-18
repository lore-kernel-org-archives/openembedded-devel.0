Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A9FC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 12:35:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19717.1752842148014683175
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 05:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9294411082=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56ICYbep3139695
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 12:35:47 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47yby3ggt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 12:35:46 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 18 Jul 2025 05:35:44 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] mariadb: upgrade 11.4.5 -> 11.4.6
Date: Fri, 18 Jul 2025 18:05:22 +0530
Message-ID: <20250718123522.3248347-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254)
X-Authority-Analysis: v=2.4 cv=BfbY0qt2 c=1 sm=1 tr=0 ts=687a3fa2 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=jpp-Wi3FAAAA:8 a=hkEv4HZQAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=x4Tn9eRuAAAA:8
 a=N5DeKDZ82g0qJfPC0goA:9 a=3HWhRrkoiJongTt84g_J:22 a=NA03pvyaApPJG5valX87:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=NBNoG_gAMsMl4eXmfJ8P:22
X-Proofpoint-GUID: paToqKcr_XKdA_c054lHnL5f9QrKJAQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAwMiBTYWx0ZWRfX+Zhfy8PdQO4g
 ESPz17RZmGDxYQ4t7dHpGyT6FnammikyiX4J7/xEpnbOi0rkfB9ZH4ZJLAQdAXE+V44skmYxnLZ
 k0wXIHIGvad0tJ3f0Y5I41zNiTSbq9tmdqs5x3p0q8mfDhphTh35kxGZbc1l1CrtyanMrppGsBt
 f04fOfFerGsFHP6klBknBcVLlvyruDGOU4flM6+vPZnMi0ZQFQbsKTXHSzqLgDYQVWVO33QfHyV
 oigVdbMrQYT/0IFmObhYJvp9EkXwEZw8CFEFQ33ZKb/Tlqghaw3cSTdh+mdRU4bnEeg9BIK137p
 NF6G3an1h8I/1GwnKz+O353JXFK0TRcZyFCzJirVwz2AMrMcPA4XHdLwvjWAyp7pFEqROg1AQPZ
 d+mj7jPq
X-Proofpoint-ORIG-GUID: paToqKcr_XKdA_c054lHnL5f9QrKJAQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506270000 definitions=main-2507180002
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 12:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118624

From: Yogita Urade <yogita.urade@windriver.com>

This upgrade includes fix for CVE-2023-52971

Changelog:
https://mariadb.com/kb/en/mariadb-11-4-6-changelog/

refresh 0001-Add-missing-includes-cstdint-and-cstdio.patch

Droped 3871.patch and mm_malloc.patch as these are available in 11.4.6

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...ive_11.4.5.bb => mariadb-native_11.4.6.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...-missing-includes-cstdint-and-cstdio.patch | 40 +++++++------------
 meta-oe/recipes-dbs/mysql/mariadb/3871.patch  | 29 --------------
 .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 23 -----------
 .../{mariadb_11.4.5.bb => mariadb_11.4.6.bb}  |  0
 6 files changed, 16 insertions(+), 80 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.5.bb => mariadb-native_11.4.6.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/3871.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.5.bb => mariadb_11.4.6.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.5.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 3a39d036f7..13e55ebacd 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,17 +17,15 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://ssize_t.patch \
-           file://mm_malloc.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
-           file://3871.patch \
            file://riscv32.patch \
           "
-SRC_URI[sha256sum] = "ff6595f8c482f9921e39b97fa1122377a69f0dcbd92553c6b9032cbf0e9b5354"
+SRC_URI[sha256sum] = "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7df07"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index 08e73424d1..bc1b992919 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -11,27 +11,14 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
- storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
- .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
- storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
- storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
- 5 files changed, 5 insertions(+)
+ storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
+ .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
+ storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
+ storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
+ 4 files changed, 4 insertions(+), 1 deletion(-)
 
-diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
-index 963c1d8e..73487edd 100644
---- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
-+++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
-@@ -5,6 +5,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include "rocksdb/rocksdb_namespace.h"
- 
- struct CompactionIterationStats {
 diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
-index c7f93b4c..3c2ab805 100644
+index 7fb9d489..f7b4e6f0 100644
 --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 @@ -8,6 +8,7 @@
@@ -55,19 +42,20 @@ index f356395f..32152217 100644
  #include <vector>
  
 diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
-index 6db11cc9..c26b6a21 100644
+index 3c3656de..b18d7f5d 100644
 --- a/storage/rocksdb/rocksdb/util/slice.cc
 +++ b/storage/rocksdb/rocksdb/util/slice.cc
-@@ -8,6 +8,7 @@
- // found in the LICENSE file. See the AUTHORS file for names of contributors.
+@@ -12,7 +12,7 @@
+ #include <stdio.h>
  
  #include <algorithm>
+-
 +#include <cstdint>
+ #include "rocksdb/convenience.h"
  #include "rocksdb/slice_transform.h"
- #include "rocksdb/slice.h"
- #include "util/string_util.h"
+ #include "rocksdb/utilities/object_registry.h"
 diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
-index a761be66..064d059f 100644
+index 7794dbb0..b480177e 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
@@ -78,3 +66,5 @@ index a761be66..064d059f 100644
  #include <sstream>
  #include <string>
  #include <unordered_map>
+--
+2.40.0
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/3871.patch b/meta-oe/recipes-dbs/mysql/mariadb/3871.patch
deleted file mode 100644
index 4bbca2d706..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/3871.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d6923ac0adc11a0364acd421316116190eedb508 Mon Sep 17 00:00:00 2001
-From: Brad Smith <brad@comstyle.com>
-Date: Fri, 7 Mar 2025 02:04:01 -0500
-Subject: [PATCH] Fix building with Clang and GCC on RISC-V
-
-Clang does not have the builtin __builtin_riscv_pause().
-
-Upstream-Status: Backport [https://github.com/MariaDB/server/pull/3871]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/my_cpu.h | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
---- a/include/my_cpu.h
-+++ b/include/my_cpu.h
-@@ -97,7 +97,12 @@ static inline void MY_RELAX_CPU(void)
-   /* Changed from __ppc_get_timebase for musl and clang compatibility */
-   __builtin_ppc_get_timebase();
- #elif defined __GNUC__ && defined __riscv
--  __builtin_riscv_pause();
-+  /* The GCC-only __builtin_riscv_pause() or the pause instruction is
-+  encoded like a fence instruction with special parameters. On RISC-V
-+  implementations that do not support arch=+zihintpause this
-+  instruction could be interpreted as a more expensive memory fence;
-+  it should not be an illegal instruction. */
-+  __asm__ volatile(".long 0x0100000f" ::: "memory");
- #elif defined __GNUC__
-   /* Mainly, prevent the compiler from optimizing away delay loops */
-   __asm__ __volatile__ ("":::"memory");
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
deleted file mode 100644
index a590a3fa36..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 76e4c3e8d001eaaabd0fb34c136b81b82830c420 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Jun 2021 22:48:07 -0700
-Subject: [PATCH] mariadb: Fix build with clang/musl
-
-Upstream-Status: Pending
----
- storage/rocksdb/rocksdb/port/jemalloc_helper.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/storage/rocksdb/rocksdb/port/jemalloc_helper.h b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
-index f6f72f8c..b9657cf3 100644
---- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
-+++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
-@@ -5,7 +5,7 @@
- 
- #pragma once
- 
--#if defined(__clang__)
-+#if defined(__clang__) && defined(__GLIBC__)
- // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
- // declaration does not. There is a hack in clang to make its re-declaration
- // compatible with glibc's if they are declared consecutively. That hack breaks
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.5.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb
-- 
2.40.0


