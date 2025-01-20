Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7E4C0218D
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.32640.1737360859515753603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X2KoRBuF;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360859; x=1768896859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0nDGfRal1+MSQEu72JQd49oQa/JEAAz8GwAfwnML9J8=;
  b=X2KoRBuFyEc2RBuspNM2wug/1o0e8s+6bm9ybsLncv4i+DPgCqtWR7Pp
   lnPkeHMiwNTi6jUTp33eG6nhmui8z77qsA89/QPTAx7ncykTqCc4IkMFo
   fx9/y8zAYV1EptUnZKvDzrKyBnWGVHLs/6rqyTFRmHmfSnOyJy5Axw9CX
   FpO7BqUHI/ScS2AqLItZp/Qoxz1e4K8S0PwK0xVLKGvkDO7RtJK5WdE6L
   HeC0lX1CQU/ytMoZojTFE4smty9Ym/iLlgsWdaGlMnwSkaRfMN5KB4bBs
   4wO19VrrceBeAI7gDqKAgyQBDTkjffT3iUMFEr5ma4HTflE4I3wlSDAaL
   Q==;
X-CSE-ConnectionGUID: ys0DLu79QrKpt+4HPQljOg==
X-CSE-MsgGUID: tqtyXlIkRHCblhKnNFPIWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="166049243"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="166049243"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 41884DCFD3
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FE03D7489
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 97C5E20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47B921A0071;
	Mon, 20 Jan 2025 16:14:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/32] mariadb: upgrade 11.4.4 -> 11.8.0
Date: Mon, 20 Jan 2025 16:13:44 +0800
Message-Id: <1737360846-4824-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--7.310100-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUhwlOfYeSqx1QQ6Jx/fflY6FHRWx2FGsM8L
	GTNFqWKa7wJL2+8U4LHGKIf6hBf7VaSoXNVlyrwmxkszn8tNF/+b4MeUT6yx0I+BqYBjLlwkd8u
	5EqsUWd+KhXV7aRCSUuaffHI8kAmis1RWeqLGIw6xlpnlQFCyh0i8rgutezVpnx64ywPQ4WYUMv
	hs4v0Hfg7KQ3efmX8TrIIoaOiStoL14VhNdqloPqncG1vVsfbQCRyOXT6KCHU9l6vw5mwGC+fDo
	tHL7YhsmA6+/YfEs7+AMuqetGVetnyef22ep6XY4kYXbobxJbKl/MtrTwS4UA9iiWki4CO5/ijm
	T6147412hSeWQLxec02+AOhynl+EMD7xEXJXHFc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114972

From: Wang Mingyu <wangmy@fujitsu.com>

0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
refreshed for 11.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{mariadb-native_11.4.4.bb => mariadb-native_11.8.0.bb} | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                     | 2 +-
 ...io_linux-Check-if-syscall-exists-before-using-it.patch | 8 ++++----
 ...-innobase-Define-__NR_futex-if-it-does-not-exist.patch | 6 +++---
 ...01-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch | 6 +++---
 ...ort-files-CMakeLists.txt-fix-do_populate_sysroot.patch | 6 +++---
 .../mysql/{mariadb_11.4.4.bb => mariadb_11.8.0.bb}        | 0
 7 files changed, 14 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb => mariadb-native_11.8.0.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb => mariadb_11.8.0.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.8.0.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.8.0.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index dae41d89aa..d924378531 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
           "
-SRC_URI[sha256sum] = "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090cbbefed52599dc77b"
+SRC_URI[sha256sum] = "57456dbdd1d9ea6274c18d28500d27c95ea926ce6ba30a7ea81e1ddf4bef8515"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
index eddfdaaf77..106c37a828 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
@@ -1,4 +1,4 @@
-From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001
+From 883f3b2c351dfc136ba81d4060b2e3bf4f4d7e7c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Aug 2021 06:49:25 +0000
 Subject: [PATCH] aio_linux: Check if syscall exists before using it
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
-index 507c6b92..a6adf1af 100644
+index abf37e22..2b75ed4a 100644
 --- a/tpool/aio_linux.cc
 +++ b/tpool/aio_linux.cc
-@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+@@ -60,6 +60,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
  */
  static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
  {
@@ -28,7 +28,7 @@ index 507c6b92..a6adf1af 100644
    int saved_errno= errno;
    int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
                     min_nr, nr, ev, 0);
-@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+@@ -69,6 +70,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
      errno= saved_errno;
    }
    return ret;
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
index bfcd45b64b..4152a604b0 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
@@ -1,4 +1,4 @@
-From 3a29c2f7afe10bf0bc0529b5d9ea44866946ac5a Mon Sep 17 00:00:00 2001
+From 9ad66b45557ce95f8ee14335e4d3a5d081c958e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 14 Nov 2020 14:37:13 -0800
 Subject: [PATCH] innobase: Define __NR_futex if it does not exist
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/storage/innobase/log/log0sync.cc b/storage/innobase/log/log0sync.cc
-index 0de283ca..265ab691 100644
+index f6ca440e..9a602b2a 100644
 --- a/storage/innobase/log/log0sync.cc
 +++ b/storage/innobase/log/log0sync.cc
 @@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b) can be fine as alternative.
@@ -31,4 +31,4 @@ index 0de283ca..265ab691 100644
 +#endif
  #endif
  
- #include <atomic>
+ #include <algorithm>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index 1475bb1a51..b1d04e2b4e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -1,4 +1,4 @@
-From 360d41c1dd2d28d5102d66179095cedacaf5dc3a Mon Sep 17 00:00:00 2001
+From 003615e4290090c5e1944e0843b1017a0a975e92 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 23 Sep 2022 15:48:21 +0800
 Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
@@ -15,7 +15,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 22 insertions(+), 8 deletions(-)
 
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 0195555e..507136cb 100644
+index cb43f7ad..0fb8cd01 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
 @@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql
@@ -41,7 +41,7 @@ index 0195555e..507136cb 100644
  
  FIND_PACKAGE(BISON 2.4)
  
-@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+@@ -411,11 +418,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
index 30c9e2452a..8bf8ed8ddb 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
@@ -1,4 +1,4 @@
-From 34713c3bba68cb94b373b750c1c8fcc0b04b2c45 Mon Sep 17 00:00:00 2001
+From 3fb7db413c5496ef5cb4f5415433acc8ea23db26 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 27 Feb 2019 22:41:26 -0800
 Subject: [PATCH] support-files/CMakeLists.txt: fix do_populate_sysroot issue
@@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.txt
-index ee1d420e..a99c0605 100644
+index ae7f9063..9f54d63e 100644
 --- a/support-files/CMakeLists.txt
 +++ b/support-files/CMakeLists.txt
-@@ -245,12 +245,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)
+@@ -247,12 +247,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)
        INSTALL(FILES rpm/enable_encryption.preset DESTINATION ${INSTALL_SYSCONF2DIR}
                COMPONENT IniFiles)
      ENDIF()
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.8.0.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.8.0.bb
-- 
2.43.0


