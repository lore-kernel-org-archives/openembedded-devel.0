Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACA8C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 10:31:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17697.1748514707762500691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 03:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82447577e8=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TAIk1P004837
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 10:31:46 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53955wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 10:31:46 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 29 May 2025 03:31:24 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: upgrade 10.11.9 -> 10.11.12
Date: Thu, 29 May 2025 16:01:19 +0530
Message-ID: <20250529103119.3642941-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDEwMiBTYWx0ZWRfX10SCR/NikuPQ O259YTlj0F17znMrFp+eG13A5kn2wFfXnFpM8UGoRotYjJuZgiLuGWMTYkIJGpKdD9e8HTdF9Xa gLBUnfr5T4a4gv7SzKCkZ5T0lFUExnDM/4GGj5nfApfGy7wGt2wDi2VYug0I3or3WUi8GDfcHyb
 VnD7xpbVsdhG5Yhgn+G+rvdtkflanWQOlkCpmfSjT692mnWNPIUMWf7xZuOAR9GtnDJXT0cPPFM 4y0bOXq1zODR6h1rkPxNfpgFf/i7Rc4XCewJeZZifghuzsGcmptA+Iwsf+ZRr5BD0RGdyNb08NZ PEh+88osCMHKppHBpUkrPm1iFUIavwdnG6c3hHUNegsdTjbNcu3cJNWi18yI9qv5K+Xzl8CBENX
 7DTw4Qk1wsCU4mEp1sgpgrV8ZebRafzSBy5aE2kPCgsQzvh7MFkMgG41t+ouo7hIUUp/KazI
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=68383792 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=jpp-Wi3FAAAA:8 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=kmYkUENqAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=hAY5sv2raVBYYU5yzRAA:9 a=3HWhRrkoiJongTt84g_J:22 a=NA03pvyaApPJG5valX87:22 a=p9kz6gysRiz6SGr9lVkz:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SXZbsy4K9F2feeTtOOxhYGpOVplPVbXT
X-Proofpoint-GUID: SXZbsy4K9F2feeTtOOxhYGpOVplPVbXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_05,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 10:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117654

From: Yogita Urade <yogita.urade@windriver.com>

This upgrade includes fix for CVE-2023-52969, CVE-2023-52970
and CVE-2023-52971

Changelog:
https://mariadb.com/kb/en/mariadb-10-11-12-changelog/

refresh 0001-Add-missing-includes-cstdint-and-cstdio.patch and
ppc-remove-glibc-dep.patch

Droped mm_malloc.patch as this changes available in 10.11.12

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ..._10.11.9.bb => mariadb-native_10.11.12.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...-missing-includes-cstdint-and-cstdio.patch | 43 +++++++------------
 .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ------
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 26 +++++------
 ...mariadb_10.11.9.bb => mariadb_10.11.12.bb} |  0
 6 files changed, 26 insertions(+), 59 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.9.bb => mariadb-native_10.11.12.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.9.bb => mariadb_10.11.12.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f52947f359..51f56d4d11 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,7 +17,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://ssize_t.patch \
-           file://mm_malloc.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
@@ -25,7 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
+SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index f8ccb998be..fa580d039a 100644
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
@@ -55,20 +42,20 @@ index f356395f..32152217 100644
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
-
-diff --git a/util/string_util.h b/util/string_util.h
-index 55d106fff02..11178fd1d7b 100644
+ #include "rocksdb/utilities/object_registry.h"
+diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
+index 7794dbb0..b480177e 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
@@ -80,5 +67,5 @@ index 55d106fff02..11178fd1d7b 100644
  #include <string>
  #include <unordered_map>
 -- 
-2.25.1
+2.40.0
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
deleted file mode 100644
index 6aa6c84882..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Pending
-
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
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
index 3787b74ad1..ab66d77019 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -4,16 +4,17 @@ Remove glibc specific function dependencies
 
 Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/my_cpu.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/include/my_cpu.h b/include/my_cpu.h
-index f2e26fca..94599b74 100644
+index 2b34e03f..27c6c227 100644
 --- a/include/my_cpu.h
 +++ b/include/my_cpu.h
-@@ -24,17 +24,16 @@
- */
-
- #ifdef _ARCH_PWR8
--#include <sys/platform/ppc.h>
+@@ -27,15 +27,15 @@
+ #ifdef __GLIBC__
+ #include <sys/platform/ppc.h>
  /* Very low priority */
 -#define HMT_very_low() __ppc_set_ppr_very_low()
 +#define HMT_very_low() asm volatile("or 31,31,31")
@@ -31,13 +32,6 @@ index f2e26fca..94599b74 100644
 +#define HMT_medium_high() asm volatile("or 5,5,5")
  /* High priority */
  #define HMT_high() asm volatile("or 3,3,3")
- #else
-@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
-   __asm__ __volatile__ ("pause");
- #endif
- #elif defined(_ARCH_PWR8)
--  __ppc_get_timebase();
-+  __builtin_ppc_get_timebase();
- #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
-   /* Mainly, prevent the compiler from optimizing away delay loops */
-   __asm__ __volatile__ ("":::"memory");
+ #else /* GLIBC */
+--
+2.40.0
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
-- 
2.40.0


