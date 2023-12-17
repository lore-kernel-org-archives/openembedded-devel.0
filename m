Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44395C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 07:39:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.15258.1702798791002240418
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 23:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ErAtua9N;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso25182265e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 23:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702798789; x=1703403589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvJ7nbPeFPP8drx4femRThAOWKntYpz4WklSAzA6G7w=;
        b=ErAtua9N85WijO4xoj+AKgF38C0+stDG6I228RgH9EoSrJQsuq+l1uNn4ZseN85Nno
         RtauDZXo8xAsiK/YnORwdrrYgFyRSlnPoP74l6LPyYrw3dSM41hv8v2fQxbuZWfXjwXS
         RYD5OCLBUDQjyUppGt+iPPyLvK4x04onA6FjV96tcAg5zv2JJ1NnmMcUc81zp8tbUziN
         fFrJAz/MLkO7L7mZMr5+eXgTrVI4ky2vAFbfkuAgCX5DkZlf/uXlEHGQ20RlJK6r1k9V
         pf+Ia3a+7u6lx3lkdGRkLSGXKnigrt2VmnkRUo/lu3OOIkFvWaqMBLPPX58FTTS/ahav
         lWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702798789; x=1703403589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvJ7nbPeFPP8drx4femRThAOWKntYpz4WklSAzA6G7w=;
        b=KzN6T7j6jw5du5ck1xkDbmEGjy2w/4tt+w+brdJ/DWroX+8RWFDCc1FEFLDQuzvdT2
         u1kkP98eSCZFkkkyOM3SK++Kjg6fJHkYkZb8p3L+n1Y4SwaShXbfw734wvnLJbhZRSKF
         GEKo3TzZ9NqrM5kOg+hU8Fqa7zaN0B0Hm/Sz2BvGvwem0inUMT9w0ai7cuV1Utefgu6T
         yeh4rBahfUU4zaj5Z709dtWcr1exnVFRPmu22o/JkC1rxysXj4xgb/e8LkAJN9ZKyEDJ
         UvDgIi98t3/UzN25FR/PdQsdlt029NTKEU2kLAraDPZbOnb2WYy3iUGqRzEuxkVyXNU9
         0QCQ==
X-Gm-Message-State: AOJu0YwsS75xBFK05IaSrMkRLA0RA4jmk38RlffKxqtC3gtIRNYAplQI
	bF+BoI1TzJcNSL9mcnaUgug15Kt3oWMcsw==
X-Google-Smtp-Source: AGHT+IF53z9km4wT0svY+YN95tVK5JMPQoUaTqu0TptAgu56W6du/Axc0C8yKlxcGhMT0v80Kw9q2w==
X-Received: by 2002:a05:600c:3b26:b0:40b:5e1f:6fe3 with SMTP id m38-20020a05600c3b2600b0040b5e1f6fe3mr7178362wms.56.1702798788822;
        Sat, 16 Dec 2023 23:39:48 -0800 (PST)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:2e8:740a:5bbd:1d48])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c4886f254sm26458428wmn.13.2023.12.16.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 23:39:48 -0800 (PST)
From: frederic.martinsons@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [meta-oe][PATCH 3/3] crash: update to 8.0.4
Date: Sun, 17 Dec 2023 08:39:41 +0100
Message-Id: <888b131229ab4dc5ca7a7d0b7bd395ddd6dc7f2e.1702798681.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702798681.git.frederic.martinsons@gmail.com>
References: <cover.1702798681.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 07:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107537

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Remove backported commit.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 ...8.0.2.bb => crash-cross-canadian_8.0.4.bb} |  0
 meta-oe/recipes-kernel/crash/crash.inc        |  3 +-
 ...001-make-src-string-const-in-strlcpy.patch | 69 -------------------
 .../crash/{crash_8.0.2.bb => crash_8.0.4.bb}  |  0
 4 files changed, 1 insertion(+), 71 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash-cross-canadian_8.0.2.bb => crash-cross-canadian_8.0.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch
 rename meta-oe/recipes-kernel/crash/{crash_8.0.2.bb => crash_8.0.4.bb} (100%)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 8d700ed48..04318b150 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -22,9 +22,8 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://0001-cross_add_configure_option.patch \
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
-           file://0001-make-src-string-const-in-strlcpy.patch \
            "
-SRCREV = "f1cd581d1c4afa5b8ffdfaa6a3ea9f545fe4ec91"
+SRCREV = "a6832f608cb5d473739cf33bbf84ab1df8d98fd5"
 
 SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
 
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch b/meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch
deleted file mode 100644
index 546973e0a..000000000
--- a/meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 4ee56105881d7bb1da1e668ac5bb47a4e0846676 Mon Sep 17 00:00:00 2001
-From: Lianbo Jiang <lijiang@redhat.com>
-Date: Wed, 5 Jul 2023 10:02:59 +0800
-Subject: [PATCH] Fix compilation error due to new strlcpy function that glibc
- added
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The crash-utility has its own strlcpy(), but recently the latest glibc
-has also implemented the strlcpy function, which is derived from
-OpenBSD.  Eventually this caused the following compilation error:
-
-  # make -j8 lzo
-  ...
-  In file included from global_data.c:18:
-  defs.h:5556:8: error: conflicting types for ‘strlcpy’; have ‘size_t(char *, char *, size_t)’ {aka ‘long unsigned int(char *, char *, long unsigned int)’}
-   5556 | size_t strlcpy(char *, char *, size_t);
-        |        ^~~~~~~
-  In file included from memory.c:19:
-  defs.h:5556:8: error: conflicting types for ‘strlcpy’; have ‘size_t(char *, char *, size_t)’ {aka ‘long unsigned int(char *, char *, long unsigned int)’}
-   5556 | size_t strlcpy(char *, char *, size_t);
-        |        ^~~~~~~
-  ...
-
-To fix the issue, let's declare the strlcpy() as a weak function and
-keep the same parameter types as the glibc function has.
-
-Related glibc commits:
-454a20c8756c ("Implement strlcpy and strlcat [BZ #178]")
-d2fda60e7c40 ("manual: Manual update for strlcat, strlcpy, wcslcat, wclscpy")
-388ae538ddcb ("hurd: Add strlcpy, strlcat, wcslcpy, wcslcat to libc.abilist")
-
-Upstream-Status: Backport [https://github.com/kraj/crash/commit/4ee56105881d7bb1da1e668ac5bb47a4e0846676]
-Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
----
- defs.h  | 2 +-
- tools.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/defs.h b/defs.h
-index 8f7d1fa..26afe23 100644
---- a/defs.h
-+++ b/defs.h
-@@ -5553,7 +5553,7 @@ uint32_t swap32(uint32_t, int);
- uint64_t swap64(uint64_t, int);
- ulong *get_cpumask_buf(void);
- int make_cpumask(char *, ulong *, int, int *);
--size_t strlcpy(char *, char *, size_t);
-+size_t strlcpy(char *, const char *, size_t) __attribute__ ((__weak__));
- struct rb_node *rb_first(struct rb_root *);
- struct rb_node *rb_parent(struct rb_node *, struct rb_node *);
- struct rb_node *rb_right(struct rb_node *, struct rb_node *);
-diff --git a/tools.c b/tools.c
-index 392a797..0f2db10 100644
---- a/tools.c
-+++ b/tools.c
-@@ -6795,7 +6795,7 @@ make_cpumask_error:
-  * always be NULL-terminated.
-  */
- size_t 
--strlcpy(char *dest, char *src, size_t size)
-+strlcpy(char *dest, const char *src, size_t size)
- {
- 	size_t ret = strlen(src);
- 
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.2.bb b/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash_8.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash_8.0.4.bb
-- 
2.34.1


