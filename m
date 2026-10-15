Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753D3CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32867.1792043127089226286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nK9LCOiK;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8246b13cbso36322545ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043126; x=1792647926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RqoBVTvuWIA3oRwlp4pXxdSlrh9dq7DOjEbbCIaPUvY=;
        b=nK9LCOiKDLaSeAAAoYqjm+ScUPAs6B7y7JA6qEAJRdSCFbPM4m6YRji1vfhPUhVgIB
         dyx01FXaZ5iH6DlLEgq/T8KF7eBJNDAy5Tj0UCqogkoekeJ8g2r22rADT2KAqbXR4a1r
         iWbXY0LwD4S7JjUOCzbbLg13GMzkc8+SXa/rqnoxMx3/peZLcPq8t7UWqgHuR8RL0RBX
         ZjQcWZiAmJNOxTRGh3PRt1P5q60aYs6Ynt0OBIAqaxhvcffhmd2LMbYkAWJwNcOL2RrI
         +3oiwja4M2Ijs4g9/ecGysYOYQ+b7LnDCS4ybztwlISWAlDknroLmqNz0D/Emjq0Eq6k
         j7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043126; x=1792647926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RqoBVTvuWIA3oRwlp4pXxdSlrh9dq7DOjEbbCIaPUvY=;
        b=f5OJdGtJbezfbG/OdVXt44VscMB3JSLA+HQWAu/bgtNKO1i1GjAelJP6H5XzD4DtbA
         sZHogzCDnn8VW0fh9d96KHJYaxByE3r5/NFD8IeG18PukKg9Rjz9XQ6Gc0ENLP1zIOvZ
         b4xunNvKLhl9fbJVX6h78myH1HOw769TDDtPBq6M36FOynzH/aN3xLKjZ2vwJhu3YDII
         RtO1fotTUw1sdVwAMnLQmCofMMa6vgp3tTfKMicysfPvLXVxfFs4m4byszbFQleGhXHU
         ZysLP3R1ARbVmSURBFs7PIu1sL2AKb3aqxMfwW0Ms0bY1009tUz8R8ayKGrahS6bJpAA
         zoWw==
X-Gm-Message-State: AFq9FYLmjHqc8tbk195kwNqI71X9JMD/cn++lhCONJ9T8Agvqhb9MPJQ
	DQ2hyZkrL/oQG7ovSg8nhd1sx6xdNEJRQTNZ2i7HxymVHJLZl6i5ZyhPx6M1qQ==
X-Gm-Gg: AYBFou1c1+lNcNoXETNSduyQHPMer+nu/Ki3S68bO+J62iVZBI6PzwtoBjnj93bY9Ny
	YqYcNp1jlchApGP6kXdKkbNIDfSfIzZv4aftz63UoSgG3vj3b87ttfIl5Hcn8DImz5pewV3dKxD
	OsnOqoy5nHEf1bqhnGIkupN1BJ81uJsu+etb6By2GqUW+bWasEHVht8W3zqoJsAI6DKux5CyFpi
	wSzN7LYMnewclsV0xTvBneHYNc/koOyCYruNplSkDLBRFq8vPYs8a/Qu8a671sk9Le4znV8OG1R
	aFir+zzAuPATswXSO2TJIy3Qpqe9uqo39/zjCWJoevw+4Ssk8XigthkOe/YLxtSGE+JdO9AW4DS
	JAAElqLFdiLZASrJV+EaXg+WhMejocdYPtpEhwz60b5BTAczI+6D6krLCObX4Fu8y4eYYd7qajf
	PWBbiEqlf0NrS8DpcR+To8TXQIjl7Fv5jAq731L8K9dyhtXCn0VHYPWFIHRqc3YLesERDZEAkso
	LrjvTPI5w30MUYJYlq3zE4=
X-Received: by 2002:a17:902:c943:b0:2e8:1d5c:f6f2 with SMTP id d9443c01a7336-2e842ab21fbmr172443515ad.24.1792043126329;
        Wed, 14 Oct 2026 22:45:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 73/82] tesseract: patch CVE-2026-88052
Date: Thu, 15 Oct 2026 18:42:01 +1300
Message-ID: <3d862201ffa201c5fd627852f11144ce7fe1cdd0.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130993

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-88052

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 251dd7f80d1fc19515e162f5afd1eb889839bbaf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-88052.patch  | 165 ++++++++++++++++++
 .../tesseract/tesseract_5.5.3.bb              |   5 +-
 2 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
new file mode 100644
index 0000000000..e55968135a
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
@@ -0,0 +1,165 @@
+From c60ad589ff3a645a3fdf13cb24fe719313145a06 Mon Sep 17 00:00:00 2001
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
+index bec9ab0e..22c2c7a0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1220,6 +1220,7 @@ check_PROGRAMS += tfile_test
+ if ENABLE_TRAINING
+ check_PROGRAMS += unichar_test
+ check_PROGRAMS += unicharcompress_test
++check_PROGRAMS += unicharset_load_test
+ check_PROGRAMS += unicharset_test
+ check_PROGRAMS += validate_grapheme_test
+ check_PROGRAMS += validate_indic_test
+@@ -1493,6 +1494,10 @@ unicharcompress_test_SOURCES = unittest/unicharcompress_test.cc
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
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index 0d9b178dc9..81359b761b 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -6,8 +6,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "db0ec62f81b0737fbbe184d8fea40af5738f8eef"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV}"
-
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV} \
+           file://CVE-2026-88052.patch \
+"
 
 DEPENDS = "leptonica"
 

