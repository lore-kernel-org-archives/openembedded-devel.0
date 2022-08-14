Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DFCC25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 20:02:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.8884.1660507340725888234
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 13:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VE8wMUUv;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d20so5209145pfq.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 13:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=dWjfwaRPL+ROzwozLWEXEaQhnLpjamVO3k9/UfyHQ7k=;
        b=VE8wMUUvjQtLXBwOyiA1V2+S7asRkDsFci5l/Ch4M32EpyWXVFTD640uGfSLx7lAgZ
         W4elvBXl3UwSHCizNtQ/P5zfVNl8uvtK+acHYn726YRIQY6SfM5U0kkBUiRDxPDUpnxN
         5+0YIX+FIzL4ar4Bu31wB0Srwc0SLmqqOGI1y/hcu0YFD7X5x7gcTwgo29jYCk/cMmv1
         3s3jC6N1ygfjtRpzdBoWNqgtDEs4h/od3kI2wUQ8fDciOB9GwqOeswi8SrDVUJuBa6TA
         D7xP2fhH2GCL7OsT+lwQtodJcmNgL4Rwa+dPUOq3pY3PKNbuZRQCoe/tu73iv8rfeGKl
         XM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=dWjfwaRPL+ROzwozLWEXEaQhnLpjamVO3k9/UfyHQ7k=;
        b=2cDdfP/Viw3KcZSU2pX0rNjQbPdWPfocdQeb+SejoF6sn/p3v8v4+jeoUZCU/S2Qii
         rLmA2zlSZvTSSi0M5B55unO3TH0IPd6HdN0B0YVnvsnRFdI9dVXvfxAfNlZ/vxScQf8x
         aQ5JHvAV4kJicogYzTS+XzhF4y6rGdC1O2PcvjCaurPkE63PLumi0U463b/36PV4eDAu
         ETmovjIg5hMZhSHVSuN/jvxDwWdzmFzRmO3iATcGtb11zr0PCXTG5lhCEWU/4MUrc0nl
         2yxXafsBg+UheZFgVly0AfvgjZEcmPhJEgJ3k9U2x8PbY5iKg7RfCcSwkk4WXlfk2jJG
         V2Bg==
X-Gm-Message-State: ACgBeo0VHEmjNQ5muz6z8Dps16XM8quRu5aNvGT+fNeDH5CJ7lG6NHma
	l36DnnrMyqCCcUVA8Pq3wkEETK7CV4MTVQ==
X-Google-Smtp-Source: 
 AA6agR75PjlRT2z6c7GlU32nnO9QU9PsWCy24VlzleLdGWxRjOssYSIUUPKb3PYrL7oOH8V069v+0A==
X-Received: by 2002:a63:ed4f:0:b0:41a:f0ee:3da8 with SMTP id
 m15-20020a63ed4f000000b0041af0ee3da8mr11534565pgk.55.1660507339410;
        Sun, 14 Aug 2022 13:02:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 125-20020a620683000000b0052d3ea78858sm5422982pfg.127.2022.08.14.13.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 13:02:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] toybox: Fix build with glibc 2.36+
Date: Sun, 14 Aug 2022 13:02:16 -0700
Message-Id: <20220814200216.3155392-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Aug 2022 20:02:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98230

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update to upstream submitted patch

 ...oid-glibc-and-linux-mount.h-conflict.patch | 161 ++++++++++++++++++
 .../{toybox_0.8.7.bb => toybox_0.8.8.bb}      |   3 +-
 2 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.8.7.bb => toybox_0.8.8.bb} (95%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch b/meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch
new file mode 100644
index 0000000000..689ee2a5c4
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch
@@ -0,0 +1,161 @@
+From 89000d9cb226cd864fa247f2428c9eaf7f414882 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Aug 2022 10:02:15 -0700
+Subject: [PATCH] portability: Avoid glibc and linux mount.h conflict
+
+With glibc 2.36+ linux/mount.h> and <sys/mount.h> headers are
+no longer directly compatible
+
+Upstream-Status: Submitted [https://github.com/landley/toybox/pull/364]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/portability.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+--- a/lib/portability.h
++++ b/lib/portability.h
+@@ -180,11 +180,29 @@ void *memmem(const void *haystack, size_
+ #endif
+ 
+ // Linux headers not listed by POSIX or LSB
+-#include <sys/mount.h>
+ #ifdef __linux__
+ #include <sys/statfs.h>
+ #include <sys/swap.h>
+ #include <sys/sysinfo.h>
++
++#ifndef BLKDISCARD
++#define BLKDISCARD _IO(0x12,119)
++#endif
++#ifndef BLKSECDISCARD
++#define BLKSECDISCARD _IO(0x12,125)
++#endif
++#ifndef BLKZEROOUT
++#define BLKZEROOUT _IO(0x12,127)
++#endif
++#ifndef FIFREEZE
++#define FIFREEZE        _IOWR('X', 119, int)    /* Freeze */
++#endif
++#ifndef FITHAW
++#define FITHAW          _IOWR('X', 120, int)    /* Thaw */
++#endif
++
++#else
++#include <sys/mount.h>
+ #endif
+ 
+ #ifdef __APPLE__
+--- a/toys/other/switch_root.c
++++ b/toys/other/switch_root.c
+@@ -19,6 +19,7 @@ config SWITCH_ROOT
+ 
+ #define FOR_switch_root
+ #include "toys.h"
++#include <sys/mount.h>
+ #include <sys/vfs.h>
+ 
+ GLOBALS(
+--- a/toys/other/blkdiscard.c
++++ b/toys/other/blkdiscard.c
+@@ -31,8 +31,7 @@ config BLKDISCARD
+ 
+ #define FOR_blkdiscard
+ #include "toys.h"
+-
+-#include <linux/fs.h>
++#include <sys/mount.h>
+ 
+ GLOBALS(
+   long o, l;
+--- a/toys/other/blockdev.c
++++ b/toys/other/blockdev.c
+@@ -31,7 +31,7 @@ config BLOCKDEV
+ 
+ #define FOR_blockdev
+ #include "toys.h"
+-#include <linux/fs.h>
++#include <sys/mount.h>
+ 
+ GLOBALS(
+   long setbsz, setra;
+--- a/toys/other/fsfreeze.c
++++ b/toys/other/fsfreeze.c
+@@ -18,7 +18,6 @@ config FSFREEZE
+ 
+ #define FOR_fsfreeze
+ #include "toys.h"
+-#include <linux/fs.h>
+ 
+ void fsfreeze_main(void)
+ {
+--- a/lib/portability.c
++++ b/lib/portability.c
+@@ -5,7 +5,7 @@
+  */
+ 
+ #include "toys.h"
+-
++#include <sys/mount.h>
+ // We can't fork() on nommu systems, and vfork() requires an exec() or exit()
+ // before resuming the parent (because they share a heap until then). And no,
+ // we can't implement our own clone() call that does the equivalent of fork()
+--- a/toys/lsb/mount.c
++++ b/toys/lsb/mount.c
+@@ -58,6 +58,7 @@ config MOUNT
+ 
+ #define FOR_mount
+ #include "toys.h"
++#include <sys/mount.h>
+ 
+ GLOBALS(
+   struct arg_list *o;
+--- a/toys/lsb/umount.c
++++ b/toys/lsb/umount.c
+@@ -30,6 +30,7 @@ config UMOUNT
+ 
+ #define FOR_umount
+ #include "toys.h"
++#include <sys/mount.h>
+ 
+ GLOBALS(
+   struct arg_list *t;
+--- a/toys/other/eject.c
++++ b/toys/other/eject.c
+@@ -22,6 +22,7 @@ config EJECT
+ 
+ #define FOR_eject
+ #include "toys.h"
++#include <sys/mount.h>
+ #include <scsi/sg.h>
+ #include <scsi/scsi.h>
+ #include <linux/cdrom.h>
+--- a/toys/other/freeramdisk.c
++++ b/toys/other/freeramdisk.c
+@@ -16,6 +16,7 @@ config FREERAMDISK
+ */
+ 
+ #include "toys.h"
++#include <sys/mount.h>
+ 
+ void freeramdisk_main(void)
+ {
+--- a/toys/other/nbd_client.c
++++ b/toys/other/nbd_client.c
+@@ -36,6 +36,7 @@ config NBD_CLIENT
+ #define FOR_nbd_client
+ #include "toys.h"
+ #include <linux/nbd.h>
++#include <linux/fs.h>
+ 
+ void nbd_client_main(void)
+ {
+--- a/toys/other/partprobe.c
++++ b/toys/other/partprobe.c
+@@ -18,6 +18,7 @@ config PARTPROBE
+ */
+ 
+ #include "toys.h"
++#include <sys/mount.h>
+ 
+ static void do_partprobe(int fd, char *name)
+ {
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
similarity index 95%
rename from meta-oe/recipes-core/toybox/toybox_0.8.7.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.8.bb
index 3441568005..e27f9ed95f 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+           file://0001-portability-Avoid-glibc-and-linux-mount.h-conflict.patch \
            "
-SRC_URI[sha256sum] = "b508bf336f82cb0739b77111f945931d1a143b5a53905cb753cd2607cfdd1494"
+SRC_URI[sha256sum] = "dafd41978d40f02a61cf1be99a2b4a25812bbfb9c3157e679ee7611202d6ac58"
 
 SECTION = "base"
 
-- 
2.37.2


