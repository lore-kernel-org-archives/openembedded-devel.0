Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA35C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:20:37 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.27675.1749190831598991530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iZ2cG08D;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7481600130eso1968234b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 23:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749190830; x=1749795630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKvy5UZu95UB59JMvXllCA7bV6pm9lzq1S9m9IxDWok=;
        b=iZ2cG08DxNthEJA5/JiDOsXOuGSLO9zlzyCgYrG0GbHvsEP0pFcgA2JGyoZc2hf+PG
         uFHY18pXc7DLNfK1JyKH7K3FQFRyFFqr9GUCBfLpI6DkQC7FLBLSjX/xRWuM8gINlFp0
         Mqra9GdOIHaFkoPu3M2p5ymzWhL3ejEerQjFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190830; x=1749795630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKvy5UZu95UB59JMvXllCA7bV6pm9lzq1S9m9IxDWok=;
        b=aCgSB+HJ/+8pbVKjriTqmGkDP8voARAE0ZC/+CnyY6NsZAwi5Y1ZUoBU6SoMYQJpNt
         3gjciADsO31QNuBCZEriT9gX9ZGD0PkTz3P6wPHs4HFmvjzxjOzpaMhuDvbQEO9XPaRb
         Y+igKbCUIXdkbkx+yLNujBzzkDLSrGVXJRkm6lW7epoK1dL9v9fhd/haRJXzc8X/88fu
         01unKczU1DlubGA4/7peiB86fiie6jyitt13FHBD7G+nvbNB6UOcAMR3gW2Ae8V4xSfH
         nbbX8YtdnranVgMVwJ1+M8mz21HnpujQrx+k/1yZJcYPYOG5LGbkY/G+3iSoNlYxpo7C
         zAYQ==
X-Gm-Message-State: AOJu0YwNHS3lVydINgfiZtmZxGyOzCUiRWs/BqwGTviS24+DFelee3Zc
	7M7nv8nW+3xaru3h2WQ8P/pv7m1gmeLiaFvV6GPTY0zXgIiTIC4RNYbwTFR/RKUiHiKncb8TzAJ
	ce6DAUog=
X-Gm-Gg: ASbGncu/ZjI1glY454KHYzpNFY4KDVFlEe8fKtPR5w3wdiD1Ec/YoI7XA3+rsgC7Oc5
	cmTFMLjsb17hoHvvOvhoiJKZc0EY3/5qzsX5CAnq2wc4jwnZ2Dqt+LUfB/fviLlowFzqQE/LcEa
	rxCXVCxIGKvOLgLW3+qvTYZq50NXoh5Q6YRvFsqS9D11X0N9cRImFI1p6zxChKyz1SQ/yX5s0me
	KwnW7oOPCwgjzAz0d1kEXqnhqHkTy1gaKN+fARo/7CMhHdSkREgohakWbiBkR1dqtC7kknaUsfb
	UE/GAabrUsRAJ5YeReCdozk+Gji9/3jn6IyH5mJdGggXjDdSktgW+cz/WTen74KXgIb2l5E44g=
	=
X-Google-Smtp-Source: AGHT+IE/aNGxkbqA3W1t5lMHhOvSfRz0fEyU6aA6fRHoN90skrvl/PDQavdZ7TuijWhRotbVMc+gFg==
X-Received: by 2002:a05:6a00:991:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-74827f15a33mr3160936b3a.16.1749190830337;
        Thu, 05 Jun 2025 23:20:30 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.224.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b5fbsm622544b3a.63.2025.06.05.23.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:20:29 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][PATCH] proftpd: Fix CVE-2023-51713
Date: Fri,  6 Jun 2025 11:50:20 +0530
Message-Id: <20250606062020.6004-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 06:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117760

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07f67170ec64a8b4d62592

Link: https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone&id=730e44900a0a86265bad93a16b5a5ff344a07266

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../proftpd/files/CVE-2023-51713.patch        | 278 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |   1 +
 2 files changed, 279 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
new file mode 100644
index 0000000000..377d8a74ec
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
@@ -0,0 +1,278 @@
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index b45cb6aaec..ec38fb54e1 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
            file://contrib.patch  \
            file://build_fixup.patch \
            file://proftpd.service \
+           file://CVE-2023-51713.patch \
            file://CVE-2024-57392.patch \
            "
 
-- 
2.25.1


