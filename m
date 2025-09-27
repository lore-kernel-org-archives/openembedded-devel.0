Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9685CAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 10:34:57 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.9034.1758969275568438077
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 03:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gPNP3P+3;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2ee3c13aa4so466072766b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758969274; x=1759574074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zzak7e7MoHHZoAt/G1UJrHmHfANPN40Oah/XfPO6Hrw=;
        b=gPNP3P+3vIDB8YUeuGegm/aV7wv3eTaTRa7MV/FGDai7lFJ29VRydEXZ+5t0sCb5fc
         4lDK0PxdMO/upkZ7HT5d+Gs18ewVyhZPM3Bm6stO81vbAxM/j+i7NDaFTiBPah5lpqYa
         8DnKoD2NDhZtpckSXErGIk2bK6WjCoAUtuL9jZU+1MTRwZ1rVLor6ef3jCk9CGXNilud
         5VYOt0BrgS8D5V23aqyhCIy942vLb0WIlEsLqAVAiJuuSomI9h3+ipI2uHvF9ZG+smOp
         NGpvZXedSKaKJsR/8XFgbou9528UpvXM5goxGK5itg+ECjp50qVxrMKG8mVPqgBJg60e
         x3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758969274; x=1759574074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzak7e7MoHHZoAt/G1UJrHmHfANPN40Oah/XfPO6Hrw=;
        b=oaHOMV57uukjMzwC30akE99HEHflo1Qa1SH2PVs6CychC/CmgdOvTanGlgJ842M9D4
         4eJ5DAcWvAzsW6Y637MNihrz4z8+YXErCj0NUk+DbVXEk7jzfPM/Kd3MbZgh/bQdR/se
         /2NwlW7+gHKbs8I7W7Y3HQ2D4igGoMRcmRErADh6kSqM70VncKeK+FH3QfoQdXYpRZFw
         UU7o1Vxl0wWj/3/5SeikWHNuSXYfG00quf67zODFwJky8tM3OzoSxVz4bxAZzmZJ1pbW
         8WJE4KICELRUL6yCPmUA0fUFLpeHmJeoVorLk7x9OHSuL0WBTUVy4jyBVwemJq4oLgjh
         XRUA==
X-Gm-Message-State: AOJu0YzTsSjFKqOYo1kpJGSHd74RGRm4AUoVd5v8x199CIVB9MZevNUS
	YMFE7enBkf466VJehg2MtCxwJq02vH8XRYoVDVDOtwNrbQzli9VfqEeZ/NdTGw==
X-Gm-Gg: ASbGnctyF0AI5fcILl9tAI7Zf52xYcFeHAgEp9rpLvudLp9FwQo13nbampauLGnUrBv
	Ihm12JJSvCs1AgKg3cmDhUwbTmJhQQxnH03CNmG8IeCMnYk7tL4JEFsuStRtzzXl6+Yf2WFD6PR
	RtAKsfj6qWDlPpP4FCn+VslKIVgx6S5KWY5zl75igd/zo7ZySmSbjoKh/nfmIUXNUSn6hpJn5Z7
	/SWV278knS9oiLOif3x3C3QjWUpT+uPPYY1cBZHU6yD0ZOGaFTCIwNpBRlrFb8jzIgAzjgyyzD3
	8JD4YFl4EBNtGXv064Nae3YYw3rtYAvagrjz8+sCDm1Qx7H32/L7yzyIeLje1ZHYcX9rWTsBagx
	igFl24Y7euJp3zFKUCVOo
X-Google-Smtp-Source: AGHT+IEoifdJAh/oCai9LbZgtfoisGazJtXTXTfMTzlhJX2WAVErH+IJFvV/yQbJUuIWBIexevLP2Q==
X-Received: by 2002:a17:907:7b9e:b0:b04:1249:2b24 with SMTP id a640c23a62f3a-b34bde1e588mr1060211366b.37.1758969273864;
        Sat, 27 Sep 2025 03:34:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde4asm542475366b.76.2025.09.27.03.34.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:34:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/2] indent: fix CVE-2024-0911
Date: Sat, 27 Sep 2025 12:34:30 +0200
Message-ID: <20250927103431.319362-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927103431.319362-1-skandigraun@gmail.com>
References: <20250927103431.319362-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 10:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119982

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
index a846682c13..7bf8e406fb 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Remove-dead-paren_level-code.patch \
            file://CVE-2023-40305_0001.patch \
            file://CVE-2023-40305_0002.patch \
+           file://0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch \
            "
 SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"

