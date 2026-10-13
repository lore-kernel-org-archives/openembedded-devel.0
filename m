Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0B2CC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3538.1791885629822119334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mudIBfqm;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso1041897a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885629; x=1792490429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LFV5BDa5k3G5pVC9Yn1kpg0hPNqgW+fbIO2Z4XRXf0=;
        b=mudIBfqmIr2AVmABVoUpk7Jg45AAsqyODjvYU/110bMcvxdq9aSBhJujYxBR44ZvKv
         3dh2HlPKDrdWbjTxE/7fU6ZdGZwi6yelEFqApIlSVAqbe1H7YZPlW34h+P+9UdQSGCyV
         S/svILzVvRuQxvQUT92oCkBA7sB1zzxPlMYHwYzE5RoPGrXu8XwVJPhTeHp4lnTykpTP
         HVe1eEycTcBFhLVpfjGERPc+efh+sTeaHazeTiNdzFxZOgBLUikJZTHA0j9+ezg+q3Ow
         BdSkgdIb0LA9yn76uZf14Yls+rbfkksEwgleXbFRKB0RcxiAxSQAiqrTKNqFQOY+TMPl
         PWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885629; x=1792490429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LFV5BDa5k3G5pVC9Yn1kpg0hPNqgW+fbIO2Z4XRXf0=;
        b=C6kFizoM4j6EiUXBoszKmWAJOC9fR0As9foYj0Tj1J/CMgrCHsZJC+dMCAc6zcpCF8
         pg/ms/9TBlwIs7MgkE2krAFiNU/zaZkWFtus3gekt0Zcgc4DoSRCBR48SpOo+1Mr05bC
         u96cq8ld8anZoI5TnKU1F/mg/HZ8spfcS6BHM1Xtk1m/VBgmsF2Eid+dbBeLhoJfQbxF
         40vWsWER3u0LyaoOU0XE4arTmtiwJYvZ+Hh82S41flbK/210rHhjRLCFup632njVvqgJ
         ggcb/RD9OBHa3sSWw3Kg/JZT8Zu+Muau8N3eAvenEMz5bmpOui0pHBD2OX1u3vpMFYGF
         0/Ew==
X-Gm-Message-State: AFq9FYJLkRcyVZfwNPF3AayMuGp8/KKaekZ+8ARGhN0kt+nIOLS9n/Vb
	2tgMdzewV9pR3oIpdPDuMK1nAJosr2rtVjZ9fbL6xg+OqpvGZX4HAiAYPCqAlQ==
X-Gm-Gg: AYBFou0TgyloIS5A78F9YMzaKep9WleIwDGyoLOfSOwUW1iOlrCLuIVlgJSn9mUu3D/
	j8Dod3TKknhcl00eSv6VnsSiDNparyjfqs9ujvBceM5DzZ98ecSDyxu0apvMGbSc2bqJTLyXtgK
	gcRE0B3PeW4sMFhOoS0tpTemPWbRRBI3CWlFglNeOmQ2BI2fxokuAWo9jqmgmr00dvxZd8YlSBW
	RDg+loSZZ2UluTsXGgUxxlP8bQjzU+53tKdsst1pbRrDh5kSOfj7/2fqlVy495NbApOFz9+zZHb
	SFclNtTZRf+cC6Bn5o/nKDUFvmZ9pR+mSw7pWvsuJ1QQ1MKwJxqv7Pl8HZlA+uy/C9o/ESywuZq
	8D3ZxDgSqXR8fKBtWUkBbnfJ9kctArbe69/UKvRg1DYIZNybZARQ9ppH+NTuh37utFoZhbcKM2W
	rY3dWfcT4yF57KiGTAPxlMNISpxqNn9eMGCQisN2HIYTEZUPhjfx/vOYHvqNWWCw+nnhdWmyPya
	wIGkRZuMeALAjfQkKQeFCOYT80jnVqT7jnZQKY=
X-Received: by 2002:a17:90a:ec87:b0:3ac:5ca:c7a8 with SMTP id 98e67ed59e1d1-3ac05cac819mr3354335a91.60.1791885628858;
        Tue, 13 Oct 2026 03:00:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 26/28] tesseract: patch CVE-2026-88051
Date: Tue, 13 Oct 2026 22:59:01 +1300
Message-ID: <20261013095903.3544906-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130859

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

