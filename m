Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0404C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 20:39:06 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.9081.1660509544724649047
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 13:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=II9I59iY;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso12820297pjf.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 13:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=S5XzArm0giCwyXlBPTt4nfwIRY6JLxMy46eav1BosZA=;
        b=II9I59iYHwDPhImX5C52Dn/qDl5nj+FHtwXfQkkRFcxXia1w3s8Xmoi/3/90rHqUVi
         6HwFMvlI3med3OjtB5YsS7b2ABQb0pTD+BeF/wAtCmNqP1eqoLh/Bw7yeH7j7Lelbngk
         F/lpnC1Zxyb+rILB79FLvdlQkA2Qf12XffISw/0Hus8M5+aX95d96y5CBtIIdt7WmKXj
         XqtPQ+t1TqNnsZ2DC7UNWQH+zAajPdJtDbkk9LqRS2XSW7tCnD/VsU46I3Hv8oGu5Kfs
         l8GO0pZv7ojo3fbqYBYmdD6uUdmTuM2iMMgL0ZX6WXMVUvl9F/nY6w2nRmnPPExb2kgr
         AM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=S5XzArm0giCwyXlBPTt4nfwIRY6JLxMy46eav1BosZA=;
        b=kurTfht37sZovs0aUJyJsXXpddvSwk79qZdo6bZnU1nkarW2oi/ppoHp21afTvBTUk
         ZNj5fWNNFojXW5xdnghyx/o0jfMmkZEr9U+L09yZW5mAL5MOZsb7uFKoKtIPg07Hd81K
         PW2VoZqHY4COEoMmG8IJ2cMbRjHYHKJ/in7R/cjs/+VbKxWuoLuxy0M89P1xnBqcGuJb
         hn3wJgTO0Vl6zyD97fyRq8l9KEWDbhVHEw3+r/bMDvfEzI9jGvZHIaJYaOtcZdPLBJUb
         g1VPXuADT7//KL7ZsxyDfvXy/RDf+64xzlHzZLClfVa7B21S/j0QevGiVjJrwyYGtcWH
         /ceg==
X-Gm-Message-State: ACgBeo0KjSICgDjcbci3KQ4m6WL4DixZZGFTC8ZUY3E1ysX1hjIYRuCl
	JjpSqNSLV/FJ/LrE03LKRivp6x1gGh7aDw==
X-Google-Smtp-Source: 
 AA6agR7fumrb5taBIL113aQ35+ILKHqUhTHWsGLtV7W1yxQ2dzuJZmKFCErdyDSb+9c/AZ+0lsQSmw==
X-Received: by 2002:a17:90b:3b4d:b0:1f4:d1b6:cb69 with SMTP id
 ot13-20020a17090b3b4d00b001f4d1b6cb69mr14938821pjb.229.1660509543524;
        Sun, 14 Aug 2022 13:39:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020a170902eb8500b0016dbe5f5308sm5697302plg.79.2022.08.14.13.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 13:39:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: Upgrade to 2022.07.31 release
Date: Sun, 14 Aug 2022 13:39:01 -0700
Message-Id: <20220814203901.3473231-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Aug 2022 20:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98231

Rename recipe to reflect version number
Add patches to build with glibc 2.36
Disable one test namely detached_mounts_propagation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-a-return-type-to-aio_rw.patch    | 28 +++++++++++
 ...unts_propagation-and-remove-sys-moun.patch | 47 +++++++++++++++++++
 ...xfstests_git.bb => xfstests_2022.07.31.bb} |  5 +-
 3 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_git.bb => xfstests_2022.07.31.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch
new file mode 100644
index 0000000000..e0a04c9073
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-Add-a-return-type-to-aio_rw.patch
@@ -0,0 +1,28 @@
+From f172ea004d34b00aa7bd5baff9422b2ab80df6e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Aug 2022 13:32:10 -0700
+Subject: [PATCH 1/2] Add a return type to aio_rw
+
+Compilers complain about the function prototype otherwise
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltp/fsx.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ltp/fsx.c b/ltp/fsx.c
+index 12c2cc33..55b4e9b6 100644
+--- a/ltp/fsx.c
++++ b/ltp/fsx.c
+@@ -2429,6 +2429,7 @@ out_error:
+ 	return -1;
+ }
+ #else
++int
+ aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
+ {
+ 	fprintf(stderr, "io_rw: need AIO support!\n");
+-- 
+2.37.2
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
new file mode 100644
index 0000000000..a594b73a12
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
@@ -0,0 +1,47 @@
+From dd43cbc7f50266cdc6210f2b920d7f648a83bdd6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Aug 2022 13:33:05 -0700
+Subject: [PATCH 2/2] Drop detached_mounts_propagation and remove sys/mount.h
+ from vfs/utils.c
+
+with glibc 2.36+ sys/mount.h conflicts with linux/mount.h and here
+linux/mount.h is included via xfs/xfs.h header and we need sys/mount.h
+for the mount() API prototype. Until thats resolved lets not build this
+testcase
+
+Upstream-Status: Inappropriate [Libc specific Workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile    | 2 +-
+ src/vfs/utils.c | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 665edcf9..7debcbbd 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -31,7 +31,7 @@ LINUX_TARGETS = xfsctl bstat t_mtab getdevicesize preallo_rw_pattern_reader \
+ 	dio-invalidate-cache stat_test t_encrypted_d_revalidate \
+ 	attr_replace_test swapon mkswap t_attr_corruption t_open_tmpfiles \
+ 	fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail \
+-	detached_mounts_propagation ext4_resize t_readdir_3 splice2pipe \
++	ext4_resize t_readdir_3 splice2pipe \
+ 	uuid_ioctl
+ 
+ EXTRA_EXECS = dmerror fill2attr fill2fs fill2fs_check scaleread.sh \
+diff --git a/src/vfs/utils.c b/src/vfs/utils.c
+index 1388edda..aacd6c0a 100644
+--- a/src/vfs/utils.c
++++ b/src/vfs/utils.c
+@@ -10,7 +10,6 @@
+ #include <stdlib.h>
+ #include <sys/eventfd.h>
+ #include <sys/fsuid.h>
+-#include <sys/mount.h>
+ #include <sys/prctl.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+-- 
+2.37.2
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.07.31.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.07.31.bb
index a6fc89d606..647b6fcd73 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.07.31.bb
@@ -7,9 +7,11 @@ SRCREV_FORMAT = "xfstests_unionmount"
 SRC_URI = "\
     git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
     git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
+    file://0001-Add-a-return-type-to-aio_rw.patch \
+    file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
 "
 
-SRCREV_xfstests = "47ed066309716c73a97fff9b7f557f72d90bffb4"
+SRCREV_xfstests = "b91889d79e1d92e22860504e40108a2e4d054c33"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
@@ -24,6 +26,7 @@ RDEPENDS:${PN} += "\
     e2fsprogs \
     e2fsprogs-tune2fs \
     e2fsprogs-resize2fs \
+    libaio \
     libcap-bin \
     overlayfs-progs \
     perl \
-- 
2.37.2


