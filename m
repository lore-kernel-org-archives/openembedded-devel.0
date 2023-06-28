Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00341EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 06:59:05 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.10459.1687935539738142050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 23:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R5NpXiHb;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5577004e21bso1878206a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687935539; x=1690527539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpmpJjH4tDPjIaHSUBOYgRUvHZUrE71RyRJjlMCCpdw=;
        b=R5NpXiHb2UfysUbHKYwwuoG8x/ZzgvEOgXMZatkvQ+JT5phNFgm166rKfxfjShnmJP
         2uMKsI6POsix2+2vNGAYlsO98j5BYRFEK0e9bijjYrThmJgJW/Ey5GXYUTY1SpkqX9P8
         vw9vW4GCfxFGCm/teFD2E/mLGcY6jy5SIWIVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687935539; x=1690527539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpmpJjH4tDPjIaHSUBOYgRUvHZUrE71RyRJjlMCCpdw=;
        b=cvoGYZ26j4ZV8TSCy3Fc+BvvBAVQtTvlv+IYEbV32Upf7Q6soZgLNhRGlyM5eufB65
         VR5qCOLoPCpmEQWhFhxS3ikS2WiF15sK59/EPnYIsPhYG6q+r0ZM0RfGOwoJVwt2B9xW
         U01hfFYq7PLjZMVj6sVxdVGo4XLqZD8Rc5QhjKWKifgxWc3hXCf1tJHBArfyt/a+fP7i
         pIICBOFQaJUHP6mGdExjSbK28GUhWuhVCP+y/7bbdOL7p1Z76+DIRyH378f+N82P5Sz0
         GJO7q01XkOmJHo5fFp/pNA0/F3EcvMXCvhGsTatVCgwf8HOd4VWpW/7EBs4t0veemH3+
         0FJg==
X-Gm-Message-State: AC+VfDxvJrva/RtN2yhfPLRW23APyMGW2rbAj/s2GpUPhEdmjOarlXP+
	h67Ka6WkDMNpuD2zdpslbqTgPV5ncPilQxsReMMGIQ==
X-Google-Smtp-Source: ACHHUZ6/uHQAU7uSSAk7CzTXk8HP3JAI0NvlQOyl9PDBhMeAVpS0i2Xuo/NVJg54H/2opPL5XL/8ow==
X-Received: by 2002:a05:6a20:a11a:b0:126:b8d4:622d with SMTP id q26-20020a056a20a11a00b00126b8d4622dmr10094494pzk.49.1687935538971;
        Tue, 27 Jun 2023 23:58:58 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.143])
        by smtp.gmail.com with ESMTPSA id ja10-20020a170902efca00b001b83e624eecsm544303plb.81.2023.06.27.23.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 23:58:58 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 28 Jun 2023 12:28:53 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCHv2] libssh: CVE-2020-16135 Fix NULL pointer dereference in sftpserver.c
Date: Wed, 28 Jun 2023 12:28:50 +0530
Message-Id: <20230628065850.56155-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 06:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103622

Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/patch/?id=0a9268a60f2d3748ca69bde5651f20e72761058c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2020-16135.patch        | 44 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
new file mode 100644
index 0000000000..63b78688dd
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
@@ -0,0 +1,44 @@
+From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 3 Jun 2020 10:04:09 +0200
+Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()
+
+Add a missing NULL check for the pointer returned by ssh_buffer_new() in
+sftpserver.c.
+
+Thanks to Ramin Farajpour Cami for spotting this.
+
+Fixes T232
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/patch/?id=0a9268a60f2d3748ca69bde5651f20e72761058c]
+CVE: CVE-2020-16135
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/sftpserver.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/sftpserver.c b/src/sftpserver.c
+index 1717aa417..1af8a0e76 100644
+--- a/src/sftpserver.c
++++ b/src/sftpserver.c
+@@ -64,6 +64,12 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
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


