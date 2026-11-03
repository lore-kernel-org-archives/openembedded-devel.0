Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13531.1793718603447762682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 07:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KPSiDNyB;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso7313236c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718603; x=1794323403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssSZbrj06g/Aoj7r99pEXxq5HjQ6fnj0TSZ4L0bSymc=;
        b=KPSiDNyBxm/0eHDNeGfTvL/IW5tFS8a071/5cqta5VbFLjmaHiYjIo0i2HRRyC+Iq6
         h8NYX6YtDgRdjuYIgy8Cp0Ao/CNieP22zK0oVMX4o00a9WRACsWXlTiG/mJqFeBzvHv1
         v+S2jjFsWJe/Zpm//tezWFpukYk16/uXtvfj62ULmuSLTCd+AhOqtdOmGjN4KPilQeCa
         jNFQwhfbe8N+o6yOOIPFPycJtNlJ47xTOWA5BwULRs4gRbj2rdMxnNROzBI1guLkpxpS
         BEHiPXvBRzwwy1EMq1i6u+CV4qz9JzRSTRvYjJHrhNbuc/iiPfhB6vgjOlmXOqRcYPWU
         qBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718603; x=1794323403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssSZbrj06g/Aoj7r99pEXxq5HjQ6fnj0TSZ4L0bSymc=;
        b=sh7Lg4ZNWauyH+6wjifWphAoW4GuEHsUzwiDTsyGNVhX9rcmlUepBF84dbH+WBx5ZM
         HeOJV+pr3GvsKLu2BWvYovfvkhfCRBVwuIq18BVgMufa6jM87vir6rVyvnFStCQd0/SY
         qmqRoNpX3HkLUzikhmqWgEjTzMdeRvHdwiQWdBF68Qh3vnTY1tTYKXvXipQCYt1tqBB9
         UHzIpr52W5Ekyz9HhNj6SMGC1maGGICGPH1v9lkG+cY5SCc6lMLumO237cArVia8fUfk
         V8FNh7VWj6cT0lYbMCNwrq3or6YEY1f2xnJvkD5x5TbA41yNPkPc6r/vCJs9CE3+12Xw
         4HrQ==
X-Gm-Message-State: APuU4Z+7sGH6FJsaDuo8Vim83d6ZjshURADOT1M6UTplnk8PEzyOT09t
	anB6QyXmnQl6OlWKhw6SigXltWwwchFSAIPqkeNJV3OxPUv7FrZSGdB8090VtLGOeiL5Qg==
X-Gm-Gg: AYBFou0Bi9mU1oBYGY5tgwNUdcVu4zAYwtggBt+vx3mVfQH94fMbM8dQSs4IsZD41zG
	wVOSDQEKPIlTsk+DZBCg7WdXysLFcd0Qf/l6BTo/L5CCFNsjQzGZL2/3cM7bCGHDka70WSVv3lG
	3S8fbPId1VTa4oEn3eJUx66xKOrqrRDnv1tkIu0hjbd1DbCHocRHB3cFaCJLEaIuj1JvEAqTkZn
	UQk/TYbeQ+/Tu96J2t52z6s3Pt/w/zfhDoB7z+3x0fVva0c3a3MD2u6nRHO69kIBKusHcGf0mxQ
	xX2sLRIkdUZ/8fMsyXutUiPpOw1z+yowisXxEUv7NlsC8XJ9RQ5kXROAuEdZKZjDSxUZDOk+qvO
	pG4o+t0SqzqIbK4mpaBNiAOctVLk4xfRuGPbsVe6g8a+RvmvhDZRLRpl3zl39tJ08tjZ8L4zTbP
	Nz+d+LSce6pt8FVSR5NvL6XqZT05hej0g21L6yvYUFMyyxJ8uIf2afPJ8qTE+Lzz9oaLlFKE53B
	T5xFTsuU4W7txlA6mChm4uP+sNgcicB3MupXWt6bdB9C4lPixgtO+HJDmiymsyiVrHd+UqvWk1j
	77DbUbrLDPvT+rVw5VefgA0mA4nkjK3prRY0jEvkvriDHbWs4TlQd+JO3xkhHE3hfK+r97+UwH5
	msNDMI3bh92nfHA5NYSMfnrD4+3OPoLugV58IMuXnYS4JwJJ4VXNOUBW9Acdw7oXhbKqPdFCEk8
	WcoO+RdR8oLblJ+M+ZgTQDsVXxHYa48woyISkFjRvQZqqj30skIbmj+nmQBOs8lenURRUVEyA3A
	RnJsIZ3Ye4Es+LlL9f7n1vv32Obz7hUbzvfdGdc2aZ38oI0e63AwZE8py6Q19LQAmXH87E44us3
	q7j/YGNDKY3zbacQH72194sGgg==
X-Received: by 2002:a05:701b:4515:20b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1ac5b5ee671mr20089907c88.27.1793718602425;
        Tue, 03 Nov 2026 07:10:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm75076204c88.10.2026.11.03.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:10:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH 1/2] libfaketime: Remove recipe, it is in oe-core now
Date: Tue,  3 Nov 2026 07:09:58 -0800
Message-ID: <20261103150959.4060867-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 15:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131795
Content-Type: text/plain; charset="utf-8"

libfaketime was imported into oe-core (f3a4faaf4c "libfaketime: Import
recipe from meta-oe") and has had fixes there since: a 32-bit build fix,
the clang 23 fix, -O1 for the clobbered-variable error and the man page
install. Both copies are 0.9.13 at the same layer priority, so bitbake
picks one by parse order and currently ends up with the outdated meta-oe
copy.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...-write-only-real_-pointers-as-unused.patch | 68 -------------------
 .../libfaketime/libfaketime_0.9.13.bb         | 30 --------
 2 files changed, 98 deletions(-)
 delete mode 100644 meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
 delete mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch b/meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
deleted file mode 100644
index c7a854a196..0000000000
--- a/meta-oe/recipes-test/libfaketime/libfaketime/0001-Mark-write-only-real_-pointers-as-unused.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From d0fd7b4be89feb6a8809216b0dc1d84299bbad96 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Mon, 7 Sep 2026 19:27:57 -0700
-Subject: [PATCH] Mark write-only real_* pointers as unused
-
-clang 23 added -Wunused-but-set-global, which together with the -Werror
-in src/Makefile breaks the build:
-
-  libfaketime.c:340:23: error: variable 'real_lstat' set but not used
-    [-Werror,-Wunused-but-set-global]
-
-ftpl_init() deliberately resolves every real_* pointer up front ('Look
-up all real_* functions. NULL will mark missing ones.'), but several of
-them are only consumed on other platforms or under build options that
-are off by default, so on Linux/glibc they are written and never read.
-
-Annotate exactly those with __attribute__((unused)). This is understood
-by every gcc and clang that can build libfaketime, unlike a
--Wno-error=unused-but-set-global flag, which older compilers reject.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/libfaketime.c | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/libfaketime.c b/src/libfaketime.c
-index e674883..2addaab 100644
---- a/src/libfaketime.c
-+++ b/src/libfaketime.c
-@@ -337,26 +337,26 @@ static __thread bool dont_fake = false;
- /* pointers to real (not faked) functions */
- static int          (*real_stat)            (const char *, struct stat *);
- static int          (*real_fstat)           (int, struct stat *);
--static int          (*real_lstat)           (const char *, struct stat *);
-+static int          (*real_lstat)           (const char *, struct stat *) __attribute__((unused));
- #ifndef __ANDROID__
- static int          (*real_xstat)           (int, const char *, struct stat *);
- static int          (*real_fxstat)          (int, int, struct stat *);
--static int          (*real_fxstatat)        (int, int, const char *, struct stat *, int);
--static int          (*real_lxstat)          (int, const char *, struct stat *);
-+static int          (*real_fxstatat)        (int, int, const char *, struct stat *, int) __attribute__((unused));
-+static int          (*real_lxstat)          (int, const char *, struct stat *) __attribute__((unused));
- #endif
- #if !defined(__APPLE__) || !__DARWIN_ONLY_64_BIT_INO_T
- #ifndef __ANDROID__
--static int          (*real_stat64)          (const char *, struct stat64 *);
--static int          (*real_xstat64)         (int, const char *, struct stat64 *);
--static int          (*real_fxstat64)        (int, int , struct stat64 *);
--static int          (*real_fxstatat64)      (int, int , const char *, struct stat64 *, int);
--static int          (*real_lxstat64)        (int, const char *, struct stat64 *);
-+static int          (*real_stat64)          (const char *, struct stat64 *) __attribute__((unused));
-+static int          (*real_xstat64)         (int, const char *, struct stat64 *) __attribute__((unused));
-+static int          (*real_fxstat64)        (int, int , struct stat64 *) __attribute__((unused));
-+static int          (*real_fxstatat64)      (int, int , const char *, struct stat64 *, int) __attribute__((unused));
-+static int          (*real_lxstat64)        (int, const char *, struct stat64 *) __attribute__((unused));
- #endif
- #endif
- #ifdef STATX_TYPE
--static int          (*real_statx)           (int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
-+static int          (*real_statx)           (int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) __attribute__((unused));
- #endif
--static time_t       (*real_time)            (time_t *);
-+static time_t       (*real_time)            (time_t *) __attribute__((unused));
- #ifndef __ANDROID__
- static int          (*real_ftime)           (struct timeb *);
- #endif
diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb
deleted file mode 100644
index 22c908f335..0000000000
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.13.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "A library for faking the system time in user-space programs"
-SECTION = "libs"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRCREV = "86b37fde2fed7336ea2d0c17928e3015a55d9b4a"
-
-SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
-           file://0001-Mark-write-only-real_-pointers-as-unused.patch \
-"
-
-CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
-
-do_configure[noexec] = "1"
-
-do_compile () {
-    oe_runmake
-}
-
-do_install () {
-    install -d ${D}${libdir}/faketime
-    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
-    install -d ${D}${bindir}
-    install -m 0755 src/faketime ${D}${bindir}
-}
-
-FILES:${PN} = "${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}"
-FILES:${PN}-dev += "${libdir}/faketime/lib*${SOLIBSDEV}"
-
-BBCLASSEXTEND = "native"
