Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8871878845
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:08 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id w129-v6so3536575pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UyLDm8I0mvhRorATDUmAC8psH2pDUO1E70+Vxney+qE=;
	b=rGqy+DuBZ6K5t3DhcACZ7IVLj0VXGrfeMRNcYY3JIu6O29fW7MirzXmJL8ihr9Io8J
	rVO0oYb2yhWZhO9v1kze+IyMVjp2bbU23GOshi24UcJ5oRbMH+cde/aJuums0a9+1a1h
	kxLsXs02CHNNdcxGWRjG5+0BFO641vSioTka6UKZ6nx6oppzn8JsI6ivlk1Sp2RYV+NN
	dYfqTLGwS4jz9WzwYJHAlYm0Vu7iPXBkatBvwo9TMDx8hfECdIIxlLr2KRWZU+fh05pK
	/TJQuW+n/U2v01R1//aMKhgFXppBKdd0tyvxxQHdkhnkTdD+hDmniZ3p5A2D3ngZiRT6
	7gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UyLDm8I0mvhRorATDUmAC8psH2pDUO1E70+Vxney+qE=;
	b=HsS6vhggmckFoPewUc1MDdiKDMv3qrpAi4T7g7pCKDqIZeiFmNQkDvoIYTsMSC0HdR
	sG0kw93HsJrc8Uplfn1Zp7wIhQGZ7jGmjSr+vGQ6IhuUyz9D/aPmAW3d10Kd7Q5/ipws
	Le+u0NXqnf650tnUGVJdhPAoNT5GC8Rwn+eESfORapTGu0S9ySMnXfTjakj8w+gITAZ6
	j2bkUywaZrse8FPk0VzAnwD7g8AGlFUPj1v2zbeWs1F8YLgMZkWi6tSFYk+pTFUsWC3b
	lNvFGR7SikDdeTMuXuNpaUpOjPhy0cH8I80XF228G8rrTyrI6gDjAX104W1xJ5OSwcsj
	DaQA==
X-Gm-Message-State: ALKqPwcHZWeW5bR9TdUsCJmYsMhVJvn5RJPMp51yVYJUwUQQVxbWjZku
	Qh+qHOz5oV6svKQC5F/amum7vA==
X-Google-Smtp-Source: AB8JxZoxly3OTwXx2F1P1IAhOc1nNGHeTWO/VhdlXjFPlJ56cdqrPgjSl0/JrsLNhB6vaB4M8w9mOw==
X-Received: by 2002:a63:6bc7:: with SMTP id
	g190-v6mr1334587pgc.230.1526094488942; 
	Fri, 11 May 2018 20:08:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:58 -0700
Message-Id: <20180512030758.31409-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] rocksdb: Fix build with gcc8
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
X-List-Received-Date: Sat, 12 May 2018 03:08:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Fix-GitHub-issue-3716-gcc-8-warnings.patch | 194 ++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |   4 +-
 2 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch b/meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch
new file mode 100644
index 0000000000..be498974af
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb/0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch
@@ -0,0 +1,194 @@
+From 8d65d70b54d1d306a0a0b00e036bc8ddd39d8ec1 Mon Sep 17 00:00:00 2001
+From: "przemyslaw.skibinski@percona.com" <przemyslaw.skibinski@percona.com>
+Date: Fri, 20 Apr 2018 13:28:05 -0700
+Subject: [PATCH] Fix GitHub issue #3716: gcc-8 warnings
+
+Summary:
+Fix the following gcc-8 warnings:
+- conflicting C language linkage declaration [-Werror]
+- writing to an object with no trivial copy-assignment [-Werror=class-memaccess]
+- array subscript -1 is below array bounds [-Werror=array-bounds]
+
+Solves https://github.com/facebook/rocksdb/issues/3716
+Closes https://github.com/facebook/rocksdb/pull/3736
+
+Differential Revision: D7684161
+
+Pulled By: yiwu-arbug
+
+fbshipit-source-id: 47c0423d26b74add251f1d3595211eee1e41e54a
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/facebook/rocksdb/commit/dee95a1afc6c63515e7d94dec33acdb79638b6d7.patch]
+
+ db/c.cc                   | 77 ++++++++++++++-------------------------
+ memtable/inlineskiplist.h | 12 +++---
+ 2 files changed, 33 insertions(+), 56 deletions(-)
+
+diff --git a/db/c.cc b/db/c.cc
+index 064103ed4..0d485d096 100644
+--- a/db/c.cc
++++ b/db/c.cc
+@@ -1388,23 +1388,24 @@ void rocksdb_writebatch_put_log_data(
+   b->rep.PutLogData(Slice(blob, len));
+ }
+ 
++class H : public WriteBatch::Handler {
++ public:
++  void* state_;
++  void (*put_)(void*, const char* k, size_t klen, const char* v, size_t vlen);
++  void (*deleted_)(void*, const char* k, size_t klen);
++  virtual void Put(const Slice& key, const Slice& value) override {
++    (*put_)(state_, key.data(), key.size(), value.data(), value.size());
++  }
++  virtual void Delete(const Slice& key) override {
++    (*deleted_)(state_, key.data(), key.size());
++  }
++};
++
+ void rocksdb_writebatch_iterate(
+     rocksdb_writebatch_t* b,
+     void* state,
+     void (*put)(void*, const char* k, size_t klen, const char* v, size_t vlen),
+     void (*deleted)(void*, const char* k, size_t klen)) {
+-  class H : public WriteBatch::Handler {
+-   public:
+-    void* state_;
+-    void (*put_)(void*, const char* k, size_t klen, const char* v, size_t vlen);
+-    void (*deleted_)(void*, const char* k, size_t klen);
+-    virtual void Put(const Slice& key, const Slice& value) override {
+-      (*put_)(state_, key.data(), key.size(), value.data(), value.size());
+-    }
+-    virtual void Delete(const Slice& key) override {
+-      (*deleted_)(state_, key.data(), key.size());
+-    }
+-  };
+   H handler;
+   handler.state_ = state;
+   handler.put_ = put;
+@@ -1649,18 +1650,6 @@ void rocksdb_writebatch_wi_iterate(
+     void* state,
+     void (*put)(void*, const char* k, size_t klen, const char* v, size_t vlen),
+     void (*deleted)(void*, const char* k, size_t klen)) {
+-  class H : public WriteBatch::Handler {
+-   public:
+-    void* state_;
+-    void (*put_)(void*, const char* k, size_t klen, const char* v, size_t vlen);
+-    void (*deleted_)(void*, const char* k, size_t klen);
+-    virtual void Put(const Slice& key, const Slice& value) override {
+-      (*put_)(state_, key.data(), key.size(), value.data(), value.size());
+-    }
+-    virtual void Delete(const Slice& key) override {
+-      (*deleted_)(state_, key.data(), key.size());
+-    }
+-  };
+   H handler;
+   handler.state_ = state;
+   handler.put_ = put;
+@@ -3109,20 +3098,21 @@ void rocksdb_slicetransform_destroy(rocksdb_slicetransform_t* st) {
+   delete st;
+ }
+ 
++struct Wrapper : public rocksdb_slicetransform_t {
++  const SliceTransform* rep_;
++  ~Wrapper() { delete rep_; }
++  const char* Name() const override { return rep_->Name(); }
++  Slice Transform(const Slice& src) const override {
++    return rep_->Transform(src);
++  }
++  bool InDomain(const Slice& src) const override {
++    return rep_->InDomain(src);
++  }
++  bool InRange(const Slice& src) const override { return rep_->InRange(src); }
++  static void DoNothing(void*) { }
++};
++
+ rocksdb_slicetransform_t* rocksdb_slicetransform_create_fixed_prefix(size_t prefixLen) {
+-  struct Wrapper : public rocksdb_slicetransform_t {
+-    const SliceTransform* rep_;
+-    ~Wrapper() { delete rep_; }
+-    const char* Name() const override { return rep_->Name(); }
+-    Slice Transform(const Slice& src) const override {
+-      return rep_->Transform(src);
+-    }
+-    bool InDomain(const Slice& src) const override {
+-      return rep_->InDomain(src);
+-    }
+-    bool InRange(const Slice& src) const override { return rep_->InRange(src); }
+-    static void DoNothing(void*) { }
+-  };
+   Wrapper* wrapper = new Wrapper;
+   wrapper->rep_ = rocksdb::NewFixedPrefixTransform(prefixLen);
+   wrapper->state_ = nullptr;
+@@ -3131,19 +3121,6 @@ rocksdb_slicetransform_t* rocksdb_slicetransform_create_fixed_prefix(size_t pref
+ }
+ 
+ rocksdb_slicetransform_t* rocksdb_slicetransform_create_noop() {
+-  struct Wrapper : public rocksdb_slicetransform_t {
+-    const SliceTransform* rep_;
+-    ~Wrapper() { delete rep_; }
+-    const char* Name() const override { return rep_->Name(); }
+-    Slice Transform(const Slice& src) const override {
+-      return rep_->Transform(src);
+-    }
+-    bool InDomain(const Slice& src) const override {
+-      return rep_->InDomain(src);
+-    }
+-    bool InRange(const Slice& src) const override { return rep_->InRange(src); }
+-    static void DoNothing(void*) { }
+-  };
+   Wrapper* wrapper = new Wrapper;
+   wrapper->rep_ = rocksdb::NewNoopTransform();
+   wrapper->state_ = nullptr;
+diff --git a/memtable/inlineskiplist.h b/memtable/inlineskiplist.h
+index 702a7336d..eadda1dc1 100644
+--- a/memtable/inlineskiplist.h
++++ b/memtable/inlineskiplist.h
+@@ -280,7 +280,7 @@ struct InlineSkipList<Comparator>::Node {
+   // next_[0].  This is used for passing data from AllocateKey to Insert.
+   void StashHeight(const int height) {
+     assert(sizeof(int) <= sizeof(next_[0]));
+-    memcpy(&next_[0], &height, sizeof(int));
++    memcpy(static_cast<void*>(&next_[0]), &height, sizeof(int));
+   }
+ 
+   // Retrieves the value passed to StashHeight.  Undefined after a call
+@@ -300,30 +300,30 @@ struct InlineSkipList<Comparator>::Node {
+     assert(n >= 0);
+     // Use an 'acquire load' so that we observe a fully initialized
+     // version of the returned Node.
+-    return (next_[-n].load(std::memory_order_acquire));
++    return ((&next_[0] - n)->load(std::memory_order_acquire));
+   }
+ 
+   void SetNext(int n, Node* x) {
+     assert(n >= 0);
+     // Use a 'release store' so that anybody who reads through this
+     // pointer observes a fully initialized version of the inserted node.
+-    next_[-n].store(x, std::memory_order_release);
++    (&next_[0] - n)->store(x, std::memory_order_release);
+   }
+ 
+   bool CASNext(int n, Node* expected, Node* x) {
+     assert(n >= 0);
+-    return next_[-n].compare_exchange_strong(expected, x);
++    return (&next_[0] - n)->compare_exchange_strong(expected, x);
+   }
+ 
+   // No-barrier variants that can be safely used in a few locations.
+   Node* NoBarrier_Next(int n) {
+     assert(n >= 0);
+-    return next_[-n].load(std::memory_order_relaxed);
++    return (&next_[0] - n)->load(std::memory_order_relaxed);
+   }
+ 
+   void NoBarrier_SetNext(int n, Node* x) {
+     assert(n >= 0);
+-    next_[-n].store(x, std::memory_order_relaxed);
++    (&next_[0] - n)->store(x, std::memory_order_relaxed);
+   }
+ 
+   // Insert node after prev on specific level.
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 1e6cbae389..9a2f9dd1c5 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -10,7 +10,9 @@ SRCREV = "8969445642039566214d650cc6614849e7dd5e17"
 SRCBRANCH = "5.12.fb"
 PV = "5.12.2"
 
-SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
+           file://0001-Fix-GitHub-issue-3716-gcc-8-warnings.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0


