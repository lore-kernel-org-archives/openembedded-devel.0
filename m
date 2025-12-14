Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0872ACFD314
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 10:44:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23419.1765709084986554833
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 02:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wt9L1qru;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d52768ccso2919255ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765709084; x=1766313884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQCiH1XG3EFQRAW46O4wxXnwmoBIKM0l+udsO39mL2A=;
        b=Wt9L1qruQK/Ajlc+DJGHIq1S96VMQCBn//0hDJlIQr79fyI/q1Ga/5jTEOuUEL2YOa
         pPliJ4ePx3N7YInYdJwPg/WYE5HOOWsy/8XwrI5AVxI9Kms52mZnuxqM9QbzQABaBWdc
         Mr8YRMtmxSt/QrIzLePunFNbr0hof7AIEObNT10DIXkWiXCoXKYlReMFad7ZTD/B88dh
         jWCBSJ6r/FiFv5ilFhbs1dqYBZA0y/d1J4tP97aonUSbkPTrmA2ouTB5uNRBL1BqzEch
         1RmaT1TUNTB/xqNl9ejmiNa0xpcD/P85fsqIiyzsZBHSTh0AVa1xuW9AHp/Q6eUnkyCU
         VQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765709084; x=1766313884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQCiH1XG3EFQRAW46O4wxXnwmoBIKM0l+udsO39mL2A=;
        b=I0b0ZBEpUyTyCyhW5ESAmL9SyzL8Vbg+M9im1OW3E6CYrU4Wucx2J3yav283cLZVnc
         /6cfexeAi6nfvB1IxpVO78k5tBFjh0QLs9g1HDKnaw4uw74+j2maTZV2pOIfPG7ZyWTd
         YitMZSEY8i1LFYdu50L7cvybaQTvcRC4plBYlF/lSkZ8KHZXjdmhqgs9ITi9/bh7Vjdl
         D7cGUcGAikHKLeX8EJAajGblY/WBctFNVJiEhcAyNl+y+JxJBWF1hJLirC+BQbMioMXI
         wUx4AEF7ihtT0ErdnOAjaG7M9D1sp+TVNPIvBFyeicm+HxC9iYMljDFvI7HHEBkubY+i
         E9bA==
X-Gm-Message-State: AOJu0Yw9AnODwJEnI86mQZe7fMuYcoDiLBngQejUpEbgBS87tgyyYkoN
	iH6tCJibVAP4j0X4Ce/nSa3dM27l0ML2Cs/aTriKF/v24Yxzm+mrS6tFgTLyNulq
X-Gm-Gg: AY/fxX4ibqiyFV/lVyQbcYe74NHzj1yxofsVh5t1esoz9LSrICQoPrBGwtqGF6aw9SQ
	fRuORXr48aGST8ttby3iXF6ckQ/snM7m64piK6Xuco3zHw7jV4ueYx0LGDEGP7sVB4Y8iSEX4qn
	byL7rcNGp6nEf3nxJLS1zIQnEr/KHzRcuZtndUzslqSYUC54uJx65I0sJK851AaWw7OebcGSCCg
	1AbQlUmtQmW+xL+CODQ2/nSe+aHj1lPPC1Yueav4DLvKZsr9J1Rg8mNyd5gEHyprJQuVJSrTL7X
	QBqSJjxX9tgQOusUgY9Q3EMjy2q+GrQBQKz8CbvBjA7j9DupomLbnVEmBiLEkKdALN2Pqv60Ldl
	3Ss+rx0U+SHooC6cT6SdwB1pZprbqmbCb0JEbEBjWEJpt4lTKEypH29rKfEvIgDfBnNyEoClJyW
	5jX8nAknUy+w4OtIH1vvE1MsDG4KBu2vMNmZ1EiHpJ5bSnwJqm0K4J4dxfvWOGgZIK9Mzj/onuE
	FT0BZW7z49ErDSjO+M1SMVwSsYNVHrp
X-Google-Smtp-Source: AGHT+IGB2TCkhnuXDvDVr7PHBKUH9ZuKeiFwmViFSBLJAF1Iyu0QaLuUN0ZXEDbCUH9vDNX6q7KNog==
X-Received: by 2002:a05:701b:2803:b0:11b:9386:8263 with SMTP id a92af1059eb24-11f34c701ffmr4086100c88.48.1765709083993;
        Sun, 14 Dec 2025 02:44:43 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm33026160c88.8.2025.12.14.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 02:44:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] wavpack: Delete unused patches
Date: Sun, 14 Dec 2025 02:44:39 -0800
Message-ID: <20251214104439.1085235-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214104439.1085235-1-raj.khem@gmail.com>
References: <20251214104439.1085235-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 10:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122650

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...act-libtool-and-convert-to-soversion.patch | 35 -------------------
 .../files/set-soversion-and-version.patch     | 26 --------------
 2 files changed, 61 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch
 delete mode 100644 meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch

diff --git a/meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch b/meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch
deleted file mode 100644
index d66ad4f268..0000000000
--- a/meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 25e12cf5918884f232cebc34c92bd548fe40c2b3 Mon Sep 17 00:00:00 2001
-From: Anonymous Maarten <anonymous.maarten@gmail.com>
-Date: Fri, 9 Dec 2022 19:13:09 +0100
-Subject: [PATCH] cmake: extract libtool from configure.ac and convert to
- SOVERSION
-
-Upstream-Status: Backport [https://github.com/dbry/WavPack/commit/25e12cf5918884f232cebc34c92bd548fe40c2b3]
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index adc73b09..7ae5043f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,6 +2,18 @@ cmake_minimum_required(VERSION 3.2)
-
- project(WavPack VERSION 5.6.0)
-
-+file(READ "${CMAKE_CURRENT_SOURCE_DIR}/configure.ac" CONFIGURE_AC)
-+string(REGEX MATCH "LT_CURRENT=([0-9]+)" LT_CURRENT "${CONFIGURE_AC}")
-+set(LT_CURRENT "${CMAKE_MATCH_1}")
-+string(REGEX MATCH "LT_REVISION=([0-9]+)" LT_REVISION "${CONFIGURE_AC}")
-+set(LT_REVISION "${CMAKE_MATCH_1}")
-+string(REGEX MATCH "LT_AGE=([0-9]+)" LT_AGE "${CONFIGURE_AC}")
-+set(LT_AGE "${CMAKE_MATCH_1}")
-+
-+math(EXPR SOVERSION_MAJOR "${LT_CURRENT}-${LT_AGE}")
-+math(EXPR SOVERSION_MINOR "${LT_AGE}")
-+math(EXPR SOVERSION_MICRO "${LT_REVISION}")
-+
- # Languages
-
- include(CheckLanguage)
diff --git a/meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch b/meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch
deleted file mode 100644
index faddb7b754..0000000000
--- a/meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7c1dd729302b7f77f65884df4e79301df1490423 Mon Sep 17 00:00:00 2001
-From: Anonymous Maarten <anonymous.maarten@gmail.com>
-Date: Fri, 9 Dec 2022 19:23:51 +0100
-Subject: [PATCH] cmake: set SOVERSION and VERSION property of wavpack
-
-This is used to version .so libraries on Linux
-
-Upstream-Status: Backport [https://github.com/dbry/WavPack/commit/7c1dd729302b7f77f65884df4e79301df1490423]
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7ae5043f..285b295b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -361,6 +361,8 @@ if(BUILD_SHARED_LIBS)
-         target_link_directories(wavpack PRIVATE "-Wl,-exported_symbols_list,${CMAKE_CURRENT_BINARY_DIR}/libwavpack.sym")
-     endif()
-   else()
-+    set_target_properties(wavpack PROPERTIES SOVERSION "${SOVERSION_MAJOR}")
-+    set_target_properties(wavpack PROPERTIES VERSION "${SOVERSION_MAJOR}.${SOVERSION_MINOR}.${SOVERSION_MICRO}")
-     set(CONFTTEST_CONTENTS "VERS_1 {\n    global: sym;\n};\n\nVERS_2 {\n    global: sym;\n} VERS_1;\n")
-     file(WRITE ${PROJECT_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/conftest.map "${CONFTTEST_CONTENTS}")
-     check_c_linker_flag("-Wl,--version-script=${PROJECT_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/conftest.map" COMPILER_SUPPORTS_SYMBOL_MAPS)

