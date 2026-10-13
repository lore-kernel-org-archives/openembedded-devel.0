Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAA0CC6B10
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:19 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3439.1791885612287283224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YACoJImQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab33730821so1524778a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885612; x=1792490412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqoBVTvuWIA3oRwlp4pXxdSlrh9dq7DOjEbbCIaPUvY=;
        b=YACoJImQMHK+yMjPtgHKSESef7NTU6ooeS30eCmVdgJ+Dd39PocovWLlguBk8fdIE3
         dzA9QizsyZZWfBce17J5XqYkV72SvlufWcrHOHIssZZhQKxwnCPdUv1xGuhdeFfHPbkQ
         cCAqYyGJeiXS/hptwbH+GAaDYNinfzMLrqBwNpVTfUN0tcxfdUThysvU9Fzcbtbs9Tgn
         Gn+213HGOO440QyWyFJ4qdstmlUStj6eX/aysfMRLJK+97V0yQ73HfG6oP/vpm8uXlWC
         n8a6Dw3jWrs6Rb9OptnOq1bts9nYgWh815uN1lN97QRKZWOPYgJDtWEoAVeqj2z60RXp
         YJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885612; x=1792490412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqoBVTvuWIA3oRwlp4pXxdSlrh9dq7DOjEbbCIaPUvY=;
        b=Y/v5DTbLHlx3EHw+ce8skQM9FBn1+zGYlEe8HRhxb/e1IsCxs6yqkXOWNMANKapEYO
         MsdnMDRiu3izpgrXY638O20cZL836aKAwu8jLDE/9+1CPjl3h28vsVRi/kd9MYf2042u
         KyykxZldRPfROBITEu31TIeTLUbdA1fXWevySLSOJkmBmGqofFuH4I/LD5K88O1iQFYk
         1QCgPF28Gjc8bWYgCxvzw+DQFrV0SNvA3bYnfl2q9gXAo7Afaj1qi2Z+EGEKvFRqYsz2
         Y9hRwroQVGxrxyZXR1taXwy+HO50uji2JDZy/9KlLbX7v/skZ5nOwzPFW1wE/t0C4PFJ
         lnGA==
X-Gm-Message-State: AFq9FYIWtt5ZWLhau3UafLckiffM6bfQTD9bEGVJoki7q/9ZDwCJ1rXh
	Q4fHCGZV9VS3j49SIPjDmpiam9uOsdwiJd+ip9TvKksuKlbRDqQ0f3sHJDtcvg==
X-Gm-Gg: AYBFou0RC/qOxfx6SmnxbPQxUSEYXpaUUbFh1WY1fJFHy/YifZXvOAUIZkLjc5dBQHh
	f9L8u+WL+oH5w0j8C6QmobnqmtBks5pQFM8LDLsFCwR0xeO6vQO/Trdr/9khZbWry7ktM8AvC4+
	tlZseP1FCUc5JnQW7Eii2kIfdG3dfInTb9oAvT+ILMbaSxOVgQfdpo7TuPTteOz238rLynBTJW1
	jgnhSA8GEaMHxUEk/f4I0jkmtkJXyHuu0/sfKocqux7FNe9p7/XMmkR2O/u4pmIaMyO3TagcZoI
	t3tm1ofFY/DlnJTlofciRsJH+Cpljafzt1cwlivTIpXGpuYdiiuSlhslMi+7VRfZia8ozfqNoTx
	BSEKaYTMoVqLaAE06Ad4wXr+vb6jo9pAFSc9/EtRR9rCxxmJh+OHUdo4xP58PF632qSZi+ZbS6n
	UCvvPW5rkQmdqeG5GAZS/s+bZJU125zXuvdFbXx3GOOsdmi5Sk4vcXRkiBk1bSLRn0QouyUhqHz
	EYcgqRwrhWR2JkA1beqcWX9JTxh/d3pmS+XTpc=
X-Received: by 2002:a17:90b:4fcb:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3ab3a609f14mr10005233a91.10.1791885611288;
        Tue, 13 Oct 2026 03:00:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.03.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 21/28] tesseract: patch CVE-2026-88052
Date: Tue, 13 Oct 2026 22:58:56 +1300
Message-ID: <20261013095903.3544906-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130854

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
 

