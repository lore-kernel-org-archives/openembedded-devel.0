Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A47CC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3441.1791885621487294053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HZQM2RSB;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso1144692a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885621; x=1792490421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jtEXI6DzBOUNNFoHZSKvXiTIYRqf/dnrlUdsu1s60M=;
        b=HZQM2RSBlqk12bxmZF+YNy1ry+mHPqk4F00PmjJq+0w3GQ64zOdJ4GAdTn5qARWuB+
         nI+lGa/jXg30VMoFgXtDwyle4+OBVPWm2GKLaQSYRAu3Y8P11hJl5jk9eAJKG7aFfEKg
         u9VSl0UWA8kk0NbOyl5KNzM2Nx55dEeJo8LYb4NwN4lha2QN0vJdyokaGiZMj8+keOzG
         md7+oBKL1Be3cK4amiOvQ62VZldV7jaMYAUYiRX/NJZS4s5G6Jw3fokzUcLyyFjuPxG4
         vjU76StuENlMDWUqi8zowS9AVdD6W9HKITb/g5KzVrAeE9jhvCdf02E+nOHpri5QNZ22
         G9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885621; x=1792490421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jtEXI6DzBOUNNFoHZSKvXiTIYRqf/dnrlUdsu1s60M=;
        b=tev+EZQci/TrZ4/EenTpvrdU/d0j4AeFVaAZ3Gcy4ybzCkT+SSLwE2zKleBktVa3+K
         OWgQq/ROrqScguxgGeovzIP61oncpK0XZ6oV0E131OOmeHwJkC3Lkog8o2bsHx2cg5Zx
         fkyU3AdHXJgcCxGnt1pg7pYRcYsEpFGug0ticWHr311vrh1yXW59foU0OfVbrRpaf5JN
         KOkNNwgZZA5cvTNjGOw4RXuICRyTTnjJPr2yJ9t37WovTXXfhsFLlXIx+KBhtQlGhZkv
         lrCscouG1Xriu8QJKJaB5wLMgW4XfjHvjMi7jg+WvbAzE4DFCQyHXzVQMFuIv6uvzeHu
         TQgA==
X-Gm-Message-State: AFq9FYJkwrR38lrw0S30xZARbqvGnDEq9uyB+l2n5M4dJrfrsC1DXLb1
	MGICE/9X7/0Y9yKBb7L/jbaI4deUtMhSegXxOWZjUORzK51SiL5Zs+xorMeGJw==
X-Gm-Gg: AYBFou1CUq7iNf88x0cY8lq8Rbzo0+9S0g0xVr+uEjaVdcsNRFH0mAFJUugIzY0m5Oj
	1JUuf2iKfhTinz3oRJlzLmXFMUXA8kTuBtyFOIGdJCn83ofcGDEP96cEYuCZvnxB6LL6nHn+oSC
	69p9nQGZXUlz1kO/VepWwLkYB/VZn7P0Dy8/ViKYzjObC25Lzx59ZRexMo/cm9/8jUIXfGdWten
	m9uMQrIT0mYHs3u5NMiUFu8xIVozsGOJn/12dqSSI1CZn7K3/N43dBg/mR7KWAvuJRd6Nlm2P4k
	6KQWDCEhgdqvxVUEOCqBLCGN0l7RhKkWBdH7bQb2ZtSb6zlUL0nlaSLkxyn0wxs6YmkmfoF9+Q0
	p653YKXc9yqZ1rJoCvjIkJJ1+J9q5MACq4KgBqRj3N6va6Lsuia/MkxclBAdCOZtXPWMG59sO8Y
	FPUF53PM33a7Yhq3fBTKhPTq6yXBEogaE2bWuQZlScdgEzAyBwUBIg0gvDACIyV9frb0YPggOOw
	RdaMDKekEuY8opufBxhppQyNrVtuUp+Osu8YLd6AMC+NMbcGg==
X-Received: by 2002:a17:90b:2b50:b0:3a8:609c:7a6 with SMTP id 98e67ed59e1d1-3ab3a8e9100mr9386830a91.44.1791885620048;
        Tue, 13 Oct 2026 03:00:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 23/28] tesseract: patch CVE-2026-88049
Date: Tue, 13 Oct 2026 22:58:58 +1300
Message-ID: <20261013095903.3544906-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130856

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88049

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 218b6a19b168587a67d1eab85160c302013164db)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88049.patch  | 315 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   1 +
 2 files changed, 316 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch
new file mode 100644
index 0000000000..b6a5e5275d
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch
@@ -0,0 +1,315 @@
+From 62fabbca097d127e7d5a8fe3869102d2e4918b80 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 21 Aug 2026 16:41:51 +0200
+Subject: [PATCH] Validate LSTM gate matrix dimensions against na_/no_ at load
+
+LSTM::DeSerialize read na_ from the untrusted TESSDATA_LSTM component
+and derived ns_ from the CI gate matrix's dim1, but never checked that
+the deserialized dimensions were mutually consistent. The forward pass
+sizes its buffers from na_, no_ and ns_ while the gate matrices drive
+their own dimensions, so a crafted .traineddata performed heap
+out-of-bounds writes and reads during the first recognition step, e.g.
+WriteTimeStepPart writing ns_ floats at offset ni_+nf_ into a source_
+buffer sized from na_ (up to ~256 KB with an attacker-chosen gate
+matrix dim1).
+
+The bounds assertions added by 2f4d2f4 (CVE-2026-73066) covered only
+NetworkIO::CopyTimeStepGeneral and Randomize, leaving
+WriteTimeStepPart and AddTimeStepPart unguarded.
+
+Key changes:
+- weightmatrix.h: add Dim1()/Dim2() accessors for the active weight
+  matrix (int or float), alongside the existing NumOutputs().
+- lstm.cpp: reject the layer in DeSerialize unless na_ ==
+  ni_ + nf_ + (is_2d_ ? 2 : 1) * ns_, every deserialized gate has
+  Dim1() == ns_ and Dim2() == na_ + 1 (the layout InitWeightsFloat
+  always produces), ns_ == no_ for plain NT_LSTM/NT_LSTM_SUMMARY, and
+  the softmax layer's sizes match ns_/no_ for the softmax variants.
+- networkio.cpp: add the same defense-in-depth bounds assertions to
+  WriteTimeStepPart and AddTimeStepPart as 2f4d2f4 added to
+  CopyTimeStepGeneral and Randomize.
+- unittest: add lstm_layer_test with crafted NT_LSTM layers for the
+  na_ mismatch, gate dim1 mismatch, and gate dim2 mismatch cases
+  (each rejected at load; on unpatched code the tests reach Forward
+  and ASan catches the out-of-bounds write in WriteTimeStepPart),
+  plus a positive control that a consistent layer loads and runs.
+
+Reported-by: Zhixi "Jace" Sun <g.mygenie@gmail.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit b494ac18925f9d9aff9ef5815475de9943ab19bf)
+
+CVE: CVE-2026-88049
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/b494ac18925f9d9aff9ef5815475de9943ab19bf]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                 |   5 +
+ src/lstm/lstm.cpp           |  20 ++++
+ src/lstm/networkio.cpp      |   2 +
+ unittest/lstm_layer_test.cc | 177 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 204 insertions(+)
+ create mode 100644 unittest/lstm_layer_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index 284f8b53..4bcc858b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1171,6 +1171,7 @@ check_PROGRAMS += layout_test
+ check_PROGRAMS += ligature_table_test
+ check_PROGRAMS += linlsq_test
+ check_PROGRAMS += list_test
++check_PROGRAMS += lstm_layer_test
+ if ENABLE_TRAINING
+ check_PROGRAMS += lstm_recode_test
+ check_PROGRAMS += lstm_squashed_test
+@@ -1352,6 +1353,10 @@ loadlang_test_SOURCES = unittest/loadlang_test.cc
+ loadlang_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ loadlang_test_LDADD = $(TESS_LIBS) $(LEPTONICA_LIBS)
+ 
++lstm_layer_test_SOURCES = unittest/lstm_layer_test.cc
++lstm_layer_test_CPPFLAGS = $(unittest_CPPFLAGS)
++lstm_layer_test_LDADD = $(TESS_LIBS)
++
+ lstm_recode_test_SOURCES = unittest/lstm_recode_test.cc
+ lstm_recode_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ lstm_recode_test_LDADD = $(TRAINING_LIBS)
+diff --git a/src/lstm/lstm.cpp b/src/lstm/lstm.cpp
+index 7bfd19b5..bfffa5de 100644
+--- a/src/lstm/lstm.cpp
++++ b/src/lstm/lstm.cpp
+@@ -274,12 +274,32 @@ bool LSTM::DeSerialize(TFile *fp) {
+       is_2d_ = na_ - nf_ == ni_ + 2 * ns_;
+     }
+   }
++  // The deserialized dimensions must be mutually consistent: the forward
++  // pass sizes its buffers from na_, no_ and ns_ while the gate matrices
++  // drive their own dimensions.
++  if (na_ != ni_ + nf_ + (is_2d_ ? 2 : 1) * ns_) {
++    return false;
++  }
++  for (int w = 0; w < WT_COUNT; ++w) {
++    if (w == GFS && !Is2D()) {
++      continue;
++    }
++    if (gate_weights_[w].Dim1() != ns_ || gate_weights_[w].Dim2() != na_ + 1) {
++      return false;
++    }
++  }
++  if ((type_ == NT_LSTM || type_ == NT_LSTM_SUMMARY) && ns_ != no_) {
++    return false;
++  }
+   delete softmax_;
+   if (type_ == NT_LSTM_SOFTMAX || type_ == NT_LSTM_SOFTMAX_ENCODED) {
+     softmax_ = static_cast<FullyConnected *>(Network::CreateFromFile(fp));
+     if (softmax_ == nullptr) {
+       return false;
+     }
++    if (softmax_->NumInputs() != ns_ || softmax_->NumOutputs() != no_) {
++      return false;
++    }
+   } else {
+     softmax_ = nullptr;
+   }
+diff --git a/src/lstm/networkio.cpp b/src/lstm/networkio.cpp
+index 8e1c6679..7a31034b 100644
+--- a/src/lstm/networkio.cpp
++++ b/src/lstm/networkio.cpp
+@@ -641,6 +641,7 @@ void NetworkIO::AddTimeStep(int t, TFloat *inout) const {
+ 
+ // Adds part of a single timestep to floats.
+ void NetworkIO::AddTimeStepPart(int t, int offset, int num_features, float *inout) const {
++  ASSERT_HOST(offset + num_features <= NumFeatures());
+   if (int_mode_) {
+     const int8_t *line = i_[t] + offset;
+     for (int i = 0; i < num_features; ++i) {
+@@ -662,6 +663,7 @@ void NetworkIO::WriteTimeStep(int t, const TFloat *input) {
+ // Writes a single timestep from floats in the range [-1, 1] writing only
+ // num_features elements of input to (*this)[t], starting at offset.
+ void NetworkIO::WriteTimeStepPart(int t, int offset, int num_features, const TFloat *input) {
++  ASSERT_HOST(offset + num_features <= NumFeatures());
+   if (int_mode_) {
+     int8_t *line = i_[t] + offset;
+     for (int i = 0; i < num_features; ++i) {
+diff --git a/unittest/lstm_layer_test.cc b/unittest/lstm_layer_test.cc
+new file mode 100644
+index 00000000..2c874995
+--- /dev/null
++++ b/unittest/lstm_layer_test.cc
+@@ -0,0 +1,177 @@
++///////////////////////////////////////////////////////////////////////
++// File:        lstm_layer_test.cc
++// Description: Tests that an NT_LSTM network layer with mutually
++//              inconsistent deserialized dimensions is rejected at
++//              load. The forward pass sizes its buffers from na_, no_
++//              and ns_ while the gate weight matrices drive their own
++//              dimensions, so a crafted .traineddata performs heap
++//              out-of-bounds writes/reads during the first
++//              recognition step (e.g. WriteTimeStepPart writing ns_
++//              floats into a source_ buffer sized from na_).
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
++#include "stridemap.h"
++
++#include <cstdint>
++#include <utility>
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
++// A serialized float-mode WeightMatrix with the given dimensions,
++// all weight data zeroed.
++void PutGateMatrix(ByteWriter *w, int32_t dim1, int32_t dim2) {
++  w->PutU8(128); // mode: kDoubleFlag, float mode
++  w->PutS32(dim1);
++  w->PutS32(dim2);
++  PutDoubleLE(w, 0.0); // empty_ cell
++  for (int32_t i = 0; i < dim1 * dim2; ++i) {
++    PutDoubleLE(w, 0.0);
++  }
++}
++
++// A serialized 1-D NT_LSTM network: header with the given ni/no, na_,
++// then the four gates CI, GI, GF1, GO (GFS is not serialized for 1-D).
++std::vector<char> MakeLstmNetwork(int ni, int no, int32_t na,
++                                  const int32_t gate_dim1[4], const int32_t gate_dim2[4]) {
++  ByteWriter w;
++  w.PutU8(static_cast<uint32_t>(NT_LSTM));
++  w.PutU8(0); // training: TS_DISABLED
++  w.PutU8(0); // needs_to_backprop
++  w.PutU32(0); // network_flags
++  w.PutU32(static_cast<uint32_t>(ni));
++  w.PutU32(static_cast<uint32_t>(no));
++  w.PutU32(0); // num_weights
++  w.PutU32(0); // name (empty string)
++  w.PutS32(na);
++  for (int g = 0; g < 4; ++g) {
++    PutGateMatrix(&w, gate_dim1[g], gate_dim2[g]);
++  }
++  return w.data();
++}
++
++// Builds the input a standalone LSTM layer would receive: one row of
++// the given width with ni features.
++NetworkIO MakeInput(int ni, int width) {
++  StrideMap stride_map;
++  stride_map.SetStride({{1, width}});
++  NetworkIO input;
++  input.ResizeToMap(false, stride_map, ni);
++  return input;
++}
++
++// Runs Forward on the loaded network; on unpatched code the out-of-
++// bounds access this regression test guards against fires here.
++void RunForward(Network *net, int ni, int width) {
++  NetworkIO input = MakeInput(ni, width);
++  NetworkScratch scratch;
++  NetworkIO output;
++  net->Forward(false, input, nullptr, &scratch, &output);
++  delete net;
++}
++
++// na_ must equal ni_ + nf_ + ns_ for a 1-D LSTM; here na_=2 but the
++// CI matrix makes ns_=64, so the layer must be rejected. On unpatched
++// code Forward writes 64 floats at offset ni_=1 into a source_ buffer
++// sized for na_=2 (heap out-of-bounds write).
++TEST(LstmLayerTest, RejectsInconsistentNa) {
++  const int32_t dim1[4] = {64, 64, 64, 64};
++  const int32_t dim2[4] = {3, 3, 3, 3};
++  std::vector<char> bytes = MakeLstmNetwork(1, 1, 2, dim1, dim2);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  Network *net = Network::CreateFromFile(&fp);
++  if (net == nullptr) {
++    return; // Fixed: the inconsistent layer is rejected at load.
++  }
++  RunForward(net, 1, 2);
++  FAIL() << "crafted LSTM layer with inconsistent na_ was accepted";
++}
++
++// All gate matrices must have dim1 == ns_; here the GI matrix has
++// dim1=9 while ns_=5. On unpatched code the GI gate dot product writes
++// 9 results into a temp line sized for 5 (heap out-of-bounds write).
++TEST(LstmLayerTest, RejectsGateDim1Mismatch) {
++  const int32_t dim1[4] = {5, 9, 5, 5};
++  const int32_t dim2[4] = {7, 7, 7, 7};
++  std::vector<char> bytes = MakeLstmNetwork(1, 5, 6, dim1, dim2);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  Network *net = Network::CreateFromFile(&fp);
++  if (net == nullptr) {
++    return; // Fixed: the inconsistent layer is rejected at load.
++  }
++  RunForward(net, 1, 2);
++  FAIL() << "crafted LSTM layer with inconsistent gate dim1 was accepted";
++}
++
++// All gate matrices must have dim2 == na_ + 1; here the GI matrix has
++// dim2=9 while na_=6. On unpatched code the GI gate dot product reads
++// 8 inputs from a buffer sized for 6 (heap out-of-bounds read).
++TEST(LstmLayerTest, RejectsGateDim2Mismatch) {
++  const int32_t dim1[4] = {5, 5, 5, 5};
++  const int32_t dim2[4] = {7, 9, 7, 7};
++  std::vector<char> bytes = MakeLstmNetwork(1, 5, 6, dim1, dim2);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  Network *net = Network::CreateFromFile(&fp);
++  if (net == nullptr) {
++    return; // Fixed: the inconsistent layer is rejected at load.
++  }
++  RunForward(net, 1, 2);
++  FAIL() << "crafted LSTM layer with inconsistent gate dim2 was accepted";
++}
++
++// A fully consistent 1-D LSTM layer must still be accepted and usable.
++TEST(LstmLayerTest, AcceptsConsistentLayer) {
++  const int32_t dim1[4] = {5, 5, 5, 5};
++  const int32_t dim2[4] = {7, 7, 7, 7};
++  std::vector<char> bytes = MakeLstmNetwork(1, 5, 6, dim1, dim2);
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  Network *net = Network::CreateFromFile(&fp);
++  ASSERT_NE(net, nullptr);
++  RunForward(net, 1, 2);
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index bed16f9806..24c8312552 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -9,6 +9,7 @@ SRCREV = "db0ec62f81b0737fbbe184d8fea40af5738f8eef"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV} \
            file://CVE-2026-88052.patch \
            file://CVE-2026-88048.patch \
+           file://CVE-2026-88049.patch \
 "
 
 DEPENDS = "leptonica"

