Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CE9C27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 07:24:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.14120.1718004267487456145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 00:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QrSiWgzd;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42108856c33so29987085e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 00:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718004265; x=1718609065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtglUvFt4N36bXk8MWJYINXeVjKAlTta+a0OFRUGlDM=;
        b=QrSiWgzdhA6B9mv96ObEPRuMMopmYlt/rrluPAkHgqdQDsUycICefCuQo36AOhMMhj
         HKKgxd+4z73jNzHg2hDSqR9E3A1WZ1e+2GUT7cGjDBIUexaAPVYvWOWSSYvKuCGZOUR4
         G0aPiGLSOUxH+yns0RaMVgLBi1iF4RYtAn/eUgEzlFArNSgYoR0ZgDeoEHlQBpnKLmyv
         A48YSlmRGlZWgeLTDjS1bXFRFPQnILZJx3tYPJ93p0Ebe001JloSaRhEsllmijI9J2zP
         Tg3q1u0DksRpArce3FAR/P2RFFAwLJvbjArTaRQ0w6iMufwWnkn/v37ARnzQoRpFV0Cv
         //Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718004265; x=1718609065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtglUvFt4N36bXk8MWJYINXeVjKAlTta+a0OFRUGlDM=;
        b=Gp6+7EUE0ngXArI0S92ONFTHWAKw44nSM43zGalKkDhYFIThcDHkaHrihaPHLBcTut
         C7MFUQL9Kn5Su3haf7wrN/74UBuN1TCyIjIOWjcygqqw85SdhOa+xVIhJUly82OF/xTi
         dIhNgCTRcSRipkVXac9E455+M6gdqxiCaDcO5aSqHe9SXB+ekvbIaQmgI31/DNom2lpS
         pve6L4CPyj5rwXiJX648fpdAVjaKNBGaVZA2OpAs9Seb2DTq0xkF2QrY9LLZPAafj8oE
         7RnlHnFAnf/HeAn9S69kRAQdHMzxz7NVjnDU0xRsG7NieK1sipmwpWJKuCLXYF+cMN0G
         mtUA==
X-Gm-Message-State: AOJu0Yzq1mwrboiGu+qe7HNlLy1U/3OjdYSUwPMLZLL2kAp0EnI0kWrg
	ItkMejc0R457X5yxuUYF1XcQXpSNUSqkbxErRu5rBVvo1N1eTI+BBhDXkRAn
X-Google-Smtp-Source: AGHT+IGgZ5G+tcEUZUiCs8E7sr4tTA8Fr4Nn5eZxWtIyx8sH/oV+ZoLZbfKOFUJvBbqQGHWAzq9nAQ==
X-Received: by 2002:a5d:5886:0:b0:35f:120c:4ff0 with SMTP id ffacd0b85a97d-35f120c50e3mr6345567f8f.0.1718004265084;
        Mon, 10 Jun 2024 00:24:25 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421f23d06ddsm13303845e9.8.2024.06.10.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 00:24:24 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-initramfs][PATCH v2] dracut: Switch to dracut-ng and upgrade to version 102
Date: Mon, 10 Jun 2024 09:24:22 +0200
Message-ID: <20240610072422.12143-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 07:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110792

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

Dropped one patch that's unnecessary for a long time now,
because dracut (since version 049...) does not rely on
__WORDSIZE.

Added a new patch that partially reverts a change that broke
creating an initramfs on the host using the cross-compiled
sysroot.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...against-__GLIBC_PREREQ-for-musl-libc.patch | 35 -------
 ...all-split-ldd-command-arguments-for-.patch | 91 +++++++++++++++++++
 ...stall-Do-not-undef-_FILE_OFFSET_BITS.patch | 32 -------
 ....h-include-sys-reg.h-when-libc-glibc.patch | 35 -------
 .../dracut/{dracut_056.bb => dracut_102.bb}   |  8 +-
 5 files changed, 94 insertions(+), 107 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-feat-dracut-install-split-ldd-command-arguments-for-.patch
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
 rename meta-initramfs/recipes-devtools/dracut/{dracut_056.bb => dracut_102.bb} (85%)

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
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
deleted file mode 100644
index 68ec2b8fd..000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 17:14:05 -0700
-Subject: [PATCH] util.h: include <sys/reg.h> when libc != glibc
-
-For musl libc it is required to include <sys/reg.h> to
-have __WORDSIZE defined to e.g. 32 for arm*-musl.
-
-Taken from void-linux
-https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patches/musl-__wordsize.patch
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/install/util.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/install/util.h b/src/install/util.h
-index a6f9a184..82732913 100644
---- a/src/install/util.h
-+++ b/src/install/util.h
-@@ -36,6 +36,9 @@
- #include <sys/stat.h>
- #include <dirent.h>
- #include <sys/resource.h>
-+#if !defined(__GLIBC__)
-+#include <sys/reg.h>
-+#endif
- 
- #include "macro.h"
- 
--- 
-2.17.1
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
similarity index 85%
rename from meta-initramfs/recipes-devtools/dracut/dracut_056.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_102.bb
index db08fffe9..39ff265a3 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "631d5f72a223288aa1f48bb8e8d0313e75947400"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http;branch=master \
-           file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
-           file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
-           file://0001-install-Do-not-undef-_FILE_OFFSET_BITS.patch \
+SRCREV = "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
+SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
+           file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
            "
 
 DEPENDS += "kmod"
-- 
2.45.2


