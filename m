Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1758.1792434873437056328
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N2OmSBTJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a058315c79so798761b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434873; x=1793039673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymQxmOa1KTC+NSLDSSKdPfIWTdZ1eg3Jf8xxT4Z1ciY=;
        b=N2OmSBTJ30Z9AnRHGGSWBHVs12M1InEc3KqFYOq24ijSM6rtRxM6PRU6B5vLLzcvLP
         1Js0erQD49k4FbqbQydJnWk8oixLQ3oxTE32vJiunhylgPCjUgBZ9OPubzOBa6nTQ9pT
         d0QzW/4kXP5L2GeH30oBBHNnr2e808G3OlLdU149g9eEoWofPIj2aKc7wrRrDMpeHVoY
         pE2FDLZiC6TfA8SIew/0+7gBotMHPRmX9TpS4vNNc51LMin7SPhnFA8MHQ5EHw/I1Z0K
         I3ffLpmNlUyGzDFfx47fb7Ifrt+8bhQN4tDMcKSSvE/g+Yhs6RGwNjxaz7bo2UKNx1Y/
         45ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434873; x=1793039673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymQxmOa1KTC+NSLDSSKdPfIWTdZ1eg3Jf8xxT4Z1ciY=;
        b=vuxnfevwDmvz/9BzaoxIxO5X5DtXA+YN8h6MxXTdmnhsGQwOOEksVzgWniPJdJKPgU
         Wb725rY5Eg0h9tdevBWlykA4Uy4R6N5gCfujmbP5aNPLo8kEKaYqVw1rjWze6tzP0f+8
         W9LBaYEMuohZ/1DQbKZgcOPRp6x+5bGnlXtbIbFjTwSGcNx5ynLHYrkQZCTLyEdMqeXN
         WmCMpDkVyLaknB6/2azEvsSNmDwdQTUCLGWrKsC4xL2HB7sCGR/FZbvFLveMae+OONKg
         Z+yy8RgUBKxpg6Ja9faYIXG3nXTABmoB71NLvZjYl5kVtGOQ9CtM6tCdVIPLhzQJWTUG
         BqjA==
X-Gm-Message-State: AFq9FYLEnaST7Ho/ymLerWFW5eypRIikJoCb/79RarfNafbwzY/T5Ez6
	MCb0fKOpvcWYRFJgV8ls7Efcp0yp6kgA7HIkROypQyN5bQ++ZXUCfdxI6+omIg==
X-Gm-Gg: AYBFou3o37Mkua+5XKdaKPoudFiqOScpPE/NPAkJfFRF4vTVC2JZV/6dBP4BzNLUdcu
	PI+DAJFMKcu4oEHFXUMdTatgJr1ZmP3KA//tSoiNdLRCs/V4j1F4OWjPyO3HDxbebD62oEFu4dw
	iRUEMdZAFJX6M5mnfemsNkngxT9jWRWQuUbuAwaoFGVuBoF+HfAlptbcvQRLjqNswllqmR6Euf8
	Il81i2VhmyyqWe0Zz1gxZQ+ryZxjIBWnRoPr3nW0BOJNEROGV3HLo3dsqYn9sEiQPD8Ym/A1/Kx
	FT+52OmWH+aLbab/1H/POAXr5HuAcX82AREsIZq2ovUk+eWGmLpCDAeyz+zIfLlowB0oxTcfQrx
	msg2p2CQoRoDB00BQODY67yGinnbNuA48dkMkcBhRoAVhWFWR8yfhOmZ+D+A1zC1I0tFB7eAC6W
	pSwfGBJUOF4E300h/BILLOobbypqyUfnOYGWyXWa8RDu2nbQgCBCxtv4XGDxMBpSrvqbvksvYNa
	5xR72a4EGXAphfp8+qzRxq4T+L24H/5l9gtrVM=
X-Received: by 2002:a05:6a21:490d:b0:3e1:3178:8d63 with SMTP id adf61e73a8af0-3e26765e218mr758011637.44.1792434872771;
        Mon, 19 Oct 2026 11:34:32 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 8/20] pjproject: patch CVE-2026-57165
Date: Tue, 20 Oct 2026 07:33:54 +1300
Message-ID: <20261019183407.1037972-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131134
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57165

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit aac29142ede95bcf48ecf16e19671314feb1590e)
---
 .../pjproject/pjproject/CVE-2026-57165.patch  | 85 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
new file mode 100644
index 0000000000..e2d62b0eef
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
@@ -0,0 +1,85 @@
+From 5776ee452296d5277d71e2bb011709adec80a533 Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:47:29 +0700
+Subject: [PATCH] Merge commit from fork
+
+handle_up_down() in cli_telnet.c accumulated cur_pos + 2*rcmd->len +
+history->slen bytes into a fixed PJ_CLI_MAX_CMDBUF stack buffer with no
+bound check. Size the buffer for the worst case, clamp each term to
+PJ_CLI_MAX_CMDBUF, and replace the trailing unchecked pj_strcat with a
+bounded pj_memcpy.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit 628b71638465bacf66e767959e6acbab822eccd6)
+
+CVE: CVE-2026-57165
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/628b71638465bacf66e767959e6acbab822eccd6]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjlib-util/src/pjlib-util/cli_telnet.c | 33 ++++++++++++++++++++------
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/pjlib-util/src/pjlib-util/cli_telnet.c b/pjlib-util/src/pjlib-util/cli_telnet.c
+index 150727bb5..0a2954bd4 100644
+--- a/pjlib-util/src/pjlib-util/cli_telnet.c
++++ b/pjlib-util/src/pjlib-util/cli_telnet.c
+@@ -1141,7 +1141,14 @@ static pj_bool_t handle_up_down(cli_telnet_sess *sess, pj_bool_t is_up)
+     history = get_prev_history(sess, is_up);
+     if (history) {
+         pj_str_t send_data;
+-        char str[PJ_CLI_MAX_CMDBUF];
++        /* The redraw sequence can accumulate up to
++         *   cur_pos + 2 * rcmd->len + history->slen
++         * bytes, each term bounded by PJ_CLI_MAX_CMDBUF, so size the
++         * local buffer for the worst case and clamp each term below.
++         */
++        char str[PJ_CLI_MAX_CMDBUF * 4];
++        unsigned cur_pos, buf_len;
++        pj_size_t hist_len;
+         enum {
+             MOVE_CURSOR_LEFT = 0x08,
+             CLEAR_CHAR = 0x20
+@@ -1149,15 +1156,24 @@ static pj_bool_t handle_up_down(cli_telnet_sess *sess, pj_bool_t is_up)
+         send_data.ptr = str;
+         send_data.slen = 0;
+ 
++        cur_pos = sess->rcmd->cur_pos;
++        buf_len = sess->rcmd->len;
++        hist_len = history->slen;
++        if (cur_pos > PJ_CLI_MAX_CMDBUF)
++            cur_pos = PJ_CLI_MAX_CMDBUF;
++        if (buf_len > PJ_CLI_MAX_CMDBUF)
++            buf_len = PJ_CLI_MAX_CMDBUF;
++        if (hist_len > PJ_CLI_MAX_CMDBUF)
++            hist_len = PJ_CLI_MAX_CMDBUF;
++
+         /* Move cursor position to the beginning of line */
+-        if (sess->rcmd->cur_pos > 0) {
+-            pj_memset(send_data.ptr, MOVE_CURSOR_LEFT, sess->rcmd->cur_pos);
+-            send_data.slen = sess->rcmd->cur_pos;
++        if (cur_pos > 0) {
++            pj_memset(send_data.ptr, MOVE_CURSOR_LEFT, cur_pos);
++            send_data.slen = cur_pos;
+         }
+ 
+-        if (sess->rcmd->len > (unsigned)history->slen) {
++        if (buf_len > (unsigned)hist_len) {
+             /* Clear the command currently shown*/
+-            unsigned buf_len = sess->rcmd->len;
+             pj_memset(&send_data.ptr[send_data.slen], CLEAR_CHAR, buf_len);
+             send_data.slen += buf_len;
+ 
+@@ -1167,7 +1183,10 @@ static pj_bool_t handle_up_down(cli_telnet_sess *sess, pj_bool_t is_up)
+             send_data.slen += buf_len;
+         }
+         /* Send data */
+-        pj_strcat(&send_data, history);
++        if (hist_len > 0) {
++            pj_memcpy(&send_data.ptr[send_data.slen], history->ptr, hist_len);
++            send_data.slen += hist_len;
++        }
+         telnet_sess_send(sess, &send_data);
+         pj_ansi_strxcpy2((char*)sess->rcmd->rbuf, history, 
+                          sizeof(sess->rcmd->rbuf));
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 8e0b358ffe..e7cae469ed 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57162.patch \
            file://CVE-2026-57163.patch \
            file://CVE-2026-57164.patch \
+           file://CVE-2026-57165.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
