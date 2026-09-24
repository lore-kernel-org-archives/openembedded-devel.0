Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4EAC982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:04 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.734.1790224442740954091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qKjhfl5/;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8674704dab1so1511632b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224442; x=1790829242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJg+Vk80SDAORumMkzT1iLDsX11w6az1KkfwesQKlu8=;
        b=qKjhfl5/zJGdyKB0JP6gE49Vp6G8KhF10eby4pB1Do1ryDHhxY/c2qGh/e0eMl5MOD
         JzcQuu/QpGvC3kkgvjtPPvNYYZsszcJui9OVYxhW+y4sM3iyAJoJ7W31XJ9eGThQf08/
         Rd7SFchyvmry3R5+53dimDFpdf2jdFpg/5P41zY71WkZps5/C9KGskU3k7r7yEb0kltY
         ls5k1O1S9aCIeiV5xhxaEcD0HVvcCE/Bq8VjuK4p60eQIOV1d9E1hHhLxqmVuQzFG1Ws
         zLZPWayqDG4ASWHk5WuLVEA8rh98MqXfnnrRdqK1demucUpg4D1Lxhn6BE/Ju0ct+kbE
         aiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224442; x=1790829242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJg+Vk80SDAORumMkzT1iLDsX11w6az1KkfwesQKlu8=;
        b=E68jd6skSn+8zqqKsDXLadgWF1QqpbmuHnpui3P4DujOVpghY+D3ygjzaCltTJtBpl
         cjoI5Q3w6iYe+glc09hxOWsVl/qvTk68R9HkUs+AcfL5IzFoPa004935y/DyV9wHv/cF
         010S+JS8kxUu/Z6RQwOfxB95hAGoJ/7ANm4ydI5TLMg7WdCJ2wcYkz1jHTAEb3K7USZ6
         8wY+hUDlCspBm1uJg1YRhyf4oY81GFo2L1VuSE0L2w1nMl/WsJfQpDIh3sBGLI+wSfDJ
         dbanNJZ9pBkMeddtHke/E0v54ziLOrQKybkJwnvUZhg4KpS5c4lrqDbv/NqkNST3zhq+
         jW0Q==
X-Gm-Message-State: AFuF++mY7hhlEChr0xnvc3AJnQx0wBAGhwOLFGrkovblmfBz7/NSxuxI
	pjb2hr3WPH5fow4VdsbuAq54gRhVi02kA9CfQ2WF+GUlUHYjxKPT4AJ/JdB5qw==
X-Gm-Gg: AYBFou2dMbLaCKsnajYN8boF2lQVXg2KzPGWKN89jj8hOWb69iVr0JTa5WVyQpGu3LO
	Fmf3k0gCpVRYxG+1w5vC7/yu3FjCnpVk4FU212MzSFy0uoGh+wVTU0ZBDjbrjQAhXf1YswD3WMb
	U+zFdfhXbayyvlki0D29yommwinqijzW/3+uJH6bXk1b2ZiUuIQp6D8QfQqB/GiIC59Rs/XsH3p
	PfznMMV8v1b67l3yFS8Jfh7qG7WCGdLRnJu90T08oLwPYkxohd+C+UZwL1xhqsAgPKd8WU51HAb
	THf8tUBWDV97scMxXjzUaajd6+g4la3SCqLqCnIFF4WcisC9NCwqeB7FkQg2y2JQHfBklOgh1Ow
	UNeTx8qwMkGW5oY6cmjz8V7Csrp5XPH2MsZSo8nyDoI/N74NhKc2VSDkM9Ai69+4jtYevclzRaN
	YHfhcwBmzEdP/d0pZ9KJM/L1OSrh1wy52Jc53ddl1nMVkEHSObNU0amP2YQvqpeKiHvTpQdiwna
	Paihw+i/NEnW3XP7zClArFtByZt7c8i/w==
X-Received: by 2002:a05:6a00:4b15:b0:878:37b2:dfa9 with SMTP id d2e1a72fcca58-87e9f62dca2mr1030029b3a.57.1790224441910;
        Wed, 23 Sep 2026 21:34:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:34:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 19/24] tesseract: patch CVE-2026-88050
Date: Thu, 24 Sep 2026 16:33:09 +1200
Message-ID: <20260924043315.1663186-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130267

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88050

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88050.patch  | 210 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   1 +
 2 files changed, 211 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
new file mode 100644
index 0000000000..b07ef69989
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
@@ -0,0 +1,210 @@
+From bb1e72a7f8488d653d2a37e482babac6d9dc7ab2 Mon Sep 17 00:00:00 2001
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
+
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
+index 86ac9d0d..c1491263 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1231,6 +1231,7 @@ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += progress_test
+ check_PROGRAMS += qrsequence_test
+ check_PROGRAMS += recodebeam_test
++check_PROGRAMS += recoder_test
+ check_PROGRAMS += rect_test
+ check_PROGRAMS += resultiterator_test
+ check_PROGRAMS += scanutils_test
+@@ -1464,6 +1465,10 @@ recodebeam_test_SOURCES = unittest/recodebeam_test.cc
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
+index d5efccab..7f3d48fe 100644
+--- a/src/ccutil/unicharcompress.cpp
++++ b/src/ccutil/unicharcompress.cpp
+@@ -400,6 +400,7 @@ void UnicharCompress::SetupDecoder() {
+   for (unsigned c = 0; c < encoder_.size(); ++c) {
+     const RecodedCharID &code = encoder_[c];
+     decoder_[code] = c;
++    ASSERT_HOST(code(0) >= 0 && code(0) < code_range_);
+     is_valid_start_[code(0)] = true;
+     RecodedCharID prefix = code;
+     int len = code.length() - 1;
+diff --git a/src/ccutil/unicharcompress.h b/src/ccutil/unicharcompress.h
+index 67a441e8..05778ce6 100644
+--- a/src/ccutil/unicharcompress.h
++++ b/src/ccutil/unicharcompress.h
+@@ -79,7 +79,17 @@ public:
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
+@@ -185,6 +195,7 @@ public:
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
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index df6ff11d78..756e780659 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88052.patch \
            file://CVE-2026-88048.patch \
            file://CVE-2026-88049.patch \
+           file://CVE-2026-88050.patch \
 "
 
 

