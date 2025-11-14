Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A618CDE001
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:50:46 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10458.1763092245434900129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPqN0+Oh;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34361025290so1309915a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763092245; x=1763697045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9Wzd99L1iU6rTydkIGkOdzX2EFHnYWuN0TO0X/CPYk=;
        b=UPqN0+OhVBvPrycbu5SvJMuSuxjETWJLqkwtWmBRTcKKUPctb89k/OUK/Utlu9hhUF
         k2BozCLSKLlqAKC//52Kc/VZNtsZYNBCy2adStjCE2goZWmiprmn+Q5DV10kyj5xaCkD
         CIlgp6yZ559pyX+Z+ozQ4gxs3zRcVsXbNRgf2kumaPGdPAdGnsZL1D1twO+IXVn7MDMc
         G2qvwpSItCXBrcLN2fR4KaVYNfb6Ulp6T0UzFV2y+o8KD5eGAKNJ+iic0nqDS0aQI3TA
         o271hvY609BBD5fg12o10Nzm+uo2TdG/icsAkVyogo1VcZvG8+mRrzCO9Y20i/TcKzDq
         1GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092245; x=1763697045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9Wzd99L1iU6rTydkIGkOdzX2EFHnYWuN0TO0X/CPYk=;
        b=H2CIgQs5eglyyEGkQLdqX/NQ+dsulelgnrXYRy+7ONp7rRA2YZ1ACm6iyblvsZ/qr0
         Gv9H9HihjUAaOVVIC/CNwAvqOFJWVhL51d0CbJuTZizifBGT7fj8a74Lbcd2Dlw7CSiE
         Roq60W+y/J/Dl9MTL6nXEdL6KbY+L060MJWzDbStSdnaE/jzAqkCCfWRpo+VpGUo95jO
         yfCs5l6EjpMGxqiYVyb54nQoFG7qkrD/JetOtGQdQRF6XZJw0tovBnkdwFYEXCALrQ8e
         ALB6bsD1nsS2tj/slv5ocAHWtSK1MUhMkZwMDoASq4GEprNjw9dT0XfB73HXTnHhHKbV
         4GlQ==
X-Gm-Message-State: AOJu0YzOHiHo4DsKRzZx6Mtsui3BlrAbpABciD/ICfgL+csUI09M8sPg
	k2XwgH5eajr60JTIgS7PrtaLkStOF2TQnzSm6Gpo4N4uKrHyu40ZTgJTRibnXA==
X-Gm-Gg: ASbGncuElaC2yLIOVPnD3Wq3DWz7V5BoYICR9WQXUIZLO53TdheKOrW7U3RGVadKr34
	URb7mdQ02alCZAe3/enVEfTavJj3OpizN7dbZWClyWxmv2AzVR53Cgbod2uVEh4dQxYgoNYHZ0h
	b6NRW6LgCHF1pZj7ISJBWb2FxPH9kfR+gvY9huTQTL0Xe/XoOw3/zD2RTxKXQl1e032dqYk93t7
	boWdg9nqMavcDutsbu4kK6lBN2wrifDZzljZ8Qyv+PE6mLz37XpPk9g1mFE5scD9iihlafhGg6X
	1G9gnlS6uMrzOQ5MLbepytrgrKoHJJ3k8luuk8PWHrlPLUd6HbvZswp06Zv6w91h2eCEfKqhYYG
	sHqir8aU5f1qsXF7QKm8agxqq/xL5jDkY84l0QpK8ZK7LTaTTtzFTCRTsx6BwOT6PUbI9icQn4x
	QhjqvWrB3tFLYoarSg/Sp3xVPB
X-Google-Smtp-Source: AGHT+IGfpSXYtOzaisj0JPDGk5937Ow5czzyw63onxKVr1K6e5n3f1KTsfPWRYi+w59zQ4dx1LVk/A==
X-Received: by 2002:a17:90b:33c6:b0:340:d578:f298 with SMTP id 98e67ed59e1d1-343f9d90cadmr1945150a91.8.1763092244526;
        Thu, 13 Nov 2025 19:50:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm3478092a12.23.2025.11.13.19.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:50:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/5] liburing: upgrade 2.9 -> 2.12
Date: Fri, 14 Nov 2025 16:50:30 +1300
Message-ID: <20251114035030.4042745-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
References: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121681

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch which is now merged upstream.

Changelog:
https://github.com/axboe/liburing/releases/tag/liburing-2.10
https://github.com/axboe/liburing/releases/tag/liburing-2.11
https://github.com/axboe/liburing/releases/tag/liburing-2.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

