Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81E7C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.17397.1703059081632630873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aC2t/wfN;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9344f30caso362866b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 23:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703059080; x=1703663880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21euJ1ehQiJXiCndwQlk6/VYrHE+gUnkvKojSQKUZtw=;
        b=aC2t/wfNanmtIOuHXa/pHJ7wPwTyeNZar+6iQ+C5nIstuZbB/+5ONtB8+ppAFQrYvr
         rFTK18y+dveJ9H9BzaQJJ1QKxwkyILe+BoS5rQrTStOqFlhvvqNw/ATwk4hPkYyWlUDU
         6hYz8ZgdKhXHodziJA4koBn4cixyWDvV6bWU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059080; x=1703663880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21euJ1ehQiJXiCndwQlk6/VYrHE+gUnkvKojSQKUZtw=;
        b=vdcHMScnN26c2wraUrW+c5fP1DTp+pvSpOgWcb/l1IJs4MKfTwcE6xBXoYb5Vf8Ac1
         Hw0lZnusF+rT8b9OP6k0BG59VTwjZJVfwgIZPTTZd2jGX8K0sXPnxTCTLbTkz4BfHoeZ
         99YbBbyVuIxFWzDPjGGhNNUl2rjkmgyZvqczFunq01xKlc9M2kUwOqMqRIoG5Oiz+Tox
         gC5WgDaMY803vlh+tt06V8Pg20HfmpXp1VRB6EWvrJ7Heu/fpsMpGaYLloL2YcN9fdUx
         4ED09b3kqJ/66uX/773lzOWDSIUZMwc1uGd78GrlYGcaentZDnzEC0dqqYMpqY716ybT
         r1BA==
X-Gm-Message-State: AOJu0YxS9vvP+t2cQ5ZimoI9lbH0TUpC9HolO1PsakesJTXlYe+FLwbV
	RClvNJE6k9mLOqf45n2ljiaKdqJLAtb92VGPT5XUhMgyAE8=
X-Google-Smtp-Source: AGHT+IFobg2/pEE4XJRfKJwCJ52xot33UgqFWcgaDY+Wi9Ilfo6YKcuwZ5ctF+cYDfUkXYSEwaokTg==
X-Received: by 2002:aa7:814d:0:b0:6d9:3e48:a782 with SMTP id d13-20020aa7814d000000b006d93e48a782mr1960602pfn.18.1703059080203;
        Tue, 19 Dec 2023 23:58:00 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b006d451d8d7f3sm6794230pfo.76.2023.12.19.23.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:57:59 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 1/4] libssh: upgrade 0.8.9 -> 0.10.4
Date: Wed, 20 Dec 2023 13:25:40 +0530
Message-Id: <20231220075543.96481-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 07:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107646

From: Vijay Anusuri <vanusuri@mvista.com>

ChangeLog:
https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

Drop CVE-2020-16135.patch

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=4b7e4341327e867208bfc3d8ba1954af66641e60

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh/libssh/CVE-2020-16135.patch        | 44 -------------------
 .../{libssh_0.8.9.bb => libssh_0.10.4.bb}     | 16 ++-----
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb => libssh_0.10.4.bb} (62%)

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
deleted file mode 100644
index 63b78688d..000000000
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
index 061f13912..3a57a728a 100644
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


