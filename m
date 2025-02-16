Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C99C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 08:24:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.25649.1739694231671305412
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Feb 2025 00:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TKT2O0cU;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43963935585so33149015e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 00:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739694230; x=1740299030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KszZ4tqnbOrJ6Q9ffg8gSUelTmXFTRWmjqlD2wQ877Q=;
        b=TKT2O0cUeE9B5xuP6suGjMoFjt1q9kW0fWEyHGr389gos08i2gbj1/kVzMEFp69lMb
         /eGH7wK65FlLJPcE+tU54usVti24sI2v0mtawLCaqGVYWGEIs/80w0DbhmWXhbCTQJ5/
         3GizxtAxvwOitk84gM8dZ+QOxdVc2w/k8GNNckfgh2G5x2mn06NFswmNd5/o2bLV1uxn
         wUWw/VLQNPeuRUEu86zNawrKMUrjFRFwQqFEpDKsKW3VH0OHhQYyyRC0GZbkB/vMWhwW
         NAdlt1gcByYgnhdXTAjEaWJnCGrE/OxSqw8YAB3xIJ4gdks+BodweMwZ9qnvFDu8An9r
         XhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739694230; x=1740299030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KszZ4tqnbOrJ6Q9ffg8gSUelTmXFTRWmjqlD2wQ877Q=;
        b=qXqIBqzca9NFxyyk73/W5WgfxnXBvDwJOYzzWOVC6y+jIy8gQjKLQQbW9W77Q4QyB1
         YjMi1Gl0kvkBVgNqrnjSYmeR1Lje2vLY8GXxPejtjnHLrliAnKZ1iLJjKh+2/5XW+KEB
         ZjpUdfJw0MhjPy9+sXu/T9WAXan88hHiefMIAzi2nQv22zdXCL+8I9D4Hjw8TVVAuzUA
         mgvY5cR2mmFqVgTGsR3xeskSz/tS2u6JW8gxQo3cyYKQurYZFy/nBluTIdhQepo9jo8g
         RncmfQEnEmYLZU15nzmin6Vkki/RVi7mih9pB+kVBB6lDFWoCxOX/9nDrGQnHNURVGXk
         d42Q==
X-Gm-Message-State: AOJu0YxTNT+O8/QyAr5CTHPH1+OmH3tw6v0N8v3CxaYf1bXU1/hH7Wbo
	DG7EGbBcU6jpOMj0u3dFkJo7dWWkIRN5N3m8gFehkEln25B7EdxVXd9qEvJg
X-Gm-Gg: ASbGncvam6v6gCfF6Kq8P+ZLri3qDamHNUHP8NhzrpOdPIBdOQ0ZaxxnKIKBka3wHGp
	2hM5rCfRgGql/iAMUDLrzJhJ2YJlN1mCp039AidmGtmvieWwamjpZ20nlS9Dtzjb4x8VQeun1rv
	xOpvPeCDWqrPCt5+X3Lhfmf1JvMHJhNwrWJz5mAaMc6te8UNg+cuHD5zVNjnKcKLFCmbWxIPOmu
	R8t6oJoPGe3L3MBJj116UopaiEfRKKJ5GxOtESdt+fRX64Fs42LIonuCCYL2iUsUeODOmrdn/zS
	Oo/kprmY5OjzjlFT9867Uu/StCL4bNqTndpHmNqYLd93DskoY+4OpbYG3GA=
X-Google-Smtp-Source: AGHT+IEuVd0JPJNfXfbxfZkm72zpvs61JYXBnrIICcoMgZ0Cbp5xnmLtTpVq+GhfGN3O3PrNGWqVnw==
X-Received: by 2002:a05:600c:458a:b0:439:5fc7:b483 with SMTP id 5b1f17b1804b1-4396e6a9fa7mr70626325e9.11.1739694229570;
        Sun, 16 Feb 2025 00:23:49 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d237sm119868395e9.21.2025.02.16.00.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 00:23:48 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-filesystems][PATCH v2] gpiod-sysfs-proxy: Fix deprecation warning
Date: Sun, 16 Feb 2025 08:23:23 +0000
Message-Id: <20250216082322.1072-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Feb 2025 08:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115501

Replace `\/` sequences to fix:

  gpiod-sysfs-proxy_0.1.2.bb: Var <MOUNTPOINT>:1: DeprecationWarning: invalid escape sequence \/

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
index fef2589106cd..07208d1b775a 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "4bdd4b8a7042f63a40507ae0f16b360011e67cbb2f0276289636487a54
 # non-standard behavior so make sure the user actually wants it.
 PACKAGECONFIG[sys-class-mount] = ""
 
-export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '\/sys\/class\/gpio', '\/run\/gpio', d)}"
+export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '/sys/class/gpio', '/run/gpio', d)}"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
@@ -41,11 +41,11 @@ do_install:append() {
             ln -sf ../sys-class.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/sys-class.mount
         fi
 
-        sed -i "s/@mountpoint@/$MOUNTPOINT/g" ${D}${systemd_system_unitdir}/gpiod-sysfs-proxy.service
+        sed -i "s:@mountpoint@:$MOUNTPOINT:g" ${D}${systemd_system_unitdir}/gpiod-sysfs-proxy.service
     elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${UNPACKDIR}/gpiod-sysfs-proxy.init.in ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
-        sed -i "s/@mountpoint@/$MOUNTPOINT/g" ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
+        sed -i "s:@mountpoint@:$MOUNTPOINT:g" ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
     fi
 }
 
@@ -72,7 +72,7 @@ python __anonymous() {
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests/
     install -m 0755 ${UNPACKDIR}/run-ptest.in ${D}${PTEST_PATH}/run-ptest
-    sed -i "s/@mountpoint@/$MOUNTPOINT/g" ${D}${PTEST_PATH}/run-ptest
+    sed -i "s:@mountpoint@:$MOUNTPOINT:g" ${D}${PTEST_PATH}/run-ptest
     install -m 0755 ${UNPACKDIR}/tests/gpio-sysfs-compat-tests ${D}${PTEST_PATH}/tests/gpio-sysfs-compat-tests
 }
 

