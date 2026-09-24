Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD88C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:16 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.737.1790224446801071169
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dgy2rFwO;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so927171b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224446; x=1790829246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3rus/LyQ9yzYbQ0n5NNi0aVn97Qc0iH97ys1YBgzTA=;
        b=dgy2rFwOzHKot+z2EDOR5ji+6Kec4anEuBdFre3ugJMOzypUk4PVOUQxXSVqP/Hh60
         CgE+lAvM1LR14tHL8dEy7FOQEvJHMe7+Fv5sxcUaMUEaflPNYLYeCz81cXUrkq1YgCr+
         36jSdHpTdzyhNKEtG8Jj+SFC7EVYAdGxykf4Kcvuah5CCHo/IArwhGUYmdyZ/DxkX6xT
         CAjGgDiLNVMHgH42DoMHgQ6x+UH+CyZqArlz44CUC+iuA3+htW9oiyjsaxuIJUk9DWjj
         EEAqbYpvT+Nm7HbiwIohfW113viHtN/TweRgQKCxohsSQoEEjTGa5Wn5oOc+HNYAHERL
         7vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224446; x=1790829246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3rus/LyQ9yzYbQ0n5NNi0aVn97Qc0iH97ys1YBgzTA=;
        b=q6TJSD3j/yThgPVkZOi2w+rAKr8H6qbeQht88c5eQEzdk0TMAEq8H2XVLaobHVMSZo
         kOFoPzXeQiWtimkN6b1G88mxxhNjhu/2qOgeheaRxFlYapEZCU0j8zsWYDOjAmRC9TWf
         wIfBs1+j4XiKiRUYna7DwHwY7PsHRNS14LHZsj8GtpByks3RjE9jeTVTikpiGwZrLNq1
         AFb44P4ydEhPeHY8cJV6F8XdLmmEXVGu/Ml6KZEln0dJH2li0lZtIvxom7zvKF6xI9SU
         3DT0arIMj9r8t6vELhrp7I/xL0lqPXEZcVOnHOWPINEixUoMEaXe+odZCeSsRB4v8ynD
         wALw==
X-Gm-Message-State: AFuF++mvq5mSsS58Ye9p5SLqjMbI/bhY4cGs2fiPj8bQRxDzbThdMrHw
	A+QJ29QaDTvjajgAaN5eQzR1vPfa45dsn6l8D/bHoPoDATwfCUskRnjwNox8rw==
X-Gm-Gg: AYBFou2eggT7funsZ5cmQn/IEGVejAZ1YyEABWfrrzy1TlCshu1fjHDEFtiDpVYhU+I
	CO5ctlsVRQOJBZyagsyk5urW0a5JAx3gPiGn420knpPxcKjH+GVDgbqMwjysLqX7/elu2u7w2I2
	fV+M1LX3qP4TNFMVuyeiT1l9pnGAgtrbPD1/gAXBdCpRbDQBqzYsT6KVlHxwFLNVsAYRTtzUoa6
	3gWPVNqNp/iAV4gd4BXPcNSW0lyrMB5o8qz9dMq1qhS1SQk8kNUegxvFaiMVcYPXFzVlO3cJQEi
	SFQSmvVIhXYpz7i5PIezXAFl1Cg3hnzdYjvmgwngyjlWwTVpPmDjqCiszBbe6S3/UulZZE+l2fl
	tzq8D9IORge9iWvi3keSFRcnUIrcLvv8PZpOVSmZpVd+k/2V+1EOtxd3YbeDs+XNDAVfpDtLaSg
	pt2S0asNz9MK7fGEH1+qdy/q9tNcUZ4vxjObRxKzktlxSTEpXDTjzb9t/0cO1m5eFSpl0g40C3p
	U1zyeBUjAuEZly0jN9leJc=
X-Received: by 2002:a05:6a00:a0d:b0:87c:d00a:f335 with SMTP id d2e1a72fcca58-87e9be7f2eemr987836b3a.44.1790224446078;
        Wed, 23 Sep 2026 21:34:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:34:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 21/24] tesseract: patch CVE-2026-88051
Date: Thu, 24 Sep 2026 16:33:11 +1200
Message-ID: <20260924043315.1663186-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130269

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88051

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88051.patch  | 185 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   1 +
 2 files changed, 186 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
new file mode 100644
index 0000000000..efc204dc04
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
@@ -0,0 +1,185 @@
+From 0ad773414bcb9a4f41e7d86759353d9558ba8cbe Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                    |  5 ++
+ src/ccutil/genericvector.h     | 10 ++++
+ unittest/genericvector_test.cc | 91 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 106 insertions(+)
+ create mode 100644 unittest/genericvector_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index 48e7dcbc..d2b503d4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1188,6 +1188,7 @@ check_PROGRAMS += equationdetect_test
+ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += fileio_test
+ check_PROGRAMS += fullyconnected_test
++check_PROGRAMS += genericvector_test
+ check_PROGRAMS += heap_test
+ check_PROGRAMS += imagedata_test
+ if !DISABLED_LEGACY_ENGINE
+@@ -1327,6 +1328,10 @@ fullyconnected_test_SOURCES = unittest/fullyconnected_test.cc
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
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index 61cb1f7cad..60b50f16a5 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88049.patch \
            file://CVE-2026-88050.patch \
            file://CVE-2026-88047.patch \
+           file://CVE-2026-88051.patch \
 "
 
 

