Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36208.1793161516606881536
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BA5xkp9n;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so453705a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161516; x=1793766316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksQHST4eSfDUcwni8T/B9cuekd3lKyWtQo9c0ZUXCCA=;
        b=BA5xkp9n5iSFd6kOPF3IWEqfHgrytY3kv1isqReWJ6aSstV3XYJ9oV6oGzCFfdDVjB
         07kA/2qOl8OXjDZbb3SbdVnRtimc9xCYI5pbWpxRqdFIzx2cJV068TR3qmsJ1AT0DMaD
         r/HbA4JIgMrL6iSNs2M9zltKDvuFpvoMHyUC4M5dkHOB/GTfpLixLy7vzbXart5dGIlA
         itOg7FTrt/ihrnkMO3i4JzGI03aTfXAXDnqNmNCGn6iJANzbAR19mHST0G3i6dZATv/7
         6sq3tBVP/8ah6UKY0bEaWj3Vd/7ICzcNbEHfvCpAiO6zLIvivNtLMboZbvvDa2j86xvX
         YbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161516; x=1793766316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksQHST4eSfDUcwni8T/B9cuekd3lKyWtQo9c0ZUXCCA=;
        b=QprOi9dUjm1Wmlqzrot2WwWhhmaA3crkRqCiJActjdtUv5efmjA4VC1zdyUyIqtZTA
         cQY7ur/tvpg0Y/i8JfzREATlDzVCWG+Xgs7a7jUhOHB1loW/vl/KxoT2qgzNQBBMX5Nr
         d6d6M0UCwkFeJInobHbSX/B4GhUPnXap8yKsERfRaqXv+PMDPU0Sg0pcTyHsB7mFvOSj
         T3jIDez1TEmG4T8d2+4GwF9J8TLQ3gb1DB+U25Y+jShAMvRTRK8y0XO9EKIQI8ZJ1rOU
         jo6j+M28mCrEWNkP+tWkgfyxZ5GdB2ewcrLQpbXasCIf9M5p5+i7UG/MjnQ6LZIwjzO8
         BjDg==
X-Gm-Message-State: AFq9FYL7EJqh6y+bhpIh9rxBQcjIMTKTO6+gM2B7FB2g5FegQjk36Ds6
	078Cbcj353h/eRDm4OqJkh/yU/d1LLHq8VShq8XwG5ncp8y8QXmsH1XRRHEkEA==
X-Gm-Gg: AYBFou2Jvy6vQP59VLz7bptti2zqBhyQBuaA/alSSfBwhyaWfWQnWDpYqmhrlbxizKg
	nfPV/hO/xjUIN32368y4RbHTOhVwS1oHzbagiKmnuDucf8zVRIoSoT+5ytdMcLWp7B34PwGvUH7
	m1zlyM6Kf0TsdRpPcl2i+IGydQQKRePsNm0O7ui8zIhDx/n6WZKjhXw39XH2p9esKLSQD5csSxt
	Zrrjp5nfCEC0EQ7QgjMb9ulTe3AxqYkf6yg5wVthPTLE0tZn4V6NGNwzb/dztjOEf1DKRCtgGoV
	//fjncrYa8aYFDu7NQ3aRuhpARQ0uiACvrXG4ihPFTUiKwbO94vg1bOdMavKN7qmF0ShxxaSYia
	rPwT8MxZ6l5Zs+f8V5U0DQ8vetTroc/IAGkw6XDbEudN7aUpw+c9/EbQzRh0nd445Rp8MdAyFFY
	oTD+vUutJZiSe32IO8KA7VjHhhVi4yC3neR8pXRWrvayCcnlLHYeTmEMiVLjVMcAsKugVP9zgrh
	Ksawmr8fnOcpyVfFNFUgKMTmfym2SNjHyCSZL11C/OUKG7TAHyRRqM3nkPKecnxPPQAPxhI4mhR
	XnfouKgPtoCyNnx8/j2s4HOmy83GmL2TcDr/IYxmPfb3jIUKoSzhsyE3k136bA==
X-Received: by 2002:a17:90b:4f49:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3ae580a0249mr852256a91.30.1793161515900;
        Tue, 27 Oct 2026 21:25:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 30/60] pjproject: patch CVE-2026-57166
Date: Wed, 28 Oct 2026 17:23:28 +1300
Message-ID: <59a6a134d6ff923bf9ee081a62755cdbde2a88c0.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131582
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
 
