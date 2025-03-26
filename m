Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD3BC3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:13:41 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.32955.1743020018218569587
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jV0s4QnV;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223f4c06e9fso5018625ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 13:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020017; x=1743624817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFbSMtaCYfoLM3TuorT/bTN6im2pkonOjdWJL+o9YGs=;
        b=jV0s4QnVSZN3ebQ3TwSRZgxZsyu7ijgn2wA471hqoNYAtB6TqfEkLf4YwjuYcQODWf
         3+XZ2+NaX+HzHHQwnMlapQj+8hVU77iuJb05pEeAHczMBNnYQHVOpweznwUIyCfM8MhN
         kBpsCYQ4lmcE9FmVIvU0v0OVL02eLePeWuNnDmjk8Nu+s4pQrmynaGmlFr4EUhh2H/74
         pHbVe5JkPhOUrBG3cMrebxmSp8uHY6pdTuV8S6dKhjJuyvtoIIuMxUKjW3FBOyLxm8LG
         7nTpm0Cbt2k54EMYZVWnzhm/yDKntc/bQYDI4N3MLCIOWhmQ7qsstufW/ioVFdmAdvhp
         UnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020017; x=1743624817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFbSMtaCYfoLM3TuorT/bTN6im2pkonOjdWJL+o9YGs=;
        b=nJoiPz+Ht8AakOPKx/ev272XMxGuvl5DWMagesBfoR6B7b1aNEgBPlIM1oeJGROSv8
         D32j8RVwT+QiF5UlkDTmBAn7H1HwN+9Hke7qSW/axAIcv6VTuHp3F0FZcUOgzLpeRlcP
         o0HSpVIe+zlEONl0tM2Pj+CejTv2r28q/Ij/wxnU3cnTizNh4HwM9f0J8CoejO3qGTHC
         pcc58+450mmrynT0psIgwXmF+vjDrq6MXPC4wex4sNd42oJz2XQLQN3Xl8I9RW2XOnf/
         4w0nxw9z2Zz0zwHO7iWFassL69pZ5cgmbBVxNWiMlGAcINqWha4TcWsCSBBfBknrMiy/
         qAIQ==
X-Gm-Message-State: AOJu0YyhVtVELvGOO+Y8DX34NSrDJ7l+5nixp1Pk6qqwzlK0wRg1skWr
	9wrhwARY3IUhI3IjkeKAfj+6ldsu3kJ3CYkDIU13A82ZNkZnK1vrRaNYc9aL
X-Gm-Gg: ASbGnct6u/RZ+B5s1kfI4C9IhVvjmFxQqisGRAwtne983xn9i/QFqrQDrwpj09mJsAV
	84pHK83m+0LrfCCcoCNhZciTefIZsFMlq7dXcUFDszFkzytgYp/e3hpeII0kYYyhrptjDuPhRg1
	G6/qJjDeYxvkJV5B0z07id6YBycbO3WP6w73C8kYoYMO4d3dkpFTsoAoEosgXoVDHNvHAvUJW9z
	/sY2Os9KBIqBzalCEVdKM0uBpK72BOLLCp0zVubTSOESA8E9YN3dLOWRlj1IZRSXaiCEZEmVtD1
	/FzAL3U7OHxcIkf/MwlNupdBhittczOErxsu
X-Google-Smtp-Source: AGHT+IGPGQJqra20jw6bFyYoVsn4Hig/Bz2bjbms0l1mUbcgfSMa8iGRmi7f6nTitHNVFMwplaNgyw==
X-Received: by 2002:a17:903:3c43:b0:215:58be:3349 with SMTP id d9443c01a7336-228039b7515mr20275725ad.14.1743020017059;
        Wed, 26 Mar 2025 13:13:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f39763sm114783365ad.10.2025.03.26.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:13:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	"mark.yang" <mark.yang@lge.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] crash: Fix build for 32bit targets
Date: Wed, 26 Mar 2025 13:13:31 -0700
Message-ID: <20250326201332.3364128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 20:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116304

Fixes
rame.c: In function 'CORE_ADDR frame_unwind_pc(frame_info*)':
frame.c:982:35: error: cannot convert 'CORE_ADDR*' {aka 'long long unsigned int*'} to 'ulong*' {aka 'long unsigned int*'}
  982 |           crash_decode_ptrauth_pc(&pc);
      |                                   ^~~
      |                                   |
      |                                   CORE_ADDR* {aka long long unsigned int*}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: mark.yang <mark.yang@lge.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash.inc        |  1 +
 ...-build-failure-on-32bit-machine-i686.patch | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 6425c4ba7a..aef77be1a0 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch \
            file://0003-Fix-build-failure-in-readline-lib.patch \
            file://0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch \
+           file://0005-Fix-build-failure-on-32bit-machine-i686.patch \
            "
 SRCREV = "f13853cef53f5c5463a51021edbc81977e2b1405"
 
diff --git a/meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch b/meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch
new file mode 100644
index 0000000000..e4796b9ced
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch
@@ -0,0 +1,83 @@
+From 2724bb1d0260f3886f8a3d533838caf80c7e61e5 Mon Sep 17 00:00:00 2001
+From: Lianbo Jiang <lijiang@redhat.com>
+Date: Fri, 24 Jan 2025 17:56:23 +0800
+Subject: [PATCH 10/10] Fix build failure on 32bit machine(i686)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This issue was caused by commit 0f39e33d3504 with the following
+compilation error:
+
+  frame.c: In function ‘CORE_ADDR frame_unwind_pc(frame_info*)’:
+  frame.c:982:35: error: cannot convert ‘CORE_ADDR*’ {aka ‘long long unsigned int*’} to ‘ulong*’ {aka ‘long unsigned int*’}
+    982 |           crash_decode_ptrauth_pc(&pc);
+        |                                   ^~~
+        |                                   |
+        |                                   CORE_ADDR* {aka long long unsigned int*}
+  frame.c:948:48: note: initializing argument 1 of ‘void crash_decode_ptrauth_pc(ulong*)’
+    948 | extern "C" void crash_decode_ptrauth_pc(ulong* pc);
+        |                                         ~~~~~~~^~
+
+Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/2724bb1d0260f3886f8a3d533838caf80c7e61e5]
+Fixes: 0f39e33d3504 ("arm64: add pac mask to better support gdb stack unwind")
+Reported-by: Guanyou.Chen <chenguanyou@xiaomi.com>
+Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
+---
+ gdb-10.2.patch  | 6 +++---
+ gdb_interface.c | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/gdb-10.2.patch b/gdb-10.2.patch
+index 8f5d7db22840..d22f2d6d75bc 100644
+--- a/gdb-10.2.patch
++++ b/gdb-10.2.patch
+@@ -55,7 +55,7 @@ exit 0
+  # your system doesn't have fcntl.h in /usr/include (which is where it
+  # should be according to Posix).
+ -DEFS = @DEFS@
+-+DEFS = -DCRASH_MERGE @DEFS@
+++DEFS = -DCRASH_MERGE -D${CRASH_TARGET} @DEFS@
+  GDB_CFLAGS = -I. -I$(srcdir) -I$(srcdir)/config \
+  	-DLOCALEDIR="\"$(localedir)\"" $(DEFS)
+  
+@@ -16222,7 +16222,7 @@ exit 0
+    return NULL;
+  }
+ 
+-+#ifdef CRASH_MERGE
+++#if defined(CRASH_MERGE) && defined(ARM64)
+ +extern "C" void crash_decode_ptrauth_pc(ulong* pc);
+ +#endif
+ +
+@@ -16233,7 +16233,7 @@ exit 0
+        try
+ 	{
+ 	  pc = gdbarch_unwind_pc (prev_gdbarch, this_frame);
+-+#ifdef CRASH_MERGE
+++#if defined(CRASH_MERGE) && defined(ARM64)
+ +	  crash_decode_ptrauth_pc(&pc);
+ +#endif
+ 	  pc_p = true;
+diff --git a/gdb_interface.c b/gdb_interface.c
+index e108d097ee5f..c2e99f5c156a 100644
+--- a/gdb_interface.c
++++ b/gdb_interface.c
+@@ -1084,12 +1084,12 @@ int crash_get_current_task_reg (int regno, const char *regname,
+ }
+ 
+ /* arm64 kernel lr maybe has patuh */
++#ifdef ARM64
+ void crash_decode_ptrauth_pc(ulong *pc);
+ void crash_decode_ptrauth_pc(ulong *pc)
+ {
+-#ifdef ARM64
+ 	struct machine_specific *ms = machdep->machspec;
+ 	if (is_kernel_text(*pc | ms->CONFIG_ARM64_KERNELPACMASK))
+ 		*pc |= ms->CONFIG_ARM64_KERNELPACMASK;
+-#endif /* !ARM64 */
+ }
++#endif /* !ARM64 */
+-- 
+2.47.1
+

