Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F20CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 05:38:00 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.16310.1755149873133642350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Aug 2025 22:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyIh/Brg;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so625571b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 22:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755149872; x=1755754672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYFkFXeMQd6L+vlncD8zc7LkkQ0xNRFACtg83GQR8Ws=;
        b=gyIh/Brgm7ybR0VIlGbyKghBV+PWe57njnsywYZkwA0CGBufonxKCr09x4owrSj9Xo
         RgenctsPg7jFltEs5ltV2WZ+aQzup4E1GC/hsuZs/JnzHyMNS8OXco956ohrsrHZ34Ox
         7Y36RtApYJzvn10AbyEHmAwOJBl5607HHMzJ/EDd57MrZ81HaqgN9pG/+o3Adl2dp53j
         /I3YOc+yodr7PeAfPvDRc9ymALgNDZ7nG2LsniRQzCAjxJe9TgIsefSSTn4PkAI3YY3h
         t5I/EENug1yvz2fPdW52335CxyFkK0OkhZq1xi6pSF/3GEny7TwIXVjjDBog/PMTaWwQ
         BN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755149872; x=1755754672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYFkFXeMQd6L+vlncD8zc7LkkQ0xNRFACtg83GQR8Ws=;
        b=wsyTbfKAu7I/wAed6/eiw5skk8AmUzvOdZfM1Y/a8EkLTf9k7JHixohu0q8KQRAnsu
         nGSsIqrUoQAuhdZUkRrcjvKOAyQZgHFc6PyBJNwnMMcEgj7bCZ1hBydZUhbxsc/jkJq2
         TewkC6ToL1FNx57//47oYr/77IZsfosdoE66bWVN3osNwUqOof1y0ZzglRxh1hwc/71+
         hzwaiaVxz/2t43hhyMoOv4lY1Lo/0OyWiYJt430d9huVxhV/FhCz+20E5ILpSJ2VAUtK
         S1gh9gHTGOf3Y77XZ8bNVoiqrSsWwS2KEHGEvDRev9Psb6meyEYWBqE7WW1f9ivTUvK3
         nqXw==
X-Gm-Message-State: AOJu0YxN/8RkoSNJKon/THm6DfsdbJaRNsnHD4R56SeDCdbqk3MajQcL
	yBuWcuwP81bPjz69+Rp2zJw/ZRw5cjb0K49sCMMEwc/MaTEA+aykjwbSuEuHFF8T
X-Gm-Gg: ASbGncv4jSDr/+vjHbTVqipY/KDTtiMdjypLUOswVL3AcumErng6OCSvs7egjJ1gUcG
	fcJm/lTe683pb+bpwg0+tSFD1sgLJRd4hja54JffRI61jZbqDnesJbB5nxRkKYMqvdBhkYlKRBc
	/XL0fhmz5F0Z5ayhIh8BxylaffQsoIdMyniW3YzDsCWg45qTgGVZRzhZemzDDEK866+07V/pwdx
	FVm7v2Ook8eD+LPcq3HGIGvWIBwQ6DKOp6sDrMdsiE20vpEp3VcQt6bEOEq/A1Kfs1cjMjO8JJv
	VHuICIThC79AWWS2U0HlkOHfIMKMZHYLEPYLLKe4Ae3ULDJhIp53Xhn8/xTb5/VAfzr6A3Ih0A2
	i7HEOO5HDct4kAQArheNA
X-Google-Smtp-Source: AGHT+IEuWmniM9oKWFy6ni54Z2u3zKl5FB7nwsx2pcm3f1TOT0LSlEZSqPS+SqgFsGT3hYCe2q7NKg==
X-Received: by 2002:a05:6a20:1584:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-240bdfa3fb8mr2446405637.11.1755149872015;
        Wed, 13 Aug 2025 22:37:52 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd78875cesm32381465b3a.15.2025.08.13.22.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 22:37:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] protobuf: Delete unused 0001-utf8_range-add-version-marker-to-library-19009.patch
Date: Wed, 13 Aug 2025 22:37:49 -0700
Message-ID: <20250814053749.1879337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 05:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118929

It is already present in 31.1 release anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-add-version-marker-to-library-19009.patch | 43 -------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
deleted file mode 100644
index e58fdc1d19..0000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fd020ef700dbf2d324aecd087b8fcb6ff329feb6 Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Thu, 21 Nov 2024 11:30:17 -0800
-Subject: [PATCH] utf8_range: add version marker to library (#19009)
-
-Unversioned libraries / libraries without due ABI indicators are not allowed in certain Linux distributions because it precludes the concurrent presence of multiple versions.
-
-If you have both /usr/lib/libprotobuf-lite.so.28.3.0 and /usr/lib/libprotobuf-lite.so.29.0.0, both of them want libutf8_validity.so, but if the ABI is different between utf8_range 28 and utf8_range 29, that's a problem.
-
-Closes #19009
-
-COPYBARA_INTEGRATE_REVIEW=https://github.com/protocolbuffers/protobuf/pull/19009 from jengelh:master 1a5f8682be2f2b84da07fcdd32474baae8088959
-PiperOrigin-RevId: 698855702
-
-Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf/commit/ced605d0e6a7ad20985375b596b2ca6720e07737]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- third_party/utf8_range/CMakeLists.txt | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/third_party/utf8_range/CMakeLists.txt b/third_party/utf8_range/CMakeLists.txt
-index 4276b97290..e054893c63 100644
---- a/third_party/utf8_range/CMakeLists.txt
-+++ b/third_party/utf8_range/CMakeLists.txt
-@@ -19,6 +19,15 @@ add_library (utf8_range
- # A heavier-weight C++ wrapper that supports Abseil.
- add_library (utf8_validity utf8_validity.cc utf8_range.c)
- 
-+set_target_properties(utf8_range PROPERTIES
-+  VERSION ${protobuf_VERSION}
-+  OUTPUT_NAME ${LIB_PREFIX}utf8_range
-+)
-+set_target_properties(utf8_validity PROPERTIES
-+  VERSION ${protobuf_VERSION}
-+  OUTPUT_NAME ${LIB_PREFIX}utf8_validity
-+)
-+
- # Load Abseil dependency.
- if (NOT TARGET absl::strings)
-   if (NOT ABSL_ROOT_DIR)
--- 
-2.34.1
-

