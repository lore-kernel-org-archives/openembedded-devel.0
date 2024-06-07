Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900ABC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:32:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.38752.1717756343830439199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4FVZ4Su;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35e5604abdcso1935814f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717756342; x=1718361142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MCoHSYY73LDFiRSgNtZU/MTSjBFmV5Yhu9HwXnlBzVg=;
        b=S4FVZ4SuttSUCx3P43LDBW8rFUMhDQoOi4E1G4limEGYuSraRwvM+3Avyfz4I9hWSX
         IPeGW9gWZwDsu5qTwBZ4bsOFO8NYyPAccJe8hL/6MySZE6VuMsMZZIRo+J4sSDejX+9L
         Snl4gwa47icxiDyBNEAhvkwzbluJ0e4P+lS+7Lgbm2Trf4z3Ya2PhT4PmIwGx7QeCu7T
         eON8SlJA2HTeVhLrfel3aAYCFZGbNX/xH4vtDfiOjZoGjCFU8H6zMi+EzDWs5ycmpoY2
         Xl4cIiTuAviCbAQYZllFTZ7xkKvg/RH1RAXU4foMsUfH4Tewr8GcMKevHRhKEX63RUNM
         OHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717756342; x=1718361142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCoHSYY73LDFiRSgNtZU/MTSjBFmV5Yhu9HwXnlBzVg=;
        b=rCeFz5c0y0FLmxPpbh50v1PoI+zo8Bl2rL+3EISvzG8sPk5oQ2FxI+/7Etnd/SKchd
         wfsyhk0UJ09KUkumM3Uam0Zxmc+rv9sUY5yKHZzfl5bEKnQmTOTbwrcQLZkYGumv80qx
         0RxfKm7NF6ZSDWON0R33qh+HhYoDGuq7/tV7okPYSP4eZozVgvoZ2z3udfdSL1wCBDk9
         6WvAwAWWiODZ37Ro8FrwjyQLs6ogKvpmb6jl9zAfw6mPhd8YxYehQ5X0hXFFzHLjOm30
         3BP0DDrKD5ze5zecamXwzUAdKo/A1vgzGqVHFGICKvLQDeL27GjAtEqaUxN1GJHqX+K0
         ubmg==
X-Gm-Message-State: AOJu0YxNSnGkxym48g/sT1jJVKGBbqMwAD1gFXsOWbPZpdATl0AgJDgW
	mVC+q1Wg0s00OESWVJ8yZ5c/u1P2lYe3XIbUt4zJmqHtOTNEQSrk+MzMbA==
X-Google-Smtp-Source: AGHT+IH9vG2H1xCm158cxbaZTpl05q/zzoqa14RO63DQAWmcq8u9ySG6JqUHVwxn1NSPlKSerzNTEA==
X-Received: by 2002:a5d:6911:0:b0:356:4809:1a7e with SMTP id ffacd0b85a97d-35efea6fb6dmr1956159f8f.34.1717756341626;
        Fri, 07 Jun 2024 03:32:21 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d687f6sm3718671f8f.55.2024.06.07.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:32:21 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-initramfs][PATCH] dracut: Switch to dracut-ng and upgrade to version 102
Date: Fri,  7 Jun 2024 12:32:09 +0200
Message-ID: <20240607103209.986207-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 10:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110765

The previous dracut 056 was hopelessly outdated. When creating
an initramfs from a systemd based system with a recent systemd
version, booting failed with this error:

[    1.906055] systemd[1]: Failed to open executor binary '/usr/lib/systemd/systemd-executor'
[    1.912230] systemd[1]: Failed to allocate manager object: No such file or directory
[!!!!!!] Failed	to allocate manager object
[    1.912480] systemd[1]: Freezing execution

dracut-ng took over after development in the original dracut
repository stopped. Switched to the new source repository.

Dropped two patches upstreamed in dracut-ng.

Added a new patch that partially reverts a change that broke
creating an initramfs on the host using the cross-compiled
sysroot.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...against-__GLIBC_PREREQ-for-musl-libc.patch | 35 -------
 ...all-split-ldd-command-arguments-for-.patch | 91 +++++++++++++++++++
 ...stall-Do-not-undef-_FILE_OFFSET_BITS.patch | 32 -------
 .../dracut/{dracut_056.bb => dracut_102.bb}   |  7 +-
 4 files changed, 94 insertions(+), 71 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut-install-split-ldd-command-arguments-for-.patch
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
 rename meta-initramfs/recipes-devtools/dracut/{dracut_056.bb => dracut_102.bb} (88%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
deleted file mode 100644
index bd768d00d..000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ff5e1a662ba93ba79e2aeaaaec48a2a8ec4b4701 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 31 Mar 2022 22:22:44 +0800
-Subject: [PATCH] Guard against __GLIBC_PREREQ for musl libc
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/install/util.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/install/util.c b/src/install/util.c
-index 5721de89..784aec48 100644
---- a/src/install/util.c
-+++ b/src/install/util.c
-@@ -27,6 +27,7 @@
- 
- #include "util.h"
- 
-+#if defined(__GLIBC__)
- #if __GLIBC_PREREQ(2, 30) == 0
- #include <sys/syscall.h>
- #ifndef SYS_gettid
-@@ -35,6 +36,7 @@
- 
- #define gettid()    ((pid_t) syscall(SYS_gettid))
- #endif /*__GLIBC_PREREQ */
-+#endif /*__GLIBC__*/
- 
- size_t page_size(void)
- {
--- 
-2.25.1
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut-install-split-ldd-command-arguments-for-.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut-install-split-ldd-command-arguments-for-.patch
new file mode 100644
index 000000000..febdbdbdd
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut-install-split-ldd-command-arguments-for-.patch
@@ -0,0 +1,91 @@
+From 38dea7dd671fd621b563377cfbd95e4783568c6e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Fri, 7 Jun 2024 10:32:40 +0200
+Subject: [PATCH] feat(dracut-install): split ldd command arguments for
+ execvp()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This restores a not-so-subtle feature of previously executing ldd
+via popen(), i.e. the ability to use a cross-compiled sysroot.
+
+The ldd command may be passed in via the DRACUT_LDD environment
+variable, and the command may contain command line arguments.
+The number of such arguments are not known in advance.
+
+Split the command into executable and arguments and run it
+via execvp().
+
+Fixes: d010fa0d7f8ef42ad31729d027d2e4be6dd6e588
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://github.com/dracut-ng/dracut-ng/pull/339]
+---
+ src/install/dracut-install.c | 47 +++++++++++++++++++++++++++++++++++-
+ 1 file changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/src/install/dracut-install.c b/src/install/dracut-install.c
+index e9708c45..724b27b5 100644
+--- a/src/install/dracut-install.c
++++ b/src/install/dracut-install.c
+@@ -559,10 +559,55 @@ static int resolve_deps(const char *src)
+         log_debug("%s %s", ldd, fullsrcpath);
+         pid_t ldd_pid;
+         if ((ldd_pid = fork()) == 0) {
++                char **cmdline = NULL;
++                int start, pos, idx = 0;
++                /* Account for at least 2 elements plus the terminating NULL in cmdline */
++                int args = 3;
++
++                /* Estimate the number of space-separated elements in the "ldd" string */
++                pos = 0;
++                while (isspace(ldd[pos]))
++                        pos++;
++                for (; ldd[pos]; pos++) {
++                        if (isspace(ldd[pos])) {
++                                if (pos)
++                                        args++;
++                                while (isspace(ldd[pos]))
++                                        pos++;
++                        }
++                }
++
++                cmdline = malloc(args * sizeof(char *));
++                memset(cmdline, 0, args * sizeof(char *));
++
++                pos = 0;
++                while (isspace(ldd[pos]))
++                        pos++;
++                start = pos;
++                for (; ldd[pos]; pos++) {
++                        while (ldd[pos] && !isspace(ldd[pos]))
++                                pos++;
++
++                        cmdline[idx] = malloc(pos - start + 1);
++                        memcpy(cmdline[idx], ldd + start, pos - start);
++                        cmdline[idx][pos - start] = 0;
++                        idx++;
++
++                        if (!ldd[pos])
++                                break;
++
++                        while (isspace(ldd[pos]))
++                                pos++;
++                        start = pos;
++                }
++
++                cmdline[idx++] = fullsrcpath;
++                cmdline[idx] = NULL;
++
+                 dup2(fds[1], 1);
+                 dup2(fds[1], 2);
+                 putenv("LC_ALL=C");
+-                execlp(ldd, ldd, fullsrcpath, (char *)NULL);
++                execvp(cmdline[0], cmdline);
+                 _exit(errno == ENOENT ? 127 : 126);
+         }
+         close(fds[1]);
+-- 
+2.45.2
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
deleted file mode 100644
index 170df7119..000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7f8ef553b7c433af153d48c6a16b2943780abf67 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 31 Dec 2022 14:41:52 -0800
-Subject: [PATCH] install: Do not undef _FILE_OFFSET_BITS
-
-_FILE_OFFSET_BITS is a feature test macro to determine largefile
-support. Usually its set to 64 on systems supporting LFS. Its also
-needed to be set to 64 for supporting 64bit time_t on glibc on 32bit
-systems. If its undefined explicitly, then 64bit time_t can not be
-enabled.
-
-Upstream-Status: Submitted [https://github.com/dracutdevs/dracut/pull/2157]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/install/dracut-install.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/install/dracut-install.c b/src/install/dracut-install.c
-index dda0caca..05a67a03 100644
---- a/src/install/dracut-install.c
-+++ b/src/install/dracut-install.c
-@@ -22,7 +22,6 @@
- #ifndef _GNU_SOURCE
- #define _GNU_SOURCE
- #endif
--#undef _FILE_OFFSET_BITS
- #include <ctype.h>
- #include <errno.h>
- #include <fcntl.h>
--- 
-2.39.0
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
similarity index 88%
rename from meta-initramfs/recipes-devtools/dracut/dracut_056.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_102.bb
index db08fffe9..496380a0f 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "631d5f72a223288aa1f48bb8e8d0313e75947400"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http;branch=master \
+SRCREV = "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
+SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
-           file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
-           file://0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch \
+           file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
            "
 
 DEPENDS += "kmod"
-- 
2.45.2


