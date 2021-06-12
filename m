Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.11383.1623538447269376899
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jun 2021 15:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NsJOUZ4N;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id ba2so39706729edb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jun 2021 15:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=C/MkPtA/h9XRQ4ZIfQE5nkz3ruUhRVzJ0p4EZ05+Pdc=;
        b=NsJOUZ4N3lGDUxnLo3YXCQ9XwWbtzG591vylQdi7CzF5BSdZ/pSqPFp4UuQqt9GcVd
         jHL1xE7S36aCl+xSZ315h4JySkO6w1vm5zPmbPgfSHHGdLBtAKUOgoNcCO5K/VgCr1zZ
         whODjyjKzCyIizLTpxnzar4kdIp2wDwvdhC5iuWR+HWX6BgItCAVPZeYwSdu1L6YISoW
         U7R+HtK8dl6Q+WsM1pQfB/I+LjbJrGcOTDQUB3ZvlzoEJEvkEZ7hrNSeGOFROgTDMwdW
         vV5nchT2KE/X5+nEOxpnkHnNkLTam0Az0zmXrSzJgOAkJkhlJAv8BUtUGX0Y61EMY5ma
         Z7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=C/MkPtA/h9XRQ4ZIfQE5nkz3ruUhRVzJ0p4EZ05+Pdc=;
        b=ZxFrW8CzJP7O7sdS0ls7Eci2WIjmuNRVjVSFgri0Y5XU3h3InxlPzN2ivSL8qKZVUZ
         z40i9KXF9dutLS+voIVjklvK5T9WrTeW4VaOdlm7JXrZL9FzQjAmpNDN423YM8vI6/jP
         mxaOrXsr/p74JZfXxPIq4YOokTGgomea3GoGxKenU4+MOT9pdStZJ561FghVHc+lVbUc
         Ftq+x5JNakJJRFzoze1Hq6RO9YtKP5R1RYRcdHV+ntIvrKp4OONzSrsqKqP/+mAKiSYp
         +9phJ7J8csueaPZyCbz1gGp9jXxDNE46uCs/8S4p4r13aehUHdzCd2aVNHqVYfEffGak
         /Csg==
X-Gm-Message-State: AOAM531AxQ0eYcLJBoR9ekL+Wmompmx81Dm5rRB9w3iQSce5wCtQyOmM
	Kkb6tuY9w0AF85P+hx0VwbopuCGid2UIuZ7y
X-Google-Smtp-Source: ABdhPJxCn6o65qJZjANg6fzJzpkKyDqfXX6mOhbbZITR5ZDo4lhAuVpSdLHZN8dohDpHWUOBLCzgKw==
X-Received: by 2002:aa7:d305:: with SMTP id p5mr10115484edq.167.1623538445671;
        Sat, 12 Jun 2021 15:54:05 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.gmail.com with ESMTPSA id h22sm4526132edv.0.2021.06.12.15.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 15:54:05 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] initramfs-kexecboot-image: support cases where machines override IMAGE_FSTYPES
Date: Sun, 13 Jun 2021 00:53:58 +0200
Message-Id: <20210612225359.25688-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

test case: zaurus.inc

IMAGE_FSTYPES ?= "tar.gz jffs2 jffs2.sum ubi ubifs"
IMAGE_FSTYPES_collie ?= "tar.gz jffs2 jffs2.sum"
INITRAMFS_FSTYPES ?= "cpio.gz cpio.xz"

The last assignment IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}" did in fact
reset the value to IMAGE_FSTYPES_collie, thus not producing cpio.gz / cpio.xz.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-core/images/initramfs-kexecboot-image.bb      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
index 9a686f366f..dd082ba529 100644
--- a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
@@ -1,9 +1,13 @@
 SUMMARY = "Initramfs image for kexecboot kernel"
 DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
 
-inherit image
+# Some BSPs use IMAGE_FSTYPES_<machine override> which would override
+# an assignment to IMAGE_FSTYPES so we need anon python
+python () {
+    d.setVar("IMAGE_FSTYPES", d.getVar("INITRAMFS_FSTYPES"))
+}
 
-IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+inherit image
 
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
-- 
2.17.1

