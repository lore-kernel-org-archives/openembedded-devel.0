Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C27CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:40 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32873.1792043139984825332
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o5GHzJ9T;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6e954afbdso8094435ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043139; x=1792647939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ug9eKCO58Y4VLl98m5Gdv4zQb9sK2CAyt5HE5vVxfgI=;
        b=o5GHzJ9TuPbTcc+MZsYNfFE9+rstoN4Gt19kjBHYA2FyV3BWeKFBO31h1OkN58Yl2s
         iDX9hZLj3Rt6b2aPRh5L4y7BD88gOnzhCwE3X5Cg28m3Rs580+nfw8Gfub15sY+c1RWv
         XmOs7fZlsg0gmEkDsLZqMqfSFe+E/ZbDzyAu53Xkhrgwh7uvQT3VfIulqcOI2UqXPpfX
         yzSy4RJzu8GZP+BUz+WRTm+oAqihBncRYdleI00K8KhkLS5LtAp6zwIgubkO+BeShK9Q
         v/vncLAIKHdYleMLrBBfyC1xKB0yvwNDUr/i6LAvTUvQMpRuvXoLcHTeXuSIPVGCwWPt
         2Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043139; x=1792647939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ug9eKCO58Y4VLl98m5Gdv4zQb9sK2CAyt5HE5vVxfgI=;
        b=cIyMT4Ds0SV571pDU2GFpkNDG0Ixg+DEmpYvarM06L+EB2cZpvtlyt7V6WEcBYg/70
         K6/tQ9iBu2i7w+2QUCj3LRSbi3EFzxHayCUrNzBjflg55CW2CKrn/JnmwtM7t3RyCVvZ
         wTX3dRBWcBGmAmp5evzjxqbz93a93CVi8Qj+UYABnLKsTkkJtg/Qk2E9BLdRIn07lCKn
         vnG7oVSkSOxijqtLdGHyrTzSJ7DD3VIHlDTlI8TJH6KTFlIiAGeCL+sNX0Nc8pP3uWiB
         6vPJcqCjxVj6RVKfnEOZ/ReRxHX0PAQVP8Xk7D5G7TOxxbGn8iD7wnQ1avVWotyfJASP
         KoZA==
X-Gm-Message-State: AFq9FYIKVggKAsqHxjhTbFl2sT2bDMZCHzC7zJy1CNUtOA/zD435URYn
	HOFX7FcHjeTKMGdi1iYNZFkXgOSVlcfkJkWFKLR2uvCJhKfGxHddV8ddx/gyDw==
X-Gm-Gg: AYBFou1n8LsvTK23S3O/r557GyClr146UpCBqQUkKWDOOWdfut7KAwwwr9YOn5d32qR
	Wy2uRW++htwxrI9p+OzKuS1q0NLrRpshPH5s1FJWW2HUhVL//SbPp9HPWXwxrgOHafqPk3dmEzb
	gTVS+8p7RWjWZ1OcMU01+OUwpnQMfVqTwLf52F4awK8aigf7CljWSCLXLbK7ELW1f/UWcAp1+8i
	HlLpCZ08dZzu4JKMTcPTpI8PzZ0nrmuFJaIjxwmhKqwrW4H2/zyymEVF8o0X27RcoD9769CLqxq
	C0n1jTJUvNEIwlxialcaqAD+5JbSAMsvHr1CQW42+DqOXdbkotd0Oz5Zfkkc5V6V8LIOQi+txwA
	N3gPHRCbM19cWi06KTgyyuSjHVYUtJ5/gMAl6FKAuU0sOBWGfnV4OpATNhRNm3hU2Wj+W8mnLuC
	C/N1nhDVZuZ1fEhmjebQlaWUB2+TamdhfQLjTYx1fQFfB+0fVTQcRQ7oRKUrEjUM3cKpbgwv1vm
	RTLh+3UD2WXn6LrQdIrCsA=
X-Received: by 2002:a17:902:dacd:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2e842ab8e10mr157932375ad.13.1792043139102;
        Wed, 14 Oct 2026 22:45:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 79/82] tesseract: patch CVE-2026-88054
Date: Thu, 15 Oct 2026 18:42:07 +1300
Message-ID: <68a702ac5dde65111b6d03fbaa8555e1e9697254.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130999

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88054

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 4c00053135fb03b6043c960dc96a839b675f7eec)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88054.patch  | 274 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   1 +
 2 files changed, 275 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
new file mode 100644
index 0000000000..32e70c0f6f
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
@@ -0,0 +1,274 @@
+From 83bbac0975f52a5171776fddcc800a2aaa5206a3 Mon Sep 17 00:00:00 2001
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
+index c67f0f63..a6ee0931 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1198,6 +1198,7 @@ if ENABLE_TRAINING
+ check_PROGRAMS += pango_font_info_test
+ endif # ENABLE_TRAINING
+ check_PROGRAMS += paragraphs_test
++check_PROGRAMS += plumbing_test
+ if !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += params_model_test
+ endif # !DISABLED_LEGACY_ENGINE
+@@ -1427,6 +1428,10 @@ paragraphs_test_SOURCES = unittest/paragraphs_test.cc
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
+index 7ec89bd9..722ed09b 100644
+--- a/src/ccmain/tessedit.cpp
++++ b/src/ccmain/tessedit.cpp
+@@ -169,7 +169,12 @@ bool Tesseract::init_tesseract_lang_data(const std::string &language, OcrEngineM
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
+ #ifdef DISABLED_LEGACY_ENGINE
+       // The legacy engine is compiled out, so we cannot fall back to it.
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
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index be6ec1e463..c96aca1dde 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88050.patch \
            file://CVE-2026-88047.patch \
            file://CVE-2026-88051.patch \
+           file://CVE-2026-88054.patch \
 "
 
 DEPENDS = "leptonica"

