Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBB7C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:05 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.733.1790224436167171509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B7hXuWAU;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86e6d007703so877720b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224435; x=1790829235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOPsiIuLflelx5nYfMfvki3WyuWrMiONoEzn8gPE17w=;
        b=B7hXuWAUCIsT1yQtL41oaoTC/+wL+vgnLQzpRD7A+MJTrxJyFdDrGkbXGynOsXXyjK
         o6+mnjXU432sE/PNc0RlSp2efUEg0UC+WrOVRooAH3WYt4fATnfNCEfjlwbS6C44ci45
         JnUuyc2WCHCkqsGKkNuMCiH0Ie2L7d53ihjdkSR5+Ureq2zcILr7aR+DIDiJhvmLLUfk
         yP/CyJM+8lxkzWHEGbTp4/TrOL87T4uCtjhCsyt3p1bU7GNapA8aWoPZa1Y+qN0naupj
         6J2xmLtN5nxschpxDbxxzQ7As7W26Fbyz/ePo381OCJCaDsRFM2lcTWEBp97VJeBete/
         NPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224435; x=1790829235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOPsiIuLflelx5nYfMfvki3WyuWrMiONoEzn8gPE17w=;
        b=O/L9VxjJMWdpASCdLr6PI8pUk2r2AFaFzbzRURK04xX6lLoNAZdf12dORp4cNMVR3C
         DC9rfSlqDDScqRPEIRKqEQ13OGCrYPYQmJRByhQGc68YT1Z+dNHwH9cziaybxOHqj/NQ
         utd7ViXZU5aG9SssFMF+cTTzklIf5bf+mxqYaEzHono7a7k6/eNK6o47zgAR7nTZhHLJ
         nXNUxqEa1nuTjtubvI2J1TDEQkfKce5Dfq20w8d9W2y+FHuE9BohIINOJmyeWLAPq72w
         FYqG8z5MQ9K7268NN9c+yugi7DCTF+ZxriIrBRTdTFza0z6nxKz9evIUoDxpuhKh5kvA
         0Ueg==
X-Gm-Message-State: AFuF++kaWZLjHv9P+NPMaBbh8zVUCNUmFJRN8ZSjKYHwcQl+R7ptwb/o
	+lTQNc5x+j2nY5MNUdPnfANynRgeOg/wWTEHC9JirafyidjAO+tJwKxJNLb0jA==
X-Gm-Gg: AYBFou19S08tF7mUOKvmXMXyNnyoz8wDYPOGvbbAQ5OEpAfNiVEtjPMqyvnK06NBafq
	LnGWns1C68d6IQVzkpMdUcYX0YEQ5LHJr4GH2cbE+8bK2FUWEB9B8lr7VKvgZwKaw0KBIq9dxtr
	MgVnv2rx42/WoX/jJt6TIq6A3C8eOuCB6Ms5fMfZlxzkzVL3k5ta2YoQvKXvLdX54SAw0IOO5jX
	LnopgzurRyp2Eibj9s9yP6u4WK9Ye7s/fHYygLHEZQ0DtdxPpD9e3fASHikdzW4ZXa1ncA9Y9DL
	MJPx6cY9lxSccXfTr2BIR/09duPYbPw77X33t+fv1DdvzHmDYfleu0VlCj6I+66ypU8LHdfolKX
	HgrEhmvUi9S/Xc0FgNgamcxiyxAromx5rEnsDYrx6u0y97LZY5TukZZpKQAc3JEHrLyky8APBr/
	nJPnX18/5cMJ2ToUt/r1RBD5L/47w7DlIbg69l72kHDf+ztEvMDG3Qn6cxw6jj9RxzNfvD44bqK
	XsM8QXFnj0w2Foy4myrW5tKGCGf04CFow==
X-Received: by 2002:a05:6a00:ad02:b0:878:3538:8f82 with SMTP id d2e1a72fcca58-87e9f824483mr1058897b3a.48.1790224435483;
        Wed, 23 Sep 2026 21:33:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 16/24] tesseract: patch CVE-2026-88052
Date: Thu, 24 Sep 2026 16:33:06 +1200
Message-ID: <20260924043315.1663186-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130264

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88052

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88052.patch  | 165 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
new file mode 100644
index 0000000000..fb21f6eb02
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
@@ -0,0 +1,165 @@
+From 26355d536f148a45a43cfe8b5b5f4a748d99fe8e Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 21 Aug 2026 18:34:33 +0200
+Subject: [PATCH] Reject unicharset files whose inserts desync id from unichars
+
+UNICHARSET::load_via_fgets reads the unichar count via sscanf and
+trusts it as the loop bound, indexing the unichars vector with the
+loop index id via the unchecked set_* accessors. unichar_insert is a
+no-op for duplicate (or empty) representations, so once any insert
+no-ops, unichars.size() falls behind id and the subsequent
+set_*(id, ...) and unichars[id].properties writes land past the end
+of the vector - a deterministic heap out-of-bounds write (including a
+std::string assignment via set_normed) for every remaining line, on
+both the LSTM and legacy init paths. A malformed unicharset with a
+duplicate line (e.g. two identical entries) triggers it; a
+non-positive header count likewise loads an empty unicharset
+"successfully".
+
+Key changes:
+- unicharset.cpp: reject unicharset_size <= 0, and after each insert
+  verify the vector actually grew to id + 1; on mismatch report the
+  offending line and reject the file instead of writing out of bounds.
+- unittest: add unicharset_load_test with a duplicate-representation
+  unicharset (on unpatched code the test dies on the
+  container-overflow in load_via_fgets), a zero and a negative count,
+  and a positive control that a valid unicharset still loads.
+
+Reported-by: Zhixi "Jace" Sun <g.mygenie@gmail.com>
+Assisted-by: OpenCode / qwen3.8-27b-thinking (Alibaba Cloud)
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+(cherry picked from commit 2d04d640db2e8c7e3bab2369d599343b5a8b8443)
+
+CVE: CVE-2026-88052
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/2d04d640db2e8c7e3bab2369d599343b5a8b8443]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ Makefile.am                      |  5 +++
+ src/ccutil/unicharset.cpp        | 12 ++++++
+ unittest/unicharset_load_test.cc | 64 ++++++++++++++++++++++++++++++++
+ 3 files changed, 81 insertions(+)
+ create mode 100644 unittest/unicharset_load_test.cc
+
+diff --git a/Makefile.am b/Makefile.am
+index 9f2a367d..1a0a6771 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1249,6 +1249,7 @@ check_PROGRAMS += tfile_test
+ if ENABLE_TRAINING
+ check_PROGRAMS += unichar_test
+ check_PROGRAMS += unicharcompress_test
++check_PROGRAMS += unicharset_load_test
+ check_PROGRAMS += unicharset_test
+ check_PROGRAMS += validate_grapheme_test
+ check_PROGRAMS += validate_indic_test
+@@ -1522,6 +1523,10 @@ unicharcompress_test_SOURCES = unittest/unicharcompress_test.cc
+ unicharcompress_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ unicharcompress_test_LDADD = $(TRAINING_LIBS) $(ICU_UC_LIBS)
+ 
++unicharset_load_test_SOURCES = unittest/unicharset_load_test.cc
++unicharset_load_test_CPPFLAGS = $(unittest_CPPFLAGS)
++unicharset_load_test_LDADD = $(TESS_LIBS)
++
+ unicharset_test_SOURCES = unittest/unicharset_test.cc
+ unicharset_test_CPPFLAGS = $(unittest_CPPFLAGS)
+ unicharset_test_LDADD = $(TRAINING_LIBS) $(ICU_UC_LIBS)
+diff --git a/src/ccutil/unicharset.cpp b/src/ccutil/unicharset.cpp
+index b29ec3b7..0e72ae48 100644
+--- a/src/ccutil/unicharset.cpp
++++ b/src/ccutil/unicharset.cpp
+@@ -791,6 +791,9 @@ bool UNICHARSET::load_via_fgets(
+       sscanf(buffer, "%d", &unicharset_size) != 1) {
+     return false;
+   }
++  if (unicharset_size <= 0) {
++    return false;
++  }
+   for (UNICHAR_ID id = 0; id < unicharset_size; ++id) {
+     char unichar[256];
+     unsigned int properties;
+@@ -884,6 +887,15 @@ bool UNICHARSET::load_via_fgets(
+     } else {
+       this->unichar_insert_backwards_compatible(unichar);
+     }
++    // A duplicate or empty representation makes the insert a no-op,
++    // desynchronizing id from the unichars vector; the set_* calls and
++    // unichars[id] below would then write out of bounds. The file is
++    // malformed, so reject it.
++    if (size() != static_cast<size_t>(id) + 1) {
++      fprintf(stderr, "%s:%d unichar %d has a duplicate or empty representation\n",
++              __FILE__, __LINE__, id);
++      return false;
++    }
+ 
+     this->set_isalpha(id, properties & ISALPHA_MASK);
+     this->set_islower(id, properties & ISLOWER_MASK);
+diff --git a/unittest/unicharset_load_test.cc b/unittest/unicharset_load_test.cc
+new file mode 100644
+index 00000000..d775e233
+--- /dev/null
++++ b/unittest/unicharset_load_test.cc
+@@ -0,0 +1,64 @@
++///////////////////////////////////////////////////////////////////////
++// File:        unicharset_load_test.cc
++// Description: Tests that UNICHARSET::load_via_fgets rejects unicharset
++//              files whose insertions desynchronize the id loop index
++//              from the unichars vector (duplicate or empty
++//              representations), which would make the subsequent set_*
++//              calls write out of bounds, and non-positive size counts.
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
++#include "unicharset.h"
++
++#include <cstring>
++
++namespace tesseract {
++namespace {
++
++// Loads the given unicharset text via the TFile-based loader.
++bool LoadUnicharset(const char *text, UNICHARSET *unicharset) {
++  TFile fp;
++  if (!fp.Open(text, std::strlen(text))) {
++    return false;
++  }
++  return unicharset->load_from_file(&fp, false);
++}
++
++// A duplicate representation makes the second insert a no-op, so on
++// unpatched code the set_* calls for the remaining lines write past
++// the end of the unichars vector (ASan container-overflow).
++TEST(UnicharsetLoadTest, RejectsDuplicateRepresentation) {
++  const char *text = "3\nA 0 Latin\nA 0 Latin\nB 0 Latin\n";
++  UNICHARSET unicharset;
++  EXPECT_FALSE(LoadUnicharset(text, &unicharset));
++}
++
++// A non-positive size count must be rejected; on unpatched code a
++// zero or negative count loads an empty unicharset successfully.
++TEST(UnicharsetLoadTest, RejectsNonPositiveCount) {
++  const char *texts[] = {"0\n", "-1\n"};
++  for (const char *text : texts) {
++    UNICHARSET unicharset;
++    EXPECT_FALSE(LoadUnicharset(text, &unicharset));
++  }
++}
++
++// A valid unicharset must still be accepted.
++TEST(UnicharsetLoadTest, AcceptsValidUnicharset) {
++  const char *text = "3\nA 0 Latin\nB 0 Latin\nC 0 Latin\n";
++  UNICHARSET unicharset;
++  ASSERT_TRUE(LoadUnicharset(text, &unicharset));
++  EXPECT_EQ(unicharset.size(), 3u);
++  EXPECT_STREQ(unicharset.id_to_unichar(1), "B");
++}
++
++} // namespace
++} // namespace tesseract
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index f26d2f36a1..a80407b749 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag
            file://CVE-2026-73066.patch \
            file://CVE-2026-73067-1.patch \
            file://CVE-2026-73067-2.patch \
+           file://CVE-2026-88052.patch \
 "
 
 

