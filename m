Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF84DC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 20:24:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5539.1683231875776360529
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 13:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RDul6oh3;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso6873195e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 13:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683231874; x=1685823874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dylY0Wu7b1dnjSBo4F3H2malLOZhbWxdUpEV46GfhTw=;
        b=RDul6oh33VN58RFlv004OnaDv2nqQber2xvNL0XytoSKd0t+fX43FbbpvCKGOq5qxk
         1GedaDJ7xTeIaIWrCF8qT0SNwDnCedBwRRdDDlB94xnJEOzGIQhXPav6beMDl+QQKfY+
         t9B6b33gsLanAUhA/WfxSd4+tD/ZkBqZcWGZ2he3JxrvZPr6rbknNH1EhOiBwEX5PkZa
         6BI/zyCiJdACEy7FOCHU5tgQmM3gnruE54QH1YdCfBaBdKEvPNKeT7fqFxiEdAJXnj+v
         gd0/422dmX87MoO01+eu3VYzHq6d9tZswMMM5ZNUa7/WFztwtQjEJkMh98f4eE09H1EN
         0T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683231874; x=1685823874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dylY0Wu7b1dnjSBo4F3H2malLOZhbWxdUpEV46GfhTw=;
        b=A8i3F5pdIQnWafSbb7YqVM+nPMOx8XkrRsyZMvnuEunZCyKcjxN9h8zuGi3tYCdWqM
         Ya4rl9te93rJtU456QXlke0U/TFaAru7C4wjMzZFIR5zXh5HVPrwiD6RIkANt4swGYR5
         Jqd7c66DxCu4AH6RGXADxNoZdMPLFSLZTYzM+m4paM7XkYBaXcIvJnZFEqSGGKxKypTH
         Phof1ImX/4+yFI6CKOg0IpVMDApqdvscD+mk0dZDJbfM7p0gDZrsHpOhfroJHz59oFw0
         NfG7hVQgY+Mncgay4UMqnVum4mqIdARwTrgUTuIU9ewlBBcn9IX4HWlVBjlY2oaqRYBJ
         MwGA==
X-Gm-Message-State: AC+VfDx8j/hHlrb47RBTC8AwpQ+dI20PjERBD0LfAMB/Qd/p8KnwoDcM
	+ELfH5OByZP2BX1bEMpqEHxjLMi00To=
X-Google-Smtp-Source: ACHHUZ6CgGIx/6E/KFk/SYwnGVp2Rq6sv5LX3Or9eGa6JbQiE5qHLzK4A2LQrPe9fY8aH4b2AMy3xQ==
X-Received: by 2002:adf:f108:0:b0:301:81f8:765f with SMTP id r8-20020adff108000000b0030181f8765fmr2927040wro.38.1683231874106;
        Thu, 04 May 2023 13:24:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p3-20020adfce03000000b002fe522117fdsm146644wrn.36.2023.05.04.13.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 13:24:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-filesystems][PATCH] zfs: fix installation paths for multilib
Date: Thu,  4 May 2023 22:24:28 +0200
Message-Id: <20230504202428.3448442-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 20:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102313

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


