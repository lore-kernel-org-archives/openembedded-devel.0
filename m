Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0206FFEFB62
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:40:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99026.1772206837464677438
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnhpnyjz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so25252525e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206836; x=1772811636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/mpB0gIKUty+U0/hfafnNtVw7K2aTalh0Fx2hA4ois=;
        b=fnhpnyjzGBci5rvLBQa7z9BLpU2RnpY1OAuAGbenLUccc3hnmgnPLyPoDxQXZSVtoq
         DspyufxJPBUotrYIuV9MfbESfD4YZozRzFslYd/R/a7WI/QwjGOd3lvvQvh6gDn7uBd4
         i+tOCOXR2RSYBfUYRQ+wUkFr45a/7xxxxK/FMDZoMxbXD35mJ7oBID1MSsfAesptzGIk
         uH8M50jKdnh+X6sclAm/vqkV70wA192FtSd7NjxbSjaTUgEAyQsej3w7Il4KrTPDZyyJ
         XXg57slRbnXcZxCHPKmGLPAsvFkEDvchiHbOsTctj/8uvBpfhaa64c26Tk7o8bD7QqQk
         ZvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206836; x=1772811636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/mpB0gIKUty+U0/hfafnNtVw7K2aTalh0Fx2hA4ois=;
        b=czxEGC+4qC+0B8bzrPzWjon9NA+UI95t9cR7gWHgD0Bw+1ddej0oqq2VPFq1SFzrjf
         wIwEU1VnD/KvTkcf50PqfPIRA5ssWNyRlazDcGQeMUVvD/eljZjl15PhirwMMtQxU7SO
         lD6M+espKyoqQhQf6txuD37WFWq4E37WwY/YKw52saiRPs+8op6QuMZkOk9jcEbAPvbv
         cHx7YapGfRxISvx1iJvFX4tmvzvRDOFmymojbRyHjQ3zmpBHFHxDt9loY6HszX69c0Xb
         AwkYj2brB3hzm/s5/ckPfpBp+m+mHXhfgYspwtGZK2YF8vaZj2XovBpsk990T11YKJpM
         0roA==
X-Gm-Message-State: AOJu0YxeU9ggw5A1v6TLFkobPgDSxyJCRuc/UyEs1gU6uMv/J5YSHTbp
	xlHS/veUpjLJYsm+VvrTghqRRIkN6h07CEQWUsia5Ad/c4GrOK5O3fOTazTUBQ==
X-Gm-Gg: ATEYQzy+5zsyDJptXC3vB+mzev6U6Sy0bD6VCGn9qQo7XSTFk499TlpvNfaVh7n1zXg
	UFs11YFEI4Xr6JB6jL2yTBLmxfWnKT8gYJpf94/ZWhmQlt2f5CkertKVkkftdKZS+AEKPUr9WsL
	omWWO4yfP21jQcmSEFKZ13i4UlBCCRzcJIzIf18euQgm1XLNc4GDftmphUgJJTTgTPfHy6DTOA5
	O9xl2ZH+4ZhLBQrZxhtYntQ64J+jxMN2L0gSKq7txw58mmiRWV8tPx6SceCOM1SDQ8jkZ6py14l
	bznAG8oPM3kKtoBoXcrSMDpcg8z8TTNzb/LOCpY7/hhLiwhx/ncfcxYkoipPY8L4JLllTrZtLNX
	BvQW8zoojcfhscNr4MnJdWoPTSL79CGNr3qamSZhd+nrthJTwmqwD7FBGP73FYExN39fynOLjgn
	EODE21lQTO6DuRFeSAOXrF
X-Received: by 2002:a05:600c:c490:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-483c9bb65ffmr45057245e9.6.1772206835652;
        Fri, 27 Feb 2026 07:40:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm123409785e9.9.2026.02.27.07.40.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:40:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] emacs: patch CVE-2022-48337
Date: Fri, 27 Feb 2026 16:40:32 +0100
Message-ID: <20260227154032.499047-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227154032.499047-1-skandigraun@gmail.com>
References: <20260227154032.499047-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124761

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-48337

Backport the patch that is referenced by he NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_27.2.bb   |   1 +
 .../emacs/files/CVE-2022-48337.patch          | 108 ++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/CVE-2022-48337.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_27.2.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
index 4a7e7aba5c..c17059b15d 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://emacs-glibc-2.34.patch \
+           file://CVE-2022-48337.patch \
           "
 SRC_URI:append:class-target = " file://usemake-docfile-native.patch"
 
diff --git a/meta-oe/recipes-support/emacs/files/CVE-2022-48337.patch b/meta-oe/recipes-support/emacs/files/CVE-2022-48337.patch
new file mode 100644
index 0000000000..351ffc4338
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/CVE-2022-48337.patch
@@ -0,0 +1,108 @@
+From a10958677d359e016a4e857a9cd7c98258061f5f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 6 Dec 2022 15:42:40 +0800
+Subject: [PATCH] Fix etags local command injection vulnerability
+
+From: lu4nx <lx@shellcodes.org>
+
+* lib-src/etags.c: (escape_shell_arg_string): New function.
+(process_file_name): Use it to quote file names passed to the
+shell.  (Bug#59817)
+
+CVE: CVE-2022-48337
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?id=01a4035c869b91c153af9a9132c87adb7669ea1c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lib-src/etags.c | 63 +++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 58 insertions(+), 5 deletions(-)
+
+diff --git a/lib-src/etags.c b/lib-src/etags.c
+index bb92f2b..7cecfe2 100644
+--- a/lib-src/etags.c
++++ b/lib-src/etags.c
+@@ -397,6 +397,7 @@ static void pfnote (char *, bool, char *, ptrdiff_t, intmax_t, intmax_t);
+ static void invalidate_nodes (fdesc *, node **);
+ static void put_entries (node *);
+ 
++static char *escape_shell_arg_string (char *);
+ static char *concat (const char *, const char *, const char *);
+ static char *skip_spaces (char *);
+ static char *skip_non_spaces (char *);
+@@ -1635,13 +1636,16 @@ process_file_name (char *file, language *lang)
+       else
+ 	{
+ #if MSDOS || defined (DOS_NT)
+-	  char *cmd1 = concat (compr->command, " \"", real_name);
+-	  char *cmd = concat (cmd1, "\" > ", tmp_name);
++          int buf_len = strlen (compr->command) + strlen (" \"\" > \"\"") + strlen (real_name) + strlen (tmp_name) + 1;
++          char *cmd = xmalloc (buf_len);
++          snprintf (cmd, buf_len, "%s \"%s\" > \"%s\"", compr->command, real_name, tmp_name);
+ #else
+-	  char *cmd1 = concat (compr->command, " '", real_name);
+-	  char *cmd = concat (cmd1, "' > ", tmp_name);
++          char *new_real_name = escape_shell_arg_string (real_name);
++          char *new_tmp_name = escape_shell_arg_string (tmp_name);
++          int buf_len = strlen (compr->command) + strlen ("  > ") + strlen (new_real_name) + strlen (new_tmp_name) + 1;
++          char *cmd = xmalloc (buf_len);
++          snprintf (cmd, buf_len, "%s %s > %s", compr->command, new_real_name, new_tmp_name);
+ #endif
+-	  free (cmd1);
+ 	  int tmp_errno;
+ 	  if (system (cmd) == -1)
+ 	    {
+@@ -1685,6 +1689,55 @@ process_file_name (char *file, language *lang)
+   return;
+ }
+ 
++/*
++ * Adds single quotes around a string, if found single quotes, escaped it.
++ * Return a newly-allocated string.
++ *
++ * For example:
++ * escape_shell_arg_string("test.txt") => 'test.txt'
++ * escape_shell_arg_string("'test.txt") => ''\''test.txt'
++ */
++static char *
++escape_shell_arg_string (char *str)
++{
++  char *p = str;
++  int need_space = 2;           /* ' at begin and end */
++
++  while (*p != '\0')
++    {
++      if (*p == '\'')
++        need_space += 4;        /* ' to '\'', length is 4 */
++      else
++        need_space++;
++
++      p++;
++    }
++
++  char *new_str = xnew (need_space + 1, char);
++  new_str[0] = '\'';
++  new_str[need_space-1] = '\'';
++
++  int i = 1;                    /* skip first byte */
++  p = str;
++  while (*p != '\0')
++    {
++      new_str[i] = *p;
++      if (*p == '\'')
++        {
++          new_str[i+1] = '\\';
++          new_str[i+2] = '\'';
++          new_str[i+3] = '\'';
++          i += 3;
++        }
++
++      i++;
++      p++;
++    }
++
++  new_str[need_space] = '\0';
++  return new_str;
++}
++
+ static void
+ process_file (FILE *fh, char *fn, language *lang)
+ {

