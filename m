Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC097C77B7F
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 06:15:00 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.2158.1750918498789110305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 23:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CRtKBZNX;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso536291a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 23:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1750918498; x=1751523298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9SbLwdqXpftmEi9jrME6WBFwWqRHHveuQz9jz+gL+U=;
        b=CRtKBZNXYLc+mfz6qDsAF1j4pFyvDyPkLivw/wYSWNKex6t+e1kF0mufKrYUzQRMdk
         0ojv1D+oGzqJkovmgyJFgOs50J+zgxTKbM1wVapmHLfaZ//Zbg4fVEvvSSih1z6uTjAs
         vqg1/dHnbOlhv8j2zIsh7FpZPO5wKKFkuH6E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918498; x=1751523298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9SbLwdqXpftmEi9jrME6WBFwWqRHHveuQz9jz+gL+U=;
        b=eZcfh3rpUA+YP09sX16gvyXKaCQiltz2qB/7fwpLJ7pnUBLwj6HhMpME1fuIaLQ+hW
         RYWp2/rCnV8+ejifo89333gjigJc/sli0fDVAB7i4I3sTaelT8ixe+adiI94PkBRwNkl
         gac+d1VoGJJ9HNatQknp4FrcH4VL6BBOXWkXqeQd2NjRLEF6PZbNxLXf6nwbBBdXqrIA
         BXYYpQ9xog7LK+Zc/0IA5UcLfe/Tq5Gp7fauinvKWGCUGsZ/ED4afd+oGSi6Tzm6AdTh
         L7BnhBly2xPiiJJxZCsXyqsHtKwqiBsUhPhUxn19pipw/kymUO9urIj5TP+4uLmp8SEQ
         oSwA==
X-Gm-Message-State: AOJu0YzwbfIrpNqqP+V6hfitpud3dP+G3GDEb3vSqG5efzXfxFCpIq/V
	Vtyn3CoOLN3KSw/eMBlrDn2B97UbkGKM+uLzbuXT7Z8b/8TYJYWKLC/x1MCZZCa589tUIT66BnW
	u7ntU
X-Gm-Gg: ASbGncsJKtFm78TUUc2jrm2+j+sWw1q2Ri0OQiyxXftl5lfzY+msnDGkCJP3z85AfHg
	g6IIPgQYkPilOr6dTnQO5qZHdtme1yD8kGlMxKa+dTxp07mifG5VPZveqRB8pyhIFxBQ+HdlbLM
	Ytjyh9cOxOkHwkcqcA4HqyXNWjn61GrVAuwQN5NQyqFLKsrpB5xJtMSjtt+x/BRldUUqsoxR0ID
	RpNdoVFbyMiKJKAyKtNRKQKnJQ3/BohVpMmZmMVK1czCQrHiVcEiDOu8pd1p8eJJHlptPL3DXKd
	ZyPUGx6grS4T8f1DEEc3r5AVI3nWmL7cF/yb+GQThzvtP+PE+7odgkkALRQ7gODNEgQw/LJZdi+
	ZPtg7ihCAlxw=
X-Google-Smtp-Source: AGHT+IH0rqpYIWYHLK3MIps5aoZCECSwA7PMlWjVV3rQ2WNH5Ps5mAce5YakYg+HXPXEgpWRikbRjg==
X-Received: by 2002:a17:90b:1c09:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-315f269d826mr8209167a91.30.1750918496005;
        Wed, 25 Jun 2025 23:14:56 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53d9098sm3292476a91.31.2025.06.25.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 23:14:55 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] libssh: fix CVE-2025-5318
Date: Thu, 26 Jun 2025 11:44:37 +0530
Message-ID: <20250626061437.40761-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 06:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118117

Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/commit/?id=5f4ffda88770f95482fd0e66aa44106614dbf466

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2025-5318.patch         | 31 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
new file mode 100644
index 0000000000..2f89977873
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5318.patch
@@ -0,0 +1,31 @@
+From 5f4ffda88770f95482fd0e66aa44106614dbf466 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 22 Apr 2025 21:18:44 +0200
+Subject: CVE-2025-5318: sftpserver: Fix possible buffer overrun
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=5f4ffda88770f95482fd0e66aa44106614dbf466]
+CVE: CVE-2025-5318
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/sftpserver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 1af8a0e7..dee51534 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -530,7 +530,7 @@ void *sftp_handle(sftp_session sftp, ssh_string handle){
+ 
+   memcpy(&val, ssh_string_data(handle), sizeof(uint32_t));
+ 
+-  if (val > SFTP_HANDLES) {
++  if (val >= SFTP_HANDLES) {
+     return NULL;
+   }
+ 
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 061f13912f..e53b8a834e 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -8,6 +8,7 @@ DEPENDS = "zlib openssl"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
            file://CVE-2020-16135.patch \
+           file://CVE-2025-5318.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.49.0


