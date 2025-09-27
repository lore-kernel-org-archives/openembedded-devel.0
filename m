Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC111CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 10:36:47 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.9065.1758969397432951401
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 03:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h96pUCD4;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so6150161a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758969396; x=1759574196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpozTK4lPaaU6OXpnFaNDk2uUPmT7nzFx4dNrwaXi0Y=;
        b=h96pUCD4R2I5Z+oWxeR1gIe61kPSu40CPAuBUoZ1lqy4UuaO+OTWBr1QsikQaaQM5F
         /hcH7233xQtp8H80x+VHYbWhNJCIhf1DJwTWbI0/BtTUaKhfoT/A3K2YiYHCa44SAX27
         qi1DEJUECDgojXHfda4mIc46TxM8Js8/+lPyPtoKslVOXyr42fyBFwYNdfJVu5P/1YYq
         ln4bo6ZRpWQ3dioY8vITjNjRolN1S/1ull5gRZ4AStdfy4WPJgf0kSAyTBdidk+Xpqhi
         p4oUTKyPSeo1FOlzY69KbB6TuK1/T5NycNO60R9ehzk8nRSuTTgzgyza2KLfEsKbOiNq
         s/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758969396; x=1759574196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpozTK4lPaaU6OXpnFaNDk2uUPmT7nzFx4dNrwaXi0Y=;
        b=CcrfkD7+RZ1PnTSmNS+0bYYmlAGIiOQKlVjlkxB6yRDoYsys1b42AodxTvcAlQx75g
         45X/1V1B3RLD+bzb+WuygSf+ZrzCcOhCMQzAc2V9Ow+OpqZrsr1ZeIG5LfUUc0ACZqI0
         qNEGXL7jNBW8vUmN/bGKt1gSxlNVq7T1479RW+IyvUwuNACagvzfW0GMWEHGEOrj2PaC
         vEY7OuGLbGaSoRgW66DFKsBVPuw6V/N4ZgvLnhOJaW8gVL0S2adpOQFwbjgPGl7DnYHR
         3SeozgpIZ9WUr9jF2kL1yX/8pRI2OBciaPYHDSw5FwX462lV2/+cAMFILd9a9f0Ncxte
         M2dQ==
X-Gm-Message-State: AOJu0Yx/cnc+46LzAZ2kjH7aIMtaxE+hd6goVevK/ygYU3TPKr2UfRLB
	W+OjRAh2qtVdN0s6G8It6ALbbzrUrff4si9e6wl8Ox7m2g5CfrO0YxuhCK5qng==
X-Gm-Gg: ASbGncsGt3sCJVf6ROyre+GES5Eh2cuQWnJq8TizaA/O22FrAHY+onAsj1cpSYqZgmc
	RpaL4A5u8UHUrDBwJo2EdEuYJYcD3QeeoAAFGUSnUkL4bq8mdlilG+IQPMFdcYSpf46rtAFQpT3
	3hlubGHevVCCrln+ZaLisvhr+ogEqX+GNZJzhcjAl0kvsHyfgXmekcKZk23RvbHX9aGkJVkbBCS
	JQtl7DTkUQ+3/GqkFskCr1z/5q58CXKhsoyQnN1/ca8F9FBE2/2IjPPYYfctXnQnvK6FA8ya++g
	Z1Ab9NOZe0zcQrdW1gWZMVOMj3yaqB8+ML7stP0ITYgi1b0VWiohfteX6dsamlISc6JQ1wHpyBJ
	bNG6C/bLHieHDt3XdAc4ExmhTihDY9m8=
X-Google-Smtp-Source: AGHT+IFor7VjsQ3hnv6zPsuvWcw+sDH4br6RfUOgYYhd6UE9+lmt9DQSLC7b/uJVPVGbRFJuzT/CHA==
X-Received: by 2002:a17:907:7244:b0:b07:6538:4dc5 with SMTP id a640c23a62f3a-b34bd93d0edmr1032670866b.64.1758969395520;
        Sat, 27 Sep 2025 03:36:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7681sm538007766b.58.2025.09.27.03.36.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:36:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/2] indent: fix CVE-2024-0911
Date: Sat, 27 Sep 2025 12:36:32 +0200
Message-ID: <20250927103633.319618-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927103633.319618-1-skandigraun@gmail.com>
References: <20250927103633.319618-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 10:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119985

From: hongxu <hongxu.jia@eng.windriver.com>

Backport a fix from upstream to resolve CVE-2024-0911

  https://git.savannah.gnu.org/git/indent.git feb2b646e6c3a05018e132515c5eda98ca13d50d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 26ef6a9c2da06b7de4116c483f9197fd4cf2a4cb)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
 

