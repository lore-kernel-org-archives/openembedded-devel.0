Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B92EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 05:19:11 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.1497.1687756745307201696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 22:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=KjNQIsdA;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-54f85f8b961so2361851a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687756744; x=1690348744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fF5G+J1mLFraE3/QdFDMhThPV/tiejIpxjjjUeyPPd4=;
        b=KjNQIsdAWIuDJdtphiZqx5FNBoDXXUUdzI73E4kgNnEo+Sz5JjA3C0bDpqBkmxrLKm
         mNb0Eozh+uFvmwXxcF7Esl8YNlt5Xoh4lgpw17fwL3QxU3ZPXmjzZfZHwx4pDxdJwuz8
         00TCldizdHNuxXV9+yTFvSVTzzfsOlbJN9rrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687756744; x=1690348744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fF5G+J1mLFraE3/QdFDMhThPV/tiejIpxjjjUeyPPd4=;
        b=Y5tt6tWTvQrWIwVD01tUKONvq203ZmjV3shX49w5ZdjP6zjCE8rhta43aJSokvutW4
         RBqQQxXP45g8oi6T7YePj1VC/hgqtTuDDScj/gIsp8KCRXzU4AIiqmKpHxDK8oFj+CMw
         hBCYwDRWTnRqXOa1rFxkDys2uejVnLJu7nHS1iG2AIJY/iSsoFynnpmH7A761+1U8zzh
         OgDLEk+hQU1+4zADp4iAT9rRlukY9WRNAqCnTBw4O5upoVeFbRjhA/Yc5ck+tyUFb+0+
         v4NsVQn5nT/K/GyM5ReYmSO95Uz5Xn2fEL32Otiy5hh/O4acN3wkwdZBCqqjVADuk7Rf
         LiWA==
X-Gm-Message-State: AC+VfDxo5lqtXVpJiTFUwtQfNNYcXgsMPZhZBOBwqcDUpJ7Rs1EMZAtx
	+b4S7Ge6m8/66snn1Wq9u5YVdhqk1DKamWGcDZY=
X-Google-Smtp-Source: ACHHUZ4dzBpUpVA9aA6SPLu+c6A/YDogLDrIz4E6Q2tx4b/UpDl+ZPL0Y+v2PVZaRdtgdBxc9cN/9Q==
X-Received: by 2002:a05:6a20:7495:b0:11f:33da:56ec with SMTP id p21-20020a056a20749500b0011f33da56ecmr32251592pzd.27.1687756744071;
        Sun, 25 Jun 2023 22:19:04 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.247])
        by smtp.gmail.com with ESMTPSA id f9-20020aa782c9000000b0066a31111cc5sm2959953pfn.152.2023.06.25.22.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 22:19:03 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] libssh: CVE-2020-16135 NULL pointer dereference in sftpserver.c if ssh_buffer_new returns NULL
Date: Mon, 26 Jun 2023 10:46:53 +0530
Message-Id: <20230626051653.48601-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 05:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103571

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.com/libssh/libssh-mirror/-/commit/533d881b0f4b24c72b35ecc97fa35d295d063e53
&
https://gitlab.com/libssh/libssh-mirror/-/commit/2782cb0495b7450bd8fe43ce4af886b66fea6c40
&
https://gitlab.com/libssh/libssh-mirror/-/commit/10b3ebbe61a7031a3dae97f05834442220447181
&
https://gitlab.com/libssh/libssh-mirror/-/commit/245ad744b5ab0582fef7cf3905a717b791d7e08b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/files/CVE-2020-16135-1.patch       | 40 +++++++++++
 .../libssh/files/CVE-2020-16135-2.patch       | 42 +++++++++++
 .../libssh/files/CVE-2020-16135-3.patch       | 70 +++++++++++++++++++
 .../libssh/files/CVE-2020-16135-4.patch       | 34 +++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  8 ++-
 5 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch
 create mode 100644 meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch

diff --git a/meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch
new file mode 100644
index 000000000..2944a4462
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-1.patch
@@ -0,0 +1,40 @@
+From 533d881b0f4b24c72b35ecc97fa35d295d063e53 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 3 Jun 2020 10:04:09 +0200
+Subject: [PATCH] sftpserver: Add missing NULL check for ssh_buffer_new()
+
+Thanks to Ramin Farajpour Cami for spotting this.
+
+Fixes T232
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/533d881b0f4b24c72b35ecc97fa35d295d063e53]
+CVE: CVE-2020-16135
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/sftpserver.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 5a2110e58..b639a2ce3 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -67,6 +67,12 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
+ 
+   /* take a copy of the whole packet */
+   msg->complete_message = ssh_buffer_new();
++  if (msg->complete_message == NULL) {
++      ssh_set_error_oom(session);
++      sftp_client_message_free(msg);
++      return NULL;
++  }
++
+   ssh_buffer_add_data(msg->complete_message,
+                       ssh_buffer_get(payload),
+                       ssh_buffer_get_len(payload));
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch
new file mode 100644
index 000000000..3c4ff0c61
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-2.patch
@@ -0,0 +1,42 @@
+From 2782cb0495b7450bd8fe43ce4af886b66fea6c40 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 3 Jun 2020 10:05:51 +0200
+Subject: [PATCH] sftpserver: Add missing return check for
+ ssh_buffer_add_data()
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/2782cb0495b7450bd8fe43ce4af886b66fea6c40]
+CVE: CVE-2020-16135
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/sftpserver.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index b639a2ce3..9117f155f 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -73,9 +73,14 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
+       return NULL;
+   }
+ 
+-  ssh_buffer_add_data(msg->complete_message,
+-                      ssh_buffer_get(payload),
+-                      ssh_buffer_get_len(payload));
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
+GitLab
+
diff --git a/meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch
new file mode 100644
index 000000000..03a8ac156
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-3.patch
@@ -0,0 +1,70 @@
+From 10b3ebbe61a7031a3dae97f05834442220447181 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 3 Jun 2020 10:10:11 +0200
+Subject: [PATCH] buffer: Reformat ssh_buffer_add_data()
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/10b3ebbe61a7031a3dae97f05834442220447181]
+CVE: CVE-2020-16135
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/buffer.c | 35 ++++++++++++++++++-----------------
+ 1 file changed, 18 insertions(+), 17 deletions(-)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index a2e6246af..476bc1358 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -299,28 +299,29 @@ int ssh_buffer_reinit(struct ssh_buffer_struct *buffer)
+  */
+ int ssh_buffer_add_data(struct ssh_buffer_struct *buffer, const void *data, uint32_t len)
+ {
+-  buffer_verify(buffer);
++    buffer_verify(buffer);
+ 
+-  if (data == NULL) {
+-      return -1;
+-  }
++    if (data == NULL) {
++        return -1;
++    }
+ 
+-  if (buffer->used + len < len) {
+-    return -1;
+-  }
++    if (buffer->used + len < len) {
++        return -1;
++    }
+ 
+-  if (buffer->allocated < (buffer->used + len)) {
+-    if(buffer->pos > 0)
+-      buffer_shift(buffer);
+-    if (realloc_buffer(buffer, buffer->used + len) < 0) {
+-      return -1;
++    if (buffer->allocated < (buffer->used + len)) {
++        if (buffer->pos > 0) {
++            buffer_shift(buffer);
++        }
++        if (realloc_buffer(buffer, buffer->used + len) < 0) {
++            return -1;
++        }
+     }
+-  }
+ 
+-  memcpy(buffer->data+buffer->used, data, len);
+-  buffer->used+=len;
+-  buffer_verify(buffer);
+-  return 0;
++    memcpy(buffer->data + buffer->used, data, len);
++    buffer->used += len;
++    buffer_verify(buffer);
++    return 0;
+ }
+ 
+ /**
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch
new file mode 100644
index 000000000..8e9a4c3f5
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/files/CVE-2020-16135-4.patch
@@ -0,0 +1,34 @@
+From 245ad744b5ab0582fef7cf3905a717b791d7e08b Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 3 Jun 2020 10:11:21 +0200
+Subject: [PATCH] buffer: Add NULL check for 'buffer' argument
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/245ad744b5ab0582fef7cf3905a717b791d7e08b]
+CVE: CVE-2020-16135
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/buffer.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index 476bc1358..ce12f491a 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -299,6 +299,10 @@ int ssh_buffer_reinit(struct ssh_buffer_struct *buffer)
+  */
+ int ssh_buffer_add_data(struct ssh_buffer_struct *buffer, const void *data, uint32_t len)
+ {
++    if (buffer == NULL) {
++        return -1;
++    }
++
+     buffer_verify(buffer);
+ 
+     if (data == NULL) {
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 39ed8a8fb..0fb07a0eb 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -6,7 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl libgcrypt"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8 \
+           file://CVE-2020-16135-1.patch \
+           file://CVE-2020-16135-2.patch \
+           file://CVE-2020-16135-3.patch \
+           file://CVE-2020-16135-4.patch \
+          "
+
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


