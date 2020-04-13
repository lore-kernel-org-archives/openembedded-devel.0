Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.14257.1586782242229980914
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 05:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=hA6Rfm5/;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 079526008F;
	Mon, 13 Apr 2020 14:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586782238;
	bh=HFG7s3bmr/XwQ4f9S5jsA2NgviyP+S9S1ewsHGSVgdc=;
	h=From:To:Cc:Subject:Date:From;
	b=hA6Rfm5//qTaxF0xZ+aGxaGhdHqdKTC0tmTUnsMhCnyOfxVI8m6VNg8DAeEtsgcW7
	 jrdVBCufnArHuJjx+0THi96J771I+ePP3VHelyDXhqi1KICqgSoMhiMr+SBwVThTCs
	 sMjsutpzCJ+WRnkLxBmzCje8IL9xGcmW9z7jc6mgGztkv2kYGalOZcg0nnWgA6J6NZ
	 ZgBBkxd8D3B0jKdXpyC6xzbuRVLhwr73D2OxbZhhNmzVJMkjzKcCNtecZ9EmkvKq2n
	 saGSiPRXhb/pnfwgIca5u+IVFyOecE4hy964i5VGxaN3LPIkc/gSKs8HuZ0MNZpoXB
	 endFtnXYV6Jlw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-filesystems][PATCH] unionfs-fuse: upgrade 2.0 -> 2.1
Date: Mon, 13 Apr 2020 14:50:35 +0200
Message-Id: <1586782235-12050-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

8d73296 test message update
31f752f tests reorganization
c9604f7 more updates in credits and news
bbef3ab add brian to credits and update news.
6d9f4c3 whitespace fixes
3a26b75 Merge branch 'master' of https://github.com/rpodgorny/unionfs-fuse
3b46d86 whitespace formatting
9a1765a Merge pull request #93 from briankendall/mac-fixes
f1bd82a Merge pull request #94 from lightmare/man-page-typos
34f4840 man page wording
8e145ad man page formatting
2249ae9 fix some man page typos and missing commas
f3fccaf Fix tests in macOS
29d8b6c Fix error code -50 when copying files using Finder in macOS
5f1431a Merge pull request #90 from h3xx/fix-mandir-path
04ed9a2 Use standard variable for man page install path
2ac5726 updated readme to explain where the cache is
24b46b6 add atha to credits
eaf8397 Fix compilation on macOS
b663b12 annotate ioctl call correctly as DBG()
c8d23a9 whitespace formatting
de61d85 Merge branch 'therealfun-master'
df79b8e minor test improvements
d8d20c2 Implement access() for "cow,relaxed_permissions" use case
b97ff88 typo fix
75a367c formatting
7e9e708 restore errno in dbg macro
039ba92 more useful tests output
b5a7392 add julien to credits
fa2ec03 Merge branch 'bplaa-yai-master'
1d91cfe Merge branch 'master' of https://github.com/bplaa-yai/unionfs-fuse into bplaa-yai-master
b48fa6a fix travis script
6947e79 more tests
341dfc8 formatting
b2d8426 whitespace formatting
c393877 prepare mknod test
99a529c typo fix
5df6aec add test case for mkdir and sync (not working)
f15bc13 add tests to makefile
8ef0b14 more tests
e0e8233 add coverage files to gitignore and clean it up a bit
0460915 whitespace formatting
f0acead whitespace formatting
80be111 make unionfs_oper accessible outside of its compilation unit
a016d2d make add_branch and parse_branches accessible outside of their compilation unit
1df24c6 add rules for static and shared libraries, update objects list
d4e62eb separate main logic from fuse ops handlers

Also remove patch already in version.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...1-unionfs-Define-IOCPARM_LEN-if-undefined.patch | 62 ----------------------
 .../{unionfs-fuse_2.0.bb => unionfs-fuse_2.1.bb}   |  3 +-
 2 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch
 rename meta-filesystems/recipes-filesystems/unionfs-fuse/{unionfs-fuse_2.0.bb => unionfs-fuse_2.1.bb} (81%)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch
deleted file mode 100644
index 8f991cd..0000000
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 10411fa8658621822ae394160daffaced4a4cd7f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 23:07:29 -0700
-Subject: [PATCH] unionfs: Define IOCPARM_LEN if undefined
-
-musl does not have sysctl.h which defines this
-for glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unionfs.c |  8 --------
- src/unionfs.h | 15 +++++++++++++++
- 2 files changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/src/unionfs.c b/src/unionfs.c
-index a34d34e..51684a7 100644
---- a/src/unionfs.c
-+++ b/src/unionfs.c
-@@ -21,14 +21,6 @@
- #include "opts.h"
- #include "usyslog.h"
- 
--#ifndef _IOC_SIZE
--#ifdef IOCPARM_LEN
--#define _IOC_SIZE(x) IOCPARM_LEN(x)
--#else
--#error "No mechanism for determining ioctl length found."
--#endif
--#endif
--
- static struct fuse_opt unionfs_opts[] = {
- 	FUSE_OPT_KEY("chroot=%s,", KEY_CHROOT),
- 	FUSE_OPT_KEY("cow", KEY_COW),
-diff --git a/src/unionfs.h b/src/unionfs.h
-index 8f5e0bf..b02de5a 100644
---- a/src/unionfs.h
-+++ b/src/unionfs.h
-@@ -17,6 +17,21 @@
- #define FUSE_META_FILE ".fuse_hidden"
- #define FUSE_META_LENGTH 12
- 
-+#ifndef IOCPARM_MASK
-+#define IOCPARM_MASK      0x1FFF
-+#endif
-+#ifndef IOCPARM_LEN
-+#define IOCPARM_LEN(a)    (((a) >> 16) & IOCPARM_MASK)
-+#endif
-+
-+#ifndef _IOC_SIZE
-+#ifdef IOCPARM_LEN
-+#define _IOC_SIZE(x) IOCPARM_LEN(x)
-+#else
-+#error "No mechanism for determining ioctl length found."
-+#endif
-+#endif
-+
- // file access protection mask
- #define S_PROT_MASK (S_ISUID| S_ISGID | S_ISVTX | S_IRWXU | S_IRWXG | S_IRWXO)
- 
--- 
-2.13.2
-
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.1.bb
similarity index 81%
rename from meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
rename to meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.1.bb
index 6bedf16..3dd5c82 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.1.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8a
 
 SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master \
            file://0001-support-cross-compiling.patch \
-           file://0001-unionfs-Define-IOCPARM_LEN-if-undefined.patch \
            "
-SRCREV = "c8d23a9a75f1a62988593671839e8a168a79f3e5"
+SRCREV = "8d732962423c3ca5be1f14b7ec139ff464e10a51"
 
 DEPENDS = "fuse"
 
-- 
2.7.4

