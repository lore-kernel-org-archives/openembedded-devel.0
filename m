Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36060.1793161514208111683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fAkoSbk/;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e987a2ba0cso2895695ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161513; x=1793766313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3KJ3yyJKfspcu8H365dSee74tV0BXuG6FsNAfJkHi8=;
        b=fAkoSbk/tc0fZ14ANfszF9F0p2gOIsfAJTqILpTraa6rVhCOds2dqG8UnN7lht2wmY
         i4PHuo6XdSg1yBxe2JxqFUrnxvXINA7/D1uUrdChmMYFjktGYLjYo4woTVKjr8EalapV
         JYnKMsiOfd5vq+Y72PAKtjt/a4owMzv6UrhP6Cr31R0g1swraKtrGFwtRlq4yeYWPIcY
         IM0lJcO7DbVZpxrzMJpzkeiaoGOVIMh5o8IiRafLtBUPoAv24xAAfrmwslcc4WAqHo5u
         CMpJbFh3KAy0Ba5f8aI1O2+ZciWHesTAX/JR6fgah34GQzQrQtJsaTaMCzQrRKiKO5vk
         jxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161513; x=1793766313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3KJ3yyJKfspcu8H365dSee74tV0BXuG6FsNAfJkHi8=;
        b=VhR/hG0b+UHxusWGj4oV9g9ZUJiWugzzcG1ZuhpxTVDg9NvVekgrBoGec2loVaj4J2
         P85sZqiqYuRtL7jugzSyNDjgp1KN4mIfnLINIBtOwQQYbbwDE/8d9mr+X1QGpqpI4m+U
         Dkl0wXLldsocn5wUE+ocguN/ZA5gy2uIyi6DYDYkRNnsWt1DGcyM8AN4fC00xB90CwN1
         PeNqjSmzTkJrRMuoZbwahcFlN6Z4NbyQtrbOTa27GeXXA3m5ybnvD1W7EG0NEENANQ5c
         6cJIsJfsp2bkZAXKlLfNsTkRRg3KEBJ6amY8kd2CgYA0MIX19p5HvltXPqlQl9ytzr1E
         6OnA==
X-Gm-Message-State: AFq9FYKQ1Fpn27z59U6a7eDx6GhX4bCTdbUVmxfma+NiokNdXqwC2CHv
	Rq2OPIs3PKNf51A2FVaWgUGiCH9DLV+QHICg2mJzNI2jKjcIGBqpQlEARGZ0yQ==
X-Gm-Gg: AYBFou34AXE33k9rXqbFhe6NYUKrj0fHQQgIpLpsY1TBHrfDyUvAFIz04p6euNau3zU
	2YLgENPGtMAi8J5Qi5yp4yOfhQmY3eS4WKj59dinOPHU0h+eYsaGeag1+1e8oeGdsEVqKupk4gZ
	BrsIw+gTsN28h9HP3um7GX+pBaCoA/XqZFI5Wky8mwByHCfiMmRyV2QkHhqnq2nVSECVMOKBk4Y
	IcUKWbCsaTYotg2FaugXdB6jojxT5FmkzhJDzo5HWXiTqFDzpL8KtFEGr7SvkvwHR8HM/E/+sEA
	2RqQVGFz1wKocb1CSM0HoPQm8qkMihHTHOGkFVrF2M+2YEIFPxZ3OP/nczCYh1jjQTg5voYdE14
	FIu++rthyCHlzxQq9PAiQ0WIa3Dz06uJrAEFH3e3TL6qfFd9hrxRJpG0Mb+fkzomKrb06LJvuFO
	ckGbAKuTc3JWiIJMewWpyuzVj0vdMIdavkmmgSjzviTmxcZ07sf0tceE3rqymGd2RSkTRAYg5nM
	aCRtqCS/Gk9OpsRgwaaQpryhdCxC/rSV0iCVrYhHA9v0INfdgtinLtpuh96dle/zxV5S5E5YkaL
	3Y00XcrtIigOARr4OOkvlhTvI/43RfdSfHUAK6ffhdzjIxrpu3eO0D1RzEHp4w==
X-Received: by 2002:a17:90b:564d:b0:3ae:533e:7e3c with SMTP id 98e67ed59e1d1-3ae58155bfbmr878758a91.35.1793161513471;
        Tue, 27 Oct 2026 21:25:13 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 29/60] pjproject: patch CVE-2026-57165
Date: Wed, 28 Oct 2026 17:23:27 +1300
Message-ID: <aac29142ede95bcf48ecf16e19671314feb1590e.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131581
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
 
