Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3672CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 20:45:35 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.974.1759524334271951461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 13:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SqB3fAit;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78118e163e5so3171084b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759524333; x=1760129133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBkESuGyCHlJ6i9nJYO63KlJvwMKLqPAF3IgBKU8rEk=;
        b=SqB3fAit6OU2bpSFfxqKYjckcUAxeKds0JgvOhRlSJTGncIJ6OaXvKHeTN1+Bzt2xV
         9zEoK6H+M2yVdz3YwqXusvNa2c+fMHyTSovMif8CdvAtxd4S/P2ubFJn0QSp6iWx7ScD
         53xu1KCHIZmjtJiI1ALeqpjzidK2IaZvlcgcdmd4WpeZj5dBjg9Dtq0evi6RfQv8BU58
         YmcRW9pqZytHYdw17EzbN3dLB0bOvbFzw4ww/K5DMp9OGEvwRhdksl0kI0iGiaIdIZ91
         qqSVvJLv7xcscthV0sDoqKY4VOdmgSA2IwjAYdNWerXfhzxMigsi80fa6WmHZdX1Humn
         UIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759524333; x=1760129133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBkESuGyCHlJ6i9nJYO63KlJvwMKLqPAF3IgBKU8rEk=;
        b=o4W/CPyZZXLscgjYYaZ/oPKYX5BaGbmDGsT8eVY9cgN470n/YTmK8mTYQYKvmhqDXX
         +FcQrsrsnnvjXIAryFXDl5ML2RwHCi2oDVunTrZZZyiagIzpWxzG0c7+xYu0jRxPuAB2
         to7vjVe3YJbh/B9UqOKvPXq05BuBkF7WMJMaXZ/jsPCq4q1CoSRYDN9OtN9/wKy70kS9
         KvRIptfLZ1X9kYBsT89M+fKNyW+1+gRPgTjZOz2Y6NA8IETn6m1spyC8CrzEALdWo9oh
         L/WHeG1aQMzf1QyL85RGfSu860iLKRulIgBGMDD+jZn/qKdfeXmPwQA7c8ytZc9UmBwg
         ym4A==
X-Gm-Message-State: AOJu0YxhgbqRdm9LTYd3f/1e7nMnyCIsV4XCGWaeW9A3NLwwbKWm1hhj
	Di15zuH9iIb2ldQJcQEqQVDcSF0nq8WCjEDrA6JIpalNIoXZxnipNiGMpmBuQw==
X-Gm-Gg: ASbGnctf1lduE9/zdLOWkGfgsTfW8Pp2hxh8ncWoQQB+qOFbQaa8HlqanFbZ8lq+utj
	leVtACf5ugox8LbZTuJQI0momv4sPLSAcEW+v/LiIkJxJtvAqI0+MmFGU81cLwomK7SVY0IE5ez
	w9kEeuGFjzMcoUq630QGSqbyVOAgxMJLoPAxoFcTX4qbQkAm587/gPJGjjhywNC6PlWcCnUPn/3
	0p16zyJ0vH4axP7SNWUkbJhcTruaE8GXEroAvRm1RH5i2I5W+Q3rZnhE8kr23c+WdIw6DZgeHs6
	WQ1+3VCyREfAN53Ssrb3JU4ugiUen3WReelmhaE71ujyCZU6EfB0W2yfs20JuxFChGFDETT+EKd
	zjTPZ7cEVx5jVDcRtHkEp14l4F/B+Pg9QaLEBoXQbm30Zp4a4uDHtIFNJLXsm
X-Google-Smtp-Source: AGHT+IHDLcEhG1bdRsM/u743Wj+CtLfz04yNXuCc3OI/QTsW5oSnR4Vqij9jRVUSJ8GCzN7u4V+ImQ==
X-Received: by 2002:a05:6a20:3c8e:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-32b61b4e21cmr5701480637.9.1759524333357;
        Fri, 03 Oct 2025 13:45:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e809sm5720965b3a.71.2025.10.03.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:45:33 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: hongxu <hongxu.jia@eng.windriver.com>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Armin Kuster <akuster808@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 3/3] indent: fix CVE-2024-0911
Date: Sat,  4 Oct 2025 09:44:49 +1300
Message-ID: <20251003204459.273748-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003204459.273748-1-ankur.tyagi85@gmail.com>
References: <20251003204459.273748-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 20:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120227

From: hongxu <hongxu.jia@eng.windriver.com>

Backport a fix from upstream to resolve CVE-2024-0911

  https://git.savannah.gnu.org/git/indent.git feb2b646e6c3a05018e132515c5eda98ca13d50d

(cherry picked from commit 26ef6a9c2da06b7de4116c483f9197fd4cf2a4cb)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d1375d37ee514b8883836ca4437e11b013fc781e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ap-buffer-underread-in-set_buf_break.patch | 123 ++++++++++++++++++
 .../recipes-extended/indent/indent_2.2.12.bb  |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch

diff --git a/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch b/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
new file mode 100644
index 0000000000..9938b6ebed
--- /dev/null
+++ b/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
@@ -0,0 +1,123 @@
+From ec3ce4dce7f0bc6f15e8a29eeb3776359e0750fb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Fri, 22 Nov 2024 17:27:21 +0800
+Subject: [PATCH] Fix a heap buffer underread in set_buf_break()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If an opening parenthesis follows a comment with a text, a read from
+an invalid address happens in set_buf_break():
+
+    $ printf '/*a*/()' | valgrind -- ./src/indent - -o /dev/null
+    ==28887== Memcheck, a memory error detector
+    ==28887== Copyright (C) 2002-2022, and GNU GPL'd, by Julian Seward et al.
+    ==28887== Using Valgrind-3.22.0 and LibVEX; rerun with -h for copyright info
+    ==28887== Command: ./src/indent - -o /dev/null
+    ==28887==
+    ==28887== Invalid read of size 2
+    ==28887==    at 0x409989: set_buf_break (output.c:319)
+    ==28887==    by 0x401FE7: indent_main_loop (indent.c:640)
+    ==28887==    by 0x4022A7: indent (indent.c:759)
+    ==28887==    by 0x40294E: indent_single_file (indent.c:1004)
+    ==28887==    by 0x402A1C: indent_all (indent.c:1042)
+    ==28887==    by 0x402BD0: main (indent.c:1123)
+    ==28887==  Address 0x4a5facc is 4 bytes before a block of size 16 alloc'd
+    ==28887==    at 0x4849E60: calloc (vg_replace_malloc.c:1595)
+    ==28887==    by 0x408B61: xmalloc (globs.c:42)
+    ==28887==    by 0x40765E: init_parser (parse.c:73)
+    ==28887==    by 0x402B1F: main (indent.c:1101)
+
+It happens when checking an indentation level of the outer scope by indexing
+parser_state_tos->paren_indents[]:
+
+    level = parser_state_tos->p_l_follow;
+    [...]
+    /* Did we just parse a bracket that will be put on the next line
+     * by this line break? */
+    if ((*token == '(') || (*token == '['))
+        --level;    /* then don't take it into account */
+    [...]
+    if (level == 0) {
+    } else {
+→       if (parser_state_tos->paren_indents[level - 1] < 0) {...}
+    }
+
+The cause is a special case for moving opening parentheses and
+brackets to a next line. If parser_state_tos->p_l_follow is zero
+(like in the reproducer), the index evaluates to -2 and goes out of
+range of the paren_indents array.
+
+This patch simply prevents from decreasing the index under zero when
+formating the code. Maybe it leaves some piece of code unformated, but
+it's safe.
+
+I checked all places where p_l_follow is set (it is only in
+handletoken.c) and they corretly prevent from decrasing it under
+zero. That keeps set_buf_break() in output.c as the culprit.
+
+<https://lists.gnu.org/archive/html/bug-indent/2024-01/msg00000.html>
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2024-0911
+Upstream-Status: Backport [feb2b646e6c3a05018e132515c5eda98ca13d50d
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ regression/TEST                                     | 2 +-
+ regression/input/comment-parent-heap-underread.c    | 3 +++
+ regression/standard/comment-parent-heap-underread.c | 5 +++++
+ src/output.c                                        | 2 +-
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+ create mode 100644 regression/input/comment-parent-heap-underread.c
+ create mode 100644 regression/standard/comment-parent-heap-underread.c
+
+diff --git a/regression/TEST b/regression/TEST
+index a76c112..0888a18 100755
+--- a/regression/TEST
++++ b/regression/TEST
+@@ -38,7 +38,7 @@ BUGS="case-label.c one-line-1.c one-line-2.c one-line-3.c \
+         macro.c enum.c elif.c nested.c wrapped-string.c minus_predecrement.c \
+         bug-gnu-33364.c float-constant-suffix.c block-comments.c \
+         no-forced-nl-in-block-init.c hexadecimal_float.c \
+-        comment-heap-overread.c"
++        comment-heap-overread.c comment-parent-heap-underread.c"
+ 
+ INDENTSRC="args.c backup.h backup.c dirent_def.h globs.c indent.h \
+         indent.c indent_globs.h io.c lexi.c memcpy.c parse.c pr_comment.c \
+diff --git a/regression/input/comment-parent-heap-underread.c b/regression/input/comment-parent-heap-underread.c
+new file mode 100644
+index 0000000..68e13cf
+--- /dev/null
++++ b/regression/input/comment-parent-heap-underread.c
+@@ -0,0 +1,3 @@
++void foo(void) {
++/*a*/(1);
++}
+diff --git a/regression/standard/comment-parent-heap-underread.c b/regression/standard/comment-parent-heap-underread.c
+new file mode 100644
+index 0000000..9a1c6e3
+--- /dev/null
++++ b/regression/standard/comment-parent-heap-underread.c
+@@ -0,0 +1,5 @@
++void
++foo (void)
++{
++/*a*/ (1);
++}
+diff --git a/src/output.c b/src/output.c
+index 5b92167..b8a4961 100644
+--- a/src/output.c
++++ b/src/output.c
+@@ -290,7 +290,7 @@ void set_buf_break (
+     /* Did we just parse a bracket that will be put on the next line
+      * by this line break? */
+ 
+-    if ((*token == '(') || (*token == '['))
++    if (level > 0 && ((*token == '(') || (*token == '[')))
+     {
+         --level;                        /* then don't take it into account */
+     }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index 2326f47b44..000abe4447 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Remove-dead-paren_level-code.patch \
            file://CVE-2023-40305_0001.patch \
            file://CVE-2023-40305_0002.patch \
+           file://0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch \
            "
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
 

