Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B82AC77B7D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.94806.1683499459450386616
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gsPI4ELV;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-966287b0f72so233696566b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499458; x=1686091458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dylY0Wu7b1dnjSBo4F3H2malLOZhbWxdUpEV46GfhTw=;
        b=gsPI4ELV/T0kiM5TpXLh0RrLkU8q1qJYTcbg5V75Te14vyG6IApnTERnYrjtnQxsyz
         nGBSFVZVHiUkngrp2tAuW0w5vNVVA40gAOFoJo2R+ZVQ1XRVrHkhFx3YT4miRgTODU+3
         h+Zn9MfNpfsDrSN2em3J8dgvnFL51m6q3U4OCDjQE2zEs9xJwLOPH612L58WhiW43D64
         og+BZGkTtKwQIonCnDoIA3iqj5uhgw2XPmFHfihB/q3zDCOrrj0nMnw5WDrCMgJDJLxK
         DeNaJ3B1Nu1D95od97ytviHrd8feTfi61CpwMYGsdO3qQKbP9JtmbyNmAD43Mdt3gYWj
         W1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499458; x=1686091458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dylY0Wu7b1dnjSBo4F3H2malLOZhbWxdUpEV46GfhTw=;
        b=HzCNFGV3MugSJJVoTpNhsGTajDooBvihDHE7q5zrpZYOvmrJ3PIz6eOjwX+MEPXp6k
         pE3ntqHoYC7B0+tQfXTDKmsuMGl8lfO6DLzSP3/SBme4N9MGfJxrba9o5pfWeDIFcG4G
         B24AKNkni+SDEeJP3RvtSyW1wkEcuwLfmEng2rNVRscS1Vl5OA91lQRZbKYo1Bjhlwds
         Qh0uQmTygYVi/ZqQOcoRxQRYCgUaq7yPsaa7LpIXJAStj/ZMjAc/Aja7ItI0B0zs4+rB
         XLWZkezCs9bK4v37CLUdMzqfjccH4Y28yfdxJgLt5QKAdfaEwnSpVBfz6QGKlZNKs8nI
         CUDg==
X-Gm-Message-State: AC+VfDzNfyQayLx4Go645/5XBFv2bHbMbCu4yerxIbLx8lLqZsOHmfvG
	+Gx3QGIHribXgO3BwgvNAXiLOWcBc1I=
X-Google-Smtp-Source: ACHHUZ51Xeg5yZWWbI1YnCndeCahSJi5VvqaQajLkAW9Mo2NlB/yp9UEoYuzbUunYMN4WM8tw6H1Hw==
X-Received: by 2002:a17:907:2d90:b0:966:40ad:3aec with SMTP id gt16-20020a1709072d9000b0096640ad3aecmr2995680ejc.6.1683499457090;
        Sun, 07 May 2023 15:44:17 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709063a0a00b0094b5ce9d43dsm4135020eje.85.2023.05.07.15.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 16/16] zfs: fix installation paths for multilib
Date: Mon,  8 May 2023 00:43:54 +0200
Message-Id: <20230507224354.1149327-16-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102378

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


