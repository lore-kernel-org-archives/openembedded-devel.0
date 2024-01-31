Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297DFC47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 11:58:17 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.12204.1706702296149767282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 03:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M/on/fVS;
 spf=pass (domain: mvista.com, ip: 209.85.167.174, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb9d54575cso3656873b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 03:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1706702295; x=1707307095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ED6oPqMau711ns5QBRCa2HtVgP9hET6Z4dAjtjNlzss=;
        b=M/on/fVSdf0GqbL85w7zth0CPnxF05Hgex0F9SNQim1OOYc4gtCyGS6tZAv3LscHYm
         Hcco/pdVd06oD9gSW8i/6DO33Yc8BmZ5kJ0Y3FRE3nYfYBX3WaUN6RMdNUeYAIFQJx9V
         ixNz1Ne9dNGlb5thI1M+Bz11w1BGwgByxSfl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702295; x=1707307095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ED6oPqMau711ns5QBRCa2HtVgP9hET6Z4dAjtjNlzss=;
        b=rhhXqgtk4eWg3VW8fy2xPaUmrC4Gu6hLmu3a6hsvE1CQmayPn5YFuEfjA63ogtnAcC
         2NptxURjYwHzoIeHxFM74miCGgR3io2QSKiNLRy3A+G+apUtyvdjdMivVoQeTzFHlkBu
         xi3Na9qBTY3tREpUuoHvPxPNCHF31meFdixwiucKvX9UK03MDKWpXkQ+tRO9kiGO78yk
         7HTI5fm5lqpobAnZN0TpuGThVKi3Z6yQY4LENCByEc8S+uPB/DlaF8vomPG08pY6s8zD
         zHmocZrIK9QVPhvIB3DcoXiPIkR5Jvq2YK3AABpO/WmqhdkbHfIxlDcfIKPL/o+eUhs5
         UTxw==
X-Gm-Message-State: AOJu0Yymp14KdbYnsZ3OCG4Yd+6qMju7uxmcUnuwCMu9X8TYle21JFNt
	FwXXi1pVcGiaBRyOMd7gmQF00f6gi+tLr5cMaXGzN+Xb9hpQrTYKHlE2eT12TUmVeHWMxRC+wlP
	4
X-Google-Smtp-Source: AGHT+IG3LicUGwHzqFHvSENWTMIVhBuVM6K443/LgBcnbBxhBjBHSuBKlOY/NRUe92SuD8vxx1jolg==
X-Received: by 2002:a05:6808:1388:b0:3be:a625:b87d with SMTP id c8-20020a056808138800b003bea625b87dmr1461438oiw.31.1706702295145;
        Wed, 31 Jan 2024 03:58:15 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.206])
        by smtp.gmail.com with ESMTPSA id kt6-20020a056a004ba600b006dbd9501028sm9986507pfb.92.2024.01.31.03.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 03:58:14 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] libssh: upgrade 0.8.9 -> 0.10.4
Date: Wed, 31 Jan 2024 17:28:09 +0530
Message-Id: <20240131115809.355760-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 11:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108506

ChangeLog:
https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

The "CVE-2020-16135.patch" is no longer needed as it's included in this upgrade.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2020-16135.patch        | 44 -------------------
 .../{libssh_0.8.9.bb => libssh_0.10.4.bb}     | 16 ++-----
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb => libssh_0.10.4.bb} (62%)

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
deleted file mode 100644
index 63b78688dd..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Wed, 3 Jun 2020 10:04:09 +0200
-Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()
-
-Add a missing NULL check for the pointer returned by ssh_buffer_new() in
-sftpserver.c.
-
-Thanks to Ramin Farajpour Cami for spotting this.
-
-Fixes T232
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)
-
-Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/patch/?id=0a9268a60f2d3748ca69bde5651f20e72761058c]
-CVE: CVE-2020-16135
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/sftpserver.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/sftpserver.c b/src/sftpserver.c
-index 1717aa417..1af8a0e76 100644
---- a/src/sftpserver.c
-+++ b/src/sftpserver.c
-@@ -64,6 +64,12 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
- 
-   /* take a copy of the whole packet */
-   msg->complete_message = ssh_buffer_new();
-+  if (msg->complete_message == NULL) {
-+      ssh_set_error_oom(session);
-+      sftp_client_message_free(msg);
-+      return NULL;
-+  }
-+
-   ssh_buffer_add_data(msg->complete_message,
-                       ssh_buffer_get(payload),
-                       ssh_buffer_get_len(payload));
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
similarity index 62%
rename from meta-oe/recipes-support/libssh/libssh_0.8.9.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index 061f13912f..3a57a728a1 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
-           file://CVE-2020-16135.patch \
-          "
-SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10"
+SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
 
 S = "${WORKDIR}/git"
 
@@ -25,15 +23,7 @@ EXTRA_OECMAKE = " \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
-    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+    -DWITH_EXAMPLES=0 \
     "
 
-do_configure:prepend () {
-    # Disable building of examples
-    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
-        || bbfatal "Failed to disable examples"
-}
-
-TOOLCHAIN = "gcc"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


