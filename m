Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id DE8A07F7CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 03:42:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id h14so2919895pfe.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y5dYAuW8SwGi/JuaT5AUYE8FvleAHUf6M3zTRYHKWgw=;
	b=Oki11rHm3XL2J3HX3vaTBI1VRv9jc2mWWPuO0DolQykf1//8snkjtkA/OYyE8GApnU
	HBVctDuoRNst2ct1LBuR3cvsnfR1ZG3Sycr37E/M9UMIGGGYfi+GMhpmaul0Yww3kTw/
	oBCmlV1UvWLIDP41kf8TTyIiO0tRkJJKwnRI574W3fZRwGJYNlNRLPmDOAOmPxqjG+c8
	xeLvZFCDfY0ZAz5ejDq7avPuZmATdVwJNHWbhBAN1ybV1eguWzKqk4A6XQG0MPuZrAIp
	K8RykWyuLYZitB/6L2etq1XV13WTXcv9MjmAEAHUZn/NJKsNNIOiI8FszxrozWMeKwgO
	fEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y5dYAuW8SwGi/JuaT5AUYE8FvleAHUf6M3zTRYHKWgw=;
	b=NtjxzfvlPhDZc7vqg+V8t4ZIgbGiJpGYzaI5XxV4Gq+eJJeZcMlsepjXE7odl82jm7
	sHJn5e59+Kw56v18VzxXjAk3bIYkyqjKIGffMEhfH95bPg6Tjzz8f/yn1D+fts1ksd0j
	IiMdsMMl4XUgGVZuGr/yLtVbDZ3f+T7mbTNTL95UlWbecu2Xh8cpv97ErtJb2xysI22Z
	Q593bjcVdE3K29+L3n7JxgcL2sM9335aN+Wd9p3PFYk2iKtPD43V91H3p2cwS2PWchoI
	RXCWKMXXvQUy5gR0Z/Q5qHyDR/+PnIuYTZtQOcUVpf7HwzPl73NUPPyEra0vcjSi6VL0
	SX+g==
X-Gm-Message-State: APjAAAWfyyOpR2qhMWH2A+fb45i0NxcRcqTz2mMiNVzBDAA9GEKaoJTS
	aP9N4wGDmpse8X4vL9T19NthF2hjl3I=
X-Google-Smtp-Source: APXvYqz2nMed+UPo3UTZO3JBF7TC/OYgfCtRwyHSk3DlR8swwKnKGa4Konoszh+bTtI0EoSckWNqBw==
X-Received: by 2002:a63:646:: with SMTP id 67mr15753033pgg.150.1576467730487; 
	Sun, 15 Dec 2019 19:42:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	a22sm21336106pfk.108.2019.12.15.19.42.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 19:42:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 19:41:52 -0800
Message-Id: <20191216034155.2675900-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216034155.2675900-1-raj.khem@gmail.com>
References: <20191216034155.2675900-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] breakpad: Update to latest upstream
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
X-List-Received-Date: Mon, 16 Dec 2019 03:42:11 -0000
Content-Transfer-Encoding: 8bit

Drop upstreamed patch
Adjust syscalls for mips64
Drop fpregset_t/mcontext alternatives for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-add-stack-pointer-to-clobber-list.patch} | 57 +++++++-----------
 ...isable-calls-to-getcontext-with-musl.patch | 10 ++--
 ...001-lss-Match-syscalls-to-match-musl.patch | 25 +++++---
 .../breakpad/breakpad/mcontext.patch          | 59 -------------------
 .../recipes-devtools/breakpad/breakpad_git.bb | 12 ++--
 5 files changed, 50 insertions(+), 113 deletions(-)
 rename meta-oe/recipes-devtools/breakpad/breakpad/{dont-clobber-rsp.patch => 0001-Do-not-add-stack-pointer-to-clobber-list.patch} (52%)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
similarity index 52%
rename from meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
rename to meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
index edf903552d..6e58490980 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/dont-clobber-rsp.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
@@ -1,26 +1,26 @@
-From d1d7b616219fd47736c804ff4c2f393d7184a75b Mon Sep 17 00:00:00 2001
+From 5c63eb5d56abd4e5232add4727247965a863d851 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Dec 2018 16:58:04 -0800
-Subject: [PATCH] chromium: stack pointer clobber
+Date: Sun, 15 Dec 2019 14:02:45 -0800
+Subject: [PATCH] Do not add stack pointer to clobber list
 
-Do not add stack pointer to clobber list
+It was being ignored until now when gcc 9.0 became capable
+of flagging these silent ignore via [1].
 
-it was being ignored until gcc 9.0 became capable
-of flagging this silent ignoring via [1]
+We weren't actually clobbering the stack pointers here
+so it should not cause change in behavior.
 
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813<Paste>
+[1] https://gcc.gnu.org/PR52813
 
-Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/linux-syscall-support/+/1390160]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/third_party/lss/linux_syscall_support.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ linux_syscall_support.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: b/src/third_party/lss/linux_syscall_support.h
-===================================================================
---- a/src/third_party/lss/linux_syscall_support.h
-+++ b/src/third_party/lss/linux_syscall_support.h
-@@ -1957,7 +1957,7 @@ struct kernel_statfs {
+diff --git a/linux_syscall_support.h b/linux_syscall_support.h
+index 9276f56..6e73309 100644
+--- a/linux_syscall_support.h
++++ b/linux_syscall_support.h
+@@ -1955,7 +1955,7 @@ struct kernel_statfs {
                             LSS_ENTRYPOINT                                     \
                             "pop %%ebx"                                        \
                             args                                               \
@@ -29,16 +29,7 @@ Index: b/src/third_party/lss/linux_syscall_support.h
        LSS_RETURN(type,__res)
      #undef  _syscall0
      #define _syscall0(type,name)                                              \
-@@ -1966,7 +1966,7 @@ struct kernel_statfs {
-         __asm__ volatile(LSS_ENTRYPOINT                                       \
-                          : "=a" (__res)                                       \
-                          : "0" (__NR_##name)                                  \
--                         : "esp", "memory");                                  \
-+                         : "memory");                                         \
-         LSS_RETURN(type,__res);                                               \
-       }
-     #undef  _syscall1
-@@ -2014,7 +2014,7 @@ struct kernel_statfs {
+@@ -2012,7 +2012,7 @@ struct kernel_statfs {
                               : "i" (__NR_##name), "ri" ((long)(arg1)),        \
                                 "c" ((long)(arg2)), "d" ((long)(arg3)),        \
                                 "S" ((long)(arg4)), "D" ((long)(arg5))         \
@@ -47,7 +38,7 @@ Index: b/src/third_party/lss/linux_syscall_support.h
          LSS_RETURN(type,__res);                                               \
        }
      #undef  _syscall6
-@@ -2036,7 +2036,7 @@ struct kernel_statfs {
+@@ -2034,7 +2034,7 @@ struct kernel_statfs {
                               : "i" (__NR_##name),  "0" ((long)(&__s)),        \
                                 "c" ((long)(arg2)), "d" ((long)(arg3)),        \
                                 "S" ((long)(arg4)), "D" ((long)(arg5))         \
@@ -56,7 +47,7 @@ Index: b/src/third_party/lss/linux_syscall_support.h
          LSS_RETURN(type,__res);                                               \
        }
      LSS_INLINE int LSS_NAME(clone)(int (*fn)(void *), void *child_stack,
-@@ -2122,7 +2122,7 @@ struct kernel_statfs {
+@@ -2120,7 +2120,7 @@ struct kernel_statfs {
                             : "0"(-EINVAL), "i"(__NR_clone),
                               "m"(fn), "m"(child_stack), "m"(flags), "m"(arg),
                               "m"(parent_tidptr), "m"(newtls), "m"(child_tidptr)
@@ -65,12 +56,6 @@ Index: b/src/third_party/lss/linux_syscall_support.h
        LSS_RETURN(int, __res);
      }
  
-@@ -2407,7 +2407,7 @@ struct kernel_statfs {
-                                "d"(LSS_SYSCALL_ARG(parent_tidptr)),
-                                "r"(LSS_SYSCALL_ARG(newtls)),
-                                "r"(LSS_SYSCALL_ARG(child_tidptr))
--                             : "rsp", "memory", "r8", "r10", "r11", "rcx");
-+                             : "memory", "r8", "r10", "r11", "rcx");
-       }
-       LSS_RETURN(int, __res);
-     }
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
index bc79727edd..466abe5f87 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-disable-calls-to-getcontext-with-musl.patch
@@ -8,11 +8,9 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/client/linux/handler/exception_handler.cc | 17 +++++++++++++++++
  1 file changed, 17 insertions(+)
 
-Index: git/src/client/linux/handler/exception_handler.cc
-===================================================================
---- git.orig/src/client/linux/handler/exception_handler.cc
-+++ git/src/client/linux/handler/exception_handler.cc
-@@ -495,7 +495,19 @@ bool ExceptionHandler::SimulateSignalDel
+--- a/src/client/linux/handler/exception_handler.cc
++++ b/src/client/linux/handler/exception_handler.cc
+@@ -490,7 +490,19 @@ bool ExceptionHandler::SimulateSignalDel
    siginfo.si_code = SI_USER;
    siginfo.si_pid = getpid();
    ucontext_t context;
@@ -32,7 +30,7 @@ Index: git/src/client/linux/handler/exception_handler.cc
    return HandleSignal(sig, &siginfo, &context);
  }
  
-@@ -680,9 +692,14 @@ bool ExceptionHandler::WriteMinidump() {
+@@ -675,9 +687,14 @@ bool ExceptionHandler::WriteMinidump() {
    sys_prctl(PR_SET_DUMPABLE, 1, 0, 0, 0);
  
    CrashContext context;
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
index 2b892ad64f..bdd787afd5 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
@@ -8,11 +8,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  linux_syscall_support.h | 3 +++
  1 file changed, 3 insertions(+)
 
-Index: lss/linux_syscall_support.h
-===================================================================
---- lss.orig/linux_syscall_support.h
-+++ lss/linux_syscall_support.h
-@@ -793,6 +793,9 @@ struct kernel_statfs {
+--- a/linux_syscall_support.h
++++ b/linux_syscall_support.h
+@@ -816,6 +816,9 @@ struct kernel_statfs {
  #define FUTEX_TRYLOCK_PI_PRIVATE  (FUTEX_TRYLOCK_PI | FUTEX_PRIVATE_FLAG)
  #endif
  
@@ -22,7 +20,7 @@ Index: lss/linux_syscall_support.h
  
  #if defined(__x86_64__)
  #ifndef ARCH_SET_GS
-@@ -924,6 +927,7 @@ struct kernel_statfs {
+@@ -947,6 +950,7 @@ struct kernel_statfs {
  #ifndef __NR_fallocate
  #define __NR_fallocate          324
  #endif
@@ -30,7 +28,7 @@ Index: lss/linux_syscall_support.h
  /* End of i386 definitions                                                   */
  #elif defined(__ARM_ARCH_3__) || defined(__ARM_EABI__)
  #ifndef __NR_setresuid
-@@ -1211,6 +1215,12 @@ struct kernel_statfs {
+@@ -1239,6 +1243,12 @@ struct kernel_statfs {
  #ifndef __NR_fallocate
  #define __NR_fallocate          285
  #endif
@@ -43,3 +41,16 @@ Index: lss/linux_syscall_support.h
  /* End of x86-64 definitions                                                 */
  #elif defined(__mips__)
  #if _MIPS_SIM == _MIPS_SIM_ABI32
+@@ -1418,6 +1428,12 @@ struct kernel_statfs {
+ #ifndef __NR_ioprio_get
+ #define __NR_ioprio_get         (__NR_Linux + 274)
+ #endif
++
++#undef __NR_pread
++#define __NR_pread __NR_pread64
++#undef __NR_pwrite
++#define __NR_pwrite __NR_pwrite64
++
+ /* End of MIPS (64bit API) definitions */
+ #else
+ #ifndef __NR_setresuid
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
index 42e073b94d..51393967bc 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
@@ -3,48 +3,6 @@ map the mcontext_t structure for musl
 Upstream-Status: Inappropriate[need to consider Android]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: git/src/client/linux/dump_writer_common/thread_info.cc
-===================================================================
---- git.orig/src/client/linux/dump_writer_common/thread_info.cc
-+++ git/src/client/linux/dump_writer_common/thread_info.cc
-@@ -229,7 +229,6 @@ void ThreadInfo::FillCPUContext(RawConte
- }
- 
- #elif defined(__mips__)
--
- uintptr_t ThreadInfo::GetInstructionPointer() const {
-   return mcontext.pc;
- }
-@@ -263,8 +262,11 @@ void ThreadInfo::FillCPUContext(RawConte
-   out->cause = 0; // Not stored in mcontext
- 
-   for (int i = 0; i < MD_FLOATINGSAVEAREA_MIPS_FPR_COUNT; ++i)
-+#ifdef __GLIBC__
-     out->float_save.regs[i] = mcontext.fpregs.fp_r.fp_fregs[i]._fp_fregs;
--
-+#else
-+    out->float_save.regs[i] = mcontext.fpregs[i];
-+#endif
-   out->float_save.fpcsr = mcontext.fpc_csr;
- #if _MIPS_SIM == _ABIO32
-   out->float_save.fir = mcontext.fpc_eir;
-Index: git/src/client/linux/dump_writer_common/ucontext_reader.cc
-===================================================================
---- git.orig/src/client/linux/dump_writer_common/ucontext_reader.cc
-+++ git/src/client/linux/dump_writer_common/ucontext_reader.cc
-@@ -247,8 +247,11 @@ void UContextReader::FillCPUContext(RawC
-   out->cause = 0;  // Not reported in signal context.
- 
-   for (int i = 0; i < MD_FLOATINGSAVEAREA_MIPS_FPR_COUNT; ++i)
-+#ifdef __GLIBC__
-     out->float_save.regs[i] = uc->uc_mcontext.fpregs.fp_r.fp_dregs[i];
--
-+#else
-+    out->float_save.regs[i] = uc->uc_mcontext.fpregs[i];
-+#endif
-   out->float_save.fpcsr = uc->uc_mcontext.fpc_csr;
- #if _MIPS_SIM == _ABIO32
-   out->float_save.fir = uc->uc_mcontext.fpc_eir;  // Unused.
 Index: git/src/client/linux/minidump_writer/linux_core_dumper.cc
 ===================================================================
 --- git.orig/src/client/linux/minidump_writer/linux_core_dumper.cc
@@ -58,20 +16,3 @@ Index: git/src/client/linux/minidump_writer/linux_core_dumper.cc
          for (int i = EF_R0; i <= EF_R31; i++)
            info.mcontext.gregs[i - EF_R0] = status->pr_reg[i];
  #else  // __ANDROID__
-Index: git/src/tools/linux/md2core/minidump-2-core.cc
-===================================================================
---- git.orig/src/tools/linux/md2core/minidump-2-core.cc
-+++ git/src/tools/linux/md2core/minidump-2-core.cc
-@@ -516,8 +516,12 @@ ParseThreadRegisters(CrashedProcess::Thr
-   thread->mcontext.lo3 = rawregs->lo[2];
- 
-   for (int i = 0; i < MD_FLOATINGSAVEAREA_MIPS_FPR_COUNT; ++i) {
-+#ifdef __GLIBC__
-     thread->mcontext.fpregs.fp_r.fp_fregs[i]._fp_fregs =
-         rawregs->float_save.regs[i];
-+#else
-+    thread->mcontext.fpregs[i] = rawregs->float_save.regs[i];
-+#endif
-   }
- 
-   thread->mcontext.fpc_csr = rawregs->float_save.fpcsr;
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 06f3ee87da..ff5acbeac2 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -19,11 +19,11 @@ PV = "1.0"
 
 SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
 
-SRCREV_breakpad = "5467393a3d1e7ab929fd01d79971701bf4e2c2c6"
-#v1.8.0
-SRCREV_gtest = "ec44c6c1675c25b9827aacd08c02433cccde7780"
+SRCREV_breakpad = "0c0e24f709288a129d665ec27d6f089189318385"
+#v1.10.0
+SRCREV_gtest = "5ec7f0c4a113e2f18ac2c6cc7df51ad6afc24081"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
-SRCREV_lss = "a89bf7903f3169e6bc7b8efc10a73a7571de21cf"
+SRCREV_lss = "8048ece6c16c91acfe0d36d1d3cc0890ab6e945c"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad \
@@ -42,7 +42,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            file://0001-disable-calls-to-getcontext-with-musl.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
-           file://dont-clobber-rsp.patch;patchdir=src/third_party/lss;striplevel=4 \
+           file://0001-Do-not-add-stack-pointer-to-clobber-list.patch;patchdir=src/third_party/lss \
 "
 S = "${WORKDIR}/git"
 
@@ -121,3 +121,5 @@ breakpad_populate_sysroot() {
 #| make: *** [src/client/linux/handler/exception_handler.o] Error 1
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv4 = "arm"
+
+TOOLCHAIN = "gcc"
-- 
2.24.1


