Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id E43AB79D62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 17:31:29 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id d72so1442472pga.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 09:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SwC8bEhLme/pKmXgaw2/Qan9YrmCcueq2Tjd5iU6/C4=;
	b=nAwAqZ1bolQcUNqzxy2K1i/z8G66u0Mc7nlkjLr+caGVIROgYHCSYQvu/IKJ1b/uBB
	CzIx6UOl2sjuTWC5tqVUwx+kngqv+IHkrFoIhwPL47RCDeBtTxwm0uznuK20tVl+k+DV
	Ad5rXrxQySLN8pBEei7zpIfzS2P1Vd/LpBp3tifaNl5mwNFL2iSVPDL28y29gBGUVnGZ
	sy7sDw/9v15aox6N91UO6KKjt6n+WSvbPLuG6AiqCV7y62pTt4XmIWcKBuf/fSECzY7z
	WR7SUNwUBSObPd+bodYQE/U8KJOWI8C2bEjyQnOpbbJDms5HEJx4o3+WPwLEI6eYp7Hm
	rvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SwC8bEhLme/pKmXgaw2/Qan9YrmCcueq2Tjd5iU6/C4=;
	b=S5OxgcIGM4n4SOkMMyCkxO0Ax/aUIQLeN5XNaF8xO5ZQZGy+K//GJ6QH+NLhZWCo8U
	/0uMkaQ1bBLk66UWaLLAxzXfIix+to74d0+jEiFojEdvnDD4yMAojmKL0rl0XMpOoorH
	3OAWNt+jDmZSfiErR2zSZ6tAl2l/TeKQERzAX+fAcdWs+cO5Ab+MKvw4zud5w0TxIYpS
	f31SkA601k41Pp76KS6k+MmyiJyf4SUmRgOPaYJa8htQEMUgzPHxP2YRf+6P4n29sPtb
	+gBsXSLvML7Y0pRr4abaUqel2Iw4I1EHr7ezVmPza/iFeB3i9qDGEaOS0fVxhelg59va
	hKXA==
X-Gm-Message-State: AHQUAuZlnN4JzyXP678tuOB9M58Dk0muqrdXZ5PJLlaRJ7Urue3+/xr4
	cZPtKhvCm8PRioxPOypJnKbmEdU9
X-Google-Smtp-Source: AHgI3IaeopcmB18mnktJQiYqd65NDVxJtN6bQLwZYTW13Vl8fnt8TxcXlsYojaSeMCKB8UZf/VOoaQ==
X-Received: by 2002:a63:1321:: with SMTP id i33mr1470952pgl.380.1550079090621; 
	Wed, 13 Feb 2019 09:31:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	h15sm21528945pgl.43.2019.02.13.09.31.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 09:31:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2019 09:31:18 -0800
Message-Id: <20190213173118.44597-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213173118.44597-1-raj.khem@gmail.com>
References: <20190213173118.44597-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/6] rocksdb: Fix build with clang
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
X-List-Received-Date: Wed, 13 Feb 2019 17:31:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...and-do-not-mark-default-copy-constru.patch | 57 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch
new file mode 100644
index 0000000000..eccaa3a37a
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch
@@ -0,0 +1,57 @@
+From ee728434124b9b7d17abbd060a62aac79a9b79c0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Feb 2019 14:31:24 -0800
+Subject: [PATCH] Disable -Wshadow and do not mark default copy constructors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt                                     | 2 +-
+ utilities/persistent_cache/block_cache_tier.h      | 4 ++--
+ utilities/persistent_cache/block_cache_tier_file.h | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 98e2e1973..3a24a075b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -254,7 +254,7 @@ if(FAIL_ON_WARNINGS)
+   if(MSVC)
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /WX")
+   else() # assume GCC
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")
+   endif()
+ endif()
+ 
+diff --git a/utilities/persistent_cache/block_cache_tier.h b/utilities/persistent_cache/block_cache_tier.h
+index 2b2c0ef4f..96d0540a4 100644
+--- a/utilities/persistent_cache/block_cache_tier.h
++++ b/utilities/persistent_cache/block_cache_tier.h
+@@ -91,9 +91,9 @@ class BlockCacheTier : public PersistentCacheTier {
+         : key_(std::move(key)), data_(data) {}
+     ~InsertOp() {}
+ 
+-    InsertOp() = delete;
++    InsertOp() = default;
+     InsertOp(InsertOp&& /*rhs*/) = default;
+-    InsertOp& operator=(InsertOp&& rhs) = default;
++    InsertOp& operator=(InsertOp&& rhs) = delete;
+ 
+     // used for estimating size by bounded queue
+     size_t Size() { return data_.size() + key_.size(); }
+diff --git a/utilities/persistent_cache/block_cache_tier_file.h b/utilities/persistent_cache/block_cache_tier_file.h
+index e38b6c9a1..d9b89a4f7 100644
+--- a/utilities/persistent_cache/block_cache_tier_file.h
++++ b/utilities/persistent_cache/block_cache_tier_file.h
+@@ -262,7 +262,7 @@ class ThreadedWriter : public Writer {
+         : file_(file), buf_(buf), file_off_(file_off), callback_(callback) {}
+ 
+     IO(const IO&) = default;
+-    IO& operator=(const IO&) = default;
++    IO& operator=(const IO&) = delete;
+     size_t Size() const { return sizeof(IO); }
+ 
+     WritableFile* file_ = nullptr;           // File to write to
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index ebe50a58ec..78520f99b0 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -11,6 +11,7 @@ SRCBRANCH = "5.18.fb"
 PV = "5.18.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
+           file://0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.20.1


