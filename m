Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.1447.1615834150874971416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 11:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OcPEPv36;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id a8so9241265plp.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3OvMr+VZ0GZdt58UNHrs0wA0u+GJvwAimM7fN2jpWNA=;
        b=OcPEPv36ML0RepVi/JMsis8h+go0mxegOZhvprQd/u090yLbjcf+Le2eLdsJ7MJBRX
         EPwdC1iazYUafuuSZuA38gDy/X/MEjeQ920oikFaj5PTGVZ1AGJ9MJ7jeM62aUmcP/kQ
         jfufLfHDt7z99VSfqIG0tS8byZru5npeYNgOMMREXajXb3gjNidzkEamTzwjWCgeT1hS
         pIa8CyAh7cFovkJMSiNdRn01J+imUawMkD/lfJSNH6OS2VSodjOoVNo2pj+jW6/l7/WK
         suYVEQw6kRjIGmaOGL9IQUZz348gPXNb7BKgbVZZNM4LOzUL1n3uA98OVuvGzSREo49t
         t0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3OvMr+VZ0GZdt58UNHrs0wA0u+GJvwAimM7fN2jpWNA=;
        b=jaVCLjDs/k6Fc/W2L46T1ytZeKP/E85r9+dIx3/PIaS1Hjo6AbHN+N5TsrcXABWlGY
         TPdwT27btBpx/9vl6deapSGwH0B+zcm3NetCK6jdwaBgYW1sLBLZPObeBVWJUNROM0F+
         Ua968Nze/QzZ0ZHF29+OLQWXB8Xa2sL9m6d7FfkqehWFiKWGb0CJ6GzdirHIr+RIDeF9
         rsxOlsnj8brnlAnUW+VfdOcxGmZtxa3hIpds8CNc7XAEkyK4oVJexySOwAvb4S1SHPt/
         gxJrp+oBfc6E+70Hk4ULeLFocqhuE4wptQK2BNvbhTUVHFA8NupxKwK+Ggb85nT2CFtx
         3NKg==
X-Gm-Message-State: AOAM5300/B7m0gPDkeL750zu1oeLNloUejAQmGpg8Vnm6//wKWz3t21t
	Rh8owy1jjJ1Dev/jGiZP96JZlsp/BO4R6w==
X-Google-Smtp-Source: ABdhPJzQYqhM06glMx4dREI50uddTgf/FAF7S26NeZna/2VeonEGVivosFtM87GLLKNCaUJgJrzRsA==
X-Received: by 2002:a17:90a:9f43:: with SMTP id q3mr530676pjv.50.1615834149612;
        Mon, 15 Mar 2021 11:49:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id 133sm14743259pfa.130.2021.03.15.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 11:49:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] breakpad: Do not fallback to android implementation for getcontext/setcontext on musl
Date: Mon, 15 Mar 2021 11:49:07 -0700
Message-Id: <20210315184907.2783355-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

with musl, it tried to use local implementation which is geared towards
android and does not compile with musl/linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ONTEXT-check-to-add-local-implementa.patch | 54 +++++++++++++++++++
 ...isable-calls-to-getcontext-with-musl.patch | 47 ----------------
 .../recipes-devtools/breakpad/breakpad_git.bb |  5 +-
 3 files changed, 58 insertions(+), 48 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch
new file mode 100644
index 0000000000..d7a5c06753
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch
@@ -0,0 +1,54 @@
+From 70441611d4e8200d9d16dfed493873b8c1bb57c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Mar 2021 11:33:38 -0700
+Subject: [PATCH] Remove HAVE_GETCONTEXT check to add local implementation
+
+On musl getcontext/setcontext APIs are implemented in libucontext which
+can be used
+
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ee7454e4..69700192 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -187,10 +187,6 @@ src_client_linux_libbreakpad_client_a_SOURCES = \
+ 	src/common/linux/linux_libc_support.cc \
+ 	src/common/linux/memory_mapped_file.cc \
+ 	src/common/linux/safe_readlink.cc
+-if !HAVE_GETCONTEXT
+-src_client_linux_libbreakpad_client_a_SOURCES += \
+-	src/common/linux/breakpad_getcontext.S
+-endif
+ endif LINUX_HOST
+ 
+ if !DISABLE_PROCESSOR
+@@ -508,10 +504,6 @@ src_client_linux_linux_client_unittest_shlib_SOURCES = \
+ 	src/processor/minidump.cc \
+ 	src/processor/pathname_stripper.cc \
+ 	src/processor/proc_maps_linux.cc
+-if !HAVE_GETCONTEXT
+-src_client_linux_linux_client_unittest_shlib_SOURCES += \
+-	src/common/linux/breakpad_getcontext.S
+-endif
+ 
+ src_client_linux_linux_client_unittest_shlib_CPPFLAGS = \
+ 	$(AM_CPPFLAGS) $(TEST_CFLAGS)
+@@ -541,10 +533,6 @@ src_client_linux_linux_client_unittest_shlib_LDADD = \
+ 	src/common/string_conversion.o \
+ 	$(TEST_LIBS) \
+ 	$(PTHREAD_CFLAGS) $(PTHREAD_LIBS)
+-if !HAVE_GETCONTEXT
+-src_client_linux_linux_client_unittest_shlib_SOURCES += \
+-	src/common/linux/breakpad_getcontext_unittest.cc
+-endif
+ if ANDROID_HOST
+ src_client_linux_linux_client_unittest_shlib_LDFLAGS += \
+ 	-llog -lm
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
deleted file mode 100644
index 466abe5f87..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 57ecf7205feedd23f901e1bb9d193787e559e433 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 23 Jan 2018 15:13:26 -0800
-Subject: [PATCH] disable calls to getcontext() with musl
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -490,7 +490,19 @@ bool ExceptionHandler::SimulateSignalDel
-   siginfo.si_code = SI_USER;
-   siginfo.si_pid = getpid();
-   ucontext_t context;
-+#if defined(__GLIBC__)
-   getcontext(&context);
-+#else
-+  // Extreme hack: Allow musl builds to compile - but don't expect them to work.
-+  // Although musl provides a definition for getcontext() in ucontext.h (which
-+  // enough to build libbreakpad_client) musl does not provide a corresponding
-+  // getcontext() function, so builds will fail when attempting to link anything
-+  // with libbreakpad_client. Disabling calls to getcontext() is a temporary
-+  // hack. The real fix is probably to enable Breakpad's own implementation of
-+  // getcontext() when building for musl (it's currently only enabled when
-+  // building for Android).
-+  memset (&context, 0, sizeof(context));
-+#endif
-   return HandleSignal(sig, &siginfo, &context);
- }
- 
-@@ -675,9 +687,14 @@ bool ExceptionHandler::WriteMinidump() {
-   sys_prctl(PR_SET_DUMPABLE, 1, 0, 0, 0);
- 
-   CrashContext context;
-+#if defined(__GLIBC__)
-   int getcontext_result = getcontext(&context.context);
-   if (getcontext_result)
-     return false;
-+#else
-+  // Extreme hack - see comments above.
-+  memset (&context.context, 0, sizeof(context.context));
-+#endif
- 
- #if defined(__i386__)
-   // In CPUFillFromUContext in minidumpwriter.cc the stack pointer is retrieved
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 4d9038a92c..81955f450d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -11,6 +11,8 @@ SECTION = "libs"
 
 inherit autotools
 
+DEPENDS_append_libc-musl = " libucontext"
+
 BBCLASSEXTEND = "native"
 
 PE = "2"
@@ -37,7 +39,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main \
            file://0003-Dont-include-stab.h.patch \
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
            file://mcontext.patch \
-           file://0001-disable-calls-to-getcontext-with-musl.patch \
+           file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
            file://0001-Do-not-add-stack-pointer-to-clobber-list.patch;patchdir=src/third_party/lss \
@@ -45,6 +47,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main \
 S = "${WORKDIR}/git"
 
 CXXFLAGS += "-D_GNU_SOURCE"
+LDFLAGS_append_libc-musl = " -lucontext"
 
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
-- 
2.30.2

