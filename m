Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8A2CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:52:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14525.1758883942169982380
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y4VcOmW8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13649a3e72=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q69rbg1767034
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 10:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=opGFagaYBHxWyoEb9w47
	C/pSKGhPnbG+98KkBij6k3Q=; b=Y4VcOmW8WH5pOBPvtOkL0Dn2XherXpwKpGWz
	n0jfKmbkWNv/jhZXahekPHNyHbgSFdG50biRJtKtf3joYyUxbQoR9A7tqU47x8JH
	NTKOFxmzb3L2WnDwCx6RSyiN+T3xLkDjt2PkyGwIijpAjAK1umP6CZhnOUn96HRW
	mrv4NnjUEHALwUjbhTWT9S7MaNBWuXNhqFGcPGL/LMuJFqIEwg/fDl1fJtNFa7vY
	jUcLLNnxf6XraEtiO14PWDdijm7atCnUqirGYqXbBbU+R2y23JHdMVwasrBt0A1R
	YMSWSAgeHiM/UXxbFyzaog5lXCIwEesI6ET7tsKlO09HEcwT1A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8pnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 10:52:21 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 03:52:18 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] Revert "mariadb: upgrade 10.11.9 -> 10.11.12"
Date: Fri, 26 Sep 2025 16:21:37 +0530
Message-ID: <20250926105137.3980107-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: bnBz9mnK_zfokOgLQfW78crzrLxyfDQ4
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d67065 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8
 a=kmYkUENqAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=S7lunCdaB3E3f_0v6_gA:9
 a=NA03pvyaApPJG5valX87:22 a=p9kz6gysRiz6SGr9lVkz:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bnBz9mnK_zfokOgLQfW78crzrLxyfDQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5OSBTYWx0ZWRfX3geiEyLVhpAN
 oWRw0v3a/wtSAW8Ji2+rdc/epaXQdcO5hQIpQr4DvHCUPpl+P+oMKZnjvcnXYTtlp56Qe9x6NjC
 LrbOzmtBG6HoZQG4kTV30ysWlYIu2GMMbHxN7ndznlsDghyhZMYrQ78W9vRl11+2zeqKA6qkdw6
 aoqd5fsx94DoJtmFOoWe1lNTEIZpOU3npARj/sRoQ07do6Jl9mQ1bl7ULt8YraHmuTuetCP7+j/
 MNjRA5bwqXpbdrhCggv+4cr8sVlcCvKbwySBBxYEnmTVkUrQK21xsxIIwSufhhvIWTXfvq3Wf4E
 Zg2t1fPk1EeCGmU1cZVNBhBrArZyzROV6aJrAHoxnOec51AHUBXmOdyJjbdymQ5Uh+Tyj0yedMi
 JOfBjSuVMJRnnsum2zFkmcvd+OfCjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 10:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119905

From: Yogita Urade <yogita.urade@windriver.com>

This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.

This upgradation causes timeout issue to start the mysqld services.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ..._10.11.12.bb => mariadb-native_10.11.9.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-------
 .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++++
 ...mariadb_10.11.12.bb => mariadb_10.11.9.bb} |  0
 6 files changed, 87 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb => mariadb-native_10.11.9.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb => mariadb_10.11.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e7c01a775..abcf0b3cda 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,13 +17,15 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://ssize_t.patch \
+           file://mm_malloc.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
-SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
+SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
+SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index fa580d039a..7fc2377f19 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -11,14 +11,27 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
- .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
- storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
- storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
+ .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
+ storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
+ .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
+ storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
+ storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
+ 5 files changed, 5 insertions(+)
 
+diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+index 963c1d8e..73487edd 100644
+--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+@@ -5,6 +5,7 @@
+
+ #pragma once
+
++#include <cstdint>
+ #include "rocksdb/rocksdb_namespace.h"
+
+ struct CompactionIterationStats {
 diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
-index 7fb9d489..f7b4e6f0 100644
+index c7f93b4c..3c2ab805 100644
 --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 @@ -8,6 +8,7 @@
@@ -42,20 +55,20 @@ index f356395f..32152217 100644
  #include <vector>
  
 diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
-index 3c3656de..b18d7f5d 100644
+index 6db11cc9..c26b6a21 100644
 --- a/storage/rocksdb/rocksdb/util/slice.cc
 +++ b/storage/rocksdb/rocksdb/util/slice.cc
-@@ -12,7 +12,7 @@
- #include <stdio.h>
+@@ -8,6 +8,7 @@
+ // found in the LICENSE file. See the AUTHORS file for names of contributors.
  
  #include <algorithm>
--
 +#include <cstdint>
- #include "rocksdb/convenience.h"
  #include "rocksdb/slice_transform.h"
- #include "rocksdb/utilities/object_registry.h"
-diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
-index 7794dbb0..b480177e 100644
+ #include "rocksdb/slice.h"
+ #include "util/string_util.h"
+
+diff --git a/util/string_util.h b/util/string_util.h
+index 55d106fff02..11178fd1d7b 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
@@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
  #include <string>
  #include <unordered_map>
 -- 
-2.40.0
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
new file mode 100644
index 0000000000..56ed480d33
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Pending
+
+--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
+@@ -5,7 +5,7 @@
+
+ #pragma once
+
+-#if defined(__clang__)
++#if defined(__clang__) && defined(__GLIBC__)
+ // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
+ // declaration does not. There is a hack in clang to make its re-declaration
+ // compatible with glibc's if they are declared consecutively. That hack breaks
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
new file mode 100644
index 0000000000..3787b74ad1
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+Remove glibc specific function dependencies
+
+Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/include/my_cpu.h b/include/my_cpu.h
+index f2e26fca..94599b74 100644
+--- a/include/my_cpu.h
++++ b/include/my_cpu.h
+@@ -24,17 +24,16 @@
+ */
+
+ #ifdef _ARCH_PWR8
+-#include <sys/platform/ppc.h>
+ /* Very low priority */
+-#define HMT_very_low() __ppc_set_ppr_very_low()
++#define HMT_very_low() asm volatile("or 31,31,31")
+ /* Low priority */
+-#define HMT_low() __ppc_set_ppr_low()
++#define HMT_low() asm volatile ("or 1,1,1")
+ /* Medium low priority */
+-#define HMT_medium_low() __ppc_set_ppr_med_low()
++#define HMT_medium_low() asm volatile ("or 6,6,6")
+ /* Medium priority */
+-#define HMT_medium() __ppc_set_ppr_med()
++#define HMT_medium() asm volatile ("or 2,2,2")
+ /* Medium high priority */
+-#define HMT_medium_high() __ppc_set_ppr_med_high()
++#define HMT_medium_high() asm volatile("or 5,5,5")
+ /* High priority */
+ #define HMT_high() asm volatile("or 3,3,3")
+ #else
+@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
+   __asm__ __volatile__ ("pause");
+ #endif
+ #elif defined(_ARCH_PWR8)
+-  __ppc_get_timebase();
++  __builtin_ppc_get_timebase();
+ #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
+   /* Mainly, prevent the compiler from optimizing away delay loops */
+   __asm__ __volatile__ ("":::"memory");
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
-- 
2.40.0


