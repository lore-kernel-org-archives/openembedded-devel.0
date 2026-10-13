Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B142ECC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:41:01 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.361.1791866453950577374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gnBiaEmm;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso765774a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866453; x=1792471253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2azljDXcg9TEmoasMdOM7wxqWIT/xnZVzzgM+sCy6w=;
        b=gnBiaEmmfnbCKDWaEDonxHMt2aPn/Vh6HJbvo3lqWju1/2+QdNGh5lffRLj1fhK1Ss
         RFVSGTnUifl5Fn4Pd5oAfZijrOgRM6yixjtIfYe9oIz3DJ34DcclqmKmicWlal9TBX/w
         79Z+C2rBcJ2F6rQU50ZPp12d28ORAzCYR67B0N0YC8btQwihX9rFlyqR5O7g4YRLapU1
         ukRwUiqzOa4F6FsGOUHprGuGGkRVTaLXm0+RSlY5l27iDIUHkB1FGGnf12UGsGtsFcFf
         zQ3V8tmFtMexUOk09msDdOOfCRxzj0alKqYMutBcXyZXHABh7EuSW7SiegfVG0OOjXa9
         SAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866453; x=1792471253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2azljDXcg9TEmoasMdOM7wxqWIT/xnZVzzgM+sCy6w=;
        b=ptE7dOYvXZm45DLpZDmAwDthkEyIGHqa18YAIpzW6VSq8XjB3aBqDGX+ZKJigcAuop
         WudbL+LpVu3TQb4abTJ1smS74sUDt1zLnfigRxCJ5l7QPQoPJIBNFAT0vxbeLhn0Knlc
         EpDndJVeSfAvOjCCu6+e2JdpPoPQ/UXFe3DfcyZFxdVQgTBriKKCUTmQ6nXkZyXoVUMS
         do6MIgP8qruXEdYPKuH0GLoC9WUqz/+XNOKHI9HKX0ychshbODE3xDO31zCzUkfUPMOV
         4xGh7zeP73UMYCRX5KBN2C6g+I9ckTTR4S7r3JcSLsOyoTfVdkmAldJGVov4GPc8vf+q
         C67g==
X-Gm-Message-State: AFq9FYK7+dpPvafXy4N5AwiUcwwNbLsCYerzFhygkzgWuWx0iIKpFz9S
	UQGqbEOgbSX0zKKn6n6wctz3Xa7aruLyX8ZWWFF5Hx+jZuqs+5auhIhh8/xN7g==
X-Gm-Gg: AYBFou2stIu+cLa77Qhifgsqm7Q2J3Qc+xPYHNBoKsAMt1ehyGBrlWsRwkVDD5/Hiub
	RBZdEpSvc46X1ztrZKmI6MT+tGyFREG8/qfb2a2Q7PCabn2hBWDy4J3quF52/+4zN3PoCLT/jXa
	P2bS2ODH00AVoCrokAxYp9gFaOD1Nih5ROMO8feSImqjYqpw9LUt67X5K/v+uBgWvKuZozCeUPi
	n/qFN6ciLj6ua+Gfk0Zrr99H8snZ0559RQeWoMOvdPWX4ikDnAPQBQ2gCoxFd33VMxEzyaLtaOy
	tIM7UxTP+P1ziR+m0zf0oD1/u5byi8HsMkIc8T9eS2P/EkDPFskH/kbiraMnMxGEQS32XuvrHMs
	GrW7MMJwuBk0jmjYjrtEAZpP4WnBhGPxW2VBPeHjPVoQS8W/pAfI4oTAH1kyTEmnLV/NWr47QL4
	jlGSU2EzYBMXrPAJClzHrOe+uUeScvX/x7mTUiQKVOSxyYDsW8Abya/10UB9AQXNzRt7mxHRAE2
	Qh21GLmpZQn2wi87H3G7HQc7hj+uSWsjsJkeazQ26e9d7oIng==
X-Received: by 2002:a17:90b:164b:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3ab3b0375e8mr8486138a91.64.1791866453119;
        Mon, 12 Oct 2026 21:40:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 13/16] tesseract: patch CVE-2026-88047
Date: Tue, 13 Oct 2026 17:40:03 +1300
Message-ID: <20261013044006.834868-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130827

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

