Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD3FC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:25:32 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.4600.1702286722688546371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 01:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OwiZvCZU;
 spf=pass (domain: mvista.com, ip: 209.85.161.43, mailfrom: vkumbhar@mvista.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5910b21896eso154733eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702286721; x=1702891521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHsCdnJg99ikFMuNm16OdZtVNXoA03COBblsSaUUjEc=;
        b=OwiZvCZUZv4e+rcIf6n1f7KKwm+6TzWPHg4Fj/AuQHU0Ize34XGLDZ0RRt9Y32I9/F
         GnnxrSjPIx3bDLPOCjUW6YIGPEFcYTe38EFCey5vg54CEsCa5PyOKT6+62NzoB6m6hmS
         B2TyBO25DD4o/3A+/e0XP3flM3vT7v7BRiAdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286721; x=1702891521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHsCdnJg99ikFMuNm16OdZtVNXoA03COBblsSaUUjEc=;
        b=CLdJRL84+yMSRA3flUegfF+dL/supOwCW0ietXixfX7cqcRSU/fSJGRFhCVb95c/tX
         anlgGIFp4Gq+pTZuSNH2z0CuOPXQ49thgD5qA/jgaCv1LYBFeVYxFU1TjxcFj2YB8kSH
         tpVV7PHj7iJl3nj0FDNpFB9qvE2cEG78yb//NNCoqbJojf3m26M/APvtkQTRvoh2F1D4
         8QgXPPqvSAvHQSQpL12fhDh1vhHOCDuZSE/tPcQSQJgf4Zd14/Nw29deb7QICI2aDSEh
         3ztCe979KcKO+MksecLtb+u3doBf51tq1greQRbLy+PB9rqMf37EP5N6tsivx9LnmmIb
         3Chw==
X-Gm-Message-State: AOJu0YzeEF5wA+CNMBskeD6BoErhuxEKr09gkeM6k2mTddspu37i0G94
	7fmeBpWwoxDKCeKEXP2rSrwVgvE8sZfS2VlOVpk=
X-Google-Smtp-Source: AGHT+IHgKXnubiJqzyE9WZLjvYRs2I8XzTbqrkgBh3fcsF5uynpbt0sm+Imh126r3wikYjcMPEhnSw==
X-Received: by 2002:a05:6359:29d:b0:170:17eb:1df with SMTP id ek29-20020a056359029d00b0017017eb01dfmr1537198rwb.34.1702286721318;
        Mon, 11 Dec 2023 01:25:21 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.75.30.146])
        by smtp.gmail.com with ESMTPSA id d17-20020a056a00245100b006ce66144e91sm5777024pfj.114.2023.12.11.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:25:20 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][dunfell][PATCH] proftpd: fix CVE-2020-9273 Use-after-free vulnerability in memory pools during data transfer
Date: Mon, 11 Dec 2023 14:55:11 +0530
Message-Id: <20231211092511.5887-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 09:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107321

Upstream-Status: Backport from https://github.com/proftpd/proftpd/commit/e845abc1bd86eebec7a0342fded908a1b0f1996b

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../proftpd/files/CVE-2020-9273.patch         | 280 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.6.bb  |   1 +
 2 files changed, 281 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2020-9273.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2020-9273.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2020-9273.patch
new file mode 100644
index 0000000000..fcec958e23
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2020-9273.patch
@@ -0,0 +1,280 @@
+From e845abc1bd86eebec7a0342fded908a1b0f1996b Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Tue, 18 Feb 2020 09:48:18 -0800
+Subject: [PATCH] Issue #903: Ensure that we do not reuse already-destroyed
+ memory pools during data transfers.
+
+Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/e845abc1bd86eebec7a0342fded908a1b0f1996b]
+CVE: CVE-2020-9273
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/data.c           | 27 +++++++++++++-----
+ src/main.c           |  6 ++--
+ src/response.c       | 12 ++++++++
+ tests/api/data.c     | 68 ++++++++++++++++++++++++++++++++++++++++++++
+ tests/api/response.c | 10 +++++++
+ 5 files changed, 114 insertions(+), 9 deletions(-)
+
+diff --git a/src/data.c b/src/data.c
+index 05b3a34..1c050cf 100644
+--- a/src/data.c
++++ b/src/data.c
+@@ -2,7 +2,7 @@
+  * ProFTPD - FTP server daemon
+  * Copyright (c) 1997, 1998 Public Flood Software
+  * Copyright (c) 1999, 2000 MacGyver aka Habeeb J. Dihu <macgyver@tos.net>
+- * Copyright (c) 2001-2016 The ProFTPD Project team
++ * Copyright (c) 2001-2020 The ProFTPD Project team
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -684,7 +684,7 @@ void pr_data_close(int quiet) {
+  */
+ void pr_data_cleanup(void) {
+   /* sanity check */
+-  if (session.d) {
++  if (session.d != NULL) {
+     pr_inet_lingering_close(session.pool, session.d, timeout_linger);
+     session.d = NULL;
+   }
+@@ -711,7 +711,7 @@ void pr_data_abort(int err, int quiet) {
+     strerror(err), err, quiet ? "true" : "false",
+     true_abort ? "true" : "false");
+ 
+-  if (session.d) {
++  if (session.d != NULL) {
+     if (true_abort == FALSE) {
+       pr_inet_lingering_close(session.pool, session.d, timeout_linger);
+ 
+@@ -893,6 +893,11 @@ void pr_data_abort(int err, int quiet) {
+     if (true_abort == FALSE) {
+       pr_response_add_err(respcode, _("Transfer aborted. %s"), msg ? msg : "");
+     }
++
++    /* Forcibly clear the data-transfer instigating command pool from the
++     * Response API.
++     */
++    pr_response_set_pool(NULL);
+   }
+ 
+   if (true_abort) {
+@@ -925,6 +930,7 @@ static void poll_ctrl(void) {
+     res = pr_cmd_read(&cmd);
+     if (res < 0) {
+       int xerrno;
++
+ #if defined(ECONNABORTED)
+       xerrno = ECONNABORTED;
+ #elif defined(ENOTCONN)
+@@ -993,8 +999,8 @@ static void poll_ctrl(void) {
+ 
+         pr_response_flush(&resp_err_list);
+ 
+-        destroy_pool(cmd->pool);
+         pr_response_set_pool(resp_pool);
++        destroy_pool(cmd->pool);
+ 
+       /* We don't want to actually dispatch the NOOP command, since that
+        * would overwrite the scoreboard with the NOOP state; admins probably
+@@ -1019,13 +1025,14 @@ static void poll_ctrl(void) {
+ 
+         pr_response_flush(&resp_list);
+ 
+-        destroy_pool(cmd->pool);
+         pr_response_set_pool(resp_pool);
++        destroy_pool(cmd->pool);
+ 
+       } else {
+         char *title_buf = NULL;
+-        int title_len = -1;
+-        const char *sce_cmd = NULL, *sce_cmd_arg = NULL;
++        int curr_cmd_id = 0, title_len = -1;
++        const char *curr_cmd = NULL, *sce_cmd = NULL, *sce_cmd_arg = NULL;
++        cmd_rec *curr_cmd_rec = NULL;
+ 
+         pr_trace_msg(trace_channel, 5,
+           "client sent '%s' command during data transfer, dispatching",
+@@ -1037,6 +1044,9 @@ static void poll_ctrl(void) {
+           pr_proctitle_get(title_buf, title_len + 1); 
+         }
+ 
++        curr_cmd = session.curr_cmd;
++        curr_cmd_id = session.curr_cmd_id;
++        curr_cmd_rec = session.curr_cmd_rec;
+         sce_cmd = pr_scoreboard_entry_get(PR_SCORE_CMD);
+         sce_cmd_arg = pr_scoreboard_entry_get(PR_SCORE_CMD_ARG);
+ 
+@@ -1052,6 +1062,9 @@ static void poll_ctrl(void) {
+         }
+ 
+         destroy_pool(cmd->pool);
++        session.curr_cmd = curr_cmd;
++        session.curr_cmd_id = curr_cmd_id;
++        session.curr_cmd_rec = curr_cmd_rec;
+       }
+ 
+     } else {
+diff --git a/src/main.c b/src/main.c
+index 1ead27f..8138c2a 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -892,8 +892,7 @@ static void cmd_loop(server_rec *server, conn_t *c) {
+       pr_timer_reset(PR_TIMER_IDLE, ANY_MODULE);
+     }
+ 
+-    if (cmd) {
+-
++    if (cmd != NULL) {
+       /* Detect known commands for other protocols; if found, drop the
+        * connection, lest we be used as part of an attack on a different
+        * protocol server (Bug#4143).
+@@ -909,6 +908,9 @@ static void cmd_loop(server_rec *server, conn_t *c) {
+  
+       pr_cmd_dispatch(cmd);
+       destroy_pool(cmd->pool);
++      session.curr_cmd = NULL;
++      session.curr_cmd_id = 0;
++      session.curr_cmd_rec = NULL;
+ 
+     } else {
+       pr_event_generate("core.invalid-command", NULL);
+diff --git a/src/response.c b/src/response.c
+index 9b4395f..93d31e2 100644
+--- a/src/response.c
++++ b/src/response.c
+@@ -219,6 +219,12 @@ void pr_response_add_err(const char *numeric, const char *fmt, ...) {
+     return;
+   }
+ 
++  if (resp_pool == NULL) {
++    pr_trace_msg(trace_channel, 1,
++      "no response pool set, ignoring added %s error response", numeric);
++    return;
++  }
++
+   va_start(msg, fmt);
+   res = vsnprintf(resp_buf, sizeof(resp_buf), fmt, msg);
+   va_end(msg);
+@@ -272,6 +278,12 @@ void pr_response_add(const char *numeric, const char *fmt, ...) {
+     return;
+   }
+ 
++  if (resp_pool == NULL) {
++    pr_trace_msg(trace_channel, 1,
++      "no response pool set, ignoring added %s response", numeric);
++    return;
++  }
++
+   va_start(msg, fmt);
+   res = vsnprintf(resp_buf, sizeof(resp_buf), fmt, msg);
+   va_end(msg);
+diff --git a/tests/api/data.c b/tests/api/data.c
+index e4442ab..38fae3e 100644
+--- a/tests/api/data.c
++++ b/tests/api/data.c
+@@ -152,6 +152,74 @@ START_TEST (data_ignore_ascii_test) {
+ }
+ END_TEST
+ 
++START_TEST (response_add_test) {
++  int res;
++  const char *last_resp_code = NULL, *last_resp_msg = NULL;
++  char *resp_code = R_200, *resp_msg = "OK";
++
++  pr_response_set_pool(NULL);
++
++  mark_point();
++  pr_response_add(resp_code, "%s", resp_msg);
++
++  pr_response_set_pool(p);
++
++  mark_point();
++  pr_response_add(NULL, NULL);
++
++  mark_point();
++  pr_response_add(NULL, "%s", resp_msg);
++
++  mark_point();
++  pr_response_add(resp_code, "%s", resp_msg);
++  pr_response_add(NULL, "%s", resp_msg);
++
++  res = pr_response_get_last(p, &last_resp_code, &last_resp_msg);
++  fail_unless(res == 0, "Failed to get last values: %d (%s)", errno,
++    strerror(errno));
++
++  fail_unless(last_resp_code != NULL, "Last response code unexpectedly null");
++  fail_unless(strcmp(last_resp_code, resp_code) == 0,
++    "Expected response code '%s', got '%s'", resp_code, last_resp_code);
++  
++  fail_unless(last_resp_msg != NULL, "Last response message unexpectedly null");
++  fail_unless(strcmp(last_resp_msg, resp_msg) == 0,
++    "Expected response message '%s', got '%s'", resp_msg, last_resp_msg);
++}
++END_TEST
++
++START_TEST (response_add_err_test) {
++  int res;
++  const char *last_resp_code = NULL, *last_resp_msg = NULL;
++  char *resp_code = R_450, *resp_msg = "Busy";
++
++  pr_response_set_pool(NULL);
++
++  mark_point();
++  pr_response_add(resp_code, "%s", resp_msg);
++
++  pr_response_set_pool(p);
++
++  mark_point();
++  pr_response_add_err(NULL, NULL);
++
++  mark_point();
++  pr_response_add_err(resp_code, "%s", resp_msg);
++
++  res = pr_response_get_last(p, &last_resp_code, &last_resp_msg);
++  fail_unless(res == 0, "Failed to get last values: %d (%s)", errno,
++    strerror(errno));
++
++  fail_unless(last_resp_code != NULL, "Last response code unexpectedly null");
++  fail_unless(strcmp(last_resp_code, resp_code) == 0,
++    "Expected response code '%s', got '%s'", resp_code, last_resp_code);
++
++  fail_unless(last_resp_msg != NULL, "Last response message unexpectedly null");
++  fail_unless(strcmp(last_resp_msg, resp_msg) == 0,
++    "Expected response message '%s', got '%s'", resp_msg, last_resp_msg);
++}
++END_TEST
++
+ static int data_close_cb(pr_netio_stream_t *nstrm) {
+   return 0;
+ }
+diff --git a/tests/api/response.c b/tests/api/response.c
+index 0d95069..9a04774 100644
+--- a/tests/api/response.c
++++ b/tests/api/response.c
+@@ -87,6 +87,11 @@ START_TEST (response_add_test) {
+   const char *last_resp_code = NULL, *last_resp_msg = NULL;
+   char *resp_code = R_200, *resp_msg = "OK";
+ 
++  pr_response_set_pool(NULL);
++
++  mark_point();
++  pr_response_add(resp_code, "%s", resp_msg);
++
+   pr_response_set_pool(p);
+ 
+   mark_point();
+@@ -118,6 +123,11 @@ START_TEST (response_add_err_test) {
+   const char *last_resp_code = NULL, *last_resp_msg = NULL;
+   char *resp_code = R_450, *resp_msg = "Busy";
+ 
++  pr_response_set_pool(NULL);
++
++  mark_point();
++  pr_response_add(resp_code, "%s", resp_msg);
++
+   pr_response_set_pool(p);
+ 
+   mark_point();
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index 9ec97b9237..f30a8d4011 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            file://CVE-2021-46854.patch \
+           file://CVE-2020-9273.patch \
            "
 SRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
 SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
-- 
2.40.1


