Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2409CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33280.1792043137372080942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rUqcemYN;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e940d5d2beso5646215ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043137; x=1792647937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4LFV5BDa5k3G5pVC9Yn1kpg0hPNqgW+fbIO2Z4XRXf0=;
        b=rUqcemYNUDCc1yaCeDQRvusu8uuAaGB9dhzTimMa9ILkhLkGRi1+hnxaOqDeaKUy0q
         Wighzh2JuWK8Onuc76aQ5XnVyNaLLHu1yjUxFizSLWlZeThxuZoEXsb295h62loFH3tb
         HdutbNo/+ZdRIWi9XlvUG+xSFq3FsEYUu4ERB5jG81dVZFEjReHVOg99DNaYyWaS4mbR
         ikWgQexwIPGQpnjgvv8GDlgd5IT/fCEZsuy+T+CArdg1191w4CdTozZ6kHKwnEdrUG/L
         2i3JwuwWP6sgYz/j4tgm+KH05hyS/Isb0MOXMcz641lHQazCm7qD4F8klldCX0gI2AA7
         zjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043137; x=1792647937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4LFV5BDa5k3G5pVC9Yn1kpg0hPNqgW+fbIO2Z4XRXf0=;
        b=CGKphK1PherF1zt8qG41ADM+HODVXHr/dvPXFQfpMLgc72nnf08jUa74fB1Wi9nw6t
         eE9iLVeUkCmIcvvNSk2cYutryuVa+qrOh0n7f2c49571cgbAD1SgXBd6DCdopCvSj8BJ
         vx4BlTQqBCtDZ7QzTwQaPH96Z4KacQfgg1NHU/1Lu/O+ZrIY35G8fhU/V7+yJ5F+kFhR
         W324k93l5h1IXhAmlFN1asLq5ROAHCklKQXSZeZy8umqftSl3z2RjBnc9nxcNW+xT+/P
         0UyQmEgdn4uJf7QpizS4TLqvnCC93YxSPP8w8QfblYd5+tkFKylsF/c26Jra8l8GGjgI
         7JBQ==
X-Gm-Message-State: AFq9FYIiuwKPOP3NVt1TXFW21P5Uv3Kwnnae8PfnYBMV4plN63SsIs8p
	zX0rt3KJODynkk8M01H59GaW2Cxp+BaQ4ztBvVQWgoaNG8smQ2bF0LPTZArbiA==
X-Gm-Gg: AYBFou1T8/Hcn7cE3jrPbL4jhgTZGfcKZc5z01osgPkypcX4ApDNJZae6XHrET2mD9W
	JNri7YdDcCh6Sl9ZjpgFx4AkBh6hUgFf98UkyhEbjVCCAAfmOqwDv32W1WHq3XoSHALx42RbrsG
	GGpe8MTwXtcfqU9iWaxCsnzwqJxQE6CvBe/AhfkX+OP3K9KduA2Ra1hL+r2PMg+ods8WwD1Nmxv
	/j/43fULzPC7PS8BUWawTNcpodd7fxY2wCAKzI95xQXuzTKLkQyBrV8cb398xpjJNixw/Ap2jwi
	uP84rA78C4gIS0ZI6ftosvr/VK4XNLR+9FIUnDp1HE0Xmwl0zck6nK5xIrzBAO1e+59mmDodkqI
	4sccKOpSpaIFWXD0J6ZGTgumXGc2QGRUv5LEl3PpICXadt4+dowfAAczytEF/+4+Lgk+j8oMi6C
	hTfjnThp2/rBD3KYLjySxabNcREDUMTtRQEz0bna/WH0l+ro7jX2sw3+EprzQE1pSNXlAYKoCsX
	y4OpRfpzsd5EqxbkPIquSQ=
X-Received: by 2002:a17:902:cf0a:b0:2e8:b5af:22e0 with SMTP id d9443c01a7336-2e8b5af2c29mr97672655ad.41.1792043136562;
        Wed, 14 Oct 2026 22:45:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 78/82] tesseract: patch CVE-2026-88051
Date: Thu, 15 Oct 2026 18:42:06 +1300
Message-ID: <9ca7f33f69826ac0ebec288801cd0a3ffc1f2144.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130998

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

