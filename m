Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD876CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:40 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32872.1792043135345195812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kpD4GVj5;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8fe8e343fso19143885ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043135; x=1792647935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W2azljDXcg9TEmoasMdOM7wxqWIT/xnZVzzgM+sCy6w=;
        b=kpD4GVj5F52kEe5zI+u/be8aS5psnAI5JeHuGcDQYw5GWRPrK36HvCiGaP4JdknfyE
         1nXQUOkUZNiQ2jghbOVvAyBkw942wtsxR7rDoobVVjZIrbw8CqHNweIOeLU+ihyW2kXR
         ZBcnYdsKvls7+Ew+NFpUV25qZ0l9jFuStE1JdJczIxinQD5xLdWPpllZRiI91bn9sLt+
         I5HWTqu+oND/0GjojesV/HPVNtkjd9WIBvYSYesdPVHOzFPnOhdWo3IQ19hG90pfvZj2
         bNcHCGzSd/gbBuRYOXazWr+Lu59C+Dfju8vZ//xpgCVO9rG8rjNcTKCjBuqwfrqUzd+p
         v1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043135; x=1792647935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W2azljDXcg9TEmoasMdOM7wxqWIT/xnZVzzgM+sCy6w=;
        b=ldhGmJsh87BhPcAnHl2Qk7z9b8GDia9X0PY/fVdF2wX0cyu1MgYjwjGL95ZxLUWAnq
         PZVr6ScnuZcR24KBeQdzLZ0Ni9LFHYM2TICuM6tKhAVeL4LtEDHLbSC5MKv7LMJQ7E/Y
         3s2wdIw/6Gg3Wo19QF5Lo0oDWNT4YFaRoSIVJDGxa9kgbzQtTTODfYOxf4N7yJfMhWik
         6Gzg5nPtlL95zP/3x+/185l72ykK7qAEM8/sXrNJuu9wlozkYGVIU9l26x6ZWUhRs3Iy
         MRPSuKOmqwrQSBG+yAwNlGn7UYPE1t1Fw3zH4VSvdwpCu/pTMOspP9kn5v0aOZCj3LiU
         rqkQ==
X-Gm-Message-State: AFq9FYKUjWugtNcdMgbjsmr2bsxWvPnrMYEhIBxLxKS2SB8WEw+XolZA
	eWTGmZFXVGur3ojYUQLpIcyg6Y543RqTvxhHVsgjFpjcBVZu6N7rIPacU+DAFg==
X-Gm-Gg: AYBFou2YAxfPI620YU/z/U8vPXan/5V6pQnkWCd3VyKMTwvoRCPE+u6r1k98Fymg/1m
	UZd8HLw3+O3EG0VwvGYRALe67qKDiN86ow5tp77Xw+yfIZdHg7u6/p7aUe4Vt8cetxp6OaEvjtz
	ukOJgyeg4zBHa5n3Sx51Yc7azosr+we2cBW+jb2In83jPnZR9PpfD0CqQx2HV7hLzqPTTIA9o9O
	pp2WcoRpHA+CiIDL8SfmXUUzPYl8ZWFHrD6BM3/mZFP+oQnOG8sNDWJ+74alzHgvksw9LFHMKvP
	kp2Kt7aDirVfFRVLKMMEoVh/HN7RN+d+CaRyKSE4Neuy8dMIQfyikkMvk8Jx5QTE4GEwm9S6FYA
	yZnud/lCL6NidLRzvMGtP6UVOI0a2IGbNWdX3Lvl18qSp3hk+GuJd8cumeuxsAQH1Joi6+Vy2By
	GMe6/adIJI9s/yZORh+C68YVodjrrNhJpEKo5hbqcv2/0j2Vg9Y4UdsSBRvqjgisTOWGM9EiQfO
	Di1KWRPiDuN9HJNQmj82IA=
X-Received: by 2002:a17:903:324d:b0:2e3:1e96:7f1a with SMTP id d9443c01a7336-2e842718deemr142595365ad.0.1792043134458;
        Wed, 14 Oct 2026 22:45:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 77/82] tesseract: patch CVE-2026-88047
Date: Thu, 15 Oct 2026 18:42:05 +1300
Message-ID: <21dc40e65a8e4d96b7dce4029455fcd376904f9f.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130997

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88047

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit b8fa7aac9168b6ebfdcc2ea3493c332f0db69491)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88047.patch  | 225 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
new file mode 100644
index 0000000000..780f686e61
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
@@ -0,0 +1,225 @@
+From e974684acbe3aeb6bc6192b06a048537c345b713 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Mon, 24 Aug 2026 13:39:22 +0200
+Subject: [PATCH] Limit unichar extraction in ReadNormProtos to the buffer size
+
+Classify::ReadNormProtos parsed each normproto line with
+`stream >> unichar >> NumProtos` into a char unichar[2 * UNICHAR_LEN + 1]
+stack buffer, but char* extraction from an istream has no length limit
+(the stream width was never set). A crafted TESSDATA_NORMPROTO component
+in a .traineddata file whose first proto-line token exceeds 60
+characters (the 100-byte line buffer allows up to 99) overflows the
+stack buffer during legacy engine initialization (CWE-121).
+
+Toolchain note: Apple's libc++ provides a C++20 array overload of
+operator>>(basic_istream&, char(&)[N]) that implicitly bounds the
+extraction to the array size, so builds against that standard library
+are incidentally protected. Standard libraries without that overload
+(e.g. libstdc++) still take the unbounded char* overload, so the
+explicit width limit below makes the behavior defined on all
+toolchains.
+
+Key changes:
+- normmatch.cpp: read the unichar token with
+  std::setw(2 * UNICHAR_LEN + 1); char* extraction takes at most
+  width - 1 characters, which fits the buffer exactly. Overlong
+  tokens are truncated and the line is rejected like any other
+  unparseable line.
+- unittest: add normproto_test covering a 99-character token (the
+  maximum a 100-byte line can hold), a token of exactly 2 *
+  UNICHAR_LEN characters, and a well-formed component. A minimal
+  reproduction of the unbounded extraction crashes an ASan build
+  with a stack-buffer-overflow.
+
+Reported-by: Tristan Madani <tristan@talencesecurity.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit 1bda5079b1c8a7e25f523486837426903d29ce84)
+
+CVE: CVE-2026-88047
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/1bda5079b1c8a7e25f523486837426903d29ce84]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                |   5 ++
+ src/classify/normmatch.cpp |   6 +-
+ unittest/CMakeLists.txt    |   1 +
+ unittest/normproto_test.cc | 111 +++++++++++++++++++++++++++++++++++++
+ 4 files changed, 122 insertions(+), 1 deletion(-)
+ create mode 100644 unittest/normproto_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index 63ca6686..cc748455 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1184,6 +1184,7 @@ check_PROGRAMS += mastertrainer_test
+ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += matrix_test
+ check_PROGRAMS += networkio_test
++check_PROGRAMS += normproto_test
+ if ENABLE_TRAINING
+ check_PROGRAMS += normstrngs_test
+ endif # ENABLE_TRAINING
+@@ -1388,6 +1389,10 @@ networkio_test_SOURCES = unittest/networkio_test.cc
+ networkio_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ networkio_test_LDADD = $(TESS_LIBS)
+ 
++normproto_test_SOURCES = unittest/normproto_test.cc
++normproto_test_CPPFLAGS = $(unittest_CPPFLAGS)
++normproto_test_LDADD = $(TESS_LIBS)
++
+ normstrngs_test_SOURCES = unittest/normstrngs_test.cc
+ normstrngs_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ normstrngs_test_LDADD = $(TRAINING_LIBS) $(ICU_I18N_LIBS) $(ICU_UC_LIBS)
+diff --git a/src/classify/normmatch.cpp b/src/classify/normmatch.cpp
+index d5bd7e6a..1ce7c928 100644
+--- a/src/classify/normmatch.cpp
++++ b/src/classify/normmatch.cpp
+@@ -28,6 +28,7 @@
+ 
+ #include <cmath>
+ #include <cstdio>
++#include <iomanip> // for std::setw
+ #include <sstream> // for std::istringstream
+ 
+ namespace tesseract {
+@@ -190,7 +191,10 @@ NORM_PROTOS *Classify::ReadNormProtos(TFile *fp) {
+   while (fp->FGets(line, kMaxLineSize) != nullptr) {
+     std::istringstream stream(line);
+     stream.imbue(std::locale::classic());
+-    stream >> unichar >> NumProtos;
++    // unichar holds at most 2 * UNICHAR_LEN characters; the width limit
++    // (width - 1 characters for char* extraction) keeps the extraction
++    // from overflowing the buffer on overlong lines.
++    stream >> std::setw(2 * UNICHAR_LEN + 1) >> unichar >> NumProtos;
+     if (stream.fail()) {
+       continue;
+     }
+diff --git a/unittest/CMakeLists.txt b/unittest/CMakeLists.txt
+index a660c9b1..4c677a60 100644
+--- a/unittest/CMakeLists.txt
++++ b/unittest/CMakeLists.txt
+@@ -59,6 +59,7 @@ set(LEGACY_TESTS
+     indexmapbidi_test.cc
+     intfeaturemap_test.cc
+     mastertrainer_test.cc
++    normproto_test.cc
+     osd_test.cc
+     params_model_test.cc
+     shapetable_test.cc
+diff --git a/unittest/normproto_test.cc b/unittest/normproto_test.cc
+new file mode 100644
+index 00000000..574b2f3d
+--- /dev/null
++++ b/unittest/normproto_test.cc
+@@ -0,0 +1,111 @@
++///////////////////////////////////////////////////////////////////////
++// File:        normproto_test.cc
++// Description: Tests that Classify::ReadNormProtos handles a normproto
++//              line whose first (unichar) token exceeds the
++//              unichar[2 * UNICHAR_LEN + 1] stack buffer. The
++//              istream extraction has no intrinsic length limit, so a
++//              crafted NORMPROTO component in a .traineddata file
++//              could overflow the stack buffer during legacy engine
++//              initialization.
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
++#include "classify.h"
++#include "serialis.h" // for TFile
++
++#include <cstdio>
++#include <cstdlib>
++#include <string>
++#include <vector>
++
++namespace tesseract {
++namespace {
++
++// Minimal unicharset (space and 'a').
++const char kMinUnicharset[] =
++    "2\n"
++    "NULL 1 0,255,0,255,0,0,0,0,0,0 Latin 2 0 2\n"
++    "a 1 0,255,0,255,0,0,0,0,0,0 Latin 2 0 2\n";
++
++// Builds a normproto component: a sample-size line (5), five parameter
++// description lines, then the given raw proto lines.
++std::vector<char> MakeNormproto(const std::string &lines) {
++  std::string data = "5\n";
++  for (int i = 0; i < 5; ++i) {
++    data += "e e 0 1\n";
++  }
++  data += lines;
++  return std::vector<char>(data.begin(), data.end());
++}
++
++class NormprotoTest : public testing::Test {
++protected:
++  void SetUp() override {
++    tmpl_ = "/tmp/tess_normproto_test_XXXXXX";
++    char *dir = mkdtemp(tmpl_.data());
++    ASSERT_NE(dir, nullptr);
++    dir_ = dir;
++    std::string uc_path = dir_ + "/eng.unicharset";
++    FILE *f = fopen(uc_path.c_str(), "w");
++    ASSERT_NE(f, nullptr);
++    ASSERT_EQ(fwrite(kMinUnicharset, 1, sizeof(kMinUnicharset) - 1, f),
++              sizeof(kMinUnicharset) - 1);
++    fclose(f);
++    // Load the minimal unicharset into the classifier's inherited
++    // unicharset member.
++    ASSERT_TRUE(classifier_.unicharset.load_from_file(uc_path.c_str()));
++  }
++  void TearDown() override {
++    std::remove((dir_ + "/eng.unicharset").c_str());
++    rmdir(dir_.c_str());
++  }
++  std::string dir_;
++  std::string tmpl_;
++  Classify classifier_;
++};
++
++// A 99-character first token (the maximum FGets can return) overflows
++// unichar[2 * UNICHAR_LEN + 1] on unpatched code; the width-limited
++// extraction must reject the line instead.
++TEST_F(NormprotoTest, ToleratesOverlongUnicharToken) {
++  std::vector<char> bytes = MakeNormproto(std::string(99, 'A') + "\n");
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  classifier_.NormProtos = classifier_.ReadNormProtos(&fp);
++  ASSERT_NE(classifier_.NormProtos, nullptr);
++  classifier_.FreeNormProtos();
++  EXPECT_EQ(classifier_.NormProtos, nullptr);
++}
++
++// A token of exactly 2 * UNICHAR_LEN characters is the maximum legitimate
++// size; it must not be truncated or rejected by the width limit.
++TEST_F(NormprotoTest, ToleratesMaxLenUnicharToken) {
++  std::vector<char> bytes = MakeNormproto(std::string(2 * UNICHAR_LEN, 'A') + " 0\n");
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  classifier_.NormProtos = classifier_.ReadNormProtos(&fp);
++  ASSERT_NE(classifier_.NormProtos, nullptr);
++  classifier_.FreeNormProtos();
++  EXPECT_EQ(classifier_.NormProtos, nullptr);
++}
++
++// A well-formed normproto component must still parse.
++TEST_F(NormprotoTest, ReadsValidNormprotos) {
++  std::vector<char> bytes = MakeNormproto("a 0\n");
++  TFile fp;
++  ASSERT_TRUE(fp.Open(bytes.data(), bytes.size()));
++  classifier_.NormProtos = classifier_.ReadNormProtos(&fp);
++  ASSERT_NE(classifier_.NormProtos, nullptr);
++  classifier_.FreeNormProtos();
++  EXPECT_EQ(classifier_.NormProtos, nullptr);
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index 6acedcee98..25d357d903 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88048.patch \
            file://CVE-2026-88049.patch \
            file://CVE-2026-88050.patch \
+           file://CVE-2026-88047.patch \
 "
 
 DEPENDS = "leptonica"

