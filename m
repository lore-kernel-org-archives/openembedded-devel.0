Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 720427863A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 23:26:37 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id o13so3818155pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 15:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4EgYnt/lCc2HLohvaZIP4s/2jFQPFFbRqU2C8Wj1+iE=;
	b=f3t4wG91hfk1gNjFB7Qt5LL5wYmpDc5MkpZXj7q7Dg8gTv77jrFvKYnLxJpH1KGaJ1
	QK4njEpz9jVFmqM90KxH2/3Oa5cml516aVeFKKWh577LlP+bRohiJ4Yghmh5WvM9hE3J
	3XAeGqc9bxSf9RXGaEtise1zekOANa7WZ9+8CuQXoHXfSgo2PRETQS0T1yZMqKA9vP41
	Hj3bpnLdVgNm/kdYbqSrRtbdDkk1A9KJZtH8KE0FbMB2IGeAV/CeLCVGzu1MxlGxPDao
	YOvvOD65iiYuG+xZsqt8Ex7HKwGI2p3sBU4frRtjwouNkFb0fFkb62g1JYZ7fgiXeTy/
	DHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4EgYnt/lCc2HLohvaZIP4s/2jFQPFFbRqU2C8Wj1+iE=;
	b=M+/kXVryVomLYqpilkSd/SqTCfK5+pTLtTa6oy+9nvXDlg5kYvx0qZt/UkDEmD5h5p
	Aa5jaUquv51jVmaY16fsi3llcwXpZEhNDTdWGKexYrAQvyF5HFrWtCj7/o9fBSaMLchQ
	acPvztY/snJFazlCvIeIPBcZAywO9XhQzEBTinlrltnuL01QLTUejdpL2VkN9BSWcZ5T
	o6AgmStEuZEcclEYvuyOeWalWCAXJ2jiT4JOecfNnspd1+Q4Bbh3blTCcdlouIvMVNCy
	0WJz2GaupubIzMCVGGcvYaEv1Jgy6/tRUHGZGNrjdgaJeDBj992ROdBx3+C6Q9atwdOe
	xNcA==
X-Gm-Message-State: AKwxytev5jg72yWVq+4TKr4kBHLZBhNnyAert4ipF/zyWgSceszcSC+o
	kZ2eLlHzpDLpNW/EvneFMAKggQ==
X-Google-Smtp-Source: AH8x226aSrhYl1I1PGXgHuWvGk37Hmyq9BKpUJHZUQXkCjFm455srBcZ/BtszHhmaOOOYOOYv12BQA==
X-Received: by 10.98.224.3 with SMTP id f3mr14400584pfh.205.1516836398195;
	Wed, 24 Jan 2018 15:26:38 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y7sm10455413pfe.48.2018.01.24.15.26.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Jan 2018 15:26:36 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jan 2018 15:26:30 -0800
Message-Id: <1516836390-25957-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] breakpad: disable calls to getcontext() with musl
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
X-List-Received-Date: Wed, 24 Jan 2018 23:26:37 -0000

Musl does not currently provide getcontext().

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...001-disable-calls-to-getcontext-with-musl.patch | 52 ++++++++++++++++++++++
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
new file mode 100644
index 0000000..c762754
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
@@ -0,0 +1,52 @@
+From 57ecf7205feedd23f901e1bb9d193787e559e433 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 23 Jan 2018 15:13:26 -0800
+Subject: [PATCH] disable calls to getcontext() with musl
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
+index cca023f..f3e460c 100644
+--- a/src/client/linux/handler/exception_handler.cc
++++ b/src/client/linux/handler/exception_handler.cc
+@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
+   siginfo.si_code = SI_USER;
+   siginfo.si_pid = getpid();
+   ucontext_t context;
++#if defined(__GLIBC__)
+   getcontext(&context);
++#else
++  // Extreme hack: Allow musl builds to compile - but don't expect them to work.
++  // Although musl provides a definition for getcontext() in ucontext.h (which
++  // enough to build libbreakpad_client) musl does not provide a corresponding
++  // getcontext() function, so builds will fail when attempting to link anything
++  // with libbreakpad_client. Disabling calls to getcontext() is a temporary
++  // hack. The real fix is probably to enable Breakpad's own implementation of
++  // getcontext() when building for musl (it's currently only enabled when
++  // building for Android).
++  memset (&context, 0, sizeof(context));
++#endif
+   return HandleSignal(sig, &siginfo, &context);
+ }
+ 
+@@ -680,9 +692,14 @@ bool ExceptionHandler::WriteMinidump() {
+   sys_prctl(PR_SET_DUMPABLE, 1, 0, 0, 0);
+ 
+   CrashContext context;
++#if defined(__GLIBC__)
+   int getcontext_result = getcontext(&context.context);
+   if (getcontext_result)
+     return false;
++#else
++  // Extreme hack - see comments above.
++  memset (&context.context, 0, sizeof(&context.context));
++#endif
+ 
+ #if defined(__i386__)
+   // In CPUFillFromUContext in minidumpwriter.cc the stack pointer is retrieved
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 5f6d82c..d9773c9 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            file://0005-md2core-Replace-basename.patch \
            file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
            file://mcontext.patch \
+           file://0001-disable-calls-to-getcontext-with-musl.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
 "
-- 
1.9.1


