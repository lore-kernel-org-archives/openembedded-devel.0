Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.695.1588021589291148709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 14:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G4iKEVkw;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: andrea.adami@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id r26so516313wmh.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4ZfuENpd+zavvFGPp0s8OPiZJpFz2gcuTHH90YMUMyY=;
        b=G4iKEVkw4fLZ+SVY/RfeZ2c5isK2obfvrO5UayIvI8FvD0IHqzClNVhfuxOjg6IuO/
         +Vo2C4jza6mTm+9kf15vMwoujf/gxuSYHyjxQ+9S4XuQOSkeb7K1Im099gEGR8d2aL9B
         CIcsBo+/QOCo3wFEIyDUEYAJCgb+8ofLeU4DlFthKPBeLShq4XacY4SgfhsLE27TfaBq
         8Jeizg0gcutcBVpEjvSt96ij1oart2EM1A7VbPBYegCSg8x+3W4VjZhr+ogUJgbj6h7e
         x9E6r34CiHxF+uLc5W3gaM8GVZfj0priSndNACvUibJBbLL3FbEm9j0T0tzjj1aUtQF+
         id6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4ZfuENpd+zavvFGPp0s8OPiZJpFz2gcuTHH90YMUMyY=;
        b=GzDu4A2QCVxqJDVoCIff9NnZrvq03S6R4QCu++KTz4eQe1P7VhvEtUYpqiNWszK125
         PXE9dShW3wIJZzglumQehFrep8gKc6cXRL7P7GRlzW85PimloW4pdh9EougIEgaHLIJX
         QH5rd2eqBe3SG69g41IlpayxGs0j5eCsrpzpgbZ5vMo7gsFxpRKrBOw9H7wm7AedpNz6
         LOHNmAonTsIJNK8g1hKe4AbfbEPtdtji2UJ+Dlg81oA44o5kSXPyn/BVyEQTS8j7fuv2
         s5wQ9Uzh9ec/9qUSuVjObIMsA9kiAMZk+nycNO3Y2YtrNaibSqRvk0D3EsiO8NQLY29e
         TeQg==
X-Gm-Message-State: AGi0PuYgUtNIUh43XobbYm6Uq+1s3PY3/mUkwimvc7dYP1Ze9QtMGZGp
	Qh/nfuD6etQefrp3nc8+4mL71BWI
X-Google-Smtp-Source: APiQypKDR+3ECdAxCteWMf59oA42e31BJqGQiKUBL9BIA3Cut9zdc0VbAf8JeYlkIeoQhoz57HrUQw==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr648388wmd.131.1588021587362;
        Mon, 27 Apr 2020 14:06:27 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host84-186-dynamic.249-95-r.retail.telecomitalia.it. [95.249.186.84])
        by smtp.googlemail.com with ESMTPSA id d13sm465697wmb.39.2020.04.27.14.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 14:06:26 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH v2] packagegroup-meta-initramfs: remove klibc utilities and kexec-tools-klibc
Date: Mon, 27 Apr 2020 23:06:24 +0200
Message-Id: <20200427210624.3206-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

klibc utils have no update-alternatives because these live ideally alone
in the initramfs. mwta-initramfs image is not minimal having busybox, linux-
utils,coreutils so to resolve the conflict we remove the shared klibc utils.

The image is mostly for build-tests and contains dracut, which does not have
runtime dependencies on kexec-tools, so we can safely remove the klibc
static version of kexec and vmcore-dmesg (not availaible on some archs).
Doing this we can safely remove EXCLUDE_FROM_WORLD

Fix:
ERROR: meta-initramfs-image-1.0-r0 do_rootfs:
Postinstall scriptlets of ['busybox', 'util-linux-umount',
'util-linux-dmesg','coreutils', 'util-linux-mount', 'cpio',
'util-linux-kill', 'util-linux-losetup'] have failed.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../packagegroup-meta-initramfs.bb            | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
index bfede5a74..2955baea2 100644
--- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
+++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
@@ -6,31 +6,13 @@ PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-initramfs \
     packagegroup-meta-initramfs-devtools \
-    packagegroup-meta-initramfs-kernel \
 '
 
 RDEPENDS_packagegroup-meta-initramfs = "\
     packagegroup-meta-initramfs-devtools \
-    packagegroup-meta-initramfs-kernel \
 "
 
 RDEPENDS_packagegroup-meta-initramfs-devtools = "\
-    libklibc  dracut \
-    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
-    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
-    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
-    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
-    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
-    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
-    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
-    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
-    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
-    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
+    dracut \
     ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
     "
-
-RDEPENDS_packagegroup-meta-initramfs-kernel = "\
-    kexec-klibc vmcore-dmesg-klibc \
-    "
-
-EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1

