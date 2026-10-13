Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0206ECC6B10
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:30 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3534.1791885623587896006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=arj/CMPC;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1897207a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885623; x=1792490423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R3PIVwduR84cNu++N7KgpS36Y6qS/pdF5Wj1ZB5rm8=;
        b=arj/CMPCimk1RMgFaI77LeUlH0cewQoT/xsBeHi6+ZeP0p5pTO8/H6OvwIwb/e9O9e
         msrrAUBvVuDyvnfpxr2OTZGubu9Lcfkb03sPu/dYZY6swKY6PmUWiC8eo4PSxDzo3034
         w1l5ww6qQjMbSbxTxkpPWUtxP9YGJCf8Z7rDBgLl0uZqoLIRrf9KynxSLcAEIM4Ttc2s
         JmdzOa5cUcDf+BSUdtSYgx4H12mzA3QdLXAbs05ynAYzVRAXS70fA8j842hkjIinaZSW
         +W2z8ljwED9ZfMilO9zsmseMz6ZzFykfbRviT50NfYf1qI5JypCjTWGEZRNcSAQJopkJ
         NqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885623; x=1792490423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3R3PIVwduR84cNu++N7KgpS36Y6qS/pdF5Wj1ZB5rm8=;
        b=Cl+pchhdl/V3VQyB4a4J8cBbPoPJhYFLHZvb2BAui3fH2CWGNXIB/U8QGzt7o19acD
         uzmbsIqLNZ0V4quVZZihDVNGA34qTEh0gaAGQMtNwPCs3Xo04QY0NhAr9LugIxK2lKEw
         OC66WSJsUhzcrRJpH2GKp7fnx53Gek4ZL35OjxlvPJO/dopxFJP/NadWy78rDiObIXWb
         TsKqMktZbEj7/b7xwgemUtfL8j1p48gw9Cq72LW2oOfI3Ezf2mYpqIPPopm33xzOFvIm
         tx5uZWf/yZ4om7UhVK0rh/Zo+wqW/FvArZe9isZWsCVsy4WfALlbQNgydCHxwOY4Vc9N
         dxlg==
X-Gm-Message-State: AFq9FYICuXkJ8VUX1eNMTesxQLieY69iXygxjGr31uGQGMxJrncxp7K7
	lPmkEsRHYu81uXBb23yrZsmiVsSklPwuAzJ38sf0AULtgW8QFlw0xz7MO2u+7A==
X-Gm-Gg: AYBFou3kIsbjVmD5qkpDIvlKHZsJVtCWYHXgIfgkjYnoXJpGJBmvSDWxphPOtv44EiI
	PxeDSidZeZME2EROO5kc6mAvg/UHsP4t418fG7najHZ+VYp2HmTSWcdC7QLmfjENY8wFY7u8ZyG
	4lot+osXJqTUrseDw0G83AVjEZo0sk+v6MxEv2ZmwjXhULpxixQNAIUGIQG+3P6NvPoBGCGjMgn
	pzGthi2OLmd6stoYaf2YYKeGRr6pA9l0mOk7fXLpkB8yRgLrBaCfFN067/AK1+ZnPJru8sBWjwF
	P2nHx5Axrn3hDRFYXVW3TjjnGbopbqw49uDjBg4g7fjBlUbU4sTdLDnmWLyehcqLbaMHs213mV6
	y5Il8SE8C+0AMpUNJFdD4EVvp5GaJa0xBZUjs5KR9OanLtRPcu1aIlWBPatkT+umwgapZfhf7/Q
	pYhv3SIoYY+qm2AC4YHRL/mEQI4spPgCvB1U0KzMQ1OweMU3sfNHh5L9DdlRDVgE8r2WwPyBsf3
	oDE2iOYvA8FK/zchdJ3b1wc60nxcqXE5OGLCIOxOg==
X-Received: by 2002:a17:90b:4fd0:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3ab3a778837mr10624981a91.30.1791885622642;
        Tue, 13 Oct 2026 03:00:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 24/28] tesseract: patch CVE-2026-88050
Date: Tue, 13 Oct 2026 22:58:59 +1300
Message-ID: <20261013095903.3544906-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130857

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88050

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 4aab0847c2e6b786437d140dd3c589e6773b9224)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88050.patch  | 209 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
new file mode 100644
index 0000000000..21fa5e9a67
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
@@ -0,0 +1,209 @@
+From 5426c23fe7fe32b62bd5694f68f71772f273c821 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 21 Aug 2026 16:56:51 +0200
+Subject: [PATCH] Reject recoder code values outside the sane range at load
+
+RecodedCharID::DeSerialize (hardened by 82727cc to check length_
+only) still read the individual code values as raw signed int32.
+UnicharCompress::ComputeCodeRange computes code_range_ as 1 plus the
+maximum code using a signed > comparison, so a code value of -1
+never raises the maximum and yields code_range_ = 0. SetupDecoder
+then resizes is_valid_start_ to 0 and writes is_valid_start_[code(0)]
+on the size-0 vector<bool>, an out-of-bounds write at a wild wrapped
+index (deterministic crash) on LSTMRecognizer load. A code value of
+INT32_MAX instead wraps code_range_ negative and makes resize()
+throw.
+
+Key changes:
+- unicharcompress.h: validate each deserialized code value to be
+  within [0, UINT16_MAX), the same arbitrary cap used elsewhere for
+  .traineddata counts; reject the recoder otherwise.
+- unicharcompress.h/.cpp: add defense-in-depth bounds assertions to
+  IsValidFirstCode and SetupDecoder, matching the style of the
+  NetworkIO assertions from 2f4d2f4.
+- unittest: add recoder_test, which feeds a crafted UnicharCompress
+  with a -1 code and an INT32_MAX code and expects DeSerialize to
+  fail (on unpatched code the -1 case dies on the SEGV in
+  SetupDecoder, the huge case on the uncaught length_error), plus a
+  positive control that valid codes load and answer
+  code_range()/IsValidFirstCode() correctly.
+
+Reported-by: Zhixi "Jace" Sun <g.mygenie@gmail.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit c94a5532ee04db5a4919542832fd94caee5ea58f)
+
+CVE: CVE-2026-88050
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/c94a5532ee04db5a4919542832fd94caee5ea58f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                    |  5 ++
+ src/ccutil/unicharcompress.cpp |  1 +
+ src/ccutil/unicharcompress.h   | 13 ++++-
+ unittest/recoder_test.cc       | 91 ++++++++++++++++++++++++++++++++++
+ 4 files changed, 109 insertions(+), 1 deletion(-)
+ create mode 100644 unittest/recoder_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index 4bcc858b..63ca6686 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1202,6 +1202,7 @@ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += progress_test
+ check_PROGRAMS += qrsequence_test
+ check_PROGRAMS += recodebeam_test
++check_PROGRAMS += recoder_test
+ check_PROGRAMS += rect_test
+ check_PROGRAMS += resultiterator_test
+ check_PROGRAMS += scanutils_test
+@@ -1435,6 +1436,10 @@ recodebeam_test_SOURCES = unittest/recodebeam_test.cc
+ recodebeam_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ recodebeam_test_LDADD = $(TRAINING_LIBS) $(ICU_I18N_LIBS) $(ICU_UC_LIBS)
+ 
++recoder_test_SOURCES = unittest/recoder_test.cc
++recoder_test_CPPFLAGS = $(unittest_CPPFLAGS)
++recoder_test_LDADD = $(TESS_LIBS)
++
+ rect_test_SOURCES = unittest/rect_test.cc
+ rect_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ rect_test_LDADD = $(TESS_LIBS)
+diff --git a/src/ccutil/unicharcompress.cpp b/src/ccutil/unicharcompress.cpp
+index f909f76e..b3dd440f 100644
+--- a/src/ccutil/unicharcompress.cpp
++++ b/src/ccutil/unicharcompress.cpp
+@@ -400,6 +400,7 @@ void UnicharCompress::SetupDecoder() {
+   for (unsigned c = 0; c < encoder_.size(); ++c) {
+     const RecodedCharID &code = encoder_[c];
+     decoder_[code] = c;
++    ASSERT_HOST(code(0) >= 0 && code(0) < code_range_);
+     is_valid_start_[code(0)] = true;
+     RecodedCharID prefix = code;
+     uint32_t len = code.length();
+diff --git a/src/ccutil/unicharcompress.h b/src/ccutil/unicharcompress.h
+index 9b696d03..6919b7d2 100644
+--- a/src/ccutil/unicharcompress.h
++++ b/src/ccutil/unicharcompress.h
+@@ -84,7 +84,17 @@ public:
+     if (length_ > kMaxCodeLen) {
+       return false;
+     }
+-    return fp->DeSerialize(&code_[0], length_);
++    if (!fp->DeSerialize(&code_[0], length_)) {
++      return false;
++    }
++    // Code values index arrays sized from the maximum code; reject values
++    // that are out of the sane range for a recoded alphabet.
++    for (uint32_t i = 0; i < length_; ++i) {
++      if (code_[i] < 0 || code_[i] >= static_cast<int32_t>(UINT16_MAX)) {
++        return false;
++      }
++    }
++    return true;
+   }
+   bool operator==(const RecodedCharID &other) const {
+     if (length_ != other.length_) {
+@@ -190,6 +200,7 @@ public:
+   int DecodeUnichar(const RecodedCharID &code) const;
+   // Returns true if the given code is a valid start or single code.
+   bool IsValidFirstCode(int code) const {
++    ASSERT_HOST(code >= 0 && code < code_range_);
+     return is_valid_start_[code];
+   }
+   // Returns a list of valid non-final next codes for a given prefix code,
+diff --git a/unittest/recoder_test.cc b/unittest/recoder_test.cc
+new file mode 100644
+index 00000000..48dfa7ea
+--- /dev/null
++++ b/unittest/recoder_test.cc
+@@ -0,0 +1,91 @@
++///////////////////////////////////////////////////////////////////////
++// File:        recoder_test.cc
++// Description: Tests that a UnicharCompress (LSTM recoder) with code
++//              values outside the sane range is rejected at load.
++//              Negative code values leave code_range_ at zero, so
++//              SetupDecoder writes is_valid_start_[code(0)] out of
++//              bounds on a size-0 vector<bool>; huge code values wrap
++//              code_range_ and make resize() throw.
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
++#include "serialis.h" // for TFile
++#include "unicharcompress.h"
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
++// A serialized UnicharCompress with one length-1 RecodedCharID per
++// given code value (self-normalizing).
++std::vector<char> MakeRecoder(const std::vector<int32_t> &codes) {
++  ByteWriter w;
++  w.PutU32(codes.size());
++  for (int32_t code : codes) {
++    w.PutU8(1); // self_normalized_
++    w.PutU32(1); // length_
++    w.PutS32(code); // code_[0]
++  }
++  return w.data();
++}
++
++// A recoder code of -1 keeps code_range_ at 0, so on unpatched code
++// SetupDecoder performs an out-of-bounds write into the size-0
++// is_valid_start_ vector<bool>.
++TEST(RecoderTest, RejectsNegativeCode) {
++  std::vector<char> bytes = MakeRecoder({-1});
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  UnicharCompress recoder;
++  EXPECT_FALSE(recoder.DeSerialize(&fp));
++}
++
++// A recoder code of INT32_MAX wraps code_range_ to a negative value,
++// so on unpatched code SetupDecoder's resize() throws.
++TEST(RecoderTest, RejectsHugeCode) {
++  std::vector<char> bytes = MakeRecoder({INT32_MAX});
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  UnicharCompress recoder;
++  EXPECT_FALSE(recoder.DeSerialize(&fp));
++}
++
++// A valid recoder must still be accepted and usable.
++TEST(RecoderTest, AcceptsValidCodes) {
++  std::vector<char> bytes = MakeRecoder({0, 1});
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  UnicharCompress recoder;
++  ASSERT_TRUE(recoder.DeSerialize(&fp));
++  EXPECT_EQ(recoder.code_range(), 2);
++  EXPECT_TRUE(recoder.IsValidFirstCode(0));
++  EXPECT_TRUE(recoder.IsValidFirstCode(1));
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index 24c8312552..6acedcee98 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88052.patch \
            file://CVE-2026-88048.patch \
            file://CVE-2026-88049.patch \
+           file://CVE-2026-88050.patch \
 "
 
 DEPENDS = "leptonica"

