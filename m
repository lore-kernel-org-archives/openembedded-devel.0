Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A21C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 05:11:52 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.10640.1704258707994331647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 21:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gXURxEKA;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28bc870c540so7798117a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 21:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704258707; x=1704863507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIcsREPDo+74ldEGXRpDZaSekZiD87dQL1UzxYQNf9k=;
        b=gXURxEKAXN9pkuWdj/6qH3Tw9AAU7SH2P/ELnuv1jU/NxKxn8mzFiB3eqU/xiHatIb
         VrrGWTLOhP+mzMjrx0gb/C1PvvgiWpVOkHBxTzUtGRlonHLZLzcbghpDAJEVxd18PBEp
         m9zHR4Rnwd/Y+wmGku0i4tHYYWk2X3SopYavI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704258707; x=1704863507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIcsREPDo+74ldEGXRpDZaSekZiD87dQL1UzxYQNf9k=;
        b=wGIDZegP4DVpw4imRBiYeSTI+lTg4smg0lQulfZIJr5+LMWK++KOdcl9ofyVvJS1PN
         MUPhEUtlIHMAv39usTPNyC2Zd/wfcmP9goHQNLLBsnaN6iyylMViUAR/8sXiWcwRAu+s
         M55tXBlX2ie922JzP6f8wNYU0rxIXUS8b1s9v0nNS7vU/m70UGS7zV56o6PCde4AXViX
         S/wjk9206mLEpGkuWTHoOQaORBROOhho0kd0ABHmixsJZnWU/Ij7OP93Nb0342mWvBjy
         JCMxaNejoKI9VB2ScCPvpGZcnHWCBx3aYaTMSykS1R7UyoKyiCQ3x22DuF8MQ7AWZhyH
         MyRw==
X-Gm-Message-State: AOJu0YzKROpoEitSmZEW4EpeKoPcZ6TpdbJa6+Y+Szvn1CHr9Fy6Mick
	NoPZWOAKFhocMhd7QqxRpeqXTYLQ6qJSyp2YRr3z0LoaL0U=
X-Google-Smtp-Source: AGHT+IFmV5xxH9pEpmM/Anh80iGLgZnn5J362cW05WoN74Z9oQ3n2tPJoubXIKY3T/wXT0qRS0nksg==
X-Received: by 2002:a17:90a:928e:b0:286:e9ef:e5bd with SMTP id n14-20020a17090a928e00b00286e9efe5bdmr8766030pjo.51.1704258707126;
        Tue, 02 Jan 2024 21:11:47 -0800 (PST)
Received: from MVIN00016.mvista.com ([43.249.234.189])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090a938100b0028bd303dc58sm551036pjo.11.2024.01.02.21.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 21:11:46 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read
Date: Wed,  3 Jan 2024 10:41:41 +0530
Message-Id: <20240103051141.40140-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 05:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108023

Upstream-Status: Backport from https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07f67170ec64a8b4d62592

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../proftpd/files/CVE-2023-51713.patch        | 277 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |   1 +
 2 files changed, 278 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
new file mode 100644
index 0000000000..4b2cac1870
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
@@ -0,0 +1,277 @@
+From 97bbe68363ccf2de0c07f67170ec64a8b4d62592 Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Sun, 6 Aug 2023 13:16:26 -0700
+Subject: [PATCH] Issue #1683: Avoid an edge case when handling unexpectedly
+ formatted input text from client, caused by quote/backslash semantics, by
+ skipping those semantics.
+
+Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07f67170ec64a8b4d62592]
+CVE: CVE-2023-51713
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ include/str.h   |  3 ++-
+ src/main.c      | 34 +++++++++++++++++++++++++++++----
+ src/str.c       | 22 +++++++++++++---------
+ tests/api/str.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++-
+ 4 files changed, 94 insertions(+), 15 deletions(-)
+
+diff --git a/include/str.h b/include/str.h
+index f08398017..1261ae2c2 100644
+--- a/include/str.h
++++ b/include/str.h
+@@ -1,6 +1,6 @@
+ /*
+  * ProFTPD - FTP server daemon
+- * Copyright (c) 2008-2020 The ProFTPD Project team
++ * Copyright (c) 2008-2023 The ProFTPD Project team
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -131,6 +131,7 @@ const char *pr_gid2str(pool *, gid_t);
+ #define PR_STR_FL_PRESERVE_COMMENTS		0x0001
+ #define PR_STR_FL_PRESERVE_WHITESPACE		0x0002
+ #define PR_STR_FL_IGNORE_CASE			0x0004
++#define PR_STR_FL_IGNORE_QUOTES			0x0008
+ 
+ char *pr_str_get_token(char **, char *);
+ char *pr_str_get_token2(char **, char *, size_t *);
+diff --git a/src/main.c b/src/main.c
+index ee9c1eecb..e6b70731d 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -811,8 +811,24 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size_t buflen, int flags) {
+     return NULL;
+   }
+ 
++  /* By default, pr_str_get_word will handle quotes and backslashes for
++   * escaping characters.  This can produce words which are shorter, use
++   * fewer bytes than the corresponding input buffer.
++   *
++   * In this particular situation, we use the length of this initial word
++   * for determining the length of the remaining buffer bytes, assumed to
++   * contain the FTP command arguments.  If this initial word is thus
++   * unexpectedly "shorter", due to nonconformant FTP text, it can lead
++   * the subsequent buffer scan, looking for CRNUL sequencees, to access
++   * unexpected memory addresses (Issue #1683).
++   *
++   * Thus for this particular situation, we tell the function to ignore/skip
++   * such quote/backslash semantics, and treat them as any other character
++   * using the IGNORE_QUOTES flag.
++   */
++
+   ptr = buf;
+-  wrd = pr_str_get_word(&ptr, str_flags);
++  wrd = pr_str_get_word(&ptr, str_flags|PR_STR_FL_IGNORE_QUOTES);
+   if (wrd == NULL) {
+     /* Nothing there...bail out. */
+     pr_trace_msg("ctrl", 5, "command '%s' is empty, ignoring", buf);
+@@ -820,6 +836,11 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size_t buflen, int flags) {
+     return NULL;
+   }
+ 
++  /* Note that this first word is the FTP command.  This is why we make
++   * use of the ptr buffer, which advances through the input buffer as
++   * we read words from the buffer.
++   */
++
+   subpool = make_sub_pool(p);
+   pr_pool_tag(subpool, "make_ftp_cmd pool");
+   cmd = pcalloc(subpool, sizeof(cmd_rec));
+@@ -846,6 +867,7 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size_t buflen, int flags) {
+   arg_len = buflen - strlen(wrd);
+   arg = pcalloc(cmd->pool, arg_len + 1);
+ 
++  /* Remember that ptr here is advanced past the first word. */
+   for (i = 0, j = 0; i < arg_len; i++) {
+     pr_signals_handle();
+     if (i > 1 &&
+@@ -854,14 +876,13 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size_t buflen, int flags) {
+ 
+       /* Strip out the NUL by simply not copying it into the new buffer. */
+       have_crnul = TRUE;
++
+     } else {
+       arg[j++] = ptr[i];
+     }
+   }
+ 
+-  cmd->arg = arg;
+-
+-  if (have_crnul) {
++  if (have_crnul == TRUE) {
+     char *dup_arg;
+ 
+     /* Now make a copy of the stripped argument; this is what we need to
+@@ -871,6 +892,11 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size_t buflen, int flags) {
+     ptr = dup_arg;
+   }
+ 
++  cmd->arg = arg;
++
++  /* Now we can read the remamining words, as command arguments, from the
++   * input buffer.
++   */
+   while ((wrd = pr_str_get_word(&ptr, str_flags)) != NULL) {
+     pr_signals_handle();
+     *((char **) push_array(tarr)) = pstrdup(cmd->pool, wrd);
+diff --git a/src/str.c b/src/str.c
+index bcca4ae4d..a2ff74daf 100644
+--- a/src/str.c
++++ b/src/str.c
+@@ -1,6 +1,6 @@
+ /*
+  * ProFTPD - FTP server daemon
+- * Copyright (c) 2008-2017 The ProFTPD Project team
++ * Copyright (c) 2008-2023 The ProFTPD Project team
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -1209,7 +1209,7 @@ int pr_str_get_nbytes(const char *str, const char *units, off_t *nbytes) {
+ 
+ char *pr_str_get_word(char **cp, int flags) {
+   char *res, *dst;
+-  char quote_mode = 0;
++  int quote_mode = FALSE;
+ 
+   if (cp == NULL ||
+      !*cp ||
+@@ -1238,24 +1238,28 @@ char *pr_str_get_word(char **cp, int flags) {
+     }
+   }
+ 
+-  if (**cp == '\"') {
+-    quote_mode++;
+-    (*cp)++;
++  if (!(flags & PR_STR_FL_IGNORE_QUOTES)) {
++    if (**cp == '\"') {
++      quote_mode = TRUE;
++      (*cp)++;
++    }
+   }
+ 
+   while (**cp && (quote_mode ? (**cp != '\"') : !PR_ISSPACE(**cp))) {
+     pr_signals_handle();
+ 
+-    if (**cp == '\\' && quote_mode) {
+-
++    if (**cp == '\\' &&
++        quote_mode == TRUE) {
+       /* Escaped char */
+       if (*((*cp)+1)) {
+-        *dst = *(++(*cp));
++        *dst++ = *(++(*cp));
++        (*cp)++;
++        continue;
+       }
+     }
+ 
+     *dst++ = **cp;
+-    ++(*cp);
++    (*cp)++;
+   }
+ 
+   if (**cp) {
+diff --git a/tests/api/str.c b/tests/api/str.c
+index 050f5c563..bc64f0fb0 100644
+--- a/tests/api/str.c
++++ b/tests/api/str.c
+@@ -1,6 +1,6 @@
+ /*
+  * ProFTPD - FTP server testsuite
+- * Copyright (c) 2008-2017 The ProFTPD Project team
++ * Copyright (c) 2008-2023 The ProFTPD Project team
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -695,19 +695,23 @@ END_TEST
+ START_TEST (get_word_test) {
+   char *ok, *res, *str;
+ 
++  mark_point();
+   res = pr_str_get_word(NULL, 0);
+   fail_unless(res == NULL, "Failed to handle null arguments");
+   fail_unless(errno == EINVAL, "Failed to set errno to EINVAL");
+ 
++  mark_point();
+   str = NULL;
+   res = pr_str_get_word(&str, 0);
+   fail_unless(res == NULL, "Failed to handle null str argument");
+   fail_unless(errno == EINVAL, "Failed to set errno to EINVAL");
+ 
++  mark_point();
+   str = pstrdup(p, "  ");
+   res = pr_str_get_word(&str, 0);
+   fail_unless(res == NULL, "Failed to handle whitespace argument");
+ 
++  mark_point();
+   str = pstrdup(p, " foo");
+   res = pr_str_get_word(&str, PR_STR_FL_PRESERVE_WHITESPACE);
+   fail_unless(res != NULL, "Failed to handle whitespace argument: %s",
+@@ -723,6 +727,7 @@ START_TEST (get_word_test) {
+   ok = "foo";
+   fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
+ 
++  mark_point();
+   str = pstrdup(p, "  # foo");
+   res = pr_str_get_word(&str, 0);
+   fail_unless(res == NULL, "Failed to handle commented argument");
+@@ -742,6 +747,8 @@ START_TEST (get_word_test) {
+   fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
+ 
+   /* Test multiple embedded quotes. */
++
++  mark_point();
+   str = pstrdup(p, "foo \"bar baz\" qux \"quz norf\"");
+   res = pr_str_get_word(&str, 0);
+   fail_unless(res != NULL, "Failed to handle quoted argument: %s",
+@@ -770,6 +777,47 @@ START_TEST (get_word_test) {
+ 
+   ok = "quz norf";
+   fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
++
++
++  /* Test embedded quotes with backslashes (Issue #1683). */
++  mark_point();
++
++  str = pstrdup(p, "\"\\\\SYST\"");
++  res = pr_str_get_word(&str, 0);
++  fail_unless(res != NULL, "Failed to handle quoted argument: %s",
++    strerror(errno));
++
++  ok = "\\SYST";
++  fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
++
++  mark_point();
++  str = pstrdup(p, "\"\"\\\\SYST");
++  res = pr_str_get_word(&str, 0);
++  fail_unless(res != NULL, "Failed to handle quoted argument: %s",
++    strerror(errno));
++
++  /* Note that pr_str_get_word() is intended to be called multiple times
++   * on an advancing buffer, effectively tokenizing the buffer.  This is
++   * why the function does NOT decrement its quote mode.
++   */
++  ok = "";
++  fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
++
++  /* Now do the same tests with the IGNORE_QUOTES flag */
++  mark_point();
++
++  str = ok = pstrdup(p, "\"\\\\SYST\"");
++  res = pr_str_get_word(&str, PR_STR_FL_IGNORE_QUOTES);
++  fail_unless(res != NULL, "Failed to handle quoted argument: %s",
++    strerror(errno));
++  fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
++
++  mark_point();
++  str = ok = pstrdup(p, "\"\"\\\\SYST");
++  res = pr_str_get_word(&str, PR_STR_FL_IGNORE_QUOTES);
++  fail_unless(res != NULL, "Failed to handle quoted argument: %s",
++    strerror(errno));
++  fail_unless(strcmp(res, ok) == 0, "Expected '%s', got '%s'", ok, res);
+ }
+ END_TEST
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index 686f1e5cdf..9d846f46a2 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
            file://contrib.patch  \
            file://build_fixup.patch \
            file://proftpd.service \
+           file://CVE-2023-51713.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


