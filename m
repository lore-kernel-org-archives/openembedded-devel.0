Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1759.1792434875995364574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DLAyezAL;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso951752a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434875; x=1793039675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0dkqA0/PYdSM2VvKCu//+slmYHgd1LOcXNVKrxQopk=;
        b=DLAyezALcP1w5pMY0UyFhgpFhO1P1PIeW/tGtYLgVwtsQGur+vLQ0beNTb06Ml/YkZ
         32GUCdo9dRUXoI+eVBgyGuBz9zDiELIOQn/k4PDoWlNNkRq36TiQiKMjEo1mlBoGRtfm
         O/tJ1NxtD46hITvmXRP208iRnk3zUNo0PZsat5tI0xrue7m7xdjSc9J7A+CZwvPtGhSK
         Pjq97gLSCz7S0xJIdr5IsfK3szbfmhieiAhp9m3RgBANv6SODGce3m/BD4Cp/kfBWmjI
         w9jZHrdzVJ4l+M4hMnIlYvxKZ9tTQAL+vuNXu80zmPS5+S9t/r2ffbdqcamHECp0dCEy
         xk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434875; x=1793039675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0dkqA0/PYdSM2VvKCu//+slmYHgd1LOcXNVKrxQopk=;
        b=VWzfDZ7uv0UK37UGi4Z/OG9FCId8zB9D21/zpsMGTIUfY24iTzBPA3o4kqMf3knMv3
         Yqx5U0GkPaaxPaluHkm+O8JSJYjRLNj2PHGCXZvY7Zj9bydek5pW6g1fBl8wtTT4LWfu
         ENgjb5rEJ/lmJdD0LIfY13dqHDhPlQhdosdFFmfNcdmRaFBjWTrXIqq15r5OrmZvD63Z
         cQpmvQwD3E9K8lCMR7wAbrcueuVagMUiUCFbv5He0z4egBKK5dp6uzeff4LUH5g1kZjq
         sYEHzpjaAjt8Y0EEhhhkhsFciOVhW8WsqDSwANQd3t58lm+E+ur7kM0q/TIbuCJt2y3D
         T7IQ==
X-Gm-Message-State: AFq9FYJtNwDGDABCZcADsd9VFsiqOgjt4h+Th2a046rq7bGeWB2kFrT0
	uWCMRSss9y72bUG2Lr8UK9FtrTybfT4EeOnrNioOAdJTS+eLec6b8xGzGyDxWg==
X-Gm-Gg: AYBFou2LhhcMaxwpxC7XvmgVQvfCV59RNg1Hwl4Lp3htNjWXUpcR7DrW9Y6DZTCJsR3
	EjdSPqMwhYlAQfIlRQYxIbJE8Ye9MzOzMa10B5ELvtp2ytmV/7r90JJXK58NyGrBbpTiSV88eLb
	bsI99LJz1JOS/2CaNTabRThNfr2X6JIT2ZJpo9IvxI3ltgbDesV5dW/zczwnt5twglZCIH8XA9u
	fHfVHBR2mtZKbPdHoL6iCft6dT8wXk7sWNW33pe4zEZx5zmUXeXBCdRyBoRdfw5/Rl/AkJ2JlPh
	k9cuLUmuQpVo7pz2DFg9WOMGBLiRS765C0eNZf7RlMiUMnrCRUtBckYi96Pq5NzZefbAHzKe7H6
	p9WL56rR6YVeoHBC7fwq7k+V5xYfYZpFclX7OnhmQk1kqAoEU/oUlnzWUUNhLDe2KTGDq0vFeDf
	iPS0/OliA2DIFCz0RfmyGfI20JrYyGJVnNcLhW7ewekdxjCERtSerqisBA9ad7XUnU5rVt4iBkq
	PNeEdMglaulwVeqAHfm/gvN3V8ptq5caTsZ9JICr2DzuYCmeQ==
X-Received: by 2002:a05:6a21:3284:b0:3e0:de4c:71f0 with SMTP id adf61e73a8af0-3e225f7deafmr6842377637.31.1792434875183;
        Mon, 19 Oct 2026 11:34:35 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 9/20] pjproject: patch CVE-2026-57166
Date: Tue, 20 Oct 2026 07:33:55 +1300
Message-ID: <20261019183407.1037972-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131135
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57166

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 59a6a134d6ff923bf9ee081a62755cdbde2a88c0)
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
 
