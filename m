Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99235FED2CC
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 04:27:45 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14549.1773289661180044023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 21:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HUQI/tD3;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso340125a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 21:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773289660; x=1773894460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUO6w/OK6TIaVHU8t81OV44Bb2cCDawyb8Fra7m8iuY=;
        b=HUQI/tD3R/ub1gkyLnLTQ6PN2Y624ezV2SUpv2ScjNmiBcfdyXsvDbfF6tTnLx19IM
         oD6m03y2BgkwSlcoXrGSct5afGXTysjAotJPB/mYIw5c1p6ji2ltaOecMMuUEjkw6Ftk
         bHIxqnQQfvIlKsEsBWZNzuXMDveC03OPBbZ78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773289660; x=1773894460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUO6w/OK6TIaVHU8t81OV44Bb2cCDawyb8Fra7m8iuY=;
        b=JlOh2p1Ah1WcQIZV1li4h84YzgpmK63dgLIXngcNcsunsv+8ZE85HGMvdchS1JDDuQ
         t1poQiL0lqsVhPX6aYJcd/AyHq3hFV8XQxPA38MB9qRsaSGr/wdTnLHDP407QXsO4/UD
         XoMLUAjS8r8bn/4X1zShzfTUUL/5E6Lv+DTv554Y9QANn3+8P8BwHNLE5PR03Qjh2qYa
         uQArAKG4wnZ+t4tD43aBt73ADGfD4qZPKyN8IbKZ4JtLFxQWWksX9OLbMWVSL7TGBS3t
         YvzbvZYmvsRHZ4hyv0mhS8zLEAG5yiIerYBkMMSqo0V2mf994AHFSrLVdEijF4jgg/oN
         tgYA==
X-Gm-Message-State: AOJu0YzjFmwmr2y76P98vv45HIAHNwUknmc6HXaXrUHKy4xFeJMvpDnF
	44Apjrwhj4ogCJOgU/Ds4ZRMztNlP/AyJR+5MDoN6icJ5DCe4X2+gHLZI4dYkePOa8KFPo0nStF
	eORRS
X-Gm-Gg: ATEYQzzOoOvIW8U1j2GfyC5UsJbHviEqCfXy/TRVSCKnVd2sf60lUexx6NePB9NO0vd
	sU6J0zPmYPCl9lF4DHSMmZKVdkyL19P0inNY9hoHpZU9ZITfI7RSBkBGrOZzWZRntG6N6GjI+iJ
	2CkLH5mWIp7/FgvozW5DJpdP5wuhiL8A9dgtBN+ISzqYuJEdhnMBpSERWEN2VDd/quMtvvpzD0j
	NFDiwkdIxrDFWnhnh2D3DKDpC6/sN8EvyaCZ8R/Pyb8n+R8CHuufpafS2vEzqDNnAdlQI3YvDeD
	jcjJ0iOcxpANNu08gI8QsWIiEChCCwqlk9Yj8Tk9zCQsIqUmOKlo8j7zttYXd1CLElMFoIaIU55
	J+kjzFeria33EioSXCoeLg+U2VHqiMU+b+SxXRidWNBL85qiIUIjgrUUY8YUgZmfuJJnXwo1kuu
	nXrOIUpblvpNVTXYSO3oP2T7t7bLWVgo9FWIYW
X-Received: by 2002:a17:90b:1f83:b0:359:8727:6448 with SMTP id 98e67ed59e1d1-35a012e13b8mr4729264a91.17.1773289660157;
        Wed, 11 Mar 2026 21:27:40 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:4d5d:7619:5e8e:665e:697e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e196fdsm3911166a91.2.2026.03.11.21.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:27:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] libssh: Fix CVE-2026-3731
Date: Thu, 12 Mar 2026 09:57:28 +0530
Message-Id: <20260312042728.26936-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 04:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125099

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commit according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-3731
[2] https://www.libssh.org/security/advisories/libssh-2026-sftp-extensions.txt

Skip the test file change as it's not available in libssh-0.8.9

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2026-3731.patch         | 44 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
new file mode 100644
index 0000000000..2ed2d4472f
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
@@ -0,0 +1,44 @@
+From f80670a7aba86cbb442c9b115c9eaf4ca04601b8 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 13:22:44 +0100
+Subject: [PATCH] sftp: Fix out-of-bound read from sftp extensions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit 855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=f80670a7aba86cbb442c9b115c9eaf4ca04601b8]
+CVE: CVE-2026-3731
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/sftp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 43eb1ad6..be473793 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -686,7 +686,7 @@ const char *sftp_extensions_get_name(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+ 
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+@@ -702,7 +702,7 @@ const char *sftp_extensions_get_data(sftp_session sftp, unsigned int idx) {
+     return NULL;
+   }
+ 
+-  if (idx > sftp->ext->count) {
++  if (idx >= sftp->ext->count) {
+     ssh_set_error_invalid(sftp->session);
+     return NULL;
+   }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 3781b501cd..a1fc64446c 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-8277-2.patch \
            file://CVE-2025-8277-3.patch \
            file://CVE-2025-8114.patch \
+           file://CVE-2026-3731.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.25.1


