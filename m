Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E373DC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:06:47 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.14611.1751033198961806537
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/Bhvm1B;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so3323074a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033197; x=1751637997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFy56JkStpORF7za9k9+dcFvQQN9ImkU4w4JlMRpIes=;
        b=B/Bhvm1BYxs3MH4eOUs9/Vs5mTskKZHrS+ifIfLSQQ2p4RGUODPC2wxmIwts3aMCYB
         Ca5K3um9ymOvEPQBO5g2LUK5nSDyXdCrRAxxGQOYqHX3HEcT0XkWz7Hl6zb7r9zvAN2Y
         red7wGthRGN6tJSckKdkCCPqdPTfKxpGSoXH6rhyX33rBnwZQellGOwuNb9yPV4olRJL
         LVVCO4Xlxf7A9KLHBahKwye975Zx5wV40M1WPH+Vns7K84BWgpE613SyEg0r0rfJxk+6
         8e/PU/6kefdQ5m4CBK7pNXYvu5M9BnnEkebv64/D0ogFkW4EAnowzmybru6EJPRmFqu+
         ydsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033197; x=1751637997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFy56JkStpORF7za9k9+dcFvQQN9ImkU4w4JlMRpIes=;
        b=mUpmvrAgaNZyWsLepnYi8OG41JaubGQlCa2+q2+dNi1i1NvRrC8rzKFbl3ryOopli1
         tnlrnYPf3XtfDM8mYsswXt3QqYER7iv77acqa2vg66tlexbQq97Cby9noIyd0DA9ozHO
         +EhDne0CecT/z7K1AuumcjbY1XUVxAnA6uRdPKuxk6EYHMAEcayyOR2uExsQ2DM/Gj7f
         zpe89Xj62E+iT3KBQWWlqSSP9Ahqz0ddLYeNJzLPi1m6dRw9TD5jA7y03X6Tp1Bf2V/n
         d9r1aysY9P2lQX9lcu8X11ByQ6xL33Xh0W37phg9EY8RvqLAq8rTgwYP//Z6c577SLQ/
         WNoQ==
X-Gm-Message-State: AOJu0YxcQMXvXJEPAgFheLpJK1afmZ3O4y78GvdDSNUfmS3Td+2u6oKh
	vYQc6kh3ovLIhymTNXS1sS3ljlj0D9Qq9t94KvPaJ7cj6QsPVikmz98D8e+LQw==
X-Gm-Gg: ASbGnctRwbEe419B2HFghg1mietV5yuWMztNNhXCKOSy5jPHoWkHZZGM/G9d6w7dV58
	KMhioujZ7BYzsD6eADaz9YfY4P8fz/kc3FjCLNddWrqKrxoFR4RQHzyoTl7gvhCQ06OrDo3827d
	1aJKvBRUyvY62bx8mnIuvvWH8/TQlH2Nu/AGnPjwd+8G2vKfF941ad552NaykZ3PD4zCKfoUEvM
	W/drxCYNy7TLNrC21Pd7aj5uwM9QL+tsFdstu4bqRObHvpxa7IuSq5cIqd5oWxcP1aJrhPuThHM
	9MRCctjqZtpiqA22Gypi+669Dh0tVBrtKtUDpGDhLEHXr24ufkPLKI2w9sGMxN0tsOX/FA==
X-Google-Smtp-Source: AGHT+IEd8YUGxOwXHn4MYdOZzrx2OgwbxGdpheSk+D8RMn38/8BnrQKKwEG4yFSkzV9lcAVnEZAR/A==
X-Received: by 2002:a05:6402:2101:b0:60c:4bc0:453e with SMTP id 4fb4d7f45d1cf-60c88b38471mr2547162a12.2.1751033195308;
        Fri, 27 Jun 2025 07:06:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb7b9sm1534083a12.15.2025.06.27.07.06.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:06:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nodejs: inherit qemu class conditionally
Date: Fri, 27 Jun 2025 16:06:33 +0200
Message-ID: <20250627140633.354460-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 14:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118154

The recipe unconditionally inherits the qemu class, because it executes
some target binaries when it is cross-compiled and the bit-width of the
build host and the target host are different.

Since it is unconditional, it also means that it is inherited for native
and nativesdk builds also. The qemu class uses some qemu options that are
always derived from the target machine's configuration, even when the
recipe is built for class-native. This means that some of the variables
used by the recipe changes (e.g. QEMU_OPTIONS), and the shared state cache
is invalidated when the target machine changes, even when nodejs-native is
being built - and it triggers a full rebuild of nodejs-native unnecessarily.

To avoid this, inherit the qemu class conditionally, only in case it is
used (when the target and build arch's bit-widths are different).

Also, inherit qemu-native based on the same condition, and move around the
qemu-dependent code a bit, so it will be only executed when the qemu class
is inherited.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 4bc829f140..162c9607d2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -9,7 +9,9 @@ DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-nati
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest siteinfo
+inherit pkgconfig python3native ptest siteinfo
+inherit_defer ${@bb.utils.contains('HOST_AND_TARGET_SAME_WIDTH', '0', 'qemu', '', d)}
+
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -108,11 +110,11 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                    qemu_libdirs)
+    qemu_cmd = ""
 
-    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
-        qemu_cmd = ""
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "0":
+        qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                        qemu_libdirs)
 
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
@@ -209,6 +211,7 @@ python __anonymous () {
     # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
     if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
+        d.appendVar("DEPENDS:class-target", " qemu-native")
     else:
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
 }

