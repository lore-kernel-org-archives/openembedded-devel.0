Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA065C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:04 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.735.1790224438342697561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DTrXdF37;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a34907so1363792b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224438; x=1790829238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKOjw8j9leOqH4d9txEHvtH56wQu9n/u4sC/XxHsZHM=;
        b=DTrXdF37t4iua3qxkEsuhO0P0xlN/WnsRlUVe0efoHqPgTJsrRLeMLG8lBm9pAesnM
         JswrycRpDoWhHGMnhdpxWiHHr7szL4/0T08vsEaoEE6G4zI0bNO1oF6KRcaPxIbz5yPT
         5Di14ZzC9Fx6jMMbVri0Wl/kIPhZKKD4o/jKYQTRfvwpO3NyQuFrIyQtDc3uNRDnhDYA
         wg9ROM1oIPBGMiy07Mt6XF6/b1prP+2B1O187RYtu/Ms7g7wXIQzT2xYq8oxNkuVE24m
         jLXKkzwqniQGCI0c8iMTC+74jBptTomp+HZRjVREtScn6YZlpfPt/RwmF4EqkQVhchqt
         HaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224438; x=1790829238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKOjw8j9leOqH4d9txEHvtH56wQu9n/u4sC/XxHsZHM=;
        b=ejRPX8H3Lm542H78asROvPkK6IbwvVsfeaCYhMKIw/ZWppyk5otyZu6AOc5FyYnh9O
         OYl8Fn6ygHy14CacQYU5tLd7vJ8M1tklj6jpe+vwVcrKZupaGQi4g6n91yOMELqX7vvx
         5XRQOrjLijKXdO32FEsVWBjcRi/uq3C/svRwI8UOgs6P3pfv3/MMEd3Cx3WWoWjO8POz
         TW3+CRMRxwz/UrP/zp0egi3k7rBVotAOknCuMWEUQp/WAvTySMNodZkGxrdI/gv7ICev
         uVjpJ0sI2jJBqOu7+m12P3lFm61taCDqFnO/iaWrXuVU6lNQM2O/GlMHMDr9M0X1y94g
         IjMg==
X-Gm-Message-State: AFuF++kAsZ3aY+NnHw03kh73EbRBN9GrEC5Kw6Pjgxk0hrpgFDZQsFWd
	zVv3mJzOPQx18ca7o4z8R+cpcWmxYLP5Vrir3ewPM568+2z6mGoTIHlKseQhkg==
X-Gm-Gg: AYBFou04xtO2w3GGPUMKcWRRCxqfeZ/DMgSJeyXcpfPEYXijhBy0cg9UFDe5myAkPtm
	CQoFMxUjk3CgK8EOsPLr0Idb/G6VExvWe28uA6jVHub6neN/B+8bS4x/XoiM/ouvLcSiGTXfmld
	mTi43lCjrZvXMpZtxY0FQOfqDQERPXIwA6mYN1tcz9lIPmw0GoeAwUMrz3nU0DXQB1qW460RurA
	dGrW3gO59SF04s54R8jhhWIKp29KflPe14FfxoWFdHCTdiM5bAETNzhsg4GJqIuI5yX9I3QQGCU
	F/djvRDRTpAGTD04Ia3YZ4HsKXm/GKLJYslmnhPWBGdtRj3WHOjydsHI7exaRjZXw/8YBW3hF22
	QcqcnaThwBVwNidOJKj8oGIILP3Z0OX/9Byxv30CLnswDQpUepmOJqYaf0EEqENarbVCjk0dr+j
	yDkJRJz0rVrpidZlOVp/OubO6uo5YSaWzERJlaCucAhUzz9nCreFQxYMMtpi1x/Hu6Eb092zEwe
	SGQegH905uSWdFUkyd4J/FPYKUPVOuUMw==
X-Received: by 2002:a05:6a20:4e92:b0:3da:755f:a031 with SMTP id adf61e73a8af0-3de0e7f76e6mr1327395637.12.1790224437602;
        Wed, 23 Sep 2026 21:33:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 17/24] tesseract: patch CVE-2026-88048
Date: Thu, 24 Sep 2026 16:33:07 +1200
Message-ID: <20260924043315.1663186-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130265

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88048

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88048.patch  | 228 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
new file mode 100644
index 0000000000..bc1beb5753
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
@@ -0,0 +1,228 @@
+From 4dd118c5b87df1a4422ebb3ab3efaa3588b88cfa Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 21 Aug 2026 15:23:59 +0200
+Subject: [PATCH] Validate FullyConnected weight matrix dimensions at load
+
+FullyConnected::DeSerialize read the WeightMatrix without checking
+that its dimensions match the layer's declared ni/no. MatrixDotVector
+drives the dot product from the matrix dimensions (writes w.dim1()
+results, reads w.dim2()-1 inputs) while the scratch buffers are sized
+from no_ and ni_, so a crafted .traineddata with a mismatched matrix
+performed a heap out-of-bounds write (up to 65535 rows) and out-of-
+bounds read on the first recognition step (crash, or heap corruption
+with attacker-influenced size and content).
+
+Key changes:
+- weightmatrix.h: add Dim1()/Dim2() accessors for the active weight
+  matrix (int or float), alongside the existing NumOutputs().
+- fullyconnected.cpp: reject the layer in DeSerialize unless
+  Dim1() == no_ and Dim2() == ni_ + 1 (the second dimension
+  includes the bias column), the layout that InitWeightsFloat
+  always produces.
+- unittest: new fullyconnected_test that builds a Softmax network
+  with mismatched matrix dimensions and expects CreateFromFile to
+  return nullptr; on unpatched code the test reaches Forward and
+  ASan catches the out-of-bounds write in MatrixDotVector. A
+  second test verifies that matching dimensions are still accepted.
+
+Reported-by: Zhixi "Jace" Sun <g.mygenie@gmail.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit 103dc134eb36411ddc6833ec20aa2c76795bd0ff)
+
+CVE: CVE-2026-88048
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/103dc134eb36411ddc6833ec20aa2c76795bd0ff]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                     |   5 ++
+ src/lstm/fullyconnected.cpp     |  11 ++-
+ src/lstm/weightmatrix.h         |   7 ++
+ unittest/fullyconnected_test.cc | 115 ++++++++++++++++++++++++++++++++
+ 4 files changed, 137 insertions(+), 1 deletion(-)
+ create mode 100644 unittest/fullyconnected_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index 1a0a6771..ea722409 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1187,6 +1187,7 @@ if !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += equationdetect_test
+ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += fileio_test
++check_PROGRAMS += fullyconnected_test
+ check_PROGRAMS += heap_test
+ check_PROGRAMS += imagedata_test
+ if !DISABLED_LEGACY_ENGINE
+@@ -1319,6 +1320,10 @@ fileio_test_SOURCES = unittest/fileio_test.cc
+ fileio_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ fileio_test_LDADD = $(TRAINING_LIBS)
+ 
++fullyconnected_test_SOURCES = unittest/fullyconnected_test.cc
++fullyconnected_test_CPPFLAGS = $(unittest_CPPFLAGS)
++fullyconnected_test_LDADD = $(TESS_LIBS)
++
+ heap_test_SOURCES = unittest/heap_test.cc
+ heap_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ heap_test_LDADD = $(TESS_LIBS)
+diff --git a/src/lstm/fullyconnected.cpp b/src/lstm/fullyconnected.cpp
+index 85989f40..380707a1 100644
+--- a/src/lstm/fullyconnected.cpp
++++ b/src/lstm/fullyconnected.cpp
+@@ -121,7 +121,16 @@ bool FullyConnected::Serialize(TFile *fp) const {
+ 
+ // Reads from the given file. Returns false in case of error.
+ bool FullyConnected::DeSerialize(TFile *fp) {
+-  return weights_.DeSerialize(IsTraining(), fp);
++  if (!weights_.DeSerialize(IsTraining(), fp)) {
++    return false;
++  }
++  // The weight matrix must match the declared sizes (the second dimension
++  // includes the bias column); otherwise Forward would read or write
++  // outside the scratch buffers sized from ni_ and no_.
++  if (weights_.Dim1() != no_ || weights_.Dim2() != ni_ + 1) {
++    return false;
++  }
++  return true;
+ }
+ 
+ // Runs forward propagation of activations on the input line.
+diff --git a/src/lstm/weightmatrix.h b/src/lstm/weightmatrix.h
+index a2cdaa52..66b69dfa 100644
+--- a/src/lstm/weightmatrix.h
++++ b/src/lstm/weightmatrix.h
+@@ -107,6 +107,13 @@ public:
+   int NumOutputs() const {
+     return int_mode_ ? wi_.dim1() : wf_.dim1();
+   }
++  // The dimensions of the active weight matrix (wi_ in int mode, else wf_).
++  int Dim1() const {
++    return int_mode_ ? wi_.dim1() : wf_.dim1();
++  }
++  int Dim2() const {
++    return int_mode_ ? wi_.dim2() : wf_.dim2();
++  }
+   // Provides one set of weights. Only used by peep weight maxpool.
+   const TFloat *GetWeights(int index) const {
+     return wf_[index];
+diff --git a/unittest/fullyconnected_test.cc b/unittest/fullyconnected_test.cc
+new file mode 100644
+index 00000000..f9697de4
+--- /dev/null
++++ b/unittest/fullyconnected_test.cc
+@@ -0,0 +1,115 @@
++///////////////////////////////////////////////////////////////////////
++// File:        fullyconnected_test.cc
++// Description: Tests that a FullyConnected (softmax) network layer with
++//              weight-matrix dimensions that do not match the declared
++//              ni/no is rejected at load. Without the check,
++//              MatrixDotVector writes w.dim1() results into a scratch
++//              buffer sized from no_ and reads w.dim2()-1 inputs from
++//              a buffer sized from ni_ (heap out-of-bounds write/read)
++//              on the first recognition step.
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
++#include "network.h" // for Network, NetworkType
++#include "networkio.h"
++#include "networkscratch.h"
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
++  void PutU8(uint32_t v) { data_.push_back(static_cast<char>(v & 0xFF)); }
++  void PutU32(uint32_t v) {
++    for (int i = 0; i < 4; ++i) {
++      data_.push_back(static_cast<char>((v >> (8 * i)) & 0xFF));
++    }
++  }
++  void PutS32(int32_t v) { PutU32(static_cast<uint32_t>(v)); }
++  const std::vector<char> &data() const { return data_; }
++
++private:
++  std::vector<char> data_;
++};
++
++void PutDoubleLE(ByteWriter *w, double d) {
++  union {
++    double d;
++    uint64_t u;
++  } conv;
++  conv.d = d;
++  w->PutU32(static_cast<uint32_t>(conv.u & 0xFFFFFFFF));
++  w->PutU32(static_cast<uint32_t>(conv.u >> 32));
++}
++
++// Builds a serialized NT_SOFTMAX network: header with the given ni/no,
++// then a float-mode WeightMatrix with the given (corrupt) dimensions.
++// The matrix is stored as doubles on disk (see WeightMatrix::DeSerialize).
++std::vector<char> MakeSoftmaxNetwork(int ni, int no, int32_t dim1, int32_t dim2) {
++  ByteWriter w;
++  w.PutU8(static_cast<uint32_t>(NT_SOFTMAX));
++  w.PutU8(0); // training: TS_DISABLED
++  w.PutU8(0); // needs_to_backprop
++  w.PutU32(0); // network_flags
++  w.PutU32(static_cast<uint32_t>(ni));
++  w.PutU32(static_cast<uint32_t>(no));
++  w.PutU32(0); // num_weights (not cross-checked, kept consistent anyway)
++  w.PutU32(0); // name (empty string)
++  // WeightMatrix::DeSerialize:
++  w.PutU8(128); // mode: kDoubleFlag, float mode
++  w.PutS32(dim1);
++  w.PutS32(dim2);
++  PutDoubleLE(&w, 0.0); // empty_ cell
++  for (int32_t i = 0; i < dim1 * dim2; ++i) {
++    PutDoubleLE(&w, 0.0); // weight data
++  }
++  return w.data();
++}
++
++// A FullyConnected layer whose weight matrix does not match the declared
++// sizes must be rejected by CreateFromFile; on unpatched code the test
++// reaches Forward, where MatrixDotVector performs the out-of-bounds
++// write this regression test guards against.
++TEST(FullyconnectedTest, RejectsWeightMatrixDimensionMismatch) {
++  // ni_=no_=1 but dim1=3 (OOB write of 3 results into a 1-result buffer)
++  // and dim2=5 (OOB read of 4 inputs from a 1-input buffer).
++  std::vector<char> bytes = MakeSoftmaxNetwork(1, 1, 3, 5);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  Network *net = Network::CreateFromFile(&fp);
++  if (net == nullptr) {
++    return; // Fixed: the mismatched layer is rejected at load.
++  }
++  NetworkIO input;
++  input.Resize2d(false, /*width=*/1, /*num_features=*/1);
++  NetworkScratch scratch;
++  NetworkIO output;
++  net->Forward(false, input, nullptr, &scratch, &output);
++  delete net;
++  FAIL() << "crafted FullyConnected layer with mismatched weight matrix was accepted";
++}
++
++// Consistent dimensions must still be accepted.
++TEST(FullyconnectedTest, AcceptsMatchingDimensions) {
++  std::vector<char> bytes = MakeSoftmaxNetwork(1, 2, 2, 2);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  Network *net = Network::CreateFromFile(&fp);
++  ASSERT_NE(net, nullptr);
++  delete net;
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index a80407b749..a8b3e55c7d 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-73067-1.patch \
            file://CVE-2026-73067-2.patch \
            file://CVE-2026-88052.patch \
+           file://CVE-2026-88048.patch \
 "
 
 

