Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AF6EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 03:57:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13231.1690257417609019464
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 20:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6570717b85=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36P3Z19S023630
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 03:56:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636a47f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 03:56:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 20:56:55 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 20:56:54 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.4
Date: Tue, 25 Jul 2023 11:56:53 +0800
Message-ID: <20230725035653.4140503-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hxw8Lgp_LG-YeQOzLkAN4kWX_b8FmEnm
X-Proofpoint-ORIG-GUID: hxw8Lgp_LG-YeQOzLkAN4kWX_b8FmEnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_01,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307250034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 03:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104008

From: Mingli Yu <mingli.yu@windriver.com>

Rebase patch 0001-Add-missing-includes-cstdint-and-cstdio.patch to
the new version.

After the commit [1] introduced in the new version, there is below
build failure though uca-dump installed as [2], so copy the uca-dump
to the right place to fix the below failure.
  make[2]: *** No rule to make target 'strings/uca-dump', needed by 'strings/ctype-uca1400data.h'.  Stop.

[1] https://github.com/MariaDB/server/commit/6f6fa3bec2decb26598bce33d43594aabb25b201
[2] https://git.openembedded.org/meta-openembedded/commit/?id=1f69de300fd3b772830432eedeb2b055396494a6

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e_10.11.2.bb => mariadb-native_10.11.4.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  8 +++-
 ...-missing-includes-cstdint-and-cstdio.patch | 41 ++++---------------
 ...{mariadb_10.11.2.bb => mariadb_10.11.4.bb} |  0
 4 files changed, 15 insertions(+), 34 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.2.bb => mariadb-native_10.11.4.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.2.bb => mariadb_10.11.4.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.2.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.2.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 57930dae3..2fb0bd7be 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "1c89dee0caed0f68bc2a1d203eb98a123150e6a179f6ee0f1fc0ba3f08dc71dc"
+SRC_URI[sha256sum] = "ce8dac125568cc5f40da74c17212767c92d8faed81066580b526a485a591127d"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
@@ -110,6 +110,11 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
+do_compile:prepend:class-target () {
+    # remove the buildpath
+    sed -i -e "s:CMAKE_SYSROOT:CMAKE_SYSROOT_PLACE_HOLDER:g" ${S}/libmariadb/mariadb_config/mariadb_config.c.in
+}
+
 do_configure:append() {
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
@@ -140,6 +145,7 @@ do_compile:prepend:class-target () {
             echo "#endif" >>${B}/include/openssl/kssl.h
         fi
     fi
+    install -D ${RECIPE_SYSROOT_NATIVE}/usr/bin/uca-dump ${B}/strings/uca-dump
 }
 
 SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index 7c37fef49..12fbd7597 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -1,4 +1,4 @@
-From 6e376601c990abaa5e261d1311f92acb3b370b8f Mon Sep 17 00:00:00 2001
+From 68100b1f2243304289b9a9a35e8fb0e1bb0cf70f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 24 Jan 2023 21:40:43 -0800
 Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
@@ -9,17 +9,16 @@ This is needed with GCC 13 and newer [1]
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
  storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
  .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
  storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
- storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
- tpool/aio_linux.cc                                               | 1 +
- 6 files changed, 6 insertions(+)
+ 4 files changed, 4 insertions(+)
 
 diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
-index 963c1d8eb49..73487edd96d 100644
+index 963c1d8e..73487edd 100644
 --- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
 +++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
 @@ -5,6 +5,7 @@
@@ -31,7 +30,7 @@ index 963c1d8eb49..73487edd96d 100644
  
  struct CompactionIterationStats {
 diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
-index c7f93b4cfcd..3c2ab80535a 100644
+index c7f93b4c..3c2ab805 100644
 --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 @@ -8,6 +8,7 @@
@@ -43,7 +42,7 @@ index c7f93b4cfcd..3c2ab80535a 100644
  #include <vector>
  #include "rocksdb/status.h"
 diff --git a/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h b/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
-index f356395f329..3215221755d 100644
+index f356395f..32152217 100644
 --- a/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
 +++ b/storage/rocksdb/rocksdb/table/block_based/data_block_hash_index.h
 @@ -5,6 +5,7 @@
@@ -55,7 +54,7 @@ index f356395f329..3215221755d 100644
  #include <vector>
  
 diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
-index 6db11cc947a..c26b6a21a57 100644
+index 6db11cc9..c26b6a21 100644
 --- a/storage/rocksdb/rocksdb/util/slice.cc
 +++ b/storage/rocksdb/rocksdb/util/slice.cc
 @@ -8,6 +8,7 @@
@@ -66,30 +65,6 @@ index 6db11cc947a..c26b6a21a57 100644
  #include "rocksdb/slice_transform.h"
  #include "rocksdb/slice.h"
  #include "util/string_util.h"
-diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
-index a761be66c52..064d059f08f 100644
---- a/storage/rocksdb/rocksdb/util/string_util.h
-+++ b/storage/rocksdb/rocksdb/util/string_util.h
-@@ -6,6 +6,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <sstream>
- #include <string>
- #include <unordered_map>
-diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
-index 10234e0e46a..a6adf1af257 100644
---- a/tpool/aio_linux.cc
-+++ b/tpool/aio_linux.cc
-@@ -18,6 +18,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
- 
- # include <thread>
- # include <atomic>
-+# include <cstdio>
- # include <libaio.h>
- # include <sys/syscall.h>
- 
 -- 
-2.39.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.2.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.2.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
-- 
2.25.1


