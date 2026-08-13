Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F9C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 11:43:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17153.1786621434178958260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 04:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HopH/Ne/;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1905011a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786621433; x=1787226233; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5NfTbbd42fVl8gnCgKhLQ2Z4xZ7Khj4fe8lEFzQPjc=;
        b=HopH/Ne/mDWtLxqu3yTWCRrAOp90LyPMc9QrdmJknTWGosRD1PkeO5W5VnUUHMz5RB
         wxy86/v9h0Pm0QbwHV26oYZIVBqI7kRwQvrFLL+hg3QhzxgS5f49DNrwUDQBo45Hy9DF
         YrfF14Cw+lGoZj9VEssy/kap7Xz5FF8VEUtow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621433; x=1787226233;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5NfTbbd42fVl8gnCgKhLQ2Z4xZ7Khj4fe8lEFzQPjc=;
        b=G3lagaZKz5n67DkbqLc/Qx11m7OfMpfehc8cKHpLDtrv/zxzsm2CUKOF3KOy3C24YW
         KcV574+/h086ncZM3R5M4WwGePvbgz7PzLOmwjoJcxQwJkJmbkMa75hWYVaS8B66TcRV
         0uz58MSZkSC6KicFHG/x8+RNuHAHg2Su/dLDYZ+Ic9Z0G5A0tp1Xf3XSjeIu3hgAAOAF
         TfEQ3ZPh5SYX6uvCir1a71prinXhn8lzmjVU18GohOtUeiAdTy2m+WK4vrhdlSdyhtrH
         SQjT0MYBs+f7e/n/neTCLUQwad9co36ITvgup4G/q9L34Y2BIJ9B0HY0iFX21nokoz43
         KdvQ==
X-Gm-Message-State: AOJu0YwJsbMobS85tQx+Qs/JpeAgCkcKNOg+nhFkO+ZsEafqoJDYcWhJ
	GWgZyioTJvBqmq33S32uPZsxEuwoD5Upa3qCAYMuVvONZcBBAJLs7DYC0Wl7k6eRkkFJiV8Dql5
	bfu7VE9U=
X-Gm-Gg: AR+sD10B/UXzq2RUW22gkDJYEErMMBDoqjGI5ryDJaQuiZL1Vv6j2EtV0mB24VO2Z1q
	7Ie2qDJpMv7enhZlj4qvh1ShAbn0K1WRiIceZaDmkRG+qSA3RZYv3aEGWm2Nf+61458VSDRSoJk
	9JKLZeIL/xFbhnykwyS8C3pt4TYOjPISsu0SNkqUgp/2JU+ykohcguU6w4KvjPgex6wNbOIBZSO
	a8K6Z9T69RRli9gePOghF2xKjB+gFKtOdqoblDzaoKc5AcUvh0uGsBPTbbaU6ajJPqhbFFsfeLh
	wWKUNn+yuc54DmSEnAFVs4uUDBnL80ybha7S1vm8ybIFBf7pUfj4qCLnBW0lgukGYImV3qw4c9d
	OffFLH4LC7ivXkivsmWHbvmg3tsTMJFPudzxws0yzGWIlho3E3vM3LOkY8ateCuWtvMMUo5ezwt
	d7APufOgSm45HzbQhP2SN/HjsPWXGpU1/qbA1o6ggbkLYFzTsOnXkhkw/ZrQGWC8e2vDlz7xiV6
	o9jyiIANhfM
X-Received: by 2002:a17:90b:1b0c:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3931e0fd1b2mr5823366a91.11.1786621433315;
        Thu, 13 Aug 2026 04:43:53 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d8d0abesm8812713c88.7.2026.08.13.04.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:43:52 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] libssh: fix for CVE-2026-59845, CVE-2026-59847
Date: Thu, 13 Aug 2026 17:13:42 +0530
Message-ID: <20260813114344.98697-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 11:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128940

Pick patch from [1], [2] & [3] also mentioned at Debian report in [4] & [5]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=53b8152623290c69657a6774d96888b876e6061f
[2] https://git.libssh.org/projects/libssh.git/commit/?id=c483a187354dfd96b16d3309a74f6d1cf82c2074
[3] https://git.libssh.org/projects/libssh.git/commit/?id=d4847509b792d564d1935dbfea4ee1496ad3d3d9
[4] https://security-tracker.debian.org/tracker/CVE-2026-59845
[5] https://security-tracker.debian.org/tracker/CVE-2026-59847

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2026-59845.patch        | 68 +++++++++++++++++++
 .../libssh/libssh/CVE-2026-59847-01.patch     | 39 +++++++++++
 .../libssh/libssh/CVE-2026-59847-02.patch     | 35 ++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  3 +
 4 files changed, 145 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59845.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-01.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-02.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59845.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59845.patch
new file mode 100644
index 0000000000..5cdc809129
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59845.patch
@@ -0,0 +1,68 @@
+From 53b8152623290c69657a6774d96888b876e6061f Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 26 Mar 2026 16:32:24 +0100
+Subject: CVE-2026-59845 socket: Properly check fork() return code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+During execution of proxy command, when fork() fails, its return value
+is stored in pid and when the parent process attempts to kill it,
+it sends the kill signal to all processes the calling application has
+access to (except for init).
+
+This caused nard to debug issues when the system under the load was hitting
+fork failures, which resulted in killing of all the system processes
+(of given user).
+
+Reported and first patch iteration provided by: Halil Oktay (oblivionsage).
+
+This code missing fork return value check is in libssh since 2010
+(f31a14b7932ef4cc165ddd8f1f1a5b23eb21beb3), but this issue is exploitable only
+since libssh 0.9.0 as previously there was no implementation of killing
+ProxyCommand children.
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 92b6fb9c5e2d1606e8f809fd884ab6dd4d3b7d45)
+CVE: CVE-2026-59845
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=53b8152623290c69657a6774d96888b876e6061f]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/socket.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/socket.c b/src/socket.c
+index 99dcf8cc..ba9ba52d 100644
+--- a/src/socket.c
++++ b/src/socket.c
+@@ -964,6 +964,7 @@ ssh_execute_command(const char *command, socket_t in, socket_t out)
+ int
+ ssh_socket_connect_proxycommand(ssh_socket s, const char *command)
+ {
++    char err_msg[SSH_ERRNO_MSG_MAX] = {0};
+     socket_t pair[2];
+     ssh_poll_handle h = NULL;
+     int pid;
+@@ -982,7 +983,17 @@ ssh_socket_connect_proxycommand(ssh_socket s, const char *command)
+     pid = fork();
+     if (pid == 0) {
+         ssh_execute_command(command, pair[0], pair[0]);
+-        /* Does not return */
++        /* child: Does not return */
++    }
++    /* parent */
++    if (pid == -1) {
++        close(pair[0]);
++        close(pair[1]);
++        ssh_set_error(s->session,
++                      SSH_FATAL,
++                      "fork failed: %s",
++                      ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
++        return SSH_ERROR;
+     }
+     s->proxy_pid = pid;
+     close(pair[0]);
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-01.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-01.patch
new file mode 100644
index 0000000000..6fd7cffc5f
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-01.patch
@@ -0,0 +1,39 @@
+From c483a187354dfd96b16d3309a74f6d1cf82c2074 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Fri, 15 May 2026 17:01:21 +0200
+Subject: CVE-2026-59847 libcrypto: Fix tag verification of AES-GCM ciphers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+EVP_DecryptFinal() returns 0 errors, which was wrongly checked since
+its introduction.
+
+Reported by Ben Smyth discuss@bensmyth.com
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+
+CVE: CVE-2026-59847
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=c483a187354dfd96b16d3309a74f6d1cf82c2074]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/libcrypto.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index 69a850de..ff27770c 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -674,7 +674,7 @@ evp_cipher_aead_decrypt(struct ssh_cipher_struct *cipher,
+     rc = EVP_DecryptFinal(cipher->ctx,
+                           NULL,
+                           &outlen);
+-    if (rc < 0) {
++    if (rc != 1 || outlen != 0) {
+         SSH_LOG(SSH_LOG_WARNING, "EVP_DecryptFinal failed: Failed authentication");
+         return SSH_ERROR;
+     }
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-02.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-02.patch
new file mode 100644
index 0000000000..3af352b2b8
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-59847-02.patch
@@ -0,0 +1,35 @@
+From d4847509b792d564d1935dbfea4ee1496ad3d3d9 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 18 May 2026 08:56:31 +0200
+Subject: CVE-2026-59847 libcrypto: Fix symmetric issue during encryption
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit a5173c6ad249f7960bc7c1cc75a6a05ead8e3eba)
+
+CVE: CVE-2026-59847
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=d4847509b792d564d1935dbfea4ee1496ad3d3d9]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/libcrypto.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index ff27770c..95187e1d 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -586,7 +586,7 @@ evp_cipher_aead_encrypt(struct ssh_cipher_struct *cipher,
+     rc = EVP_EncryptFinal(cipher->ctx,
+                           NULL,
+                           &tmplen);
+-    if (rc < 0) {
++    if (rc != 1) {
+         SSH_LOG(SSH_LOG_WARNING, "EVP_EncryptFinal failed: Failed to create a tag");
+         return;
+     }
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 63854ef5fd..327bcbe9ef 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -32,6 +32,9 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0968-2.patch \
            file://CVE-2026-0967.patch \
            file://CVE-2026-0965.patch \
+           file://CVE-2026-59845.patch \
+           file://CVE-2026-59847-01.patch \
+           file://CVE-2026-59847-02.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.50.1


