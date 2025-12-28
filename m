Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF61D3B7E5
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 13:39:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24497.1766929174337523130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 05:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ag6tqN0Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so7469617f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766929173; x=1767533973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62Z6KiK/nKNwuh2eY9B4PBjmPZ+lTR/ckSGYe9d2C08=;
        b=ag6tqN0YkWu8UbEM+teHQPoZFrivdyesvRfh9jfRzvhsb6r2BmLSuCoWdhfAbqxxa5
         tXbYJRtTATGuLxk9Qa1nm92Mo4xFDCOLKbY2NUMUFb5za/3DAt6q8WIN5u/oua9L0vji
         AqGRQSMaTBKLW8I1O2d6eQrEmvRRhznvGaRMKYDSCBDWfFKQHlnRDjabMBbP9yM81A2A
         AXFQxXXOM6xSPsimZ9uhzS21rYQFmy9LWblneYipMvDh5rOMiI0R+8c+vOvHLpCCysET
         ebDjQP94+YqN4CXFw46Lh/a7OFY1BAj9KlAwlb2P0dCS0xge4PC9pKYXjXp13FM5YF2J
         r28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929173; x=1767533973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62Z6KiK/nKNwuh2eY9B4PBjmPZ+lTR/ckSGYe9d2C08=;
        b=cvYYHchaGdX9GBiBe9fzREd1uNABJjxNt+FyDXICu6eVQGk7gVBlAVi6kK6/SrWXbb
         1ylqWTGD/i8ul5+c4oYmjovqlge+KBDGk2wOSi4dKBt+tsSGpUljGTWCmfR/R6S3FFH2
         ePtp1m5RCKm+Kse4F4kM5QdjUbf+GoyxfSh6bKYw/8G4bxDXTNyLrzH7juNFLWnn3UUq
         8PnI1koRQAT43xfpksnFzRgQm9s8aNktpHYKAi3omkME3CVYDNWmdQfKbzn9cYvuDNhL
         wzhf2fcAew5/JWSoGN2lk4srWMIlBwWsR0+B82g1nJ4whSx3UZfbYpuAqXiSWtGN4MQu
         Kw/w==
X-Gm-Message-State: AOJu0YzZh9458IDB4/tqVLSfJLvE7WVMFxEHfcS6Rgdz3AQnRlaOQ6qm
	h1JcH6T4QMUWJMjLR9OFLRfqEtD/p++y3r5W7YjiO5pZqQ9b4V81RcstxHYkIQ==
X-Gm-Gg: AY/fxX6H5qArZ3fRPs2U+ol5R6jJWfipxsPaRIhLJzP8ev61tNAVhhUoorszHlzEAW2
	E98olI3Ka+o1qybuRtDqjEXYNmXr2Upbq8KpIL0ktSPUkQxwd1mwp8ZMWJr0lhks8bCtUC/1FAL
	hlYW/NkVy4rRQ0KgeCcW8fj1LpkZKxwZm+CI0gukt7TG5PEChz0ww81nzibCNRDuRWfG2K9LHxq
	uZRDT3sJHkAhSfg0sEF2MOThqisobX0yVSnHOqfhOCdVV/HuPY9HknOc3SH6wNCkokx4dJqsh0g
	wUYzIlseUehh/0mgjV7GIsmNf4aU0/+6BOUXur6MKGgofT/mtZEvXN+PRZkQTQgRB5dvhznbvLM
	INKex0gpGelLSPE+xSq2iGnXvtSWRRYW690xLv6mgzdPBqiUao2TxD+bR5ZuuAvPxzifwlqso+j
	b276MPBviM
X-Google-Smtp-Source: AGHT+IFHizzxp6JY27sedb6VU4xjdrOAal1B2JKrfrFq27BVaIj0nkcLnSTTgvW18Nbfp2YCD1jE/g==
X-Received: by 2002:a05:6000:2504:b0:430:f437:5a6d with SMTP id ffacd0b85a97d-4324e4c9e74mr35451587f8f.22.1766929172590;
        Sun, 28 Dec 2025 05:39:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm57457874f8f.37.2025.12.28.05.39.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 05:39:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/3] nbdkit: remove unused patch
Date: Sun, 28 Dec 2025 14:39:29 +0100
Message-ID: <20251228133929.2662904-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228133929.2662904-1-skandigraun@gmail.com>
References: <20251228133929.2662904-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 13:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122964

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ver-Fix-build-when-printf-is-a-macro.patch | 39 -------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
deleted file mode 100644
index c7ec41eb9a..0000000000
--- a/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 28f07715ab4d670ce81e12776bbece043305bd83 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Apr 2020 15:08:39 -0700
-Subject: [PATCH] server: Fix build when printf is a macro
-
-clang complains on x86 when building
-
-main.c:116:2: error: embedding a #include directive within macro arguments is not supported
- ^
-
-convert nesting include into a string assignment, to same effect but
-making it compatible with clang as well
-
-Upstream-Status: Submitted [https://github.com/libguestfs/nbdkit/pull/3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- server/main.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/server/main.c b/server/main.c
-index 748122f..c0ac874 100644
---- a/server/main.c
-+++ b/server/main.c
-@@ -112,9 +112,10 @@ static void
- usage (void)
- {
-   /* --{short,long}-options remain undocumented */
--  printf (
-+  char const *opt_list =
- #include "synopsis.c"
--  );
-+	  ;
-+  printf ("%s\n", opt_list);
-   printf ("\n"
-           "Please read the nbdkit(1) manual page for full usage.\n");
- }
--- 
-2.26.0
-

