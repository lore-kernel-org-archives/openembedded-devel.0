Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF892EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 06:17:05 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.10013.1687933020359200717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 23:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DFP5ZQm6;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so1083457b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 23:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687933019; x=1690525019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kopbR4HFh7QVTQpY66vwEwiy/40xjnIR0FTAVpSJGY4=;
        b=DFP5ZQm6GUnFGlXQZLwTi57cV/tXk6dA8MOBLFWxmJP3nBkhFoo+AeSr2uM4rW09pD
         x0PZT/eznYXh/la+25DByCZ0EiBzql0aa3Ejv9ha2B9MCBH3+VnDy5Q/nNClPp8RWz6K
         V52PiAGXtckpH9266ry2zjp3KbAQV7CfeXP1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687933019; x=1690525019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kopbR4HFh7QVTQpY66vwEwiy/40xjnIR0FTAVpSJGY4=;
        b=eGwFf12FIlk/+ja7rzCRIGpkrcrBlSov4PfM9uN9j42Fyy4eqTwmXxe0lnR3Ug1WkP
         PNze2WvmCN7PTImn2I5aoelqvOB/XJDqgSJgeMvxe5Uu2j0r8gcdE+aASPcy7a7Fw/yX
         qKRsdSHuYCBl5XaagmXl0U4FXn29vwCrtSpdO7bCLo/ByypQoCeeFCb/sCRrpQ5mfU2D
         f/oUE9dkUI6kxls+zdYE4GECe3u+cyFd1Nf2hi8xBWJUZ3Fc69hOps435mWNoIeTZWv0
         qgLIaXvbf2pCAP61YycKG3c7TOG/7ibKdkCm/G+LCy8CcKw6ZzSYDr62FRWvm2sv5XU8
         I9SA==
X-Gm-Message-State: AC+VfDwpdLYPHPGmKOXGPb62/4XLrTA+I1+L6nwKhn2MlVEcO+QDr/kN
	tjNxZVxc0Hwwmdr0PMt8hm0Y7cTy0gZq8M9ZB6bacg==
X-Google-Smtp-Source: ACHHUZ6v6N8ccjWqstOJUWMyZV9f1y1O6IV8FXTYI5WrgP+Je6rJckJB17YJSHok4ljEyfeT1kRHcQ==
X-Received: by 2002:a05:6a00:1504:b0:668:7325:e184 with SMTP id q4-20020a056a00150400b006687325e184mr36433413pfu.16.1687933019096;
        Tue, 27 Jun 2023 23:16:59 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.143])
        by smtp.gmail.com with ESMTPSA id i20-20020aa787d4000000b00679325476dfsm3879529pfo.91.2023.06.27.23.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 23:16:58 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 28 Jun 2023 11:46:53 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] libssh: CVE-2020-16135 Fix NULL pointer dereference in sftpserver.c
Date: Wed, 28 Jun 2023 11:46:52 +0530
Message-Id: <20230628061652.44364-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 06:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103620

Upstream-Status: Backport from https://gitlab.com/libssh/libssh-mirror/-/commit/1493b4466fa394b321d196ad63dd6a4fa395d337

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2020-16135.patch        | 105 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |   4 +-
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
new file mode 100644
index 0000000000..210b2d17a0
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
@@ -0,0 +1,105 @@
+From 1493b4466fa394b321d196ad63dd6a4fa395d337 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 3 Jun 2020 10:04:09 +0200
+Subject: [PATCH] sftpserver: Add missing NULL check for ssh_buffer_new()
+
+Thanks to Ramin Farajpour Cami for spotting this.
+
+Fixes T232
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/1493b4466fa394b321d196ad63dd6a4fa395d337]
+CVE: CVE-2020-16135
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/buffer.c     | 39 ++++++++++++++++++++++-----------------
+ src/sftpserver.c | 17 ++++++++++++++---
+ 2 files changed, 36 insertions(+), 20 deletions(-)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index da6e587fc..6e235a1e2 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -299,28 +299,33 @@ int ssh_buffer_reinit(struct ssh_buffer_struct *buffer)
+  */
+ int ssh_buffer_add_data(struct ssh_buffer_struct *buffer, const void *data, uint32_t len)
+ {
+-  buffer_verify(buffer);
++    if (buffer == NULL) {
++        return -1;
++    }
+ 
+-  if (data == NULL) {
+-      return -1;
+-  }
++    buffer_verify(buffer);
+ 
+-  if (buffer->used + len < len) {
+-    return -1;
+-  }
++    if (data == NULL) {
++        return -1;
++    }
+ 
+-  if (buffer->allocated < (buffer->used + len)) {
+-    if(buffer->pos > 0)
+-      buffer_shift(buffer);
+-    if (realloc_buffer(buffer, buffer->used + len) < 0) {
+-      return -1;
++    if (buffer->used + len < len) {
++        return -1;
+     }
+-  }
+ 
+-  memcpy(buffer->data+buffer->used, data, len);
+-  buffer->used+=len;
+-  buffer_verify(buffer);
+-  return 0;
++    if (buffer->allocated < (buffer->used + len)) {
++        if (buffer->pos > 0) {
++            buffer_shift(buffer);
++        }
++        if (realloc_buffer(buffer, buffer->used + len) < 0) {
++            return -1;
++        }
++    }
++
++    memcpy(buffer->data + buffer->used, data, len);
++    buffer->used += len;
++    buffer_verify(buffer);
++    return 0;
+ }
+ 
+ /**
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 1717aa417..5e5b9b896 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -64,9 +64,20 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
+ 
+   /* take a copy of the whole packet */
+   msg->complete_message = ssh_buffer_new();
+-  ssh_buffer_add_data(msg->complete_message,
+-                      ssh_buffer_get(payload),
+-                      ssh_buffer_get_len(payload));
++  if (msg->complete_message == NULL) {
++      ssh_set_error_oom(session);
++      sftp_client_message_free(msg);
++      return NULL;
++  }
++
++  rc = ssh_buffer_add_data(msg->complete_message,
++                           ssh_buffer_get(payload),
++                           ssh_buffer_get_len(payload));
++  if (rc < 0) {
++      ssh_set_error_oom(session);
++      sftp_client_message_free(msg);
++      return NULL;
++  }
+ 
+   ssh_buffer_get_u32(payload, &msg->id);
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index c7e9c3320c..061f13912f 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
+           file://CVE-2020-16135.patch \
+          "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


