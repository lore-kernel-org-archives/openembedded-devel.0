Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.3020.1587686142142534857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 16:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FbHlelCx;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: andrea.adami@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id v8so8675890wma.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 16:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6jbcZaEWVuUoUV+lgew+aapeKr4YZ+j+I7efz/2FoqI=;
        b=FbHlelCxytJLZLdLH9mqan1c6e6M8wYRfw7R3DbpRWScyVlrIvkcp1ldwFf5KpWrRs
         cdlc3HSitXG6N3P/zTtwFRur3vEKKISKyP1KI89rdvpcYlsJVPhnSpGsJ5AQQG4htvTN
         oW3aN21PnrmQGVJVIVK3kOXl7irUICtOd30d35xNcMq7VzqrqwSMK09S7ed5rbeZ4x3j
         XchfJTlXrbwhCNEimSD/+8DbjbNPgN/p4h4RnCpxebyRhsXEIZiajkQWxVITWFCmqn6B
         0H0GOO7i4zIJUHf8MiPxB0nE98DeWzeMeg+IMBp4J7Jdw6MAFqOxz6+F8t604VXXzI7G
         UaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6jbcZaEWVuUoUV+lgew+aapeKr4YZ+j+I7efz/2FoqI=;
        b=Vt17DiNGs/a3gGO30Cdrmfnr/RpuRz4VTf3MEBPm5O+B1w+gzJzOp20Bzc5EwkLAq+
         jXhlhZPwk/1skpvzoROHraK74WAxFqBb0+mZMYZxMLwdLgVvnp/kTRBjz+wdUpcyYtr8
         I2q8LhJ+d4G+O2xSd19n8XsUa1SVNkt5BQBUFN1hklSj3PN9ou4wV5W0n81i3JXmlWMa
         cFcOSQq7GX+QR7YnuNRIxo49QWtWHBFjKOzQzn+UGIq73qnUPOA+ViHrWaTRdI8XHfwj
         5Y/zt4T7HHsKp5aDedJU7nJs7BWKEZ6cIyWVSRhgwL9HLeoXVQ61u7mOhPkeoyULtjVi
         T5Mw==
X-Gm-Message-State: AGi0PuYFALiyrTsp9H4snfbhdvq8ndkpNvchzpVKVaf9AmYFN5kVp+ds
	YHeZrk7u5W/d8/Az9iLw0d8AYu9H
X-Google-Smtp-Source: APiQypLTeuzIP7TiT6/XxWfj1Ja0k5VlgSG5frtoiAzdQOEiShYqGBtKhOtlek38EgGqpQ7lPPkhpA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id 19mr7093184wmg.110.1587686140054;
        Thu, 23 Apr 2020 16:55:40 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host84-186-dynamic.249-95-r.retail.telecomitalia.it. [95.249.186.84])
        by smtp.googlemail.com with ESMTPSA id t20sm595526wmi.2.2020.04.23.16.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 16:55:39 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] meta-initramfs-image: remove klibc utilities
Date: Fri, 24 Apr 2020 01:55:35 +0200
Message-Id: <20200423235535.6706-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

klibc utils have no update-alternatives because these live ideally alone
in th einitramfs. This image is not minimal having busybox, linux-utils,
coreutils so to resolve the conflict we just remove the shared klibc utils
and replace the klibc kexec and vmcore-dmesg.

Finally, remove EXCLUDE_FROM_WORLD.

Fix:
ERROR: meta-initramfs-image-1.0-r0 do_rootfs:
Postinstall scriptlets of ['busybox', 'util-linux-umount', 'util-linux-dmesg',
 'coreutils', 'util-linux-mount', 'cpio', 'util-linux-kill',
 'util-linux-losetup'] have failed.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../packagegroups/packagegroup-meta-initramfs.bb | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
index bfede5a74..dc4928b5a 100644
--- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
+++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
@@ -15,22 +15,10 @@ RDEPENDS_packagegroup-meta-initramfs = "\
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
 
 RDEPENDS_packagegroup-meta-initramfs-kernel = "\
-    kexec-klibc vmcore-dmesg-klibc \
+    kexec vmcore-dmesg \
     "
-
-EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1

