Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F208DC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.25910.1683616032540171048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KhBwWcz9;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3078fa679a7so2269576f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616031; x=1686208031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dylY0Wu7b1dnjSBo4F3H2malLOZhbWxdUpEV46GfhTw=;
        b=KhBwWcz97oy3KevOnD4A+yl4khvq7AYRHXkTdu+FYKjgzO77qBCq0fJmcymsvcIRgy
         29xn5x1ygx0jncsk+bt8FBeuVrW3g+5sToYlZMFE93WBFTFKdbhJaa9xEPOJP5LxsTy1
         dE9Ce/vE1wTORkyzZDc5oekOZKPuli3Dvgu+L6ktfs1l6h3435bD4QBKYPeYvEQSsyTt
         xu5E08XCgvtC+NMiw0H3J7foJoEpMm4uyxXtFqtMFYr/uPHPTlaMEHD+WbEISjPWUcMa
         679+1QhA2S7rIF34Z1Kiz+jtyXYIzDc6O13LsavVZlh9HmC26d3wQnbG2OiYmUEu9GlS
         df5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616031; x=1686208031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dylY0Wu7b1dnjSBo4F3H2malLOZhbWxdUpEV46GfhTw=;
        b=OvBRHzYFxDvjFhfFEC6DoCRJIGHyQKw+U9d7G7wMFKlE0j0TsKsPwZ0ejsR3bZIME2
         Ea1SYBV706YWQithdW0uQCsDZCmRXp4kNr54HAHfYG3PaRLwD1SWzLQcCU/Mdgpg416y
         bkK6Y1hVW6uQv7Ur79P76CpYOrlq9XB6Httq29k73bL/uwIsPryBJuuDHtXz3o8eB3gN
         AS1YMzERl8ZAuooxf4baPyaImRprrfxVxOOYJ1Caz89cIeMkvw1Tks5AG9mTtmDETMsu
         KfPHKwmn5nRhBoLooqTgIgNgMoUbVxwHmqDKXz8CL/FvEsoFWJ+d6i9/Vas3kqJjjkPm
         axTA==
X-Gm-Message-State: AC+VfDzYzQOozriymfv/7HOyG0DUNrLk/Xj0B+1zBAiEykWJYKh2++X3
	1uR60c6HEJ4AIgGqqVt3qlo111RPGUw=
X-Google-Smtp-Source: ACHHUZ6uLDkgAk/j6VWb4k1DIiFtHjzjfQNfQczKaJKsyPYVJisCfq6R1MIyYLxWKsUJ2xgPxr5ERQ==
X-Received: by 2002:adf:f646:0:b0:307:a287:3728 with SMTP id x6-20020adff646000000b00307a2873728mr1125394wrp.69.1683616030911;
        Tue, 09 May 2023 00:07:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v23-20020a5d5917000000b0030632833e74sm13486357wrd.11.2023.05.09.00.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 16/16] zfs: fix installation paths for multilib
Date: Tue,  9 May 2023 09:06:55 +0200
Message-Id: <20230509070655.70784-16-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102484

* pass --with-systemd* variables to install in more typical directories
* adjust FILES:${PN} to package them and more explicitly list some of
  the directories like sudoers.d
* also remove unnecessary trailing /* and fix indentation of closing quote

* fixes:
ERROR: QA Issue: zfs: Files/directories were installed but not shipped in any package:
  /lib
  /lib/modules
  /lib/modules/6.1.20-v8
  /lib/modules/6.1.20-v8/extra
  /lib/modules/6.1.20-v8/extra/zstd
  /lib/modules/6.1.20-v8/extra/zfs
  /lib/modules/6.1.20-v8/extra/unicode
  /lib/modules/6.1.20-v8/extra/lua
  /lib/modules/6.1.20-v8/extra/spl
  /lib/modules/6.1.20-v8/extra/zcommon
  /lib/modules/6.1.20-v8/extra/avl
  /lib/modules/6.1.20-v8/extra/nvpair
  /lib/modules/6.1.20-v8/extra/icp
  /lib/modules/6.1.20-v8/extra/zstd/zzstd.ko.xz
  /lib/modules/6.1.20-v8/extra/zfs/zfs.ko.xz
  /lib/modules/6.1.20-v8/extra/unicode/zunicode.ko.xz
  /lib/modules/6.1.20-v8/extra/lua/zlua.ko.xz
  /lib/modules/6.1.20-v8/extra/spl/spl.ko.xz
  /lib/modules/6.1.20-v8/extra/zcommon/zcommon.ko.xz
  /lib/modules/6.1.20-v8/extra/avl/zavl.ko.xz
  /lib/modules/6.1.20-v8/extra/nvpair/znvpair.ko.xz
  /lib/modules/6.1.20-v8/extra/icp/icp.ko.xz
  /usr/lib/modules-load.d
  /usr/lib/systemd/system
  /usr/lib/systemd/system-preset
  /usr/lib/systemd/system-generators/zfs-mount-generator
  /usr/lib/systemd/system/zfs-scrub@.service
  /usr/lib/systemd/system/zfs-scrub-weekly@.timer
  /usr/lib/systemd/system/zfs-import.service
  /usr/lib/systemd/system/zfs-import-scan.service
  /usr/lib/systemd/system/zfs-share.service
  /usr/lib/systemd/system/zfs-mount.service
  /usr/lib/systemd/system/zfs-volume-wait.service
  /usr/lib/systemd/system/zfs.target
  /usr/lib/systemd/system/zfs-load-key.service
  /usr/lib/systemd/system/zfs-import.target
  /usr/lib/systemd/system/zfs-import-cache.service
  /usr/lib/systemd/system/zfs-zed.service
  /usr/lib/systemd/system/zfs-scrub-monthly@.timer
  /usr/lib/systemd/system/zfs-volumes.target
  /usr/lib/systemd/system-preset/50-zfs.preset
  /usr/lib/modules-load.d/zfs.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
zfs: 42 installed and not shipped files. [installed-vs-shipped]

when libdir is /usr/lib64 with multilib.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-filesystems/zfs/zfs_2.1.9.bb      | 36 ++++++++++++-------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb
index 77daab7dd5..573561db25 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.9.bb
@@ -27,12 +27,16 @@ EXTRA_OECONF:append = " \
     --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
     --with-mounthelperdir=${base_sbin} \
     --with-udevdir=${base_libdir}/udev \
+    --with-systemdunitdir=${systemd_system_unitdir} \
+    --with-systemdgeneratordir=${nonarch_base_libdir}/systemd/system-generators \
+    --with-systemdpresetdir=${nonarch_base_libdir}/systemd/system-preset \
+    --with-systemdmodulesloaddir=${sysconfdir}/module-load.d \
     --without-dracutdir \
-    "
+"
 
 EXTRA_OEMAKE:append = " \
     INSTALL_MOD_PATH=${D}${root_prefix} \
-    "
+"
 
 do_install:append() {
     # /usr/share/zfs contains the zfs-tests folder which we do not need:
@@ -42,19 +46,25 @@ do_install:append() {
 }
 
 FILES:${PN} += "\
-    ${base_sbindir}/* \
-    ${base_libdir}/* \
-    ${sysconfdir}/* \
-    ${sbindir}/* \
-    ${bindir}/* \
-    ${libexecdir}/${BPN}/* \
-    ${libdir}/* \
-    "
+    ${nonarch_base_libdir}/modules \
+    ${systemd_system_unitdir} \
+    ${nonarch_base_libdir}/systemd/system-generators \
+    ${nonarch_base_libdir}/systemd/system-preset \
+    ${sysconfdir}/modules-load.d/${BPN}.conf \
+    ${sysconfdir}/default/${BPN} \
+    ${sysconfdir}/sudoers.d/${BPN} \
+    ${sysconfdir}/${BPN} \
+    ${base_libdir}/udev \
+    ${sbindir} \
+    ${bindir} \
+    ${libexecdir}/${BPN} \
+    ${libdir} \
+"
 
 FILES:${PN}-dev += "\
-    ${prefix}/src/zfs-${PV}/* \
-    ${prefix}/src/spl-${PV}/* \
-    "
+    ${prefix}/src/zfs-${PV} \
+    ${prefix}/src/spl-${PV} \
+"
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
 # conflicting definition of ABS macro from asm/asm.h from kernel
-- 
2.40.1


