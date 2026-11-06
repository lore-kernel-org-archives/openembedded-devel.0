Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.944.1793947666352449439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T6TSzxc5;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5571; q=dns/txt;
  s=iport01; t=1793947666; x=1795157266;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yZ5ijf07aQ2+opzkELGrIplr7ovS052/KBiF665wLY8=;
  b=T6TSzxc52ZzrWesH5IdTtsVRVxAG4ZoaaA09l1UhA2jlSb7YG+rUiYUB
   VuTGNq7FnnbYJ7yrIpMu+kCunz849Tey4A/XflORgD9UxrLc6cW8mLN7d
   ulQRF+I+Ubge1QCwiUvwqOTuB7/xHZWBX4WPMSTuDW8IkyrZZYZCRDBb3
   13SJufK8FBKj2OHHUDrrWFZwhgyZDNOtGNr7wgvA5Og10l7QZQdtcWygU
   yGDwD/P2eiVrrr7TojaMdRw3ThE0rECM0IiMAPouA2o8hJTKlDs6n3dzS
   ReRkAhBXwy+rPj4yix4GloGEsIWR4rC4mo2vYuTi9H2I9CmoKunpRNWZ5
   w==;
X-CSE-ConnectionGUID: f6Jvs/ymQuObl62SeP7gew==
X-CSE-MsgGUID: KedVltlTRBOvlGzZwtxmLA==
X-IPAS-Result: =?us-ascii?q?A0BIAgBnd+1q/47/Ja1aHgEBCxIMggULgld1YENJBIRTj?=
 =?us-ascii?q?1OCIZ4kgX4PAQEBD0QNBAEBhD+OZQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgEpBAsBGAFZAwECAwImAi0jGAkbgmcBgnQDE?=
 =?us-ascii?q?bt5en8zgQGDKQGBVNszAQsUAYEKLoVAgx8BhQNdGAGEfScbG4FygRWBO4Iug?=
 =?us-ascii?q?mECgUgCg3KCagSDLoFaHox6AoFRhnlIgQIcA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+Fy9YGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovG?=
 =?us-ascii?q?A1IESw3FRkEPQFuB5I9gkVNWQMfEwErF4EBG2EdDJMuPJF7oREKKIN4jCSVO?=
 =?us-ascii?q?hozhASBV5JCklSZCI4KllGEaYFoPIFZcBWDIgkKQBkPjisDFoMuMoUTxx4mM?=
 =?us-ascii?q?gIBAQEGMgIHAgcBDAEDC5FpgR1gAQE?=
IronPort-Data: A9a23:evzsNq72p6ob9OZkYrb+jQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jZOXWnSPqzZZjCkKNFyOou/oEICv8PSxt5mGlA/qi1nZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eM9M65P0wEGR36
 NsSLG5XVR272O273+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEVUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYGNJYfVHJ0I9qqej
 kHL81r9HhUmDva41z6q4ECzmv/KuQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:x6RbCKgkznOPzZEF+89QSnwTOHBQXuwji2hC6mlwRA09TyX+rb
 HKoB17726XtN9/Yh8dcLy7VZVoIkmslqKdn7NxAV7KZmCP0wGVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:JO5+GW1BLHVkjK8KrgZNHbxfFJ4HbGaa3XLpPmiyDTgzc7CtFlCd5/Yx
X-Talos-MUID: 9a23:mbOmXwl6bjUERcdqJspTdnpBOctW57iqNHontosClNu2KjBgPhO02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530737105"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 06:47:45 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 4FAE91800036A
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Nov 2026 06:47:45 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id EB4DBCC1611; Thu,  5 Nov 2026 22:47:44 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] mariadb: upgrade 11.4.12 -> 11.4.13
Date: Thu,  5 Nov 2026 22:47:44 -0800
Message-Id: <20261106064744.2832505-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 06:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131961
Content-Type: text/plain; charset="utf-8"

From: Poornima Lokesh <Poornima.Lokesh@windriver.com>

Fixes CVE-2026-107816: an out-of-bounds heap read in the qc_info plugin
when reading information_schema.query_cache_info after caching a query
that contains embedded null bytes, which could disclose adjacent heap
memory or crash the server.

Drop c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch, which is already
included upstream in 11.4.13.

Disable the DuckDB storage engine (new in 11.4.13) via -DPLUGIN_DUCKDB=NO:
it bundles its own CMake subproject that is not cross-compile aware and
fails do_compile in a cross environment.

CVE: CVE-2026-107816
Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d2aa0f282ca14afd47c764fb2fbbc775abca5d8b)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 ...e_11.4.12.bb => mariadb-native_11.4.13.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...b11be28ae9b2432b2a661bf38a197cf9514d.patch | 52 -------------------
 ...{mariadb_11.4.12.bb => mariadb_11.4.13.bb} |  0
 4 files changed, 2 insertions(+), 54 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.12.bb => mariadb-native_11.4.13.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.12.bb => mariadb_11.4.13.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.13.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.13.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index c10b0ac9a5..619a7e7449 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,9 +25,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://riscv32.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
-           file://c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch \
           "
-SRC_URI[sha256sum] = "5ab7883db519bfcebfdd2aac09bc5544a12ce328f39edd46d0bf01690615ef6c"
+SRC_URI[sha256sum] = "1bb254b106d0a7ca871cfa18fa6e18d4b80a7430f9ec9d1571ec4271a13def96"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
@@ -79,6 +78,7 @@ LDFLAGS:riscv32:toolchain-clang = "-latomic"
 EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DWITH_JEMALLOC=no \
                  -DWITHOUT_TOKUDB=TRUE \
+                 -DPLUGIN_DUCKDB=NO \
                  -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE \
                  -DGROFF=FALSE \
                  -DNROFF=FALSE \
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch b/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch
deleted file mode 100644
index a58b6f112f..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From c21bb11be28ae9b2432b2a661bf38a197cf9514d Mon Sep 17 00:00:00 2001
-From: Daniel Black <daniel@mariadb.org>
-Date: Thu, 21 May 2026 11:54:35 +1000
-Subject: [PATCH] MDEV-39692 innodb intrinsics fail to compile on ARMv8.3-A and
- later (but not ARMv9.x)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Assembler messages:
-{standard input}:169: Error: selected processor does not support `retaa'
-{standard input}:271: Error: selected processor does not support `retaa'
-
-It happens because the pmem_cvap() funciton manually inserts the `.arch
-armv8-2.a` clause, making GAS believe that retaa instruction (inserted
-by GCC) is invalid.
-
-Replaced compiler dependent version by using the generic sys instruction:
-
-__asm__ __volatile__(/* dc cvap, %0 */ "sys #3, c7, c12, 1, %0" ::
-                           "r"(u) : "memory");
-
-Co-authored-by: gemini-code-assist
-Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Reviewed-by: Marko Mäkelä
-
-Original solution: https://lore.kernel.org/openembedded-devel/20260520113418.2523208-1-dmitry.baryshkov@oss.qualcomm.com/
-
-Upstream-Status: Backport [https://github.com/MariaDB/server/commit/c21bb11be28ae9b2432b2a661bf38a197cf9514d]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
----
- storage/innobase/sync/cache.cc | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.cc
-index c5e67709e22b2..064c29d6f0205 100644
---- a/storage/innobase/sync/cache.cc
-+++ b/storage/innobase/sync/cache.cc
-@@ -82,11 +82,8 @@ static void pmem_cvap(const void* buf, size_t size)
-   for (uintptr_t u= uintptr_t(buf) & ~(CPU_LEVEL1_DCACHE_LINESIZE),
-          end= uintptr_t(buf) + size;
-        u < end; u+= CPU_LEVEL1_DCACHE_LINESIZE)
--#if defined __ARM_ARCH && __ARM_ARCH == 9
--    __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) : "memory");
--#else
--    __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) : "memory");
--#endif
-+    __asm__ __volatile__(/* dc cvap, %0 */ "sys #3, c7, c12, 1, %0" ::
-+                         "r"(u) : "memory");
- 
-   __asm__ __volatile__("dmb ishst" ::: "memory");
- }
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.13.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.13.bb
-- 
2.35.6

