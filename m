Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997AAC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 04:15:40 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.11365.1671596130816073175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 20:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ETsYhF00;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so900296pje.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 20:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+YmaAaHC8iyqVOVVraPDeLUogEQHMIz+qiIxV+fvMqw=;
        b=ETsYhF00sT3+Dv5VzX0KQqNkn/6AI36zrM+WndP3XiBK1uN2edjUvrhu1GXGC7Wfuy
         kdcjP90Sh0whk4XYcsuhptj46vDXFLTTzjLFTo8AouZmc3jCJILsq2f8TvTKC+gUODM/
         wyKNXjAD0PTniR0cSVEDsplnG08Npj2H9nrvTDHY7GdVuUnCZf1Fmb6sLnYbU8j8hTRr
         rtPvYm97e7RUKvidfQHkXXGSNX1ymlHrcja2xmqqOiLoHetv9P0cz2WvtNLZxNTfV51s
         XOysBjo+GesnrlhVn6pcQSDHdBSBrshWrvELFseiqTd6eXTZX2LL4EvORsenCsY5k/w0
         G3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YmaAaHC8iyqVOVVraPDeLUogEQHMIz+qiIxV+fvMqw=;
        b=SlasTuGqCCmecjSsm4iQZeFbjJeRxKxI96KOITFq2nOfEFbec3OB/ZZh9ohkKdt/Pq
         BE4KwNT6X9FwcJTaatxXyVR0hHZ/nWqq+ill7FRZkODUl0tw75zHtgsRvj40qtb8bYL1
         MufU+uXUMwLCyucbgUMKE5iMpbWgbhTPhRWr33dzGvxG2HBn/j2hi98JybqvQ2wco2og
         I+IIOz8I93SOJ+UGa7wHXCmo/Ug8AAhvbdLMxQtbEu5A/YCbz83fqkvfJayzXkj2JcQH
         +6w9xwcDgFmkM7Ov3Ok//QU+lWX32O9PRemTYxN+U7XFz+UOB1Swp212W5Re2HCXTcgQ
         /APw==
X-Gm-Message-State: AFqh2kpRBXseL7HGu8d9Oj0pFnBeT5ERvvorX7pmuM8FDjGu253t3x7C
	sEVUGWuOvhaEmgRjN0hMYmjl7uTezuI=
X-Google-Smtp-Source: AMrXdXuqDZJEe75QhDwttm3Zp+Caw6G6L6ix25lIz2T7ZO5Dz+AVYHVusKL8OrlqZfVNQkQY0cd5XQ==
X-Received: by 2002:a05:6a20:4291:b0:9d:efbf:8171 with SMTP id o17-20020a056a20429100b0009defbf8171mr21876679pzj.58.1671596129709;
        Tue, 20 Dec 2022 20:15:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id z24-20020aa79498000000b005765df21e68sm9699027pfk.94.2022.12.20.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 20:15:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Upgrade to 250.9 systemd release
Date: Tue, 20 Dec 2022 20:15:27 -0800
Message-Id: <20221221041527.2565080-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 04:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100168

Fix build with latest musl
Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...il-Remove-asserts-on-dirent64-dirent.patch | 38 ++++++++++
 ...lude-linux-fs.h-to-resolve-fsconfig_.patch | 74 -------------------
 ...ass-correct-parameters-to-getdents64.patch | 50 -------------
 ...250.3.bb => sdbus-c++-libsystemd_250.9.bb} |  5 +-
 4 files changed, 40 insertions(+), 127 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-dirent-util-Remove-asserts-on-dirent64-dirent.patch
 delete mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
 delete mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-pass-correct-parameters-to-getdents64.patch
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_250.3.bb => sdbus-c++-libsystemd_250.9.bb} (94%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-dirent-util-Remove-asserts-on-dirent64-dirent.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-dirent-util-Remove-asserts-on-dirent64-dirent.patch
new file mode 100644
index 0000000000..517886c727
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-dirent-util-Remove-asserts-on-dirent64-dirent.patch
@@ -0,0 +1,38 @@
+From 19cc68d4a89b59889be442d2997ff030cdc3de73 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Dec 2022 20:11:17 -0800
+Subject: [PATCH] dirent-util: Remove asserts on dirent64 == dirent
+
+We already have assert_cc(_FILE_OFFSET_BITS == 64) which ensures that 64bit LFS functions are same as their original counterparts
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/25809]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/dirent-util.h | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/src/basic/dirent-util.h b/src/basic/dirent-util.h
+index 04bc53003f..4cb317184d 100644
+--- a/src/basic/dirent-util.h
++++ b/src/basic/dirent-util.h
+@@ -35,17 +35,6 @@ struct dirent *readdir_no_dot(DIR *dirp);
+ /* Only if 64bit off_t is enabled struct dirent + struct dirent64 are actually the same. We require this, and
+  * we want them to be interchangeable to make getdents64() work, hence verify that. */
+ assert_cc(_FILE_OFFSET_BITS == 64);
+-assert_cc(sizeof(struct dirent) == sizeof(struct dirent64));
+-assert_cc(offsetof(struct dirent, d_ino) == offsetof(struct dirent64, d_ino));
+-assert_cc(sizeof_field(struct dirent, d_ino) == sizeof_field(struct dirent64, d_ino));
+-assert_cc(offsetof(struct dirent, d_off) == offsetof(struct dirent64, d_off));
+-assert_cc(sizeof_field(struct dirent, d_off) == sizeof_field(struct dirent64, d_off));
+-assert_cc(offsetof(struct dirent, d_reclen) == offsetof(struct dirent64, d_reclen));
+-assert_cc(sizeof_field(struct dirent, d_reclen) == sizeof_field(struct dirent64, d_reclen));
+-assert_cc(offsetof(struct dirent, d_type) == offsetof(struct dirent64, d_type));
+-assert_cc(sizeof_field(struct dirent, d_type) == sizeof_field(struct dirent64, d_type));
+-assert_cc(offsetof(struct dirent, d_name) == offsetof(struct dirent64, d_name));
+-assert_cc(sizeof_field(struct dirent, d_name) == sizeof_field(struct dirent64, d_name));
+ 
+ #define FOREACH_DIRENT_IN_BUFFER(de, buf, sz)                           \
+         for (void *_end = (uint8_t*) ({ (de) = (buf); }) + (sz);        \
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
deleted file mode 100644
index 01afd37a37..0000000000
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From b0933e76c6f0594c10cf8a9a70b34e15b68066d1 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 23 Jul 2022 10:38:49 +0000
-Subject: [PATCH] glibc: Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23992/commits/21c03ad5e9d8d0350e30dae92a5e15da318a1539]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build             | 13 ++++++++++++-
- src/basic/fd-util.c     |  2 ++
- src/core/namespace.c    |  2 ++
- src/shared/mount-util.c |  2 ++
- 4 files changed, 18 insertions(+), 1 deletion(-)
-
---- a/meson.build
-+++ b/meson.build
-@@ -474,7 +474,6 @@ decl_headers = '''
- #include <uchar.h>
- #include <sys/mount.h>
- #include <sys/stat.h>
--#include <linux/fs.h>
- '''
- 
- foreach decl : ['char16_t',
-@@ -486,6 +485,17 @@ foreach decl : ['char16_t',
-         # We get -1 if the size cannot be determined
-         have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
- 
-+        if decl == 'struct mount_attr'
-+                if have
-+                        want_linux_fs_h = false
-+                else
-+                        have = cc.sizeof(decl,
-+                                         prefix : decl_headers + '#include <linux/fs.h>',
-+                                         args : '-D_GNU_SOURCE') > 0
-+                        want_linux_fs_h = have
-+                endif
-+        endif
-+
-         if decl == 'struct statx'
-                 if have
-                         want_linux_stat_h = false
-@@ -501,6 +511,7 @@ foreach decl : ['char16_t',
- endforeach
- 
- conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
-+conf.set10('WANT_LINUX_FS_H', want_linux_fs_h)
- 
- foreach ident : ['secure_getenv', '__secure_getenv']
-         conf.set10('HAVE_' + ident.to_upper(), cc.has_function(ident))
---- a/src/core/namespace.c
-+++ b/src/core/namespace.c
-@@ -6,7 +6,9 @@
- #include <stdio.h>
- #include <sys/mount.h>
- #include <unistd.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "base-filesystem.h"
---- a/src/shared/mount-util.c
-+++ b/src/shared/mount-util.c
-@@ -7,7 +7,9 @@
- #include <sys/statvfs.h>
- #include <unistd.h>
- #include <linux/loop.h>
-+#if WANT_LINUX_FS_H
- #include <linux/fs.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "chase-symlinks.h"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-pass-correct-parameters-to-getdents64.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-pass-correct-parameters-to-getdents64.patch
deleted file mode 100644
index 03a29b5327..0000000000
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-pass-correct-parameters-to-getdents64.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From fbc10748c7c59d82024a4d35146b8dfef8d52927 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH 1/2] pass correct parameters to getdents64
-
-Fixes
-../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types]
-                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
-                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-../git/src/basic/stat-util.c:102:28: error: incompatible pointer types passing 'union (unnamed union at ../git/src/basic/stat-util.c:78:9) *' to parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types]
-        n = getdents64(fd, &buffer, sizeof(buffer));
-                           ^~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/basic/recurse-dir.c | 2 +-
- src/basic/stat-util.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
-index efa1797b7b..797285e3be 100644
---- a/src/basic/recurse-dir.c
-+++ b/src/basic/recurse-dir.c
-@@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
-                 bs = MIN(MALLOC_SIZEOF_SAFE(de) - offsetof(DirectoryEntries, buffer), (size_t) SSIZE_MAX);
-                 assert(bs > de->buffer_size);
- 
--                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
-+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
-                 if (n < 0)
-                         return -errno;
-                 if (n == 0)
-diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
-index efac7b002e..9e1fe7f5a0 100644
---- a/src/basic/stat-util.c
-+++ b/src/basic/stat-util.c
-@@ -99,7 +99,7 @@ int dir_is_empty_at(int dir_fd, const char *path) {
-                         return fd;
-         }
- 
--        n = getdents64(fd, &buffer, sizeof(buffer));
-+        n = getdents64(fd, (struct dirent *)&buffer, sizeof(buffer));
-         if (n < 0)
-                 return -errno;
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.9.bb
similarity index 94%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.9.bb
index 853cc20b67..14e927d075 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.9.bb
@@ -10,11 +10,11 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "73be9643910c3f7f3ff84765d63060846c110016"
+SRCREV = "1d5e0e9910500f3c3584485f77bfc35e601036e3"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
-           file://0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch \
+           file://0001-dirent-util-Remove-asserts-on-dirent64-dirent.patch \
            "
 
 # patches needed by musl
@@ -44,7 +44,6 @@ SRC_URI_MUSL = "\
                file://0025-Handle-__cpu_mask-usage.patch \
                file://0026-Handle-missing-gshadow.patch \
                file://0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
-               file://0001-pass-correct-parameters-to-getdents64.patch \
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
                "
-- 
2.39.0


