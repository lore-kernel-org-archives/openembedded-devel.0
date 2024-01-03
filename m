Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0FCC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 09:01:43 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.13931.1704272495558245682
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AI+uGs5v;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d4414ec9c7so23515185ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 01:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704272495; x=1704877295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIcsREPDo+74ldEGXRpDZaSekZiD87dQL1UzxYQNf9k=;
        b=AI+uGs5vwF7VJ7JHCCCwl+fT9UZ1l0+195UlWRI4izKY7Z0GqZtmHFPviJzFoTK9nA
         WI7sR/sm7Cfh+qXAWtknp505o1W1U9Iwtk0g9B5qxEFeS92krksyfH/PzK4kkWhdeAnG
         CKa96BUi3yOxnIc4pDD/4BFHPWeETWzwzFN7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704272495; x=1704877295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIcsREPDo+74ldEGXRpDZaSekZiD87dQL1UzxYQNf9k=;
        b=c8dl3cSmNm2HbaIK562AdtMwD1tBAWUBpLxrjCCk4vCMO2BJ0Ixip932VCjweg8YIu
         d+Q3Lyoi8nzV+TJB3FXflpEdoMFPvBqVfBLmTtq3Vh9n2WAaUWxsbikxmEBfuAkeem2J
         9v6BX4y9yPebEn1ba9TxpjY23Q2m9LxnXNcFHSTaKP9sk2SyLuDY71MEGOAbxDnk6X/9
         XpxbqPyh3/rgVkTof8jT0sGo+b/7jKRlxz40MB2foJWUVhAEvUHb8eUtiweSix9d4s8A
         +xYRh3ttjljcGpuIMSEGi4mURCc2ym9/ivqb2fHLtPsZfiGUVGN9W8ClRjwEbrlq3Kw8
         G4wQ==
X-Gm-Message-State: AOJu0Yy/w0SjGVUz3wWlleL3S9QjUtIdLY4le/LfUcAY7YnP6S7bWdav
	xgxsPSBVVwsbI9wT6saP0/qrvqi2c5BINkvZJEQmxns2Xfg=
X-Google-Smtp-Source: AGHT+IGhvHjOA287XSF75zz9Be/I8uOjPzcadnmKEil8CjxrAOHDijsoJsg6cOaY/8zT8J25oiVK8A==
X-Received: by 2002:a17:903:2346:b0:1d4:cecb:4811 with SMTP id c6-20020a170903234600b001d4cecb4811mr779051plh.51.1704272494706;
        Wed, 03 Jan 2024 01:01:34 -0800 (PST)
Received: from MVIN00016.mvista.com ([43.249.234.189])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001d4ab6f0a5csm6913710plr.230.2024.01.03.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 01:01:34 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] proftpd: Fix CVE-2023-51713 Out-of-bounds buffer read
Date: Wed,  3 Jan 2024 14:31:28 +0530
Message-Id: <20240103090128.42761-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 09:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108028

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


