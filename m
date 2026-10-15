Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43A4CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32868.1792043129117669116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e77U/bUt;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e82462a3f1so9770535ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043128; x=1792647928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Xu+zkfTcubefsRDXfR68Hr9MeQvRbPWzNonwptWFoY=;
        b=e77U/bUtqSm+CbnUIJORa2xNFeoDxuU4dmxwZ6CeDUfCBYWqLyvv0T9twspIXWhdMW
         jT56z0axDoCvh3Hce5dfrUlG7aC7P2i8vIpaeF1R4VQKLKbni+VCnzcvAsKtaFuThxop
         XoLFjPmiSAC0NCVyo84yOZUgROT07iAR147FrK4yzyco5MaBbgieq6OROAgeh54BqO+d
         9E5pTRH0/VNYmU2DI0onF8XfAHT6cop+VilDXHJu5n3JnW5TZmPZwGY0XowV5OrMsPdR
         rAJSNAU+/qcpJfTStPAoQhHgWLdDk0Yqe10/ussrCkXcnG+xpQgn2y/M/R4YP4aGMWQc
         tfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043128; x=1792647928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Xu+zkfTcubefsRDXfR68Hr9MeQvRbPWzNonwptWFoY=;
        b=dmVlARIV3efNUM/9jdScXTHLd5y4cvoaNPgO3aDOd+uIdm5JNQSF0gwUP793g28tvA
         DLPpMgFG8L4ogH/d5PVy3ZR/fQXTVlpaEvXlUUjEVE9vNSXOMrhWjR74ORkIP7qCmEY8
         4fg+1c9NEcCq74g9YjV8rqkixRWUzUYAnW6eO8Oyo7u4J5gFeEFp76sN4aaPDu2WG21C
         kw8qHqHSNrAIdffQxjnf6D1EiCpKLTTGcEqYIiKf02+0L3Pdpx2J0DT64QVXuWf+0Tl/
         I8sfOOEcnIZOa85LVm5kn/FfrK2VMNQyLwHwer26Bd1n0FJifSarU+hCpaSauxl9+cxV
         ElCg==
X-Gm-Message-State: AFq9FYIOss58Afgkb6wI7hdhnY4HOYtBO/o5ijalb7P3tIrqX74SvC6I
	jMNPurvPM5gC4KECPxNmBMcZ//OJyB5j5Df1/JtEo0+pyIjSgwr4/RKFw+/ndA==
X-Gm-Gg: AYBFou2dvqXasG8vlZ/t9F5GsRd/NMMNZzMGNFpV5Hg0+fc90lhqg1RWfFTuAdaZ5fu
	9N//Ff5/q4JeXfVh5z1skE2ZjEuQxc2C0b5MkxlVg5woz8uVmJDxIeCgh5s8tX1fqb8PYabhoWI
	MfS9uHqukS84VwWLKyYLzyaYWbI+Kya9xCJP6BY7myFuuJEMxI1xAGimlFZLselY/+UWl7df1ar
	WwfNbr9uSCQAx6alp546RNIkVoMfQvJ35qX7IOfV59hcWUve4vbwtO9J/Y7LPmEtGDuupjmZs4S
	MdGzCAhpcaWFgU5wSpVE4e5P+biIuGt3gkFs6wts8Di2TSK/H/i447l7sMc9SRCvi2wNDoju3xx
	kYWaHqpvfwZLveQlZumS5a4hrr6NrDn6dSXp+WtRSYFODucn71kTBTjMTv/5Y8kR06ICyDYFZyw
	AqvLNldc2thwmisIKY/3OI+ho9CJcK2f2DTWOTgeQ7HhdG7+7gOnL4Uuvlo2ikPeaAZBQjoMiWJ
	PsBLQ0/2LhZ1sgya4p8Fxg=
X-Received: by 2002:a17:903:ac8:b0:2e9:528c:ba02 with SMTP id d9443c01a7336-2e9528cbc9bmr21289655ad.60.1792043128313;
        Wed, 14 Oct 2026 22:45:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 74/82] tesseract: patch CVE-2026-88048
Date: Thu, 15 Oct 2026 18:42:02 +1300
Message-ID: <221a1e49f420405d5a956207d15dfa91f034c311.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130994

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88048

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 9e544d6e5087f701a0d6a9d66ae3f87b6dcc8c5e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88048.patch  | 227 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   1 +
 2 files changed, 228 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
new file mode 100644
index 0000000000..abfd502667
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
@@ -0,0 +1,227 @@
+From b2fbc8282c34f0a5a426622a9eb6a79ad0df0fe4 Mon Sep 17 00:00:00 2001
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
+index 22c2c7a0..284f8b53 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1158,6 +1158,7 @@ if !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += equationdetect_test
+ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += fileio_test
++check_PROGRAMS += fullyconnected_test
+ check_PROGRAMS += heap_test
+ check_PROGRAMS += imagedata_test
+ if !DISABLED_LEGACY_ENGINE
+@@ -1290,6 +1291,10 @@ fileio_test_SOURCES = unittest/fileio_test.cc
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
+index a0ee1b02..d999f575 100644
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
+index eaca3ffb..6c5ab236 100644
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
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index 81359b761b..bed16f9806 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "db0ec62f81b0737fbbe184d8fea40af5738f8eef"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV} \
            file://CVE-2026-88052.patch \
+           file://CVE-2026-88048.patch \
 "
 
 DEPENDS = "leptonica"

