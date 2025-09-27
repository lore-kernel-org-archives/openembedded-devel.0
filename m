Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC22CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 10:27:27 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.8970.1758968844921431637
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 03:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EHHe0Gmm;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b00a9989633so584305366b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968843; x=1759573643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0UrzBjkQC9rXvdWpcdkb7lAAiD98o/PaqrZQqxHPH4=;
        b=EHHe0Gmmdx+wHRYR8M7jxgBwfcOhnKztcmrG9/glHPaOXbid06DFh4do2iOsW3lJHI
         qIWVIpYT8xEwtgQsH/pSisI8X+w6dQbKxW0pMn+M8Pj+hcNYEBh+Ld50Y7A/6rojOEnV
         ugzlMVc4SYX3ppX0dA+n5AfTqr+XqK/m7MpW2pW1/fPL5O/BSP/QNf2MPQK7hDdshr+Q
         FUmLk31XbOpxrKgx3CJsGIFQVOb30blPA8eRjLGvgalF7nA8xBQ4Jvuw14ciT5F3yT7T
         QKTiORRswAwBjySFrb6j5wYeq8yoFUPE+OeZzvnhqhCBRY6K2FAVHk5J/igEykgAQ898
         /Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968843; x=1759573643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0UrzBjkQC9rXvdWpcdkb7lAAiD98o/PaqrZQqxHPH4=;
        b=K7/Pahz8fFnj3jnulGLMIO1ezE/ZgV/QctCQ3wsRiL5JF4y240x1aFofLAWJypRIhZ
         Oq9stPfzmVwwgzXkX+Wch3cyyFbRIPEX3o7yn9rJkuNye7VD5kfPm8hGvm5at9DMNMRA
         2iqiVIbdLGANwiKsuPDzOLyLsoDxZnvEzTGPBH+D6gpBxtYxrNgUThqyJE+MvVzQgNgz
         0V2ujUjSGltNogmEubnIA5HVzPoWlDVbklJebgQm3ABR8PDlgiQJhn7TlH8oWLTEBRo1
         T5q7iSOJHkcCsrZJikRQQs+CuGtK7tGpelEJrmhOGpUHnRnrSZ048lW/BdBOxpN23ifM
         yx9A==
X-Gm-Message-State: AOJu0YzPm2wJD8sXo68+DiABX4jrT3RrkstZT0JYlg9y17z6KWl2DDQ6
	LeNZyx11mepxjbljmkLiC+pYyw7tPm0bG8Sye9+BqGGNqdrddNrY8EC+n6STrg==
X-Gm-Gg: ASbGncvZcAS3i6rwRBrMuWdMcXWXM8dMdVTZiBYMnDiTTuq2yyvkDsqsPfF96V/kmyA
	hrFz/WZ6VvcnXVV4owSZUG9BYZDKG5XEUWbqqcoNmytXFja39HKBquAYm5KLj31kbthiDII/8q7
	06lqW7VFrDoxo27nlbZrRMsNGBK+HNq3dOuTShWKo6lADrZ6lpS4hlivijaG0LfIk83nD/1XB6p
	PNMfwfzmB6HRS3s7bcx4zobISOgBjkWOP6vzBfuUzOVevNtv0dH0pv3sNFdaf2bG9LpM/OUZAW8
	d6GUAKNAhBUTodnMy1ouCem1wF6A/I6PulEvbgPEnlGw9zAH6w1Z6el/Cr40/L3wqXyPivm+Wkf
	IZquAXbmpHA7pjp460TwiMhCyZ75xbFi/SG0Lq8Q=
X-Google-Smtp-Source: AGHT+IHAf2re27rKha31ZLCBKhoRpT/z8Xtpygm27vrDN2yNiGy8IGK2VVBGUZooNn75x/Wubm85VQ==
X-Received: by 2002:a17:907:846:b0:b0e:83e7:f6e1 with SMTP id a640c23a62f3a-b354af9e239mr1163962566b.15.1758968843007;
        Sat, 27 Sep 2025 03:27:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f586161sm530286966b.36.2025.09.27.03.27.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:27:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] indent: upgrade 2.2.12 -> 2.2.13
Date: Sat, 27 Sep 2025 12:27:19 +0200
Message-ID: <20250927102720.318735-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927102720.318735-1-skandigraun@gmail.com>
References: <20250927102720.318735-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 10:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119981

Drop 0001-Fix-builds-with-recent-gettext.patch - it built fine for me without it.

Building requires full makeinfo, not only a lite version, so switched the texinfo
class to texinfo-replacement-native dependency.

Changelog:
- Fix buffer overflows and use after free bugs
- Recognize binary integer literals
- New and updated translations, thanks to our translators:
  - Updated translations:
      Catalan, Croatian, French, Galician, German, Greek, Hungarian,
      Indonesian, Italian, Romanian, Serbian, Spanish, Turkish, Ukrainian
  -  New translation: Portuguese

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ap-buffer-underread-in-set_buf_break.patch |  4 +--
 .../0001-Fix-builds-with-recent-gettext.patch | 32 -------------------
 ...01-Makefile.am-remove-regression-dir.patch | 11 +++----
 .../0001-Remove-dead-paren_level-code.patch   | 27 +++++++---------
 .../indent/indent/CVE-2023-40305_0001.patch   |  8 ++---
 .../{indent_2.2.12.bb => indent_2.2.13.bb}    |  7 ++--
 6 files changed, 25 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
 rename meta-oe/recipes-extended/indent/{indent_2.2.12.bb => indent_2.2.13.bb} (83%)

diff --git a/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch b/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
index 9938b6ebed..49adf84aa7 100644
--- a/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
+++ b/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
@@ -76,10 +76,10 @@ diff --git a/regression/TEST b/regression/TEST
 index a76c112..0888a18 100755
 --- a/regression/TEST
 +++ b/regression/TEST
-@@ -38,7 +38,7 @@ BUGS="case-label.c one-line-1.c one-line-2.c one-line-3.c \
+@@ -40,7 +40,7 @@
          macro.c enum.c elif.c nested.c wrapped-string.c minus_predecrement.c \
          bug-gnu-33364.c float-constant-suffix.c block-comments.c \
-         no-forced-nl-in-block-init.c hexadecimal_float.c \
+         no-forced-nl-in-block-init.c hexadecimal_float.c binary-constant.c \
 -        comment-heap-overread.c"
 +        comment-heap-overread.c comment-parent-heap-underread.c"
  
diff --git a/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch b/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
deleted file mode 100644
index e9dadace02..0000000000
--- a/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3349812de0598ca7722e0b7c7b7e5d48bd79bea9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 14:01:18 +0100
-Subject: [PATCH] Fix builds with recent gettext
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in
- AUTOMAKE_OPTIONS = no-texinfo.tex
- 
--SUBDIRS = intl src doc po man
-+SUBDIRS = src po man
- 
- BUILT_SOURCES = 
- 
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,7 +58,6 @@ fi
- AC_HEADER_DIRENT
- 
- AC_OUTPUT([ 
--   intl/Makefile
-    po/Makefile.in
-    Makefile
-    src/Makefile
diff --git a/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch b/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch
index 357d77d835..e4e0ac590c 100644
--- a/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch
+++ b/meta-oe/recipes-extended/indent/indent/0001-Makefile.am-remove-regression-dir.patch
@@ -47,13 +47,13 @@ index ba37a42..548fea7 100644
  ## Process this file with automake to produce Makefile.in
  AUTOMAKE_OPTIONS = no-texinfo.tex
  
--SUBDIRS = intl src doc po man regression
-+SUBDIRS = intl src doc po man
+-SUBDIRS = src doc po man regression
++SUBDIRS = src doc po man
  
  BUILT_SOURCES = 
  
-@@ -13,8 +13,7 @@ EXTRA_DIST = 	README.md \
- 		aclocal/UTIMBUF.m4 \
+@@ -13,8 +13,7 @@
+ 		m4/UTIMBUF.m4 \
  		miscel/Makefile.mingw32 \
  		miscel/README.vc++ \
 -		bootstrap \
@@ -62,6 +62,3 @@ index ba37a42..548fea7 100644
  
  DISTCLEANFILES=config/config.cache config/config.log config.h
  
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch b/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch
index 5a474cf0fc..3c7856e571 100644
--- a/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch
+++ b/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch
@@ -18,14 +18,10 @@ diff --git a/src/output.c b/src/output.c
 index ee01bcc..5b92167 100644
 --- a/src/output.c
 +++ b/src/output.c
-@@ -798,37 +798,6 @@ static int dump_line_label(void)
-    return cur_col;
- }
+@@ -802,37 +802,6 @@
+  *
+  */
  
--/**
-- *
-- */
--
 -static int count_parens(
 -    const char * string)
 -{
@@ -53,10 +49,14 @@ index ee01bcc..5b92167 100644
 -    return paren_level;
 -}
 -
- /**
-  *
-  */
-@@ -840,8 +809,6 @@ static void dump_line_code(
+-/**
+- *
+- */
+-
+ static void dump_line_code(
+     int     * pcur_col,
+     int     * pnot_truncated,
+@@ -840,8 +809,6 @@
      BOOLEAN * pbreak_line,
      int       target_col_break)
  {
@@ -65,7 +65,7 @@ index ee01bcc..5b92167 100644
     if (s_code != e_code)
     {                       /* print code section, if any */
        int i;
-@@ -928,8 +895,6 @@ static void dump_line_code(
+@@ -928,8 +895,6 @@
  
           *pcur_col = count_columns (*pcur_col, s_code, NULL_CHAR);
  
@@ -74,6 +74,3 @@ index ee01bcc..5b92167 100644
           s_code[buf_break->offset] = c;
  
           *pnot_truncated = 0;
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch b/meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
index 367202e3c5..ae48271732 100644
--- a/meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
+++ b/meta-oe/recipes-extended/indent/indent/CVE-2023-40305_0001.patch
@@ -74,14 +74,14 @@ diff --git a/regression/TEST b/regression/TEST
 index 56f41d9..a7a6747 100755
 --- a/regression/TEST
 +++ b/regression/TEST
-@@ -37,7 +37,8 @@ BUGS="case-label.c one-line-1.c one-line-2.c one-line-3.c \
+@@ -39,7 +39,8 @@
          one-line-4.c struct-decl.c sizeof-in-while.c line-break-comment.c \
          macro.c enum.c elif.c nested.c wrapped-string.c minus_predecrement.c \
          bug-gnu-33364.c float-constant-suffix.c block-comments.c \
--        no-forced-nl-in-block-init.c hexadecimal_float.c"
-+        no-forced-nl-in-block-init.c hexadecimal_float.c \
+-        no-forced-nl-in-block-init.c hexadecimal_float.c binary-constant.c"
++        no-forced-nl-in-block-init.c hexadecimal_float.c binary-constant.c \
 +        comment-heap-overread.c"
-
+ 
  INDENTSRC="args.c backup.h backup.c dirent_def.h globs.c indent.h \
          indent.c indent_globs.h io.c lexi.c memcpy.c parse.c pr_comment.c \
 diff --git a/regression/input/comment-heap-overread.c b/regression/input/comment-heap-overread.c
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.13.bb
similarity index 83%
rename from meta-oe/recipes-extended/indent/indent_2.2.12.bb
rename to meta-oe/recipes-extended/indent/indent_2.2.13.bb
index 000abe4447..f9d5025a65 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.13.bb
@@ -10,20 +10,19 @@ you want a program to format your code."
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "virtual/gettext"
+DEPENDS = "virtual/gettext texinfo-replacement-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-src-indent.c-correct-the-check-for-locale.h.patch \
            file://0001-Makefile.am-remove-regression-dir.patch \
-           file://0001-Fix-builds-with-recent-gettext.patch \
            file://0001-Remove-dead-paren_level-code.patch \
            file://CVE-2023-40305_0001.patch \
            file://CVE-2023-40305_0002.patch \
            file://0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch \
            "
-SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
+SRC_URI[sha256sum] = "9e64634fc4ce6797b204bcb8897ce14fdd0ab48ca57696f78767c59cae578095"
 
-inherit autotools gettext texinfo
+inherit autotools gettext
 
 CFLAGS:append:class-native = " -Wno-error=unused-value"
 

