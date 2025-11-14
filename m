Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFF3CE7AA4
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 09:47:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14462.1763113644208203837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 01:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kewVUYTL;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29568d93e87so16178165ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113643; x=1763718443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wBrxb0wZaP9cM/bYaWSGQAXi4PaLwPGs8qEKSD7HKo=;
        b=kewVUYTLrLv1VRXypdUW5+Ekp6rDkYP31r8esOOmq7Z7UfBxs2JHPyiUU2j52PYuSc
         b7SSl/cUtUZoJBPSLATmQUQBYg7C0tG6vZLv0/QfUKF6KeEEKxNrhmnUd6X17UqTzjCd
         3WvxNuPC6RlbbAUFmM/wIrIUu1wk51o18dYhDEag2UJu+vyxL0ISrV2ghf16fYr0wTmm
         JuDb4do7GiVUqSj8p2slwynFWweMUCrdXzZ+Qgg4AR6R51FpEntFEcVDzetMf5PYHZc1
         FDfkzn1oMzu9Fj7nMy2cH/2DzfhvYdgoPPgYBn4zYUN/MlkizrIW/EA2czSYsDH4n1YX
         UBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113643; x=1763718443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wBrxb0wZaP9cM/bYaWSGQAXi4PaLwPGs8qEKSD7HKo=;
        b=BF9wKEuX/a3V1FI6Pt56bfXNKIu0aqSDQxyWECNDZYAzPj8Ghv3LAkTDHmu0V0HAZA
         44otKRqoFatqc1WLHGsz3QROt6N8JMnV8VRYLn6YSXUsx9kzQUON4j/ILQ/ERrW9+pwt
         HUmjvTeJtaaYiVeFk3ISe39rjTqk6+tMTKV1UFrNl6Nf9EBwU8JIloVP74lguiZpOcCV
         4YFA24jbJKODumL5vYwgM/lP20wP+0p9YhvOQY1Z3WZfrhW8XeUjQyAAiHxbp1R1BvCM
         xl84pTmc6FSVFh89uISGgwbJK6J9jRtbPOfEA8KCklwWvsn2nOGNFvLlrq761UxUZuwV
         Ol7g==
X-Gm-Message-State: AOJu0YxhGtBlLerPGLHWY1acKCXcd1tzWtBnBTsK1qpgTI4NvVETYwGz
	GexSWJYi2vzIMaLACEycqixIL7XK3mGwLMbCACbw2C+VQzv2HC+3pZQCOVPOUw==
X-Gm-Gg: ASbGncscSsHADiwGOfDq1NXjZNUbkwYM2bQW5b9XRT+L1PBm0F7OPUhTb4LNxLteDCt
	G5D0o3uZh4KpzReUnuZXuGFpegNxBCUg8rfA401etAo4xZE+WXQhK4JyyaZ1KeQHMg18R8sulyb
	St6njCyQCiTg88UCN10rXje/3EGDOuXtel+91Pm310/62S2IEualx7AAvx3+GJ647N//+S3BydL
	5qLOvUrQjoLRF8c7cXdyCKCZJyLLTwmcQ22ZaEP1J6ZkeloE1bPtrj6HZNABXmKTbF4KEg+0vqh
	wnsuJuTbFByV2JaBSI73yP1AId1xYZnX6hTCcHBy1Y/MwHzA9fXIGkCz3Mi/N+umDTAD7cjvkqi
	yict2eQ5V/MMIRWdlmM9/KPFBkZa5B8EpO43o4NFhA5Pe5YVj1Z+tgYtAyikjyclnoyk7un/uHW
	oBMWWHwuL6h7cz
X-Google-Smtp-Source: AGHT+IE+J7XHtfiHBegURxRiTaNLvlbeWx7MomuNFD8f4lHeYhNFwTJTz8XWciPGgwad6aFSTkZ8Jw==
X-Received: by 2002:a17:903:286:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-2986a6cfcd8mr26207905ad.17.1763113643022;
        Fri, 14 Nov 2025 01:47:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c103asm49413995ad.96.2025.11.14.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:47:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 5/5] liburing: upgrade 2.9 -> 2.12
Date: Fri, 14 Nov 2025 22:47:03 +1300
Message-ID: <20251114094703.4091777-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
References: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 09:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121706

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch which is now merged upstream.

Changelog:
https://github.com/axboe/liburing/releases/tag/liburing-2.10
https://github.com/axboe/liburing/releases/tag/liburing-2.11
https://github.com/axboe/liburing/releases/tag/liburing-2.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---

changes in v2:
- no change

---
 ...ncluding-missing-string.h-for-memcpy.patch | 39 -------------------
 .../{liburing_2.9.bb => liburing_2.12.bb}     |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch
 rename meta-oe/recipes-support/liburing/{liburing_2.9.bb => liburing_2.12.bb} (91%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch
deleted file mode 100644
index f744812a3f..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c55874bc28f66d606527b940d4bd0f266bbaaa2c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Feb 2025 11:51:19 -0800
-Subject: [PATCH] test: Including missing string.h for memcpy
-
-Fixes
-accept-test.c:39:2: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1351]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/232c93d07b74.c | 1 +
- test/accept-test.c  | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/test/232c93d07b74.c b/test/232c93d07b74.c
-index d3053b9..d5677d3 100644
---- a/test/232c93d07b74.c
-+++ b/test/232c93d07b74.c
-@@ -10,6 +10,7 @@
- #include <stdlib.h>
- #include <stdint.h>
- #include <assert.h>
-+#include <string.h>
- 
- #include <pthread.h>
- #include <errno.h>
-diff --git a/test/accept-test.c b/test/accept-test.c
-index 99f6080..142b2de 100644
---- a/test/accept-test.c
-+++ b/test/accept-test.c
-@@ -7,6 +7,7 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <assert.h>
-+#include <string.h>
- #include "liburing.h"
- #include "helpers.h"
- 
diff --git a/meta-oe/recipes-support/liburing/liburing_2.9.bb b/meta-oe/recipes-support/liburing/liburing_2.12.bb
similarity index 91%
rename from meta-oe/recipes-support/liburing/liburing_2.9.bb
rename to meta-oe/recipes-support/liburing/liburing_2.12.bb
index a645a8e4c4..2519d650a6 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.9.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.12.bb
@@ -9,9 +9,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-test-Including-missing-string.h-for-memcpy.patch"
-SRCREV = "08468cc3830185c75f9e7edefd88aa01e5c2f8ab"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRCREV = "e907d6a342e80b70874f93abd440b92b8a40b7bc"
 
 
 DEPENDS:append:libc-musl = " libucontext"

