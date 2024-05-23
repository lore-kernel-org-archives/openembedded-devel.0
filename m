Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB4CC25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:39:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.232.1716475195696084773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 07:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ANQyqwQu;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f693fb0ab6so3022801b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716475195; x=1717079995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKrdkc53b0hwM8OuCbBFWEkl94/lia7Iosz71IvyTyY=;
        b=ANQyqwQuGwNK00d7YNdc0G0H+KBijnEkftRnijA1uOU+LC9iPApg/0zT7D7xpiJYHm
         a9uWidUZGMWpAMIdG9eJtK/n613xxUNCJZK3Gh7KJ0QryU+hhlD3J5YWqM3lDetuL6bW
         Tfc98AjqPzCNUbIWqJT6aajEab0lTCgW3lZJXiXp4MBJl4W5S6EMDO8gXiBszhg8GfgK
         SiYmjT4xWvd6PO27rPTIwmIfYq2gIsDBZWTa/ylYrf1BKllj1e/VsJYpL1iU9NG9nYeH
         0k5Z+Kvb/6Vb7waYKZp9n+Af5LzFGBw4EEDZWW+nEGOTsqiw0V7P6TJpEpqeS0i10e7R
         6ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475195; x=1717079995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKrdkc53b0hwM8OuCbBFWEkl94/lia7Iosz71IvyTyY=;
        b=eRDwjqajpOPwwzPbbQGgUsmCvdyvMWM7fm6KGf3IBb/qXnqxVpf+fnZoaKpy6WpQNB
         M7v7K7tJQ0FUTzMkI8PbaZZ6W1faLwHFI2Dou5n2CMC5skUsBB00YWbydcbkOZhIVatg
         SJS+RWnnzovW1ECXqVAbLB1NOJwtxANfwOg8NNm5U/KpZwQqTvuRC+bEvBj5Dd0pMOLQ
         V387lr+fxyXV8rVIPh9YaMWxEOvz8pSoJKzDUHnEgN3ExNrJV/TO0854LzYT66Ivf3XJ
         L4fp8qHrDVk4+tGVQGNkROoGbcFxGKAf4P+OEQHQ+Vjd+Bm2HU1UiNa2vwlu5SB+ZCIe
         UQhw==
X-Gm-Message-State: AOJu0YxQQmZO1wOxJNDrHvPcNcacjv9wpU7rcsZrdaaTNqGi7ZeFa3dz
	uXf0Tz5J9YKi/L9pR4yebsK+MBA1S5vvJNAbMj9c4OSX3xcScv5AC7Tj0bAH4A8=
X-Google-Smtp-Source: AGHT+IHmoXA+plrnZTgkyFgsBw8qKbiz5WJoDkVTJKLTzgKiprajvALFISN7SQU4QW2/GDdO4KEQtA==
X-Received: by 2002:aa7:9a83:0:b0:6f8:caf2:eeb1 with SMTP id d2e1a72fcca58-6f8caf2f0dfmr447109b3a.15.1716475194721;
        Thu, 23 May 2024 07:39:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2fe07sm24090347b3a.216.2024.05.23.07.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:39:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] uim: Upgrade to 1.8.9
Date: Thu, 23 May 2024 07:39:51 -0700
Message-ID: <20240523143951.2957739-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523143951.2957739-1-raj.khem@gmail.com>
References: <20240523143951.2957739-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110504

Drop upstreamed patch and second patch is no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...it-path-from-configure-option-proper.patch | 29 -------------------
 .../uim/uim/JMP_BUF_GC_jmp_buf.patch          | 15 ----------
 .../uim/{uim_1.8.8.bb => uim_1.8.9.bb}        |  8 ++---
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch
 delete mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
 rename meta-oe/recipes-support/uim/{uim_1.8.8.bb => uim_1.8.9.bb} (94%)

diff --git a/meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch b/meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch
deleted file mode 100644
index 34a1ea0fa2..0000000000
--- a/meta-oe/recipes-support/uim/uim/0001-Fix-to-set-libedit-path-from-configure-option-proper.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f828a89cc1e956d56498422ec158d284fc97de3f Mon Sep 17 00:00:00 2001
-From: OBATA Akio <obache@outlook.com>
-Date: Fri, 10 Aug 2018 18:38:18 +0900
-Subject: [PATCH] Fix to set libedit path from configure option properly
-
-Upstream-Status: Backport [https://github.com/uim/uim/pull/134]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 00d1b02..9c0a5ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1311,8 +1311,8 @@ if test "x$with_libedit" != xno; then
-   if test "x$with_libedit" = xyes; then
-     libedit_path=/usr
-   else
--    with_libedit=yes
-     libedit_path="$with_libedit"
-+    with_libedit=yes
-   fi
- 
-   saved_CPPFLAGS=$CPPFLAGS
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch b/meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
deleted file mode 100644
index adb9c4b06b..0000000000
--- a/meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Fix error pointed out by gcc10
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/sigscheme/libgcroots/include/private/gc_priv.h
-+++ b/sigscheme/libgcroots/include/private/gc_priv.h
-@@ -2026,7 +2026,7 @@ void GC_err_puts(const char *s);
- 
- # if defined(NEED_FIND_LIMIT) || \
-      defined(USE_PROC_FOR_LIBRARIES) && defined(THREADS)
--JMP_BUF GC_jmp_buf;
-+extern JMP_BUF GC_jmp_buf;
- 
- /* Set up a handler for address faults which will longjmp to	*/
- /* GC_jmp_buf;							*/
diff --git a/meta-oe/recipes-support/uim/uim_1.8.8.bb b/meta-oe/recipes-support/uim/uim_1.8.9.bb
similarity index 94%
rename from meta-oe/recipes-support/uim/uim_1.8.8.bb
rename to meta-oe/recipes-support/uim/uim_1.8.9.bb
index e0d9d05dce..f78c82f18a 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.8.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.9.bb
@@ -4,15 +4,11 @@ LICENSE = "BSD-3-Clause & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab2826b41ca0ff4030d38cc39791d1c8"
 SECTION = "inputmethods"
 
-SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2 \
-    file://0001-Fix-to-set-libedit-path-from-configure-option-proper.patch \
-    file://JMP_BUF_GC_jmp_buf.patch \
-"
+SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2"
 SRC_URI:append:class-target = "\
     file://uim-module-manager.patch \
 "
-SRC_URI[md5sum] = "01c7bd5d0d4f3a9f6f5befe6f57a470b"
-SRC_URI[sha256sum] = "34599bbcc4e5ab87832370763e38be5100984a64237555e9234a1ea225a0fadc"
+SRC_URI[sha256sum] = "dbbd983768bf748449551644f330dbebe859bfeb6f024fea6697ac75131c7aa4"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.45.1


