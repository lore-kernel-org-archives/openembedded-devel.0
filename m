Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63849C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:50 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5290.1785589964528592899
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gSmZqDAf;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1097009a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589964; x=1786194764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFN/T3Uq7VtAp1PipMkUjUCT2/zp+F2ig3VRnVy92vE=;
        b=gSmZqDAf8cVMCzEKVBwenCaX/p2xtHb4i8vbJtRHFxVnLoihK6keYW6tJUS4Oh3qe0
         FtoUseCt+8r1ZoVWx7p8BrVU7IWAdkAevLU65E2ejRcBTqsi6yxG6F7AzemA04IUdbuX
         o5Wbyo5Pqdx140kbSwTfQiOpUNq8WDEXjO3DdG67e0zuJWF0D5VORxlOntHkrFMU5662
         YM8zByAUtFO/p8aJk7lUghswo+n1NmhWYFslOUhXGt273Qobwnt9UGOgqsqX+oGm6ZHz
         ho/l4IDZcswJjwkgGijaVY6DVv2ltbI/vKOh4D2Ondsx1nr8QN6loaEiHUNfzU6sdpQo
         6F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589964; x=1786194764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFN/T3Uq7VtAp1PipMkUjUCT2/zp+F2ig3VRnVy92vE=;
        b=hpXrPWqPOaz6c7SQhkR1E09f+tqxrwtsdvGOTeHygr9j1sDZGltl4iygoLbtZdrPGF
         NaKYKtabiT47rWZHqVJvHGS+82G4cIG5IvTFCRK1n9Si4kHVCh2wgSDc3AsPMX9cu7vi
         oTVlkfrpEZRgP7Jkz5MGlbaCpHiBnl/ZCxAG590SfKaE3ESP0o4INVKGQoh/EEc8uBl8
         KlFkNjHcrLE0/hogo+xsQEvMnnhJ9rKM+bUhaCSA74vra5NPOAAm0cHxIT1hXeBNMhK/
         jmZaNHz3dztDWLBy/xszEOCg4aFxE04/ZrtNZQkq7ddJaNEFqwfHLfeTBjfE8g2haVnj
         5+pw==
X-Gm-Message-State: AOJu0YyP6uy+cZv65JBZ0c4y64lGEIAdn2RdFFp+BvtLWNP0BCQ7WhyV
	zG5GHw6NlZhNveTrkgrykHXxoGgVj983Ch0DZnTVsbR6s/XtGQSe2FG4Pmdq+SnS
X-Gm-Gg: AR+sD10yZ7IN18hrnHZQgl1zwnb4aALPUKNmqYVwAjB3yjWfeiwlWbxIMn9FR3osqQg
	Hf0gwETASUdimvXICxfep9IzJegX53UzOP6ejBaeMadxRUexqRLLyQSYcs6m1LIeleVVH9LUFIw
	DKWza4W1+NPsewhDwx58xQb38AEAvzRuvPpErntG42IsahBZ3FnO/EvtVP+3gWXBYUFUQkZCEqv
	JUIZHPQqKCZOacTA3sxxvVS9ut3ztthRXls+AeoM7Od6Lp6MBhTrBlbAmlh9xs18E9crdYDAvQ+
	2iOgKeWJE2FMVYUCHjY8Pb75GxMk7lo9XDmbdBPMUd2wC+hW2eDr2MXK6XoYbxKzjSo4NVxj5YK
	Vs8b1u15y6cvjQkZ1TfRbpogb0+Acs0Jx9DWmq13tDoYtLrldbYsHS/esT0CKlUBcE7GOmEJz0F
	T4GOfoBL4tavNTPpjQeYbP8n+ID7JYQ/G8RjSwYBy+H/RZ/7E8vW8dBaZ9rkv9noyZQZqJrd2gQ
	A==
X-Received: by 2002:a05:6a00:4c95:b0:847:8d54:f4f9 with SMTP id d2e1a72fcca58-84ee496944dmr2839546b3a.51.1785589963850;
        Sat, 01 Aug 2026 06:12:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 20/20] srt: upgrade 1.5.4 -> 1.5.6
Date: Sun,  2 Aug 2026 01:11:38 +1200
Message-ID: <20260801131138.3299410-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128614

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.

https://github.com/Haivision/srt/releases/tag/v1.5.5
https://github.com/Haivision/srt/releases/tag/v1.5.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../srt/0002-allow-build-with-cmake-4.patch   | 43 -------------------
 .../srt/{srt_1.5.4.bb => srt_1.5.6.bb}        |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
 rename meta-multimedia/recipes-support/srt/{srt_1.5.4.bb => srt_1.5.6.bb} (90%)

diff --git a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
deleted file mode 100644
index 8c91e3919b..0000000000
--- a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 5a71ca427a10fe89ad48e9dbb6641e4403d81fa7 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Thu, 10 Jul 2025 13:30:25 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:10 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/Haivision/srt/commit/0def1b1a1094fc57752f241250e9a1aed71bbffd]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 328a433f..448d6254 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,7 +7,7 @@
- # file, You can obtain one at http://mozilla.org/MPL/2.0/.
- #
- 
--cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- set (SRT_VERSION 1.5.4)
- 
- set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/scripts")
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-support/srt/srt_1.5.4.bb b/meta-multimedia/recipes-support/srt/srt_1.5.6.bb
similarity index 90%
rename from meta-multimedia/recipes-support/srt/srt_1.5.4.bb
rename to meta-multimedia/recipes-support/srt/srt_1.5.6.bb
index 72e9ff658d..b4ae8bed09 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.5.4.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.6.bb
@@ -6,10 +6,9 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "a8c6b65520f814c5bd8f801be48c33ceece7c4a6"
+SRCREV = "c63c311e88aa55e430e3b7d94b89d790994f88c4"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
-           file://0002-allow-build-with-cmake-4.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

