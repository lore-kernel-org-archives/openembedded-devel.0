Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95697C98312
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:16 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.738.1790224448953964695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IuXiPSnx;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8674704dab1so1511662b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224448; x=1790829248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnYz9qctaaiIUurcmrX0BgkZG2UkcVgty4SKhwas4W0=;
        b=IuXiPSnxemDaHlB8IM9xLd4kOwT1NzlsuXdfcYJnWSpL83uaI8ReTt2p2f7SMstvNF
         4RLOG0xXWYphvwXPejcW1jMnaXjNgRZV2p0BsnkqcPaHGUPm0j2ZeVRrke8zhDuy/loJ
         RPqKwtiWdBPMFIJaHrxXWubaG6pX7qFKpOP38erYOx14HAphXpn1vAV9j8gvpXJTHxzg
         b6uYo6JWI2zTzWHWmA2O9JUv155y4dVrJ8Degk8+CkSFEKwJCQyAHbMra5Sy9CrXHXKi
         QwAyppf+jl4ximKwXvcyucx494ePNyKWXkA4ucvvQV9VkMOEqUhwAYTd+2qaxpxhTrRW
         e+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224448; x=1790829248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TnYz9qctaaiIUurcmrX0BgkZG2UkcVgty4SKhwas4W0=;
        b=2MIYYIHXqSWYP676uTBMYtxUOc5bI5mebmQ20jy//5/B3S0k3EaacyeZev9FXE7Tx2
         UqjT2G9BW4XYp2DW7PZzvt95KliaLiuE8t+Dw+Z/Ruye/T1CMeoyU52R6CahFS6dV3H9
         EfOvUBLQTNtkvDTzlyfb3UZ40Sl/FMlhdWdyiAadw7sxKq3Ter7qYzRGvaLiRaeb06DY
         TNJoQSlxm4oBYjg5sRXHIZgO5Jq25SQwqR+X5g/twQ99utA8i6bxBbrbJatiigLuoLdS
         BO6CB9c0zfd7CBAQqOJhrN5QGYTO1W5/34W1ArgyK5U5nryLo2bsp24joAjqul/C//7R
         zShw==
X-Gm-Message-State: AFuF++kL5G0rx79ctV1fslu8eMllWIxBqSxtoseWJmX1Lp24iqrUK+Xi
	vBDYZ2HPhJjqMjZgQr5Nbxz/0hSvulWB2fA0Yk40tMPkNW2wWJuau5Vq+AF56g==
X-Gm-Gg: AYBFou17DDV2DpUGyR/zVAP1Ul7MKmxYu5m52x/rP+wU06M5udSn3SHOdkwwAFcIs7h
	n3jrnTAXOrJzugIozjloRKk+cn89bjI+jmU6ImtAZu2EJumg5+mgvwvuj6Rf05DyaTgWMVHZXep
	mijpF84zKBpC9Xb7PywQG6IaTmwOglQQUvea44liOhUhx+PcQGHwNmQZZfE6ndhdjbfT6sVs8Yq
	pVTR5x9uZuFZfE+omHH2GhcCw8YsEF6qMlcfvX02b5nToweoCA89Ep9cvO9jbbUiIOMYrdKNbuJ
	3qOscpvru0ZkAwx+Lx8TWZZElXbZO0nEYLLpnD8FBBsQbA1MmP+56p6b8SIEhKByQ4FjT0LOLMP
	umx/a5F5jMTeZgBLO5sgxQvs330zbJ7NAGRyrNh9Jm7dyY4xh1rior1BR5ExsVEwhIfxmawUrx7
	nVBFsR8nB7yFbGCslwoeMqUYcww49FVtcXK+O+t9qR6T7bV8NdgM6LO3dQzvWxTVUj+et77AIDM
	I5/eFnECWySEE2gKq4C/30=
X-Received: by 2002:a05:6a00:1bca:b0:879:27a6:cc5b with SMTP id d2e1a72fcca58-87e9c543038mr1029245b3a.6.1790224448185;
        Wed, 23 Sep 2026 21:34:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:34:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 22/24] tesseract: patch CVE-2026-88054
Date: Thu, 24 Sep 2026 16:33:12 +1200
Message-ID: <20260924043315.1663186-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130270

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88054

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88054.patch  | 275 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   1 +
 2 files changed, 276 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
new file mode 100644
index 0000000000..e89df4c477
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
@@ -0,0 +1,275 @@
+From 3e9dc6d17fbbba936ca0c18a785cc481e6539555 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 21 Aug 2026 14:38:55 +0200
+Subject: [PATCH] Reject empty network stacks in LSTM .traineddata
+ deserialization
+
+Plumbing::DeSerialize read the network stack size from the untrusted
+TESSDATA_LSTM component and only rejected size > 10000. A crafted
+.traineddata with a top-level Series/Parallel/Reversed layer with an
+empty stack survived load; LSTMRecognizer initialization then called
+network_->CacheXScaleFactor(network_->XScaleFactor()), which
+dereferences stack_[0] on the empty vector:
+- Series: Series::CacheXScaleFactor (series.cpp)
+- Parallel/Reversed: inherited Plumbing::XScaleFactor
+The virtual call through the wild pointer crashed the process at
+initialization (deterministic denial of service).
+
+Key changes:
+- plumbing.cpp: reject size == 0 for all plumbing types, and
+  size < 2 for NT_SERIES (Series::Forward requires two or more
+  networks and always aborts on one).
+- tessedit.cpp: fail the language load gracefully when the LSTM model
+  cannot be loaded, instead of aborting via ASSERT_HOST, so
+  TessBaseAPI::Init returns -1 on corrupt traineddata.
+- unittest: add plumbing_test, which builds a minimal traineddata
+  with empty/undersized LSTM plumbing stacks and expects a graceful
+  init failure. On unpatched code the tests die on the original
+  SEGV in Series::CacheXScaleFactor / Plumbing::XScaleFactor.
+
+Reported-by: Zhixi "Jace" Sun <g.mygenie@gmail.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit 552771236b0d80cbdb0c7dd856120fa21a4672e5)
+
+CVE: CVE-2026-88054
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/552771236b0d80cbdb0c7dd856120fa21a4672e5]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am               |   5 ++
+ src/ccmain/tessedit.cpp   |   7 +-
+ src/lstm/plumbing.cpp     |   6 ++
+ unittest/plumbing_test.cc | 165 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 182 insertions(+), 1 deletion(-)
+ create mode 100644 unittest/plumbing_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index d2b503d4..76978570 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1227,6 +1227,7 @@ if ENABLE_TRAINING
+ check_PROGRAMS += pango_font_info_test
+ endif # ENABLE_TRAINING
+ check_PROGRAMS += paragraphs_test
++check_PROGRAMS += plumbing_test
+ if !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += params_model_test
+ endif # !DISABLED_LEGACY_ENGINE
+@@ -1456,6 +1457,10 @@ paragraphs_test_SOURCES = unittest/paragraphs_test.cc
+ paragraphs_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ paragraphs_test_LDADD = $(TESS_LIBS)
+ 
++plumbing_test_SOURCES = unittest/plumbing_test.cc
++plumbing_test_CPPFLAGS = $(unittest_CPPFLAGS)
++plumbing_test_LDADD = $(TESS_LIBS)
++
+ if !DISABLED_LEGACY_ENGINE
+ params_model_test_SOURCES = unittest/params_model_test.cc
+ params_model_test_CPPFLAGS = $(unittest_CPPFLAGS)
+diff --git a/src/ccmain/tessedit.cpp b/src/ccmain/tessedit.cpp
+index c7518883..fcbf5d9b 100644
+--- a/src/ccmain/tessedit.cpp
++++ b/src/ccmain/tessedit.cpp
+@@ -170,7 +170,12 @@ bool Tesseract::init_tesseract_lang_data(const std::string &arg0,
+ #endif // ndef DISABLED_LEGACY_ENGINE
+     if (mgr->IsComponentAvailable(TESSDATA_LSTM)) {
+       lstm_recognizer_ = new LSTMRecognizer(language_data_path_prefix.c_str());
+-      ASSERT_HOST(lstm_recognizer_->Load(this->params(), lstm_use_matrix ? language : "", mgr));
++      if (!lstm_recognizer_->Load(this->params(), lstm_use_matrix ? language : "", mgr)) {
++        delete lstm_recognizer_;
++        lstm_recognizer_ = nullptr;
++        tprintf("Error: Failed to load the LSTM model from %s\n", tessdata_path.c_str());
++        return false;
++      }
+     } else {
+       tprintf("Error: LSTM requested, but not present!! Loading tesseract.\n");
+       tessedit_ocr_engine_mode.set_value(OEM_TESSERACT_ONLY);
+diff --git a/src/lstm/plumbing.cpp b/src/lstm/plumbing.cpp
+index f0133148..15cf3d62 100644
+--- a/src/lstm/plumbing.cpp
++++ b/src/lstm/plumbing.cpp
+@@ -226,6 +226,12 @@ bool Plumbing::DeSerialize(TFile *fp) {
+   if (size > 10000) {
+     return false;
+   }
++  // Reject empty stacks: XScaleFactor, CacheXScaleFactor and other methods
++  // unconditionally dereference stack_[0] during network initialization.
++  // A Series needs at least two networks (see Series::Forward).
++  if (size == 0 || (type() == NT_SERIES && size == 1)) {
++    return false;
++  }
+   for (uint32_t i = 0; i < size; ++i) {
+     Network *network = CreateFromFile(fp);
+     if (network == nullptr) {
+diff --git a/unittest/plumbing_test.cc b/unittest/plumbing_test.cc
+new file mode 100644
+index 00000000..27486f86
+--- /dev/null
++++ b/unittest/plumbing_test.cc
+@@ -0,0 +1,165 @@
++///////////////////////////////////////////////////////////////////////
++// File:        plumbing_test.cc
++// Description: Tests that a corrupt TESSDATA_LSTM component in a
++//              .traineddata file is rejected without crashing. A
++//              plumbing layer (Series/Parallel/Reversed) with an
++//              empty or undersized network stack would make
++//              XScaleFactor/CacheXScaleFactor dereference stack_[0]
++//              during engine initialization.
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
++#include <tesseract/baseapi.h>
++
++#include "network.h"        // for NetworkType
++#include "tessdatamanager.h" // for TessdataManager, TESSDATA_LSTM
++
++#include <cstdint>
++#include <cstdio>
++#include <cstdlib>
++#include <cstring>
++#include <string>
++#include <vector>
++
++namespace tesseract {
++namespace {
++
++// Minimal unicharset with the special codes (space, Joined, Broken) that
++// UNICHARSET::load_from_file expects, as embedded in the TESSDATA_LSTM
++// component by LSTMRecognizer::Serialize.
++const char kMinUnicharset[] =
++    "3\n"
++    "NULL 0 NULL 0\n"
++    "Joined 7 0,69,188,255,486,1218,0,30,486,1188 Latin 26 0 98 Joined\n"
++    "|Broken|0|1 f 0,69,186,255,892,2138,0,80,892,2058 Common 84 10 84 |Broken|0|1\n";
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
++  void PutString(const char *s) {
++    PutU32(static_cast<uint32_t>(std::strlen(s)));
++    data_.insert(data_.end(), s, s + std::strlen(s));
++  }
++  void PutRaw(const char *s) { data_.insert(data_.end(), s, s + std::strlen(s)); }
++  const std::vector<char> &data() const { return data_; }
++
++private:
++  std::vector<char> data_;
++};
++
++// Serialized network header as written by Network::Serialize:
++//   int8 type, int8 training, int8 needs_to_backprop, int32 network_flags,
++//   int32 ni, int32 no, int32 num_weights, string name.
++void AppendNetworkHeader(ByteWriter *w, NetworkType type) {
++  w->PutU8(static_cast<uint32_t>(type));
++  w->PutU8(0); // training: TS_DISABLED
++  w->PutU8(0); // needs_to_backprop
++  w->PutU32(0); // network_flags
++  w->PutU32(0); // ni
++  w->PutU32(0); // no
++  w->PutU32(0); // num_weights
++  w->PutString(""); // name
++}
++
++// A minimal valid child network (NT_INPUT with a 1x1x1x1 shape).
++void AppendInputChild(ByteWriter *w) {
++  AppendNetworkHeader(w, NT_INPUT);
++  w->PutS32(1); // batch
++  w->PutS32(1); // height
++  w->PutS32(1); // width
++  w->PutS32(1); // depth
++  w->PutS32(0); // loss type
++}
++
++// Builds a TESSDATA_LSTM component whose top-level network is a plumbing
++// layer of the given type with the given (corrupt) stack size, followed by
++// the remaining fields of LSTMRecognizer::DeSerialize.
++std::vector<char> MakeLstmComponent(NetworkType type, uint32_t stack_size) {
++  ByteWriter w;
++  AppendNetworkHeader(&w, type);
++  w.PutU32(stack_size); // Plumbing::DeSerialize reads this as uint32
++  for (uint32_t i = 0; i < stack_size; ++i) {
++    AppendInputChild(&w);
++  }
++  w.PutRaw(kMinUnicharset); // unicharset (raw text, no recoder/unicharset components)
++  w.PutString("");             // network_str_
++  w.PutS32(0);                 // training_flags_
++  w.PutS32(0);                 // training_iteration_
++  w.PutS32(0);                 // sample_iteration_
++  w.PutS32(0);                 // null_char_
++  w.PutU32(0);                 // adam_beta_ (float 0.0)
++  w.PutU32(0);                 // learning_rate_ (float 0.0)
++  w.PutU32(0);                 // momentum_ (float 0.0)
++  return w.data();
++}
++
++// Writes a traineddata file with the given (corrupt) LSTM component to
++// dir/eng.traineddata.
++bool WriteCorruptTraineddata(const std::string &dir, const std::vector<char> &lstm) {
++  TessdataManager mgr;
++  mgr.OverwriteEntry(TESSDATA_LSTM, lstm.data(), static_cast<int>(lstm.size()));
++  return mgr.SaveFile((dir + "/eng.traineddata").c_str(), nullptr);
++}
++
++class PlumbingTest : public testing::Test {
++protected:
++  void SetUp() override {
++    tmpl_ = "/tmp/tess_plumbing_test_XXXXXX";
++    char *dir = mkdtemp(tmpl_.data());
++    ASSERT_NE(dir, nullptr);
++    dir_ = dir;
++  }
++  void TearDown() override {
++    std::remove((dir_ + "/eng.traineddata").c_str());
++    rmdir(dir_.c_str());
++  }
++  // Expects the LSTM engine to reject the corrupted traineddata
++  // gracefully (init failure) instead of crashing.
++  void ExpectInitFails(const std::vector<char> &lstm) {
++    ASSERT_TRUE(WriteCorruptTraineddata(dir_, lstm));
++    tesseract::TessBaseAPI api;
++    EXPECT_EQ(api.Init(dir_.c_str(), "eng", tesseract::OEM_LSTM_ONLY), -1);
++  }
++  std::string dir_;
++  std::string tmpl_;
++};
++
++// Empty NT_SERIES stack: Series::CacheXScaleFactor would dereference
++// stack_[0] on the empty vector during initialization.
++TEST_F(PlumbingTest, RejectsEmptySeriesStack) {
++  ExpectInitFails(MakeLstmComponent(NT_SERIES, 0));
++}
++
++// Empty NT_PARALLEL stack: Plumbing::XScaleFactor would dereference
++// stack_[0] on the empty vector during initialization.
++TEST_F(PlumbingTest, RejectsEmptyParallelStack) {
++  ExpectInitFails(MakeLstmComponent(NT_PARALLEL, 0));
++}
++
++// Empty NT_XREVERSED stack: same crash as the parallel case.
++TEST_F(PlumbingTest, RejectsEmptyReversedStack) {
++  ExpectInitFails(MakeLstmComponent(NT_XREVERSED, 0));
++}
++
++// A Series with a single network: Series::Forward requires at least two
++// networks, so such a model can never work.
++TEST_F(PlumbingTest, RejectsSingleNetworkSeries) {
++  ExpectInitFails(MakeLstmComponent(NT_SERIES, 1));
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index 60b50f16a5..b537fe56bd 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88050.patch \
            file://CVE-2026-88047.patch \
            file://CVE-2026-88051.patch \
+           file://CVE-2026-88054.patch \
 "
 
 

