Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3EAC25B0D
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 05:53:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.11224.1659851580458123545
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pBL7mXOl;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id gj1so6207339pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3Iy7Eh9YN7jIHqhgxhg8GSjK2EMO08iQrW5gImbco/U=;
        b=pBL7mXOldCnHh7Ni0xLQvCSmwDcxTM3XrPXw2f7jQcJ+cY+fsu4cY/vzdSxsBJkvl/
         BrYi6OMGZWe2Yk/HC+WG+ApyGAawEiIY10QaFOYWBlKfI6WPZ4mYp43tmF04Vc53khE+
         0EdSIqYddsctVit6Krbb0TJRQAX4x0jjnZ3p4pme78+BXEE6MN8q4cEvCohjj5kssqLd
         hluV9EKVMiY4tK2ntkp2Pd3PxFp/da+/6SBJ3G+iWg6r+UdK2dUa08IPM8uubhQ+qKnC
         jBexKsN35QQkyXv1oj/4x3+dDqofvDnCun0wTQb8tLN2apTigsxzhY3AQVNF0nbwUXIV
         etiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3Iy7Eh9YN7jIHqhgxhg8GSjK2EMO08iQrW5gImbco/U=;
        b=Ctc0hJApHZ8SaUE/4N71k049NaaGh2jzCd5ZxXcnQtfgTBPi+LmHkd8Pu1qqPu+R15
         f6VJzL9JzkXd19Bz/GqLB3i4omsCUdJ9//3Umm91/DYCIZVnn/ljG14Sb4TH+enSHNP4
         teWimAXEgeopGXyMimXIHoW6U8/tiOkJv2bHM8riLjBTGcy3sUez0M6YxkJeD7u81AVG
         76YzMbCG63ik+SgqqZ/nVSGnlzv5ezvBSgP2HUKx5BtF5WLdoQCCH7KxEX0K02kvuuqp
         7alpDwXXbMjFXDXgqYOPmgipjb2Qlous0hSQ6/TXEYYFEFg5T3tN3OrORtxkWDNJ4q5g
         S2Vg==
X-Gm-Message-State: ACgBeo2Utmx/Fp1V9Xyrky5LJElcpLGzm8Kyh7v/BEo4K9Z8/YhckNvY
	i46O3TxtlFkX8vpEKOipXTAhvqY3df0=
X-Google-Smtp-Source: 
 AA6agR4tcvxS6u+txVigh38gEyqTdSxKGDaYS3VDhXYKRXsF3BlALMlXfQVAlk4v8wudom43padEuQ==
X-Received: by 2002:a17:90a:f418:b0:1f3:223d:4349 with SMTP id
 ch24-20020a17090af41800b001f3223d4349mr24131111pjb.2.1659851579379;
        Sat, 06 Aug 2022 22:52:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0041a716cec9esm3872380pgm.62.2022.08.06.22.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 22:52:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] ostree: Upgrade to 2022.5 release
Date: Sat,  6 Aug 2022 22:52:52 -0700
Message-Id: <20220807055255.2982774-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807055255.2982774-1-raj.khem@gmail.com>
References: <20220807055255.2982774-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Aug 2022 05:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98143

Backport a fix for building with glibc 2.36+ while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Remove-unused-linux-fs.h-includes.patch | 42 +++++++++++++++++++
 ...bostree-Remove-including-sys-mount.h.patch | 29 +++++++++++++
 ...-se-luks-gencpio-There-is-no-bashism.patch | 25 +++++++++++
 .../{ostree_2022.2.bb => ostree_2022.5.bb}    |  5 ++-
 4 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2022.2.bb => ostree_2022.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch
new file mode 100644
index 0000000000..2659e4696d
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-Remove-unused-linux-fs.h-includes.patch
@@ -0,0 +1,42 @@
+From 7d32c352f628747cfadabf9fe7fcc13608e5dfe6 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Wed, 3 Aug 2022 10:37:40 -0400
+Subject: [PATCH] Remove unused `linux/fs.h` includes
+
+Prep for fixing conflicts introduced by newer glibc.
+cc https://github.com/ostreedev/ostree/issues/2685
+
+Upstream-Status: Backport [https://github.com/ostreedev/ostree/commit/edba4b33be10c05253bfa94895dfbc8477e44d76]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libostree/ostree-repo-commit.c | 1 -
+ src/ostree/ot-main.c               | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/src/libostree/ostree-repo-commit.c b/src/libostree/ostree-repo-commit.c
+index afab3fdf..35b16c71 100644
+--- a/src/libostree/ostree-repo-commit.c
++++ b/src/libostree/ostree-repo-commit.c
+@@ -30,7 +30,6 @@
+ #include <sys/xattr.h>
+ #include <glib/gprintf.h>
+ #include <sys/ioctl.h>
+-#include <linux/fs.h>
+ #include <ext2fs/ext2_fs.h>
+ 
+ #include "otutil.h"
+diff --git a/src/ostree/ot-main.c b/src/ostree/ot-main.c
+index b7b50d67..7a4405a5 100644
+--- a/src/ostree/ot-main.c
++++ b/src/ostree/ot-main.c
+@@ -28,7 +28,6 @@
+ #include <string.h>
+ #include <sys/statvfs.h>
+ #include <sys/mount.h>
+-#include <linux/fs.h>
+ 
+ #include "ot-main.h"
+ #include "ostree.h"
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch b/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch
new file mode 100644
index 0000000000..5c2792cf89
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-libostree-Remove-including-sys-mount.h.patch
@@ -0,0 +1,29 @@
+From 7ff956e4088e0bdc6bfd429f99124a8a9256c181 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 21:44:11 -0700
+Subject: [PATCH] libostree: Remove including sys/mount.h
+
+This conflicts with linux/mount.h which is included by linux/fs.h
+with glibc 2.36+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libostree/ostree-sysroot-deploy.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
+index 2dc9f58b..61b19e42 100644
+--- a/src/libostree/ostree-sysroot-deploy.c
++++ b/src/libostree/ostree-sysroot-deploy.c
+@@ -23,7 +23,6 @@
+ #include <gio/gunixoutputstream.h>
+ #include <glib-unix.h>
+ #include <stdint.h>
+-#include <sys/mount.h>
+ #include <sys/statvfs.h>
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch b/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch
new file mode 100644
index 0000000000..5cf5784f14
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-s390x-se-luks-gencpio-There-is-no-bashism.patch
@@ -0,0 +1,25 @@
+From dd55633e49aa43dede3c8e1770ae8761487f050e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 21:52:31 -0700
+Subject: [PATCH] s390x-se-luks-gencpio: There is no bashism
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libostree/s390x-se-luks-gencpio | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libostree/s390x-se-luks-gencpio b/src/libostree/s390x-se-luks-gencpio
+index e821e2fe..96c1d123 100755
+--- a/src/libostree/s390x-se-luks-gencpio
++++ b/src/libostree/s390x-se-luks-gencpio
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # This script creates new initramdisk with LUKS config within
+ set -euo pipefail
+ 
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.2.bb b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/ostree/ostree_2022.2.bb
rename to meta-oe/recipes-extended/ostree/ostree_2022.5.bb
index 50d0548cc7..b3d9ec56b7 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -19,9 +19,12 @@ DEPENDS = " \
 
 SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
+    file://0001-Remove-unused-linux-fs.h-includes.patch \
+    file://0001-libostree-Remove-including-sys-mount.h.patch \
+    file://0001-s390x-se-luks-gencpio-There-is-no-bashism.patch \
     file://run-ptest \
 "
-SRCREV = "fbc6d21c2f71099fbab44cbdd74222b91f61c667"
+SRCREV = "15740d042c9c5258a1c082b5e228cf6f115edbb0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.37.1


