Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.8350.1625819886475878150
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jul 2021 01:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VScAkLMY;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so5528667pju.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jul 2021 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfKn/2395bcPNYVhB9rRwYcU0plgCWWcxRz8SuDZI1M=;
        b=VScAkLMYBPFu+8yZJJscQPvIlqSQwdUbyd+1WndyaH82f5cO1MmvxRIxx8fuse5mKH
         ZMC2YSe6ABljquForwxlxkvUXY9bS2hUSFDStvVCsTrgtBxkKgkfvFg1UzM4WjsK2FQZ
         V1PgYdjEUzU08qlM7CHdyFFwmYmt+OKympCi6qIjZvr149teyApD1LmuKSmqHPwTuvg2
         XgX6UM7cl2LbvdnfQ1bdHZH+qPuXjKPLcIqKmKD4g96W0uokcbYCiSUKriEk+cfHZh4v
         PlOdoKQMoeCRdlOnYHSZUH6dx2TKliPywUzayQVNGleeTXOWej1YeaGLPmsPuQpw0L2g
         oc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfKn/2395bcPNYVhB9rRwYcU0plgCWWcxRz8SuDZI1M=;
        b=hax4SKgkzBUmV8nBd6JlIe54h2DpEYSo5A0teErXir1pfUqetHtYkmbVycg+/9ldZV
         IA9SlyTFL45YKOXzLOlXD791RCP/wsCNfdCxMAeudMba+v5pG5nbxJKuy5BX+8gQSWKJ
         aVAYjAwf2ZkTNmFRoysv8XzTxZuexGjhwXVZSy6TCMxyFSDnqX9uULjdFlpkjZG/KhDQ
         Hid+FK1mThAGEtwFvpdah0boXWiA9cCXyWoLKs5C87G2jN2xoNLz1K5el3UR+r9XWDzT
         Eh2MH0o60CGLUp7JmpSLzSDoZcZ3b7o5BM+Vjf+bAiicWejIylwe1i+KJ6UGjI5I24gi
         Turw==
X-Gm-Message-State: AOAM533YsI3Dwtt3ZVCBWxPbX/A79Db2dsncv2lKdPJjWT7oq3OELDaO
	a4HXswWAtf4tjs+vUckmcu7tGLMBhywLhg==
X-Google-Smtp-Source: ABdhPJx4EzxCn5btv8ljqVQW7YU0rLUOguSEEDbVHKilzyQv9BJH8RrsMGTDg6g8pW+4hz/TPSou7w==
X-Received: by 2002:a17:90a:b28a:: with SMTP id c10mr9425168pjr.59.1625819885724;
        Fri, 09 Jul 2021 01:38:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id w18sm5246068pjg.50.2021.07.09.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 01:38:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ltrace: Fix mips build with kernels 5.13+
Date: Fri,  9 Jul 2021 01:38:03 -0700
Message-Id: <20210709083803.3971008-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rdcodes-values-for-ABI-syscall-bases.patch | 50 +++++++++++++++++++
 .../ltrace/ltrace/include_unistd_nr.patch     | 30 -----------
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  2 +-
 3 files changed, 51 insertions(+), 31 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch
new file mode 100644
index 0000000000..f83e0a2738
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch
@@ -0,0 +1,50 @@
+From ed8dbe1c793f2f770fef61adc4390277f903cceb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 9 Jul 2021 01:32:42 -0700
+Subject: [PATCH] mips: Use hardcodes values for ABI syscall bases
+
+mips kernels 5.13+ have stopped exposing the UAPIs which provided these
+defines, the values are more or less static so just use the hardcoded
+values for now. Use __NR_syscalls to get number of syscalls supported
+and include asm-generic/unistd.h to get this definition
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/mips/trace.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/sysdeps/linux-gnu/mips/trace.c b/sysdeps/linux-gnu/mips/trace.c
+index d54818e..e72184d 100644
+--- a/sysdeps/linux-gnu/mips/trace.c
++++ b/sysdeps/linux-gnu/mips/trace.c
+@@ -33,6 +33,7 @@
+ #include <asm/unistd.h>
+ #include <assert.h>
+ #include <asm/unistd.h>
++#include <asm-generic/unistd.h>
+
+ #include "backend.h"
+ #include "common.h"
+@@ -135,12 +136,12 @@ syscall_p(struct process *proc, int status, int *sysnum)
+ 	int min_syscall, max_syscall, sigreturn, rt_sigreturn;
+ 	struct callstack_element *top = NULL;
+ 	int depth = proc->callstack_depth;
+-	const int syscallbase[] = {__NR_O32_Linux, __NR_N32_Linux,
+-				   __NR_64_Linux, __NR_O32_Linux};
+-	const int syscallnum[] = {__NR_O32_Linux_syscalls,
+-				  __NR_N32_Linux_syscalls,
+-				  __NR_64_Linux_syscalls,
+-				  __NR_O32_Linux_syscalls};
++	const int syscallbase[] = {4000, 6000,
++				   5000, 4000};
++	const int syscallnum[] = {__NR_syscalls,
++				  __NR_syscalls,
++				  __NR_syscalls,
++				  __NR_syscalls};
+ 	const int rt_sigreturn_list[] = {193, 211, 211, 193};
+ 	const int sigreturn_list[] = {119, -1, -1, 119};
+
+--
+2.32.0
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
deleted file mode 100644
index e4490bbb9e..0000000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-kernel headers have restructured mips syscall generation in kernel
-in recent versions, however, ltrace still has logic to define the
-syscall numbers based on old logic, this patch includes the legacy
-UAPI headers to get these defines
-
-Fixes errors e.g.
-../../../../git/sysdeps/linux-gnu/mips/trace.c:138:29: error: '__NR_O32_Linux' undeclared (first use in this function)
-  const int syscallbase[] = {__NR_O32_Linux, __NR_N32_Linux,
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/sysdeps/linux-gnu/mips/trace.c
-+++ b/sysdeps/linux-gnu/mips/trace.c
-@@ -34,6 +34,16 @@
- #include <assert.h>
- #include <asm/unistd.h>
-
-+#ifndef __NR_O32_Linux
-+#include <asm/unistd_nr_o32.h>
-+#endif
-+#ifndef __NR_N32_Linux
-+#include <asm/unistd_nr_n64.h>
-+#endif
-+#ifndef __NR_N64_Linux
-+#include <asm/unistd_nr_n32.h>
-+#endif
-+
- #include "backend.h"
- #include "common.h"
- #include "debug.h"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index b81093aa24..69dce851fa 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-mips-plt.c-Delete-include-error.h.patch \
            file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
            file://0001-hook-Do-not-append-int-to-std-string.patch \
-           file://include_unistd_nr.patch \
            file://0001-Bug-fix-for-data-type-length-judgment.patch \
            file://0001-ensure-the-struct-pointers-are-null-initilized.patch \
            file://0001-ppc-Remove-unused-host_powerpc64-function.patch \
+           file://0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch \
            "
 SRC_URI_append_libc-musl = " file://add_ppc64le.patch"

--
2.32.0
