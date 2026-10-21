Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7525.1792575014091249112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WVu4jPiw;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so947051c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575013; x=1793179813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksQHST4eSfDUcwni8T/B9cuekd3lKyWtQo9c0ZUXCCA=;
        b=WVu4jPiwI+8o8f3ImIf/f3LL7Vq1sDOeKjHmnLAFI98SRRSJiFLfdIXckAcUMWkb6j
         SDjhUUgadM33rjtlRqktFC+nbr4HlsTz+/IGPb/EfB6GyhiYD6/Zsbdz/SB1LSW4lKMf
         z6SlkvjnbFkBHa3UgDmQeuURokxoHXc+NdTbEzuxRzPqJc1XyXVGyzRmUr3BVOFzkqTm
         eCZ8NKW6GG1OOczcirRoSLQC6TWFctusGaTMhNMti/s7CTLNYxheG+CZaqWfma70jMH1
         z32gWnjUKUSxOd4bFzMXpoSMpQXg1YJdSmmd/n38tl1ZkFqw/KrLP5cxH3Kax/pe8MDn
         SlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575013; x=1793179813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksQHST4eSfDUcwni8T/B9cuekd3lKyWtQo9c0ZUXCCA=;
        b=HQmmoE9KDk7LGUZaf35FFj/uRZ5YsFfV6yVDd/HWoI/YrlsgoiN/PpF+gXJyoVR9wC
         pxpBZxbuojgil+293NUXp253CojqkeNV7XmqBgq2OZAfVD7qv/82XPg7kc7d3gi2TY9p
         N8jTigFGDLYF4QEfJCwuBJeff0wguyoRHVgmwinq5m/qG9ivtF7gzN9aaW4cJveq60ib
         d/WLjc9+T4wy/N6fuVewQMLnp4cw4QKJTKff+ZNDLG+O36HQF04d5mkywi8q7D69Xw3t
         REF7UkicPyMcjegk8yLE3LIeEzK5gnT+0w6ccFjahBAXzZR1FdqMu0FjVH1Vga4ztbrN
         xAOw==
X-Gm-Message-State: AFq9FYJPS94129j2YawgCFhmvy9g8T6yorJrxVio4gx+37hD3xjx5IN9
	WYaw5C3BifmngBNGhhtVYdSDjh+ixOH94F2/JauVRxBpqaJXYSXLmkFgnXimpA==
X-Gm-Gg: AYBFou0yFh8kbZZ3DL6mCXTp1/JFR5wBdUSTJsLF/HxMr7+ofn3iWKrLtSLl2Bsf6Wv
	0NJwXvw99B43SuuFRbty8EKUPkT2zcokkPKiQfBkUzj+/Do0jWAy6QSyzeGcfUYSPLh7OrX1H7X
	JIUCktPkGF/e7GZC6UwE8Sy1k62Cg66gVvQNBOBZG7RMH8DAW86NFkz/5btQtd9MUa9dJSjSTBM
	5UnF3YlbVBusRzmUFcG8jGC9B9h5L1V++5TNaTkRKKGlx+Ojy1RPyiPQ2sx1sIduYYj/gwLn3DD
	Fj1mTeDVlJRy2uVz8Y87pTBs/86NRSjEOV+qsbu+c9dbDWk08gTsWWHK/wwYyzH5MJd9yBJC9Kw
	aZa9K+0d5XOMm5lCbKfUgzeY9m8fVSIukNShTJkRKHlxNytcepUJx2Oy1gLxxmL8FrvXpMnWqlt
	dI4HOdVCsnvpXJiqOBbDk5DzRO1b2oKS2Oq8JGr6iCcBvOEb+lzGl4ewZdE/53RtAX6H+QBOUMW
	ptXAcu6kP02jQRvsmaLjAkmw+xeHpcAm4q+BrsTCep88sILs8eAhn//s93rrpR2OvUlkXWrzUgu
	ITnutOCL6Og3d9agqdEH+M6pG7bJUbg=
X-Received: by 2002:a05:7022:6b92:b0:190:d7de:883b with SMTP id a92af1059eb24-190d7de8999mr2676536c88.35.1792575013206;
        Wed, 21 Oct 2026 02:30:13 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 30/44] pjproject: patch CVE-2026-57166
Date: Wed, 21 Oct 2026 22:28:43 +1300
Message-ID: <20261021092857.3585453-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131217
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57166

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-57166.patch  | 228 ++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
new file mode 100644
index 0000000000..8311d4c36d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
@@ -0,0 +1,228 @@
+From d0b42b902bb6ca8a0a1393799db487642d3bf8ae Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:55:53 +0700
+Subject: [PATCH] Merge commit from fork
+
+* Fix pre-auth stack overflow formatting telnet CLI error indicator
+
+send_err_arg() in cli_telnet.c rendered the error caret into a fixed
+256-byte stack buffer using unchecked pj_strcat2; info->err_pos is
+bounded only by PJ_CLI_MAX_CMDBUF, so a long command line overflowed
+the buffer. Stream the spaces in bounded chunks via telnet_sess_send2,
+clamp the caret offset to PJ_CLI_MAX_CMDBUF, and send the message,
+prompt and echoed command separately, removing the stack buffer.
+
+Co-Authored-By Claude Code
+
+* Apply the same overflow fix to send_ambi_arg()
+
+Per review, send_ambi_arg() has the same issue as send_err_arg(): it
+renders an attacker-influenced number of caret spaces and appends the
+last command into a fixed 1028-byte stack buffer with unchecked
+pj_strcat2. info->err_pos and sess->rcmd->rbuf are bounded only by
+PJ_CLI_MAX_CMDBUF, so a long ambiguous command line could overflow it.
+
+Stream the caret offset in bounded chunks (clamped to PJ_CLI_MAX_CMDBUF)
+and stream the clamped last command separately, mirroring the
+send_err_arg() fix, instead of writing them into the fixed buffer. The
+shared SPACES constant is hoisted to file scope.
+
+Co-Authored-By Claude Code
+
+* Bound completion append in handle_tab()
+
+handle_tab() appended the matched command name into the fixed-size
+sess->rcmd->rbuf at offset len (the current command length) without
+checking that len + name length fits the buffer. len is bounded by the
+receive path, but the completion suffix is added on top, so a long
+completable command line could write past rbuf and its NUL terminator.
+
+Clamp the appended length to the space remaining in rbuf, leaving room
+for the terminator. Found while auditing the telnet CLI for the same
+fixed-buffer overflow pattern as send_err_arg()/send_ambi_arg().
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit 4472a31d77a7506ff175dad5abef490f4e31bed1)
+
+CVE: CVE-2026-57166
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/4472a31d77a7506ff175dad5abef490f4e31bed1]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjlib-util/src/pjlib-util/cli_telnet.c | 116 ++++++++++++++++++-------
+ 1 file changed, 84 insertions(+), 32 deletions(-)
+
+diff --git a/pjlib-util/src/pjlib-util/cli_telnet.c b/pjlib-util/src/pjlib-util/cli_telnet.c
+index 0a2954bd4..67898fdd8 100644
+--- a/pjlib-util/src/pjlib-util/cli_telnet.c
++++ b/pjlib-util/src/pjlib-util/cli_telnet.c
+@@ -680,6 +680,13 @@ static void send_prompt_str(cli_telnet_sess *sess)
+     telnet_sess_send(sess, &send_data);
+ }
+ 
++/* Buffer of spaces, used to stream the caret offset in bounded chunks
++ * instead of writing an attacker-influenced number of spaces into a
++ * fixed-size stack buffer. Shared by send_err_arg() and send_ambi_arg().
++ */
++static const unsigned char SPACES[64] =
++    "                                                                ";
++
+ /*
+  * This method is used to send error message to client, including
+  * the error position of the source command.
+@@ -690,32 +697,45 @@ static void send_err_arg(cli_telnet_sess *sess,
+                          pj_bool_t with_return,
+                          pj_bool_t with_last_cmd)
+ {
+-    pj_str_t send_data;
+-    char data_str[256];
+-    pj_size_t len;
+-    unsigned i;
++    pj_size_t len, remaining;
+     cli_telnet_fe *fe = (cli_telnet_fe *)sess->base.fe;
+ 
+-    send_data.ptr = data_str;
+-    send_data.slen = 0;
+-
+     if (with_return)
+-        pj_strcat2(&send_data, "\r\n");
++        telnet_sess_send2(sess, (const unsigned char*)"\r\n", 2);
+ 
++    /* Compute the caret offset. info->err_pos is derived from
++     * attacker-supplied input (pj_cli_sess_parse) and is bounded only by
++     * PJ_CLI_MAX_CMDBUF, so clamp it before emitting spaces. Otherwise a
++     * ~500-byte command line would overflow the fixed-size stack buffer
++     * this function previously used.
++     */
+     len = fe->cfg.prompt_str.slen + info->err_pos;
+-
+-    /* Set the error pointer mark */
+-    for (i=0;i<len;++i) {
+-        pj_strcat2(&send_data, " ");
++    if (len > PJ_CLI_MAX_CMDBUF)
++        len = PJ_CLI_MAX_CMDBUF;
++
++    remaining = len;
++    while (remaining > 0) {
++        pj_size_t chunk = (remaining > sizeof(SPACES)) ? sizeof(SPACES)
++                                                       : remaining;
++        telnet_sess_send2(sess, SPACES, (int)chunk);
++        remaining -= chunk;
+     }
+-    pj_strcat2(&send_data, "^");
+-    pj_strcat2(&send_data, "\r\n");
+-    pj_strcat(&send_data, msg);
+-    pj_strcat(&send_data, &fe->cfg.prompt_str);
+-    if (with_last_cmd)
+-        pj_strcat2(&send_data, (char *)sess->rcmd->rbuf);
+ 
+-    telnet_sess_send(sess, &send_data);
++    telnet_sess_send2(sess, (const unsigned char*)"^\r\n", 3);
++
++    if (msg && msg->slen > 0)
++        telnet_sess_send(sess, msg);
++    if (fe->cfg.prompt_str.slen > 0)
++        telnet_sess_send(sess, &fe->cfg.prompt_str);
++    if (with_last_cmd) {
++        pj_str_t last;
++        last.ptr = (char *)sess->rcmd->rbuf;
++        last.slen = (pj_ssize_t)pj_ansi_strlen((const char *)sess->rcmd->rbuf);
++        if (last.slen > PJ_CLI_MAX_CMDBUF)
++            last.slen = PJ_CLI_MAX_CMDBUF;
++        if (last.slen > 0)
++            telnet_sess_send(sess, &last);
++    }
+ }
+ 
+ static void send_inv_arg(cli_telnet_sess *sess,
+@@ -765,7 +785,7 @@ static void send_ambi_arg(cli_telnet_sess *sess,
+                           pj_bool_t with_last_cmd)
+ {
+     unsigned i;
+-    pj_size_t len;
++    pj_size_t len, remaining;
+     pj_str_t send_data;
+     char data[1028];
+     cli_telnet_fe *fe = (cli_telnet_fe *)sess->base.fe;
+@@ -779,14 +799,25 @@ static void send_ambi_arg(cli_telnet_sess *sess,
+     send_data.slen = 0;
+ 
+     if (with_return)
+-        pj_strcat2(&send_data, "\r\n");
++        telnet_sess_send2(sess, (const unsigned char*)"\r\n", 2);
+ 
++    /* Compute and clamp the caret offset, then stream the spaces, like
++     * send_err_arg(). info->err_pos is attacker-bounded only by
++     * PJ_CLI_MAX_CMDBUF, so it must not drive writes into data[].
++     */
+     len = fe->cfg.prompt_str.slen + info->err_pos;
+-
+-    for (i=0;i<len;++i) {
+-        pj_strcat2(&send_data, " ");
++    if (len > PJ_CLI_MAX_CMDBUF)
++        len = PJ_CLI_MAX_CMDBUF;
++
++    remaining = len;
++    while (remaining > 0) {
++        pj_size_t chunk = (remaining > sizeof(SPACES)) ? sizeof(SPACES)
++                                                       : remaining;
++        telnet_sess_send2(sess, SPACES, (int)chunk);
++        remaining -= chunk;
+     }
+-    pj_strcat2(&send_data, "^");
++    telnet_sess_send2(sess, (const unsigned char*)"^", 1);
++
+     /* Get the max length of the command name */
+     for (i=0;i<info->hint_cnt;++i) {
+         if (hint[i].type.slen > 0) {
+@@ -874,10 +905,21 @@ static void send_ambi_arg(cli_telnet_sess *sess,
+     }
+     pj_strcat2(&send_data, "\r\n");
+     pj_strcat(&send_data, &fe->cfg.prompt_str);
+-    if (with_last_cmd)
+-        pj_strcat2(&send_data, (char *)sess->rcmd->rbuf);
+-
+     telnet_sess_send(sess, &send_data);
++
++    /* Stream the last command separately with a clamp; sess->rcmd->rbuf
++     * is attacker-bounded only by PJ_CLI_MAX_CMDBUF, so appending it into
++     * data[] could overflow the fixed-size buffer.
++     */
++    if (with_last_cmd) {
++        pj_str_t last;
++        last.ptr = (char *)sess->rcmd->rbuf;
++        last.slen = (pj_ssize_t)pj_ansi_strlen((const char *)sess->rcmd->rbuf);
++        if (last.slen > PJ_CLI_MAX_CMDBUF)
++            last.slen = PJ_CLI_MAX_CMDBUF;
++        if (last.slen > 0)
++            telnet_sess_send(sess, &last);
++    }
+ }
+ 
+ /*
+@@ -1035,10 +1077,20 @@ static pj_bool_t handle_tab(cli_telnet_sess *sess)
+                 }
+                 send_comp_arg(sess, &info);
+ 
+-                pj_memcpy(&sess->rcmd->rbuf[len], info.hint[0].name.ptr,
+-                          info.hint[0].name.slen);
+-
+-                len += (unsigned)info.hint[0].name.slen;
++                /* Append the matched name into the fixed-size rbuf. len is
++                 * attacker-influenced (the typed command length), so clamp
++                 * the copy to leave room for the NUL terminator and avoid
++                 * overflowing rbuf.
++                 */
++                if (len < sizeof(sess->rcmd->rbuf) - 1) {
++                    pj_size_t avail = sizeof(sess->rcmd->rbuf) - 1 - len;
++                    pj_size_t cplen = (pj_size_t)info.hint[0].name.slen;
++                    if (cplen > avail)
++                        cplen = avail;
++                    pj_memcpy(&sess->rcmd->rbuf[len],
++                              info.hint[0].name.ptr, cplen);
++                    len += (unsigned)cplen;
++                }
+                 sess->rcmd->rbuf[len] = 0;
+             }
+         } else {
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index e7cae469ed..9d1e6af253 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57163.patch \
            file://CVE-2026-57164.patch \
            file://CVE-2026-57165.patch \
+           file://CVE-2026-57166.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
