Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 53A2872F60
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:35:06 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id k14so49585567pgr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nHzMmUaKnNjwiRNU9LD3vu7LBIB5jGj96wz+OBTCuoo=;
	b=iNfvwMEN7lykK9Ti3z6fMxzd+5I2y3aEIOpEb5/lxa+Q50kVK7SZ2pjmbL2qALjWP7
	LVLW8jHFbt8btJF0b6cX+BKnZj9f+MDPeQjMUdOcVIOh5GFAs4huXFWZo/VayVJlq2+6
	zJHU7D/yKJETcPNwd0DqQDo91ooG6vQtShiI/WF1ukXvcVTwFdPyhoHb1GTGTguY1vm3
	lloWB/Fo2LDbWAS0ZT2qUQnAUZeXssBvZR1voZnNR5x1ZjLiSkulF+ad4jV77cP5IjfJ
	QYEwMDEAYbreGlXejVsA2szsclwXxGsQ5ZDuPXyDpVZxzGkrDm8vnjgH5i6EgtRzr9vI
	GXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nHzMmUaKnNjwiRNU9LD3vu7LBIB5jGj96wz+OBTCuoo=;
	b=AJMKM2wBuI36mnzaVmMo99X4wym4mZSXOlQUMXar+D/EohkzKfF0QR0PUoTfEQLW1P
	rXypzTK566GH5d0PZ1QlzKsDyD/2fHMhOBSn5w6pSPhyUE/0MJDUElgeJX80DSqLo9oc
	SRVpT1E+xksDxpXMkqk4FD4dSsiQeseazwugPf/UdDqRLE+9qkLuVzLicSGg2MAvbYeF
	b9PC6Fkcedier4+jhJhgisOtIJ/hy4rMFaMMhqvefx7UiNnsgR4JpY65Y/lt6AFtwGxl
	lHnmKbUtCZXyKtGCt7aMBOuwTGBqsPt7vyTokwumSiRSeGxYGGULD49dk7goSiKk2qao
	dciw==
X-Gm-Message-State: AIVw111MmC7zfV4X4qojyV57lyT5+//9B1Zr4UJsw25JzDC8Lkyu3tlt
	7j3PAOrxIp8R0V0V
X-Received: by 10.98.223.141 with SMTP id d13mr6653169pfl.179.1500057307908;
	Fri, 14 Jul 2017 11:35:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	70sm18639581pft.104.2017.07.14.11.35.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:35:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 11:34:51 -0700
Message-Id: <20170714183456.22548-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-filesystems][PATCH 1/6] unionfs-fuse: Fix build with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 18:35:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-unionfs-Define-IOCPARM_LEN-if-undefined.patch | 62 ++++++++++++++++++++++
 .../unionfs-fuse/unionfs-fuse_2.0.bb               |  3 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch
new file mode 100644
index 000000000..8f991cd3f
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch
@@ -0,0 +1,62 @@
+From 10411fa8658621822ae394160daffaced4a4cd7f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 23:07:29 -0700
+Subject: [PATCH] unionfs: Define IOCPARM_LEN if undefined
+
+musl does not have sysctl.h which defines this
+for glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unionfs.c |  8 --------
+ src/unionfs.h | 15 +++++++++++++++
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/unionfs.c b/src/unionfs.c
+index a34d34e..51684a7 100644
+--- a/src/unionfs.c
++++ b/src/unionfs.c
+@@ -21,14 +21,6 @@
+ #include "opts.h"
+ #include "usyslog.h"
+ 
+-#ifndef _IOC_SIZE
+-#ifdef IOCPARM_LEN
+-#define _IOC_SIZE(x) IOCPARM_LEN(x)
+-#else
+-#error "No mechanism for determining ioctl length found."
+-#endif
+-#endif
+-
+ static struct fuse_opt unionfs_opts[] = {
+ 	FUSE_OPT_KEY("chroot=%s,", KEY_CHROOT),
+ 	FUSE_OPT_KEY("cow", KEY_COW),
+diff --git a/src/unionfs.h b/src/unionfs.h
+index 8f5e0bf..b02de5a 100644
+--- a/src/unionfs.h
++++ b/src/unionfs.h
+@@ -17,6 +17,21 @@
+ #define FUSE_META_FILE ".fuse_hidden"
+ #define FUSE_META_LENGTH 12
+ 
++#ifndef IOCPARM_MASK
++#define IOCPARM_MASK      0x1FFF
++#endif
++#ifndef IOCPARM_LEN
++#define IOCPARM_LEN(a)    (((a) >> 16) & IOCPARM_MASK)
++#endif
++
++#ifndef _IOC_SIZE
++#ifdef IOCPARM_LEN
++#define _IOC_SIZE(x) IOCPARM_LEN(x)
++#else
++#error "No mechanism for determining ioctl length found."
++#endif
++#endif
++
+ // file access protection mask
+ #define S_PROT_MASK (S_ISUID| S_ISGID | S_ISVTX | S_IRWXU | S_IRWXG | S_IRWXO)
+ 
+-- 
+2.13.2
+
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
index b89d8db15..6bedf16b0 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8a
 
 SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master \
            file://0001-support-cross-compiling.patch \
-"
+           file://0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch \
+           "
 SRCREV = "c8d23a9a75f1a62988593671839e8a168a79f3e5"
 
 DEPENDS = "fuse"
-- 
2.13.3


