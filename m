Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B6FCC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:41:01 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.362.1791866456593304576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e1QV/MQS;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2035543a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866456; x=1792471256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LFV5BDa5k3G5pVC9Yn1kpg0hPNqgW+fbIO2Z4XRXf0=;
        b=e1QV/MQSA5nPLUhkKDO+6epPdtiJNqqzaTHOUwaRMjj27k96aQpz2a/5/cWfAVzQ7q
         29yeTz3QnLpHPLdGftg13QDW3TAI/v/gYfZfZRslFQrmYVfUE3SuBize1jS/C76yUXtW
         x76fX19r0KHyvj8u+MPxGyXl0svw7imtPYFmUWZcinAdY0lAZQ3mnNwK3+uxNaMvlGiY
         GPrmjex/Zy3H0ev8oCg/OuOt944Pf7Lk/ryv8NWi/QuXa1H49Og5cN6L158Gm3d/8bVe
         9krJh3FaJwM7LnLNQm/xK1ZQP7hdX0oPuJgntb0RUoYfSmz62oCGiObiIqpqBqOgLQBl
         UFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866456; x=1792471256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LFV5BDa5k3G5pVC9Yn1kpg0hPNqgW+fbIO2Z4XRXf0=;
        b=IU5X2gfJt8z+oZRd0wSe20gAg2xwpdYb9VhiY7itCzNtzz3Us1LgUbe+YiPmBGoeGa
         YHb2+QXzDJKTQuoHqj3HdE/YzDw57S7FXnvA0X+ia2HEYlQ6SCO5ctg2nzpuN0u3OexN
         TCqs4pH+bR5rMiC3WM00xiCYh1RWL+Sqdxhk/MylWPTlZim1TYx7QIEDp3Hdhs0sfyZO
         gJGfHn5wXAeZnbs7vUxlho/LxwZGteb07qvh3p1ZnPu++/IJrh6HfmqAQ3kDJSJoQlD8
         klIE0Z/9Op+bk6Vd9a06Jk337RrPFwK+RxgT0h/OUURKDLiTJcF97dWWDDW6iJkd502v
         DkhA==
X-Gm-Message-State: AFq9FYIn2Fp3qDGHgZkDIziBxzGNEKWGoFY+M4KUrEiyEOYvX1xzOw3X
	ObDaVUJJRevjU/Lpzwwl88dFp1XouFsy0qRgu4AbYCuqFKaHR1nnOjb0Eso55g==
X-Gm-Gg: AYBFou3TkJUdi2XGRdtmx514169tzkhmoNzR0xA/RZ/oQMZXVrV36BDthAECwhTVKfz
	JGzzkxFudk8KY3R/XwGafBJxCJj4l+sBBsFPtWa1LxCYkv9GdvRg/cNs8coBuRgnTqwjeEBl+si
	NHh3F3GzWmPN5c4gQrwTtsGHoX+fMEmdUpjh0TASKUM68mntMp3GdVE84/tW0cQCrAZIKZvcn4V
	5P9UvTD9WDHUI661Ja457SQfLjUDZqkbYm/ee12sCwijYx49yUyizUa68ukA4NikMys3khJmA+U
	Iv6dMqGauBcvCzT0RMFa8FPLCovMZ4YEtBXm1/9tgdjPskLOIUyffQVJ4t7I7zum612Kre9nLvV
	dm6wlDW3nMBSxe9Wnj0MtckGbioYJoNVNfjZmJ2BL9Hc+NA4rF6rfyQJWDuhUNfBSNjC9JGGujp
	yvT1/Svf4r41LXVtJFv6D9prW0WcJtQAwm3mTyyjF/UzhZuHP2YfOsEgFPbhABnVLU/aqWLyIfD
	qCXcAxiWYU/C1MnbvSEFJlhpVkH731nsqfF9Ay4ON+hbd9qIazd
X-Received: by 2002:a17:90b:2885:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3ab3af73996mr9315163a91.65.1791866455606;
        Mon, 12 Oct 2026 21:40:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 14/16] tesseract: patch CVE-2026-88051
Date: Tue, 13 Oct 2026 17:40:04 +1300
Message-ID: <20261013044006.834868-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130828

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88051

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 727354dae2ee3075ad388bcfe22156ab1ea6fcf5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88051.patch  | 184 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   1 +
 2 files changed, 185 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
new file mode 100644
index 0000000000..1956d49672
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
@@ -0,0 +1,184 @@
+From 79bf602b0cd5216c125f86eaf3c768daae256930 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 21 Aug 2026 20:29:37 +0200
+Subject: [PATCH] Validate vector counts in GenericVector::read
+
+The callback form of GenericVector::read read two independent int32
+fields from the file: reserved sized the allocation via reserve(),
+while size_used_ drove the element loop. Neither was capped and no
+size_used_ <= reserved invariant was checked, so a crafted
+.traineddata (e.g. the fontinfo table of a version >= 4 inttemp
+component) performed a heap out-of-bounds write during legacy
+engine initialization.
+
+Key changes:
+- genericvector.h: reject negative or over-limit reserved
+  (matching the 50000000 cap of the DeSerialize overloads) and
+  reject size_used_ < 0 or size_used_ > reserved before entering
+  the read loop. Legit files always satisfy size_used_ <= reserved,
+  as write() persists size_reserved_ first.
+- unittest: add genericvector_test covering size_used_ beyond
+  reserved (on unpatched code the ASan build dies on a
+  heap-buffer-overflow in the read loop), negative counts, and a
+  consistent vector that must still load.
+
+Reported-by: Zhixi "Jace" Sun <g.mygenie@gmail.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit 56e09ca12e751623fe796ce1554ce704bffd2ef0)
+
+CVE: CVE-2026-88051
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/56e09ca12e751623fe796ce1554ce704bffd2ef0]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                    |  5 ++
+ src/ccutil/genericvector.h     | 10 ++++
+ unittest/genericvector_test.cc | 91 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 106 insertions(+)
+ create mode 100644 unittest/genericvector_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index cc748455..c67f0f63 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1159,6 +1159,7 @@ check_PROGRAMS += equationdetect_test
+ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += fileio_test
+ check_PROGRAMS += fullyconnected_test
++check_PROGRAMS += genericvector_test
+ check_PROGRAMS += heap_test
+ check_PROGRAMS += imagedata_test
+ if !DISABLED_LEGACY_ENGINE
+@@ -1298,6 +1299,10 @@ fullyconnected_test_SOURCES = unittest/fullyconnected_test.cc
+ fullyconnected_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ fullyconnected_test_LDADD = $(TESS_LIBS)
+ 
++genericvector_test_SOURCES = unittest/genericvector_test.cc
++genericvector_test_CPPFLAGS = $(unittest_CPPFLAGS)
++genericvector_test_LDADD = $(TESS_LIBS)
++
+ heap_test_SOURCES = unittest/heap_test.cc
+ heap_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ heap_test_LDADD = $(TESS_LIBS)
+diff --git a/src/ccutil/genericvector.h b/src/ccutil/genericvector.h
+index 4a5bbe12..cbe1e203 100644
+--- a/src/ccutil/genericvector.h
++++ b/src/ccutil/genericvector.h
+@@ -654,10 +654,20 @@ bool GenericVector<T>::read(TFile *f, const std::function<bool(TFile *, T *)> &c
+   if (f->FReadEndian(&reserved, sizeof(reserved), 1) != 1) {
+     return false;
+   }
++  // Arbitrarily limit the number of elements to protect against bad data.
++  const uint32_t limit = 50000000;
++  if (reserved < 0 || static_cast<uint32_t>(reserved) > limit) {
++    return false;
++  }
+   reserve(reserved);
+   if (f->FReadEndian(&size_used_, sizeof(size_used_), 1) != 1) {
+     return false;
+   }
++  // size_used_ is an independent file field; without this check the reads
++  // below land past the end of the buffer sized from reserved.
++  if (size_used_ < 0 || size_used_ > reserved) {
++    return false;
++  }
+   if (cb != nullptr) {
+     for (int i = 0; i < size_used_; ++i) {
+       if (!cb(f, data_ + i)) {
+diff --git a/unittest/genericvector_test.cc b/unittest/genericvector_test.cc
+new file mode 100644
+index 00000000..269b00f0
+--- /dev/null
++++ b/unittest/genericvector_test.cc
+@@ -0,0 +1,91 @@
++///////////////////////////////////////////////////////////////////////
++// File:        genericvector_test.cc
++// Description: Tests that the callback form of GenericVector::read
++//              rejects vectors whose size_used_ exceeds reserved (or
++//              whose counts are negative). reserved sizes the buffer
++//              while size_used_ is an independent file field driving
++//              the element loop, so a crafted .traineddata (e.g. the
++//              fontinfo table of a version >= 4 inttemp component)
++//              performs a heap out-of-bounds write during legacy
++//              engine initialization.
++//
++// Licensed under the Apache License, Version 2.0 (the "License");
++// you may not use this file except in compliance with the License.
++// You may obtain a copy of the License at
++// http://www.apache.org/licenses/LICENSE-2.0
++//
++///////////////////////////////////////////////////////////////////////
++
++#include "include_gunit.h"
++
++#include "genericvector.h"
++#include "serialis.h" // for TFile
++
++#include <cstdint>
++#include <vector>
++
++namespace tesseract {
++namespace {
++
++// Appends raw little-endian values to a byte buffer.
++class ByteWriter {
++public:
++  void PutS32(int32_t v) {
++    uint32_t u = static_cast<uint32_t>(v);
++    for (int i = 0; i < 4; ++i) {
++      data_.push_back(static_cast<char>((u >> (8 * i)) & 0xFF));
++    }
++  }
++  const std::vector<char> &data() const { return data_; }
++
++private:
++  std::vector<char> data_;
++};
++
++// A serialized vector header (reserved, size_used_) followed by the
++// given number of int32 elements.
++std::vector<char> MakeVector(int32_t reserved, int32_t size_used, int32_t num_elements) {
++  ByteWriter w;
++  w.PutS32(reserved);
++  w.PutS32(size_used);
++  for (int32_t i = 0; i < num_elements; ++i) {
++    w.PutS32(i);
++  }
++  return w.data();
++}
++
++// reserved=4 but size_used_=0x10000: on unpatched code the callback
++// loop writes 65536 ints past the 4-int buffer (heap out-of-bounds
++// write).
++TEST(GenericVectorTest, RejectsSizeUsedBeyondReserved) {
++  std::vector<char> bytes = MakeVector(4, 0x10000, 0x10000);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  GenericVector<int> v;
++  EXPECT_FALSE(v.read(&fp, [](TFile *f, int *p) { return f->DeSerialize(p); }));
++}
++
++// Negative counts must be rejected; on unpatched code the read
++// "succeeds" and leaves size_used_ negative.
++TEST(GenericVectorTest, RejectsNegativeCounts) {
++  std::vector<char> bytes = MakeVector(-1, -1, 0);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  GenericVector<int> v;
++  EXPECT_FALSE(v.read(&fp, [](TFile *f, int *p) { return f->DeSerialize(p); }));
++}
++
++// A consistent vector must still be accepted.
++TEST(GenericVectorTest, AcceptsConsistentVector) {
++  std::vector<char> bytes = MakeVector(4, 2, 2);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  GenericVector<int> v;
++  ASSERT_TRUE(v.read(&fp, [](TFile *f, int *p) { return f->DeSerialize(p); }));
++  EXPECT_EQ(v.size(), 2);
++  EXPECT_EQ(v[0], 0);
++  EXPECT_EQ(v[1], 1);
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index 25d357d903..be6ec1e463 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88049.patch \
            file://CVE-2026-88050.patch \
            file://CVE-2026-88047.patch \
+           file://CVE-2026-88051.patch \
 "
 
 DEPENDS = "leptonica"

