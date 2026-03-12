Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D921067029
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:06:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22487.1773324375765397859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=UCdiww5x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1334352-202603121406139fc1f9ba5900020777-3axnvb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202603121406139fc1f9ba5900020777
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Mar 2026 15:06:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QOHDIQergDD8MJa6msrAzixQLod7oD95NlVyDToCsOg=;
 b=UCdiww5xufpaDYVvAkK5ImJyiEBtuFtPhCHBPL+F2Wdw4M9R/X3KcS7XqPlf6qGAAZ99Xj
 ySgS+7ZpLOifsxnjl+WTwdeHKBLUWR5GGmd9M1b9rtDfjaON/DsQ3m76//XlQeicgV+WCAeg
 JcBownuk9bhGP3wU6ROLzj1heRv66vrPGGyJd6cAVpNrPndOmyoCI+IVFr2JN/9DNeH6Ue0V
 JcZ+IpA+QJf+cvaX7rLG6xWmgG2F3aUTNVWzgKSLh6FitYQhbe5zZj6RNe6nhvS4pALhv0zE
 k5dty3f1CVIzLHA2AoqLsaSs+nbCDD38NVQQy+Ip4fNUwPKccwnvDBow==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 5/6] rocksdb: upgrade 9.10.0 -> 10.10.1
Date: Thu, 12 Mar 2026 15:05:00 +0100
Message-ID: <20260312140501.29859-5-andrej.kozemcak@siemens.com>
In-Reply-To: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125170

Remove not exist PACKAGECONFIG option `lite`
Add new PACKAGECONFIG option liburing

Changelog:

v10.10.1
  https://github.com/facebook/rocksdb/releases/tag/v10.10.1

  Bugs:
    - Fixed a bug in best-efforts recovery that causes use-after-free crashes when accessing SST files that were cached during the recovery.
    - Fix resumable compaction incorrectly allowing resumption from a truncated range deletion that is not well handled currently.
    - Fixed a bug in PosixRandomFileAccess IO uring submission queue ownership & management. Fix eliminates the false positive 'Bad cqe data' IO errors in PosixRandomFileAccess::MultiRead when interleaved with PosixRandomFileAccess::ReadAsync on the same thread.
    - Fix Windows VS 2022 build errors.

v10.9.1:
  https://github.com/facebook/rocksdb/releases/tag/v10.9.1

v10.8.3:
  https://github.com/facebook/rocksdb/releases/tag/v10.8.3

v10.7.5:
  https://github.com/facebook/rocksdb/releases/tag/v10.7.5

v10.6.2:
  https://github.com/facebook/rocksdb/releases/tag/v10.6.2

v10.5.1:
  https://github.com/facebook/rocksdb/releases/tag/v10.5.1

v10.4.2:
  https://github.com/facebook/rocksdb/releases/tag/v10.4.2

v10.2.1:
  https://github.com/facebook/rocksdb/releases/tag/v10.2.1

v10.1.3:
  https://github.com/facebook/rocksdb/releases/tag/v10.1.3

v10.0.1:
  https://github.com/facebook/rocksdb/releases/tag/v10.0.1

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...with-gcc-13-by-adding-cstdint-header.patch | 28 +------------------
 ...mer-implementation-for-mips-platform.patch |  4 +--
 .../files/static_library_as_option.patch      |  2 +-
 .../{rocksdb_9.10.0.bb => rocksdb_10.10.1.bb} |  8 +++---
 4 files changed, 8 insertions(+), 34 deletions(-)
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_9.10.0.bb => rocksdb_10.10.1.bb} (95%)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch
index 168bd76ac7..31e3eb53d3 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-error-with-gcc-13-by-adding-cstdint-header.patch
@@ -22,35 +22,9 @@ TOPDIR/tmp/work/core2-64-oe-linux/rocksdb/9.10.0/git/db/blob/blob_file_meta.h:28
 Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/13437]
 Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
- db/blob/blob_file_meta.h           | 1 +
- include/rocksdb/trace_record.h     | 1 +
  include/rocksdb/write_batch_base.h | 1 +
- 3 files changed, 3 insertions(+)
+ 1 file changed, 1 insertion(+)
 
-diff --git a/db/blob/blob_file_meta.h b/db/blob/blob_file_meta.h
-index d7c8a1243..2e47726f8 100644
---- a/db/blob/blob_file_meta.h
-+++ b/db/blob/blob_file_meta.h
-@@ -6,6 +6,7 @@
- #pragma once
- 
- #include <cassert>
-+#include <cstdint>
- #include <iosfwd>
- #include <memory>
- #include <string>
-diff --git a/include/rocksdb/trace_record.h b/include/rocksdb/trace_record.h
-index 8f9c3ee2f..d321f5387 100644
---- a/include/rocksdb/trace_record.h
-+++ b/include/rocksdb/trace_record.h
-@@ -5,6 +5,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <memory>
- #include <string>
- #include <vector>
 diff --git a/include/rocksdb/write_batch_base.h b/include/rocksdb/write_batch_base.h
 index 3334a1292..43b186029 100644
 --- a/include/rocksdb/write_batch_base.h
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch b/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch
index 2979b73d2f..6205e55b3f 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0005-Implement-timer-implementation-for-mips-platform.patch
@@ -14,9 +14,9 @@ diff --git a/utilities/transactions/lock/range/range_tree/lib/portability/toku_t
 index 0a7488c397..ad7d9f2124 100644
 --- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 +++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
-@@ -162,6 +162,12 @@ static inline tokutime_t toku_time_now(void) {
+@@ -158,6 +158,12 @@ static inline tokutime_t toku_time_now(void) {
    unsigned long result;
-   asm volatile ("rdtime.d\t%0,$r0" : "=r" (result));
+   asm volatile("rdtime.d\t%0,$r0" : "=r"(result));
    return result;
 +#elif defined(__mips__)
 +  // mips apparently only allows rdtsc for superusers, so we fall
diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
index 9a85e8db45..0f957433a7 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -26,7 +26,7 @@ index 93b884dd9c1..2ca925d505c 100644
 +option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB libraries" ON)
 
  if( NOT DEFINED CMAKE_CXX_STANDARD )
-   set(CMAKE_CXX_STANDARD 17)
+   set(CMAKE_CXX_STANDARD 20)
 @@ -1139,11 +1140,13 @@ string(REGEX REPLACE "[^0-9: /-]+" "" GIT_DATE "${GIT_DATE}")
  set(BUILD_VERSION_CC ${CMAKE_BINARY_DIR}/build_version.cc)
  configure_file(util/build_version.cc.in ${BUILD_VERSION_CC} @ONLY)
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
similarity index 95%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
index d8ba31e8ca..cc0e887ea5 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.10.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "ae8fb3e5000e46d8d4c9dbf3a36019c0aaceebff"
-SRCBRANCH = "9.10.fb"
+SRCREV = "4595a5e95ae8525c42e172a054435782b3479c57"
+SRCBRANCH = "10.10.fb"
 
-SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https \
+SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https;tag=v${PV} \
            file://0001-cmake-Add-check-for-atomic-support.patch \
            file://0002-cmake-Use-exported-target-for-bz2.patch \
            file://0003-cmake-Do-not-add-msse4.2-mpclmul-on-clang.patch \
@@ -39,7 +39,7 @@ PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
 PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
 PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
-PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
+PACKAGECONFIG[liburing] = "-DWITH_LIBURING=ON,-DWITH_LIBURING=OFF,liburing"
 PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
 
 # Tools and tests currently don't compile on armv5 so we disable them
-- 
2.47.3


