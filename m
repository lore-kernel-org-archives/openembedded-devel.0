Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63CC27F7E4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:25:50 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id x6so16159650pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qfJjHi0z7GonyYM5Q8j4zwvokOYNEzkljIgCglcB0VE=;
	b=cG+AKM07Ds0T3u0IwB9fyLWfzJjNP5lOjI6ZF/ZoGjmHt/GGjKNimZ+KNFo+9AMdln
	vedH7AMh50pMSsz+Ri9vns8MuD2s6RHXjWYeonCWcB5nZwjpYRs2iEMaNwdahKNaIyBq
	aWy6+4OZbGE6HKF55qLzcorCxwFiWtMuXZG9qMcMRgiRXgCn0QB99PbcQd54uLyAsqRW
	x7f5j2Iy489007tewMQS3DbUzKz7VONN0v2VNPXhvWehluT5+O0O74EU8OXgVHSwQLyv
	62QHscG3tRC6P20RTp3GNuUbFZLfTJaQ5trbq6D/kg/M54j7ZT4csJ46Z8PFIqPBIJ/t
	7G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qfJjHi0z7GonyYM5Q8j4zwvokOYNEzkljIgCglcB0VE=;
	b=pN+RMuX7mSbm3tV+pHAIHEtIm61gqQ9gs5MUqmg2QtZbv9+Km8V4k9U3xzXh/RpAcP
	jzXXjoRCPUx4+W/bENKY/86WsjroMsYanMLQRQmYk6/wVFNmRW0OZw3RK/Rldgw/ZAUi
	28Fa+eN5NKtioWZp5T+g/01GdZcmpOVdUVpoDXoPEu2+iw2aBXLllQUNYtIhHVnuzEC+
	CEVWnK3BK3DBfRvid5h5yEOjyrqbAJ8OxoHMnYGgDjM1PN1oJjhUvZ417E1DkKFXHh16
	nHtfs8iJFUf8O8xLeJvYe/gsTydlpRymtg+FxYRG/eNHqCAEURoIou9R6qPuZW+A/ImG
	ZgJA==
X-Gm-Message-State: APjAAAXFUpfgML0zdYUfdN8WCOwK8yWrHGS4SqA8YTE3+1a2+SUCZgZO
	gvNkh24Rq9C/9eN9hNOOd/PQwKF1qbo=
X-Google-Smtp-Source: APXvYqyl6lfbx0m0TLB1OUA5MxgDqDQ2UQb8ME9o1M24cBwbh7QWgqgLRarHDFaFV0mJyF39pteipg==
X-Received: by 2002:a62:1cd6:: with SMTP id
	c205mr66811616pfc.179.1577643951028; 
	Sun, 29 Dec 2019 10:25:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	gc1sm21395010pjb.20.2019.12.29.10.25.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:25:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:25:41 -0800
Message-Id: <20191229182544.16104-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229182544.16104-1-raj.khem@gmail.com>
References: <20191229182544.16104-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] rocksdb: Upgrade to 6.5.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Dec 2019 18:25:50 -0000
Content-Transfer-Encoding: 8bit

Backport an upstream patch to fix build
Delete patches which are either upstreamed or not required

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-has-stock-FindZLIB-in-upper-case.patch | 29 -------
 ...and-do-not-mark-default-copy-constru.patch | 57 -------------
 ...-breakage-from-lock_guard-error-6161.patch | 36 +++++++++
 .../rocksdb/files/0001-fix-Issue-5303.patch   | 80 -------------------
 ...ild-failure-with-Werror-maybe-uninit.patch | 35 --------
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    | 17 ++--
 6 files changed, 43 insertions(+), 211 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
deleted file mode 100644
index 9682f8ad40..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-CMake-has-stock-FindZLIB-in-upper-case.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 38146a5d803a1fb9b10f011aa857872b6f20cd02 Mon Sep 17 00:00:00 2001
-From: Tongliang Liao <xkszltl@gmail.com>
-Date: Mon, 29 Apr 2019 03:51:51 -0700
-Subject: [PATCH] CMake has stock FindZLIB in upper case. More details in
- https://cmake.org/cmake/help/v3.14/module/FindZLIB.html
-
-
-Upstream-Status: Backport https://github.com/facebook/rocksdb/pull/5261
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 40cdd26bb..355686566 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -92,7 +92,7 @@ else()
-   endif()
-
-   if(WITH_ZLIB)
--    find_package(zlib REQUIRED)
-+    find_package(ZLIB REQUIRED)
-     add_definitions(-DZLIB)
-     if(ZLIB_INCLUDE_DIRS)
-       # CMake 3
---
-2.11.0
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch
deleted file mode 100644
index eccaa3a37a..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From ee728434124b9b7d17abbd060a62aac79a9b79c0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Feb 2019 14:31:24 -0800
-Subject: [PATCH] Disable -Wshadow and do not mark default copy constructors
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt                                     | 2 +-
- utilities/persistent_cache/block_cache_tier.h      | 4 ++--
- utilities/persistent_cache/block_cache_tier_file.h | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 98e2e1973..3a24a075b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -254,7 +254,7 @@ if(FAIL_ON_WARNINGS)
-   if(MSVC)
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /WX")
-   else() # assume GCC
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")
-   endif()
- endif()
- 
-diff --git a/utilities/persistent_cache/block_cache_tier.h b/utilities/persistent_cache/block_cache_tier.h
-index 2b2c0ef4f..96d0540a4 100644
---- a/utilities/persistent_cache/block_cache_tier.h
-+++ b/utilities/persistent_cache/block_cache_tier.h
-@@ -91,9 +91,9 @@ class BlockCacheTier : public PersistentCacheTier {
-         : key_(std::move(key)), data_(data) {}
-     ~InsertOp() {}
- 
--    InsertOp() = delete;
-+    InsertOp() = default;
-     InsertOp(InsertOp&& /*rhs*/) = default;
--    InsertOp& operator=(InsertOp&& rhs) = default;
-+    InsertOp& operator=(InsertOp&& rhs) = delete;
- 
-     // used for estimating size by bounded queue
-     size_t Size() { return data_.size() + key_.size(); }
-diff --git a/utilities/persistent_cache/block_cache_tier_file.h b/utilities/persistent_cache/block_cache_tier_file.h
-index e38b6c9a1..d9b89a4f7 100644
---- a/utilities/persistent_cache/block_cache_tier_file.h
-+++ b/utilities/persistent_cache/block_cache_tier_file.h
-@@ -262,7 +262,7 @@ class ThreadedWriter : public Writer {
-         : file_(file), buf_(buf), file_off_(file_off), callback_(callback) {}
- 
-     IO(const IO&) = default;
--    IO& operator=(const IO&) = default;
-+    IO& operator=(const IO&) = delete;
-     size_t Size() const { return sizeof(IO); }
- 
-     WritableFile* file_ = nullptr;           // File to write to
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
new file mode 100644
index 0000000000..ac87d0c60d
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
@@ -0,0 +1,36 @@
+From b626703de7ece507f360507e49d3ecb448b12e07 Mon Sep 17 00:00:00 2001
+From: Maysam Yabandeh <myabandeh@fb.com>
+Date: Thu, 12 Dec 2019 13:48:50 -0800
+Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
+
+Summary:
+This change fixes a source issue that caused compile time error which breaks build for many fbcode services in that setup. The size() member function of channel is a const member, so member variables accessed within it are implicitly const as well. This caused error when clang fails to resolve to a constructor that takes std::mutex because the suitable constructor got rejected due to loss of constness for its argument. The fix is to add mutable modifier to the lock_ member of channel.
+Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
+
+Differential Revision: D18967685
+
+Pulled By: maysamyabandeh
+
+Upstream-Status: Backport
+
+fbshipit-source-id: 698b6a5153c3c92eeacb842c467aa28cc350d432
+---
+ util/channel.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/channel.h b/util/channel.h
+index 0225482c0..a8a47680a 100644
+--- a/util/channel.h
++++ b/util/channel.h
+@@ -60,7 +60,7 @@ class channel {
+ 
+  private:
+   std::condition_variable cv_;
+-  std::mutex lock_;
++  mutable std::mutex lock_;
+   std::queue<T> buffer_;
+   bool eof_;
+ };
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
deleted file mode 100644
index ba9834dfef..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-fix-Issue-5303.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 512aaf3d833973f6146c6f1235b590901876175e Mon Sep 17 00:00:00 2001
-From: biocodz <biocodz@protonmail.com>
-Date: Fri, 7 Jun 2019 09:49:37 -0400
-Subject: [PATCH] fix Issue 5303
-
-Upstream-Status: Submitted [https://github.com/facebook/rocksdb/pull/5426]
-
----
- db/internal_stats.h                                | 21 +++++++++++++++++++++
- db/version_edit.h                                  |  8 ++++++++
- utilities/persistent_cache/persistent_cache_util.h |  2 +-
- 3 files changed, 30 insertions(+), 1 deletion(-)
-
-diff --git a/db/internal_stats.h b/db/internal_stats.h
-index 6fa8727a4..09447644d 100644
---- a/db/internal_stats.h
-+++ b/db/internal_stats.h
-@@ -236,6 +236,27 @@ class InternalStats {
-       }
-     }
-
-+	CompactionStats & operator=(const CompactionStats& c) {
-+	  count = c.count;
-+	  micros = c.micros;
-+	  cpu_micros = c.cpu_micros;
-+	  bytes_read_non_output_levels = c.bytes_read_non_output_levels;
-+	  bytes_read_output_level = c.bytes_read_output_level;
-+	  bytes_written = c.bytes_written;
-+	  bytes_moved = c.bytes_moved;
-+	  num_input_files_in_non_output_levels =
-+	      c.num_input_files_in_non_output_levels;
-+	  num_input_files_in_output_level = c.num_input_files_in_output_level;
-+	  num_output_files = c.num_output_files;
-+	  num_input_records = c.num_input_records;
-+	  num_dropped_records = c.num_dropped_records;
-+	  int num_of_reasons = static_cast<int>(CompactionReason::kNumOfReasons);
-+	  for (int i = 0; i < num_of_reasons; i++) {
-+	  	counts[i] = c.counts[i];
-+	  }
-+	  return *this;
-+	}
-+
-     void Clear() {
-       this->micros = 0;
-       this->cpu_micros = 0;
-diff --git a/db/version_edit.h b/db/version_edit.h
-index 229531792..5c50ef552 100644
---- a/db/version_edit.h
-+++ b/db/version_edit.h
-@@ -52,6 +52,14 @@ struct FileDescriptor {
-         smallest_seqno(_smallest_seqno),
-         largest_seqno(_largest_seqno) {}
-
-+  FileDescriptor(const FileDescriptor& fd) {
-+    table_reader = fd.table_reader;
-+    packed_number_and_path_id = fd.packed_number_and_path_id;
-+    file_size = fd.file_size;
-+    smallest_seqno = fd.smallest_seqno;
-+    largest_seqno = fd.largest_seqno;
-+  }
-+
-   FileDescriptor& operator=(const FileDescriptor& fd) {
-     table_reader = fd.table_reader;
-     packed_number_and_path_id = fd.packed_number_and_path_id;
-diff --git a/utilities/persistent_cache/persistent_cache_util.h b/utilities/persistent_cache/persistent_cache_util.h
-index 214bb5875..254c038f9 100644
---- a/utilities/persistent_cache/persistent_cache_util.h
-+++ b/utilities/persistent_cache/persistent_cache_util.h
-@@ -48,7 +48,7 @@ class BoundedQueue {
-     T t = std::move(q_.front());
-     size_ -= t.Size();
-     q_.pop_front();
--    return std::move(t);
-+    return t;
-   }
-
-   size_t Size() const {
---
-2.11.0
-
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch
deleted file mode 100644
index ef0429a3c8..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8996f075e64da0e6ffeda57632ef31f8710defcc Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Fri, 15 Mar 2019 16:47:03 +0800
-Subject: [PATCH] utilities: Fix build failure with -Werror=maybe-uninitialized
-
-Summary:
-Initialize magic_number to zero to avoid such failure.
-utilities/blob_db/blob_log_format.cc:91:3: error: 'magic_number' may be used
-uninitialized in this function [-Werror=maybe-uninitialized]
-   if (magic_number != kMagicNumber) {
-   ^~
-
-Upstream-Status: Accepted [expected version 5.19]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- utilities/blob_db/blob_log_format.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utilities/blob_db/blob_log_format.cc b/utilities/blob_db/blob_log_format.cc
-index 2bf7028..8726cb8 100644
---- a/utilities/blob_db/blob_log_format.cc
-+++ b/utilities/blob_db/blob_log_format.cc
-@@ -82,7 +82,7 @@ Status BlobLogFooter::DecodeFrom(Slice src) {
-   uint32_t src_crc = 0;
-   src_crc = crc32c::Value(src.data(), BlobLogFooter::kSize - sizeof(uint32_t));
-   src_crc = crc32c::Mask(src_crc);
--  uint32_t magic_number;
-+  uint32_t magic_number = 0;
-   if (!GetFixed32(&src, &magic_number) || !GetFixed64(&src, &blob_count) ||
-       !GetFixed64(&src, &expiration_range.first) ||
-       !GetFixed64(&src, &expiration_range.second) || !GetFixed32(&src, &crc)) {
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 9fd5ee15be..68c6bc2ffa 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,15 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "628a7fd74b5611657106c57f724f1682b114684c"
-SRCBRANCH = "6.0.fb"
-PV = "6.0.2"
+SRCREV = "4cfbd87afd08a16df28436fb990ef6b154ee6114"
+SRCBRANCH = "6.5.fb"
+PV = "6.5.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
-           file://0001-CMake-has-stock-FindZLIB-in-upper-case.patch \
-           file://0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch \
-           file://0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch \
-           file://0001-fix-Issue-5303.patch \
+           file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -22,9 +19,9 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
-PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON -DBZIP2_LIBRARIES:STRING=bz2,-DWITH_BZ2=OFF,bzip2"
-PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON -DLZ4_LIBRARIES:STRING=lz4,-DWITH_LZ4=OFF,lz4"
-PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON -DZLIB_LIBRARY:STRING=z,-DWITH_ZLIB=OFF,zlib"
+PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
+PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
+PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[zstd] = "-DWITH_ZSTD=ON,-DWITH_ZSTD=OFF,zstd"
 PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
 PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
-- 
2.24.1


