Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 68268746D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:10 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u46so8062196wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+7ba9A9gbJoFr7Kdze9Vcv5XiGr3akH1/GGPDl9gVIg=;
	b=XsdxkdbG0Ft2fWhcMr12VXvl42YzEqoBFCEO0EqhPQQeuoncrZYoDArL3/2rtrBJcE
	cYuvk0jHuIgE40y33pHArKZ7ff9XPbcGDFh/8kBxz2D2ou8EmEd69rcnlaUJGn8NIAVu
	PitMn1MJ0C4t8Cp50msShYhYQ78wvfJbDV1E0CcqXSFY8vpPFJQn6ZhuvSasDenmW1fx
	NBOHpu2JpNomPnORXFyekYnB2LM0mmtoyzgf/A3SB4AOGFLcpF0nzMli2X/OBFi7sJRc
	gr9J8jKtFVZMgw0Vh76ZErM17FFbnxAFH5nyHV3ZMRal7WzGMowUGgWRjfzvuur9o4qE
	ocHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+7ba9A9gbJoFr7Kdze9Vcv5XiGr3akH1/GGPDl9gVIg=;
	b=agMyk2mvwteHxg1tWbLmRcWy73xH2/V/C4T2RrEfXelwZONd7vAGSCCjOgrGf24xSN
	52J5bNuX1fWav20BURgmYf96ku8WwTiG0jLVSMgFWgnLR7PDe52+i8EoL0F4K3PBQG+X
	B33l3BJjk0XrlwY3MXzG9yicwJMgBvIk2f1NjQUEyibZeUnvhNICyxuyF8aeif+v2edO
	+GFpM5w+wvcgLhvzKlKDDrU3X8OmY6YH8Mlf/w/h/FpASGWTAXCEePgFNO2XFLNLWcY8
	CdIgLSQXaMJm07RxgdjCGiBjFNmGXeuq4GtlLrcibcGNM2fSb9lhkg5ZC0XPZMW2j9gT
	OTng==
X-Gm-Message-State: AElRT7E+JGVag4yZdIylByboakZi0dkdj+houOxP+DrFaJDegd/53Ndc
	NxZR3pr3/qLfWpyTgH5uLtN/Ag==
X-Google-Smtp-Source: AIpwx4+NIQvtXnbrOoExwuNF+T5GtcX6WtDUeqjgqBcR6y+fvS5YIEsTu5gKNfJcHDgmSabYV0kl8A==
X-Received: by 10.223.155.154 with SMTP id d26mr10580890wrc.8.1522416730690;
	Fri, 30 Mar 2018 06:32:10 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:17 +0200
Message-Id: <20180330133151.25882-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/39] mozjs: refresh patch Manually_mmap_heap_memory_esr17.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2018 13:32:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch       | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
index 15ad03f71..83f454319 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
@@ -1,4 +1,4 @@
-From a0c0f32299419359b44ac0f880c1ea9073ae51e1 Mon Sep 17 00:00:00 2001
+From 1d1fa95c8ff7697e46343385a79a8f7e5c514a87 Mon Sep 17 00:00:00 2001
 From: Zheng Xu <zheng.xu@linaro.org>
 Date: Fri, 2 Sep 2016 17:40:05 +0800
 Subject: [PATCH] Bug 1143022 - Manually mmap on arm64 to ensure high 17 bits
@@ -16,11 +16,11 @@ Upstream-status: Backport
  1 file changed, 71 insertions(+), 2 deletions(-)
 
 diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
-index 5b386a2..38101cf 100644
+index e5ad018..4149adf 100644
 --- a/js/src/gc/Memory.cpp
 +++ b/js/src/gc/Memory.cpp
-@@ -306,6 +306,75 @@ InitMemorySubsystem()
-         MOZ_CRASH();
+@@ -309,6 +309,75 @@ InitMemorySubsystem()
+ #endif
  }
  
 +static inline void *
@@ -95,7 +95,7 @@ index 5b386a2..38101cf 100644
  void *
  MapAlignedPages(size_t size, size_t alignment)
  {
-@@ -319,12 +388,12 @@ MapAlignedPages(size_t size, size_t alignment)
+@@ -322,12 +391,12 @@ MapAlignedPages(size_t size, size_t alignment)
  
      /* Special case: If we want page alignment, no further work is needed. */
      if (alignment == PageSize) {
@@ -110,6 +110,3 @@ index 5b386a2..38101cf 100644
      if (region == MAP_FAILED)
          return NULL;
  
--- 
-1.9.1
-
-- 
2.14.3


