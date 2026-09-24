Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76914C98315
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:06 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.740.1790224444761690922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DdLK49G8;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so1511641b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224444; x=1790829244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J54v1i5fRqcFDpi/tJNfyZInWjVAgj/j+3xZUk2GIS4=;
        b=DdLK49G8/wAXZ09hR7cPMhdpSx1mBzfOqg3TVTBNrkWxoK+LbEErnS0Hxq5OwlsavX
         hhPLZMORTMOxDz0MSGnRFmH4HFDhG4WeXVEBGmMyiPEDDWiI6QkBvRipkidag2D6MBZE
         DLdKs2iwik7SFE8kIXUKujqDbDddBTegV/gaFydg0oWOa+6QW+5h93TQvnmeZbQ2Xwk4
         u9lJLCZFYrorEDggukld+dSkT+iNMYLIu1DBpMHEK+Nr+jlp/u1oZrqAA9Ji1KohBgag
         FpRq9FJypDlBpZYYynoiCGhKlgsBUw+upEANDpUwpSeHNtQd5gknWbPEhBvhdW7tZM6r
         cPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224444; x=1790829244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J54v1i5fRqcFDpi/tJNfyZInWjVAgj/j+3xZUk2GIS4=;
        b=YbPJOODPH3lDtJA77h5DxSyW74uV93upbE0izaRePzrvxsIcqpMBDv3Lm7bxHtBcVp
         hspvHUdQT2NHea3VaQEfTXcPmpSYIbIpBMVG7zKqFtXTsl+I91d9yS+6AXc3pFVS1OXA
         5n/0I1IqR9uv9WLgbD54wwo3kv6ZyzCVdE12Bx01OrfaG2i7rDGprreENe/ZIo/ZRwE3
         OemSH0RflUlHaR+Y8jtgforv+r5UHR9mN1/qoMEEuZQQ5EmPm5N0cqjvHrqWQ+14R14N
         q1Dtg+Hs7q3GEhhVdO2wOcxkd96icHGs0DuIERKuPN45H2cvi6qQUnvuaNkjIV5TGrnP
         X4wA==
X-Gm-Message-State: AFuF++ndZ1X/Hgyyij/8lKiMhMYbH3oJKyo1IRfQt+Yw4u7cyhWBYWbz
	1QWAa7UemgzGt5/cchjNLuf0eRgqNQv4980HgbeBQQ20qQdwV8vq6JwQAB1ecQ==
X-Gm-Gg: AYBFou0k3JHxnUTvMaVLkQGRevgVYOkOxIB1d5WE5Ktf6dI3bEymMpC7d43XtA/Ccu9
	Th65x0+sG1NshZLGiYZgftWb40soXxdd6PZ7DIsch/8A95JfX1FcWeIH7joTUWwtdWQLMmZrDM/
	5bXxHGhJ9wGG7p9Tzzb5QBXRhEZPJMYMVxpdAoSn+BBm4Ld5jAKMPcwoWiXT5LE6JfW2CgF4XT6
	HomRdqComVKD6NCoOuRVhz3v63Lrh6pv+8Tz+BkH81ZufooKzyRr7rYmB/7ozO6W/+f0XEReEaj
	N95kUzIcS8ijZfhXcDFUW/QFkNpgEGG00No9Uvbi2GEFlnZfmx4wcDWl31TupnAtVEwrDrO/Sce
	RW0WajRNPgYCQSEGoOoxoKLR3I3FDVURcEZe29hn1c4ijmFbNlvdXHhYzykVqYUp4yLuPIifklH
	s3rDzPJUMJ6CQdjmMdKKzUgqVLxjhDnHwsVrIcU7vV2DpsEsdZ4sldvPNvrXV4bVCNWYCQQUUFg
	D8j+N21Xo0bH+h9FvMk6d4=
X-Received: by 2002:a05:6a00:4087:b0:878:34d7:6a32 with SMTP id d2e1a72fcca58-87e9ea62357mr1039851b3a.38.1790224444046;
        Wed, 23 Sep 2026 21:34:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:34:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 20/24] tesseract: patch CVE-2026-88047
Date: Thu, 24 Sep 2026 16:33:10 +1200
Message-ID: <20260924043315.1663186-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130268

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88047

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88047.patch  | 226 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
new file mode 100644
index 0000000000..04e9953d2a
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
@@ -0,0 +1,226 @@
+From a6e329ff576ad4a90952f08359dbffab7e480157 Mon Sep 17 00:00:00 2001
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
+
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
+index c1491263..48e7dcbc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1213,6 +1213,7 @@ check_PROGRAMS += mastertrainer_test
+ endif # !DISABLED_LEGACY_ENGINE
+ check_PROGRAMS += matrix_test
+ check_PROGRAMS += networkio_test
++check_PROGRAMS += normproto_test
+ if ENABLE_TRAINING
+ check_PROGRAMS += normstrngs_test
+ endif # ENABLE_TRAINING
+@@ -1417,6 +1418,10 @@ networkio_test_SOURCES = unittest/networkio_test.cc
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
+index 6a91c62f..b65cf922 100644
+--- a/unittest/CMakeLists.txt
++++ b/unittest/CMakeLists.txt
+@@ -61,6 +61,7 @@ set(LEGACY_TESTS
+     indexmapbidi_test.cc
+     intfeaturemap_test.cc
+     mastertrainer_test.cc
++    normproto_test.cc
+     osd_test.cc
+     params_model_test.cc
+     shapetable_test.cc)
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
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index 756e780659..61cb1f7cad 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-88048.patch \
            file://CVE-2026-88049.patch \
            file://CVE-2026-88050.patch \
+           file://CVE-2026-88047.patch \
 "
 
 

