Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5C03C6B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:51:30 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id w7so8731262pgp.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 18:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hKBiJbefj9R0URzWzp13SUCgAp3KzUdvWyTWObp9UNk=;
	b=KKY8v2KkVu3MW8k9VGguPDReJxBMTUTUSs+RluHiM0BUNeIUej9Z1mEpnJCavADJIN
	4IsAAZw/UAP3bblbhO+9JY4gWBYYJLi5URRoVQml+niRtj4URuMlKepqBbvR4QP/SwNQ
	ECZb5+UXSSM6jh8Du5UHS7VSS9YdZkdmOML7lQaWlxmjihmb8vRb+xZrAWtqGe3Jph1J
	zF77khZM7SQdh6mZhpNYpcO37edv7b5R30fQOUexiFaFomnwk0g4GEhqULsomgOEvnFk
	MKu882mchXDwcTkbzmeYYyhRE8f/eu1LmnxKpJdL36JAlHUh66DFz0BFupT9BFaX95bk
	4tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hKBiJbefj9R0URzWzp13SUCgAp3KzUdvWyTWObp9UNk=;
	b=AJ50Z31tx+omXc3VtwFsQEp+BDLo0h+b0Af7NcrnlKYHze1A4YeVpERTK32gN39JSF
	ZBouyHRte4OYc8PR6ObahGLbG44RI3r4oo1PLeUsts6OxB4U1aXgy9n4ThEBI6gNndYy
	ovitnuUALl/Y3cVWYVjmL0ehtiyiNTbuzOwKgnpXZSp0zz8XPjacj149lvzXtv6XJ5sR
	QThNXTPqGcIr64fBnkzpQj8pLxa/4x5Tx/DB9dxd0bc3zm8sDk5DbciTmuS0DKoTEPYm
	+vVIRPNR98+5oWK3D8BLbdFkz4PQAY1XYonavauyC+evCnpgmY5RhVX6DeRtymFPgIVk
	vkjw==
X-Gm-Message-State: AA+aEWatWVHSST3eoKHUVr/VEXG8GpSmzBoBFnpnbx0X+evenB3Z7s5W
	zfW5BwxLLFcUmV7C4T7jgA9z+39KsGU=
X-Google-Smtp-Source: AFSGD/VasUrywJXhsgbL/FxK4hUPxM1Lt6F7JHaLMte/Q+Y+FiGaE8738E2bzlXBVn/jW8mHkQBKBw==
X-Received: by 2002:a63:a401:: with SMTP id c1mr17983243pgf.403.1545187890937; 
	Tue, 18 Dec 2018 18:51:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m3sm28000563pff.173.2018.12.18.18.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 18:51:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 18:51:09 -0800
Message-Id: <20181219025109.19159-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219025109.19159-1-raj.khem@gmail.com>
References: <20181219025109.19159-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/6] rocksdb: Upgrade to 5.17.2
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
X-List-Received-Date: Wed, 19 Dec 2018 02:51:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Fix-GitHub-issue-3716-gcc-8-warnings.patch | 194 ------------------
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |   7 +-
 2 files changed, 3 insertions(+), 198 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch b/meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch
deleted file mode 100644
index be498974af..0000000000
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 8d65d70b54d1d306a0a0b00e036bc8ddd39d8ec1 Mon Sep 17 00:00:00 2001
-From: "przemyslaw.skibinski@percona.com" <przemyslaw.skibinski@percona.com>
-Date: Fri, 20 Apr 2018 13:28:05 -0700
-Subject: [PATCH] Fix GitHub issue #3716: gcc-8 warnings
-
-Summary:
-Fix the following gcc-8 warnings:
-- conflicting C language linkage declaration [-Werror]
-- writing to an object with no trivial copy-assignment [-Werror=class-memaccess]
-- array subscript -1 is below array bounds [-Werror=array-bounds]
-
-Solves https://github.com/facebook/rocksdb/issues/3716
-Closes https://github.com/facebook/rocksdb/pull/3736
-
-Differential Revision: D7684161
-
-Pulled By: yiwu-arbug
-
-fbshipit-source-id: 47c0423d26b74add251f1d3595211eee1e41e54a
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/facebook/rocksdb/commit/dee95a1afc6c63515e7d94dec33acdb79638b6d7.patch]
-
- db/c.cc                   | 77 ++++++++++++++-------------------------
- memtable/inlineskiplist.h | 12 +++---
- 2 files changed, 33 insertions(+), 56 deletions(-)
-
-diff --git a/db/c.cc b/db/c.cc
-index 064103ed4..0d485d096 100644
---- a/db/c.cc
-+++ b/db/c.cc
-@@ -1388,23 +1388,24 @@ void rocksdb_writebatch_put_log_data(
-   b->rep.PutLogData(Slice(blob, len));
- }
- 
-+class H : public WriteBatch::Handler {
-+ public:
-+  void* state_;
-+  void (*put_)(void*, const char* k, size_t klen, const char* v, size_t vlen);
-+  void (*deleted_)(void*, const char* k, size_t klen);
-+  virtual void Put(const Slice& key, const Slice& value) override {
-+    (*put_)(state_, key.data(), key.size(), value.data(), value.size());
-+  }
-+  virtual void Delete(const Slice& key) override {
-+    (*deleted_)(state_, key.data(), key.size());
-+  }
-+};
-+
- void rocksdb_writebatch_iterate(
-     rocksdb_writebatch_t* b,
-     void* state,
-     void (*put)(void*, const char* k, size_t klen, const char* v, size_t vlen),
-     void (*deleted)(void*, const char* k, size_t klen)) {
--  class H : public WriteBatch::Handler {
--   public:
--    void* state_;
--    void (*put_)(void*, const char* k, size_t klen, const char* v, size_t vlen);
--    void (*deleted_)(void*, const char* k, size_t klen);
--    virtual void Put(const Slice& key, const Slice& value) override {
--      (*put_)(state_, key.data(), key.size(), value.data(), value.size());
--    }
--    virtual void Delete(const Slice& key) override {
--      (*deleted_)(state_, key.data(), key.size());
--    }
--  };
-   H handler;
-   handler.state_ = state;
-   handler.put_ = put;
-@@ -1649,18 +1650,6 @@ void rocksdb_writebatch_wi_iterate(
-     void* state,
-     void (*put)(void*, const char* k, size_t klen, const char* v, size_t vlen),
-     void (*deleted)(void*, const char* k, size_t klen)) {
--  class H : public WriteBatch::Handler {
--   public:
--    void* state_;
--    void (*put_)(void*, const char* k, size_t klen, const char* v, size_t vlen);
--    void (*deleted_)(void*, const char* k, size_t klen);
--    virtual void Put(const Slice& key, const Slice& value) override {
--      (*put_)(state_, key.data(), key.size(), value.data(), value.size());
--    }
--    virtual void Delete(const Slice& key) override {
--      (*deleted_)(state_, key.data(), key.size());
--    }
--  };
-   H handler;
-   handler.state_ = state;
-   handler.put_ = put;
-@@ -3109,20 +3098,21 @@ void rocksdb_slicetransform_destroy(rocksdb_slicetransform_t* st) {
-   delete st;
- }
- 
-+struct Wrapper : public rocksdb_slicetransform_t {
-+  const SliceTransform* rep_;
-+  ~Wrapper() { delete rep_; }
-+  const char* Name() const override { return rep_->Name(); }
-+  Slice Transform(const Slice& src) const override {
-+    return rep_->Transform(src);
-+  }
-+  bool InDomain(const Slice& src) const override {
-+    return rep_->InDomain(src);
-+  }
-+  bool InRange(const Slice& src) const override { return rep_->InRange(src); }
-+  static void DoNothing(void*) { }
-+};
-+
- rocksdb_slicetransform_t* rocksdb_slicetransform_create_fixed_prefix(size_t prefixLen) {
--  struct Wrapper : public rocksdb_slicetransform_t {
--    const SliceTransform* rep_;
--    ~Wrapper() { delete rep_; }
--    const char* Name() const override { return rep_->Name(); }
--    Slice Transform(const Slice& src) const override {
--      return rep_->Transform(src);
--    }
--    bool InDomain(const Slice& src) const override {
--      return rep_->InDomain(src);
--    }
--    bool InRange(const Slice& src) const override { return rep_->InRange(src); }
--    static void DoNothing(void*) { }
--  };
-   Wrapper* wrapper = new Wrapper;
-   wrapper->rep_ = rocksdb::NewFixedPrefixTransform(prefixLen);
-   wrapper->state_ = nullptr;
-@@ -3131,19 +3121,6 @@ rocksdb_slicetransform_t* rocksdb_slicetransform_create_fixed_prefix(size_t pref
- }
- 
- rocksdb_slicetransform_t* rocksdb_slicetransform_create_noop() {
--  struct Wrapper : public rocksdb_slicetransform_t {
--    const SliceTransform* rep_;
--    ~Wrapper() { delete rep_; }
--    const char* Name() const override { return rep_->Name(); }
--    Slice Transform(const Slice& src) const override {
--      return rep_->Transform(src);
--    }
--    bool InDomain(const Slice& src) const override {
--      return rep_->InDomain(src);
--    }
--    bool InRange(const Slice& src) const override { return rep_->InRange(src); }
--    static void DoNothing(void*) { }
--  };
-   Wrapper* wrapper = new Wrapper;
-   wrapper->rep_ = rocksdb::NewNoopTransform();
-   wrapper->state_ = nullptr;
-diff --git a/memtable/inlineskiplist.h b/memtable/inlineskiplist.h
-index 702a7336d..eadda1dc1 100644
---- a/memtable/inlineskiplist.h
-+++ b/memtable/inlineskiplist.h
-@@ -280,7 +280,7 @@ struct InlineSkipList<Comparator>::Node {
-   // next_[0].  This is used for passing data from AllocateKey to Insert.
-   void StashHeight(const int height) {
-     assert(sizeof(int) <= sizeof(next_[0]));
--    memcpy(&next_[0], &height, sizeof(int));
-+    memcpy(static_cast<void*>(&next_[0]), &height, sizeof(int));
-   }
- 
-   // Retrieves the value passed to StashHeight.  Undefined after a call
-@@ -300,30 +300,30 @@ struct InlineSkipList<Comparator>::Node {
-     assert(n >= 0);
-     // Use an 'acquire load' so that we observe a fully initialized
-     // version of the returned Node.
--    return (next_[-n].load(std::memory_order_acquire));
-+    return ((&next_[0] - n)->load(std::memory_order_acquire));
-   }
- 
-   void SetNext(int n, Node* x) {
-     assert(n >= 0);
-     // Use a 'release store' so that anybody who reads through this
-     // pointer observes a fully initialized version of the inserted node.
--    next_[-n].store(x, std::memory_order_release);
-+    (&next_[0] - n)->store(x, std::memory_order_release);
-   }
- 
-   bool CASNext(int n, Node* expected, Node* x) {
-     assert(n >= 0);
--    return next_[-n].compare_exchange_strong(expected, x);
-+    return (&next_[0] - n)->compare_exchange_strong(expected, x);
-   }
- 
-   // No-barrier variants that can be safely used in a few locations.
-   Node* NoBarrier_Next(int n) {
-     assert(n >= 0);
--    return next_[-n].load(std::memory_order_relaxed);
-+    return (&next_[0] - n)->load(std::memory_order_relaxed);
-   }
- 
-   void NoBarrier_SetNext(int n, Node* x) {
-     assert(n >= 0);
--    next_[-n].store(x, std::memory_order_relaxed);
-+    (&next_[0] - n)->store(x, std::memory_order_relaxed);
-   }
- 
-   // Insert node after prev on specific level.
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 594d1a9c77..67822477ee 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "c60df9d9e7629fe208a9b848293a5599f83d5e77"
-SRCBRANCH = "5.13.fb"
-PV = "5.13.1"
+SRCREV = "f438b98e552010613cff8684a7d84191ed785148"
+SRCBRANCH = "5.17.fb"
+PV = "5.17.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
-           file://0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.20.1


