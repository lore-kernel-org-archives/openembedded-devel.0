Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18174.1795794964447984411
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GBfcAei3;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3915183c88.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794964; x=1796399764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5naxuchaYmPf/rnxTXTXKeycEM+fUQZgvVnDXsuTwgc=;
        b=GBfcAei3MWenWDmuP+eMT2J6S9KHmyVNCGhk+i3O3fjstYzMYRpoJc4f0eHKkagOwW
         sIeomExMLDDbQVPxIlax984MJOTyM5PVot6UqbFMG2m3MxXORWc2SVaaW0YECAwSbmLC
         UTOLUinhRlHzpUKFA44XxCegy5JLf0piDZgzV5SN5OphoQ22wbv4VPusX2r4SYuMh6x+
         btZu5rKbM2xCOAwDugaejMs+b+RkfOaoGxaT9S92HEUnLLKqHQo0ZpXOORH53c3gst2C
         vPG9oPd7zpbZ0uH31lL500GNM0n7wnRmCMxcR1kLIPQCck5d2EhhOPFHtOi+9ZXF0HT5
         uqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794964; x=1796399764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5naxuchaYmPf/rnxTXTXKeycEM+fUQZgvVnDXsuTwgc=;
        b=JC/FeCsRfxLFs+JS6I67N9ypXm4w/rSdr/CmdvN74YklkF7vL6hUu3sB88cozSmEMx
         v+NtiGy+jL5JzFL1JhEmhNg1AX85cyn4EbBKHuQBnYSBiQF+lD/K06AWt3np8Jtoptty
         i1kCdZD24he7Iq+Su5pb36v35+IOdpoY5iXpcHudyCCvPt29udC/UStK8rjs1gc+Z+lJ
         WXxlZUYE7ZgFjyR080PsI+LnH4sGzhPFD3Juq419wvmt5/Q0ruKsxj+PYdTW1Hicc8J8
         WqE7D1DeIMg5ttapUU3mF4Ty5Fr5t8toxdD4Pj0qjGXQz2/VgT1NON4qRaC7WrkNTAOg
         s3/g==
X-Gm-Message-State: APuU4Z/5QMqwoSxbcx0pFqIgsHmWhNEwA7MCbBXUMrWeCpxGA4V7FvTb
	D1WySLNasKcJneubT/xVNXWPRmZIykUKIn9xLNhbgSjAOgfaR8XAaiaUYjeQVBAa
X-Gm-Gg: AZFdTZcs05voK51M2CCeAuBO+OIL9LeMl7ENp2gZM6WTv6Z45JkCQREIl9Yht7uLRGW
	MPKgiQVZpYkZ4bSJTYEh8WKqr9CHTLl6RWtRNCb8Nk7XlbkadiG0dv7JdA47c3NvE3gLXr4D1j6
	tfYeTbba+65XWh1FfVlEFh6gEH6gA28vGZ+hycGJG/lxzlIYB7Lxw5QwA0X0OG69Xuyl5cNR73G
	Lmzc+l+4YDpAHmnIPl7xiZr1Vfalo4xRLDOF1lj0svXw91jhyh2ymw9IJfAL/vG67DixfZEyiQp
	Q+aU3HwXllGMIpiRXsBj60Xx5GQeb3EfprBQFqwhl/cdol6r5T5FSrsgKpSSfbi3SGqV3J9CMAO
	hVuF6kn1r9GKo+/YBL3tanfxHM42tolcN/MtZJPSs7Scm6L7Y3C2tCys9f7UC9shnYvrWtjUuP6
	IWSLD2USSYlSldxZX09z9LVoezplrVV6YGL0OZWVsCuFG5HPVgF8IRlMSnhwAT272TQh1WJ2BRS
	iEp5vjGYj3akKGw+1juTm9p39HML/TBQxfcPePju62GdGyJjsWSy0UT0jLClwP1XXVAzi7pKFPv
	nSQoj0HY1xR/jwSfKSEGFvR4dImSsG66NEmxBJKxuA9SzaQa0s++o9hTlpTm2bFsiq7b76Gjwhj
	38p7+iV2DSi74TsoXobsepwnPpFP4s43OxcdFbLaCaS12hHDZTPuYrBCRJXDY/J8G7Ci9XeZPil
	JnsVlGrMvdLzcNJaqEAv9nJsHSOVufj/oiAm5+xf3FQOi467Ee72th8wR4uimwvk3vXRryl0bc/
	ncWhvHrZ5E/gzUHZhgs7F10Xr/JrDxUK/ki4BkcWWPLooRBprmbxTn75HKvzUAIgqlbtrtLwpaA
	7LDc
X-Received: by 2002:a05:7022:4181:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1b5568abf0bmr34058828c88.4.1795794963730;
        Fri, 27 Nov 2026 07:56:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm58118218c88.8.2026.11.27.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:56:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] uftrace: Fix parallel build races
Date: Fri, 27 Nov 2026 07:55:57 -0800
Message-ID: <20261127155557.2874294-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
References: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133385
Content-Type: text/plain; charset="utf-8"

misc/symbols and misc/dbginfo link arch/<arch>/common.o, which only the
arch Makefile knows how to build. When the top-level make reaches it
first, it uses the builtin %.o rule without the -iquote include paths:

  arch/x86_64/common.c:10:10: fatal error: 'uftrace.h' file not found
  make: *** [<builtin>: .../arch/x86_64/common.o] Error 1

Make the object depend on uftrace-arch.a so the arch Makefile builds it.
Before the change, "make -j16 --shuffle=2" failed this way, and so did
building $(objdir)/misc/symbols alone in a clean tree.

Also backport the upstream fix for the libmcount dependency on version.h,
a second race that "make --shuffle" exposes in 0.20.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...d-error-with-make-shuffle-for-arch-c.patch | 44 +++++++++++++++++++
 ...-Fix-a-build-error-with-make-shuffle.patch | 43 ++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.20.bb  |  2 +
 3 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0002-build-Fix-a-build-error-with-make-shuffle-for-arch-c.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0003-build-Fix-a-build-error-with-make-shuffle.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0002-build-Fix-a-build-error-with-make-shuffle-for-arch-c.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0002-build-Fix-a-build-error-with-make-shuffle-for-arch-c.patch
new file mode 100644
index 0000000000..cd18eddb00
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0002-build-Fix-a-build-error-with-make-shuffle-for-arch-c.patch
@@ -0,0 +1,44 @@
+From 2347c298f7ac45f2a55dea065deadd0eabc410f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 26 Nov 2026 23:25:06 -0800
+Subject: [PATCH] build: Fix a build error with make --shuffle for arch
+ common.o
+
+The misc/symbols and misc/dbginfo link $(objdir)/arch/$(ARCH)/common.o
+but the top-level Makefile has no rule for it; it's built by the arch
+Makefile as a part of uftrace-arch.a.  When make reaches the object
+before uftrace-arch.a, it falls back to the builtin %.o rule which lacks
+the -iquote include paths (or fails with "No rule to make target" when
+objdir is different from srcdir):
+
+  $ make -j16 --shuffle=2
+  ...
+  arch/x86_64/common.c:10:10: fatal error: uftrace.h: No such file or directory
+  make: *** [<builtin>: .../arch/x86_64/common.o] Error 1
+
+Building the tool alone, like `make $PWD/misc/symbols` in a clean tree,
+fails the same way every time.
+
+Add a rule with an empty recipe that makes the object depend on
+uftrace-arch.a so that it's always built by the arch Makefile.
+
+Upstream-Status: Submitted [https://github.com/namhyung/uftrace/pull/2079]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index a4e43a12..a220cc86 100644
+--- a/Makefile
++++ b/Makefile
+@@ -316,6 +316,8 @@ $(LIBMCOUNT_ARCH_OBJS): $(wildcard $(srcdir)/arch/$(ARCH)/*.[cS]) $(LIBMCOUNT_DE
+ $(UFTRACE_ARCH_OBJS): $(wildcard $(srcdir)/arch/$(ARCH)/*.[cS]) $(COMMON_DEPS)
+ 	@$(MAKE) -B -C $(srcdir)/arch/$(ARCH) $@
+ 
++$(objdir)/arch/$(ARCH)/common.o: $(UFTRACE_ARCH_OBJS) ;
++
+ $(objdir)/uftrace.o: $(srcdir)/uftrace.c $(objdir)/version.h $(COMMON_DEPS)
+ 	$(QUIET_CC)$(CC) $(UFTRACE_CFLAGS) -c -o $@ $<
+ 
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0003-build-Fix-a-build-error-with-make-shuffle.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0003-build-Fix-a-build-error-with-make-shuffle.patch
new file mode 100644
index 0000000000..43bc24df07
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0003-build-Fix-a-build-error-with-make-shuffle.patch
@@ -0,0 +1,43 @@
+From a18631b7d579746bb91ae55f1d7701d57190012a Mon Sep 17 00:00:00 2001
+From: Namhyung Kim <namhyung@gmail.com>
+Date: Mon, 7 Sep 2026 08:39:29 -0400
+Subject: [PATCH] build: Fix a build error with make --shuffle
+
+The libmcount also has a dependency on version.h but it's not handled by
+make as it's built after the uftrace binary.  In fact, each variant of
+libmcount build should add the dependency for the mcount.c file.
+
+The Gentoo tinderbox CI found the issue when it randomized the make
+target ordering with `make --shuffle`.
+
+Fixed: #2070
+Upstream-Status: Backport [https://github.com/namhyung/uftrace/commit/cb0eec80fd149ce6ad0be2926094095b32ee704c]
+Signed-off-by: Namhyung Kim <namhyung@gmail.com>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a220cc86..7ce81f30 100644
+--- a/Makefile
++++ b/Makefile
+@@ -233,6 +233,9 @@ LIBMCOUNT_FAST_OBJS := $(patsubst $(objdir)/%.op,$(objdir)/%-fast.op,$(LIBMCOUNT
+ LIBMCOUNT_SINGLE_OBJS := $(patsubst $(objdir)/%.op,$(objdir)/%-single.op,$(LIBMCOUNT_OBJS))
+ LIBMCOUNT_FAST_SINGLE_OBJS := $(patsubst $(objdir)/%.op,$(objdir)/%-fast-single.op,$(LIBMCOUNT_OBJS))
+ 
++LIBMCOUNT_OBJS_VERSION := $(objdir)/libmcount/mcount.op $(objdir)/libmcount/mcount-single.op
++LIBMCOUNT_OBJS_VERSION += $(objdir)/libmcount/mcount-fast.op $(objdir)/libmcount/mcount-fast-single.op
++
+ LIBMCOUNT_UTILS_SRCS += $(srcdir)/utils/debug.c $(srcdir)/utils/regs.c
+ LIBMCOUNT_UTILS_SRCS += $(srcdir)/utils/rbtree.c $(srcdir)/utils/filter.c
+ LIBMCOUNT_UTILS_SRCS += $(srcdir)/utils/shmem.c $(srcdir)/utils/utils.c
+@@ -335,7 +338,7 @@ $(objdir)/misc/bench.o: $(srcdir)/misc/bench.c
+ 
+ $(objdir)/cmds/dump.o: $(C_STR_OBJS)
+ 
+-$(UFTRACE_OBJS_VERSION): $(objdir)/version.h
++$(UFTRACE_OBJS_VERSION) $(LIBMCOUNT_OBJS_VERSION): $(objdir)/version.h
+ 
+ $(filter-out $(objdir)/uftrace.o, $(UFTRACE_OBJS)): $(objdir)/%.o: $(srcdir)/%.c $(COMMON_DEPS)
+ 	$(QUIET_CC)$(CC) $(UFTRACE_CFLAGS) -c -o $@ $<
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb
index 28c2186418..80878ee296 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.20.bb
@@ -11,6 +11,8 @@ DEPENDS:append:libc-musl = " argp-standalone"
 SRCREV = "842ed731248a9daded38774d8fb26c7b09474461"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https;tag=v${PV} \
            file://0001-include-libgen.h-for-basename.patch \
+           file://0002-build-Fix-a-build-error-with-make-shuffle-for-arch-c.patch \
+           file://0003-build-Fix-a-build-error-with-make-shuffle.patch \
            "
 
 LDFLAGS:append:libc-musl = " -largp"
