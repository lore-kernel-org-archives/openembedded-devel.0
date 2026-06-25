Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF155CDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 18:08:54 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17929.1782410927344632560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 11:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CZ8Dhm6U;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139b5e604b9so231978c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782410927; x=1783015727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDcfhtvXx7smTopHgzlkWzALOocTooD35i6AOzaYb8w=;
        b=CZ8Dhm6UrhuhltMEd0/Q1yQMvtKVWVZW+UpRhEiUTGln3HkfIfdujdp0hPQKrGwFA3
         pUZiCbgieJ/YqqCBmS52502Xibhf9ibB0hAIIzjutgo2cXQpPsO1dxGISJ8leN5U4Phf
         hNrQuec8byx9cqF32M0Ni0x5tCStqTTO59+NHsVelXDJWjNHjUtI3Q4QdogUD86OS1WV
         6XxeJTYYy7wYXvCvU5DAmAOeFuBjGQfiu0qflOkkEvX46JLO3rtsp0xrs5YSs/xMNziX
         eDJu/X+d8QAbpJJT2lYtfQ2rzWIoeed3E75u9LtmCCJhzf8cShJkuoydi5fAsGicXEPk
         ewRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782410927; x=1783015727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDcfhtvXx7smTopHgzlkWzALOocTooD35i6AOzaYb8w=;
        b=LnSCkYB4tANZ12W+GKvh467VOUdjiOcnYTawQp7WEylQgEHTbs4yFEkMcL9no//XUX
         MQUpE8l7kY8NZLaFrr66hlqBX7mrs9JRTg+K316r3JknjK5cecAQHqoxYc0e8HgCKFUT
         +H1+TV5v2G4E8+Fc9hFbxwKXrVIgp5WjYqD5M4/Lam3oBQuwLuROWAQZ1ZAB9xYTMNev
         BTvYVFB3piR5OJkq+5H3UFY/NatNkoaXIuGRbcq/l/Ud/LWJLzeU524qtT5eO67AOKPE
         GiegugnPNOH5tvbHeHyW3ndDnsGEXfIu7zIkgLbgPGeKpFokVBFnYTPynH+Zj7o8XpeR
         m8/Q==
X-Gm-Message-State: AOJu0YxHtMfE950dl4/nlaFN5JNnCcmBYjOaRfuC8kdf7+FyxvFfZcVU
	YjVjv10QDHsaTkLVsSVNHldF8VAsH9ukREQakC0AEl8OZp9tOSbf5EEBBUoxCgsPJrY=
X-Gm-Gg: AfdE7cmiaJhSRTjOCjgkMTjx2yUMSrpYVLV/HUN9/RiMlyDJOSerXKfz9shHWTQwG/F
	vk8xehpj5zzcOEfFe7/zPe7mleavE/muxoCmm6zEv8ndjJN2ODBi8KRclm7C9snlqIs/iChvrur
	Huk2GvQgdGmkQWDkcdN8m0wyJxSjzlaY38w+yw8QBfwGPv7G5IoX/+/TvqfS1P07/8Siv3vlYPI
	3NsJGCm0pQFPDZ/u3yEx2PUN4ExxTAMyLFi0Q6jdA9Js0o459OszjaJ40sPOymXU3zSa/r692yi
	iNsQNz6vYHpbXEqEd0seHm7ivgwT2I9jUCBUG6UcROm0H+sFFB0j43szGq0lF/zkXJOa/QQwkGw
	opoKl7+Zr/BKEt4NeK0dxFMl1faUiP1aWv5YQnXirYzFXXSnLW92lu6hG/Rm4q7cGAk+GjLBYDF
	xDpckRsmlmRJ7jXq4/8a+OVOywHCDESInET5XCnDZ/YZDwCkoQy7nbS/4hBNwpA4Nb1f6Tm7UeQ
	Sve13vZ8wa8by2PQkLOoW4+fT7vAYN6cRiisrEATH5lfSDC+DJD0K4UKMK3JtpAg5ObdMINPbKE
	prRwQ+CxDbLx64zKZFk1BcjSxKwqhw==
X-Received: by 2002:a05:7022:4a9:b0:138:2c88:b3d6 with SMTP id a92af1059eb24-139dbac3260mr3065403c88.18.1782410926587;
        Thu, 25 Jun 2026 11:08:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f5fc82sm9799620c88.5.2026.06.25.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:08:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] crash: fix buildpaths QA properly via gdb --with-sysroot=/
Date: Thu, 25 Jun 2026 11:08:39 -0700
Message-ID: <20260625180841.2638737-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625180841.2638737-1-khem.raj@oss.qualcomm.com>
References: <20260625180841.2638737-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 18:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127784

The recipe passed --with-sysroot=${STAGING_DIR_TARGET} to the bundled gdb's
configure. gdb bakes that path in as its default target sysroot, so the
resulting /usr/bin/crash binary embedded the build-time recipe-sysroot path:

    File /usr/bin/crash in package crash contains reference to TMPDIR [buildpaths]

This was worked around by demoting the buildpaths QA check to a warning
(ERROR_QA:remove / WARN_QA:append), which only hides the problem - the build
path is still wrong for a binary that runs on the target (or, for the
cross-canadian variant, in the SDK).

Set --with-sysroot=/ instead. crash takes the kernel/vmlinux and dump on its
command line, so gdb's compiled-in default sysroot is irrelevant at runtime;
"/" is both a sane default and contains no build path. With this the binary
no longer references TMPDIR, so the QA suppression can be removed and the
buildpaths check passes for real.

Verified with a clean build for qemux86-64: no buildpaths QA issue and no
TMPDIR references remain in the crash binary.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-kernel/crash/crash-cross-canadian_9.0.2.bb   | 2 +-
 meta-oe/recipes-kernel/crash/crash.inc                   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
index 0ab18cb3d4..1a62441c05 100644
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
@@ -37,7 +37,7 @@ EXTRA_OEMAKE:class-cross-canadian = ' \
                     --target=${TARGET_SYS} \
                     --disable-gdbserver \
                     --disable-gprofng \
-                    --with-sysroot=${STAGING_DIR_TARGET} \
+                    --with-sysroot=/ \
                     ac_cv_type_gregset_t=yes \
                     ac_cv_type_fpregset_t=yes \
                     ac_cv_header_sys_procfs_h=yes" \
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index e7b3b9cf13..57a6c23bc4 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -58,7 +58,7 @@ EXTRA_OEMAKE = ' \
                     --target=${TARGET_SYS} \
                     --disable-gdbserver \
                     --disable-gprofng \
-                    --with-sysroot=${STAGING_DIR_TARGET} \
+                    --with-sysroot=/ \
                     ac_cv_type_gregset_t=yes \
                     ac_cv_type_fpregset_t=yes \
                     ac_cv_header_sys_procfs_h=yes" \
@@ -121,10 +121,3 @@ do_install:prepend () {
 RDEPENDS:${PN} += "liblzma"

 ARM_INSTRUCTION_SET = "arm"
-
-# WARNING: crash-9.0.2-r0 do_package_qa: QA Issue: File /usr/bin/crash in package crash contains reference to TMPDIR [buildpaths]
-#
-# WARNING: crash-cross-canadian-aarch64-9.0.2-r0 do_package_qa: QA Issue: File /opt/phytec-ampliphy-resy-systemd/6.0.98-devel/sysroots/x86_64-resysdk-linux/usr/bin/aarch64-resy-linux/crash in package crash-cross-canadian-aarch64 contains reference to TMPDIR [buildpaths]
-#
-ERROR_QA:remove = "buildpaths"
-WARN_QA:append = " buildpaths"

