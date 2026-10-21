Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7553.1792575011345534721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T1BW7rqO;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so1371676eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575011; x=1793179811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3KJ3yyJKfspcu8H365dSee74tV0BXuG6FsNAfJkHi8=;
        b=T1BW7rqOjiNuAaBiJnfLd0G/XPNgNZ6tiAH3F1ztyANcMKA9wpqO50D6aatW3Jee+X
         i75Z/QOnzQXhQ2hUQnP381HlHQfaHtKsIESwvakkC30nJXjBp7LS0dHWC85PQEHISxAQ
         i8/yyN84onSt8p0gf3MCJ8jmiZ1cgKy8fntjMKspZ6LP52ZMaymdA5QADmfkNWwjmnRO
         G/IbUfD52ebYiU6wYW0DEU/vlN+xqNizqxq7Er/50M5rM7KubcO9wG6paXu76acfBxAd
         xYO0N1WET0sqv4Ne0BcEdrOAGLvDic7QmimxMqVMC2OL1Yt9uRyL1KKCHBEGR8fJ5JQq
         kVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575011; x=1793179811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3KJ3yyJKfspcu8H365dSee74tV0BXuG6FsNAfJkHi8=;
        b=Irr8i5TQ8Lxkb4lFNDBrD/3jj7crp3yJPSn5RpaTxiQG2CEoVzGxN1SVVTfAMupVcJ
         wuH71J/wLOJ+n+6YwQPJn9Frt3WWKzrJ/DBb1sKxMiqufc00RTD5oqFpc3SdRoaoe2Rn
         4PUBcx5G0jm+wWJXh2T2WfRxe3BLmtkg027U4okss0wOqHzPm2BidMZTgi6kAWUXul1q
         tltmWZRjbKrjeO6eEmNsOZ61ce+v2qmEcAoEi2OcMepOz1UrfCfPgR9aKmbI4pp4FQ69
         jJ2Y9upolmlZRMRXNiXkJsRy9LtfsHQxbmoGEoU4c2PsKhC5zjHyE3gXOnaQAk08/X+1
         /KnQ==
X-Gm-Message-State: AFq9FYJs7gGyQ2uPL0A8JP7i/Fzh1gu4CtdTuZdP5FClgowHRyh0TKlg
	pN0fNKQZ2DyBinZE+A1gwccAI/NT7wx8EPsmhkcYKDqzJJJJIjyPmZ2U+0UBww==
X-Gm-Gg: AYBFou1dWfwRC4fEgEx3r41C2msrAOqbIDTh+cZC2KIh/o/uvxjd+AJ/eGMvTQ1Qg6p
	G7PP89zwypQ+O+luRaydWGUlKA1eDv3DPMsjIG/jjK9QMpsnQZ2bx/kvkEL1nUtHdwUXXcefySD
	wx7C9HpDcWTduGWvd13z30o1rgeURsDy2hXuET8fLPoSBrCOpbU5OLx5ytEZ9u2IYP6BiiTR+8t
	wrm/s6gfM9Tvt9p7/UMJHNNQKOHsKNPzis0FPLR49lcl/mXQfWjJhhdaBxmV4HWADjVb7oUMBOd
	IlT7owNL9QnzRy1gTK2UWSsGIZvtXE7wh41gaUCiH6/Vp69w+Hn0pUNzjl3c2huapHrJawaPjEJ
	Wre9IWyrcwgNGmJm2T+G8KX4dfS9nBbzw8euElQuQzHg3duuJYL/gaDnjT/dn6wLClTfWRxIqSl
	FvQ/ShUe9sq8RoI7gtpFMI3G2THIoQ4GMfEfemy5hZfi04SV+4Z0ZVM+18eVQ8KM+qzNi3jfKrV
	AHDThDDAgbLPItMZqTOC8VtJ0ZEBahdVgd/5Id2LW1Rk7g5ewJSuGVQ46OQsBbhAeRfAd2vtrzu
	dGGDMt2VE4OEVMe9JAa0c1Qr86oCHhU=
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr2077009c88.19.1792575010531;
        Wed, 21 Oct 2026 02:30:10 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 29/44] pjproject: patch CVE-2026-57165
Date: Wed, 21 Oct 2026 22:28:42 +1300
Message-ID: <20261021092857.3585453-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131216
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57165

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 
