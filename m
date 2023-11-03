Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B8CC07EB9
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.63859.1699041165176728042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TUWWOonF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mI8OUo1e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bebf92-6ab584d9-2366-4618-9be6-b16536789996-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EGfjQ5uiGicmmYS/8dfWVPonuO3MPq6WLfofERahvf0=;
	b=TUWWOonF8kRL86iksx3Kcy2DmLYEJkyRn/9Eft+fAtAwoHIt7dlKmno6gx9lXqiS
	Mjpovi25UJk5vjlUmcDWf8MPv8TW2cJX0a4wi3Qubfrj4xS66TMOoR1lq23iYspZUV3
	B+aNDshQjsExRleoCXTPr2L9fZDt17G4DtqfcUsA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EGfjQ5uiGicmmYS/8dfWVPonuO3MPq6WLfofERahvf0=;
	b=mI8OUo1epSlzkF8e5pugRjAmE9cNaep3rdarNZlJDDWtrSo/1CKueVzjOos5l+8g
	PB2kki3M/+5e81niFHCHAJPsW4zIdXFp/kexzfw4VchEBE49XLNuRZ1CZjp8vfXJaMx
	aApQYdwnDyMJYlG5jHDQ/fAe8Q7qCMGWKEL9nGHU=
Content-Type: multipart/mixed; boundary="===============2024898869318455939=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] concurrencykit: upgrading to 0.7.1 FAILED
Message-ID: <0101018b96bebf92-6ab584d9-2366-4618-9be6-b16536789996-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105890

--===============2024898869318455939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *concurrencykit* to *0.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-concurrencykit-upgrade-0.7.0-0.7.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 3aa986504f3324bfbb3ef5c64114737ca98424d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 11:56:07 +0000
Subject: [PATCH] concurrencykit: upgrade 0.7.0 -> 0.7.1

---
 ...ons-implement-aff_iterate-for-NetBSD.patch |  78 +++++++
 .../0002-configure-Fix-USE_CC_BUILTINS.patch  |  25 +++
 ...tput-operand-widths-on-x86-and-x86_6.patch | 197 ++++++++++++++++++
 ...n-t-pass-msse-msse2-with-disable-sse.patch |  32 +++
 ...-regressions-porting-to-dragonflybsd.patch |  70 +++++++
 ...itecture-diagram-workflow-to-reposit.patch |  98 +++++++++
 .../0007-Fix-tests-on-1-core-VM.patch         |  23 ++
 ...och_register-in-docs-to-send-three-a.patch |  69 ++++++
 ...SUPPORTED-from-thread_policy_set-on-.patch |  44 ++++
 ...on-Add-missing-include-for-errno-on-.patch |  23 ++
 ...-Add-riscv32-and-riscv64-support-194.patch |  57 +++++
 ...-config-to-use-the-latest-FreeBSD-de.patch |  35 ++++
 ...0013-Fixes-implicit-cast-build-error.patch |  22 ++
 .../concurrencykit/concurrencykit_git.bb      |  20 +-
 14 files changed, 790 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-regressions-implement-aff_iterate-for-NetBSD.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0002-configure-Fix-USE_CC_BUILTINS.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0003-ck_pr-fix-ptr-output-operand-widths-on-x86-and-x86_6.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0004-x86-Don-t-pass-msse-msse2-with-disable-sse.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0005-regressions-porting-to-dragonflybsd.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0006-Add-CodeSee-architecture-diagram-workflow-to-reposit.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0007-Fix-tests-on-1-core-VM.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0008-doc-update-ck_epoch_register-in-docs-to-send-three-a.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0009-Ignore-KERN_NOT_SUPPORTED-from-thread_policy_set-on-.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0010-regressions-common-Add-missing-include-for-errno-on-.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0011-build-Add-riscv32-and-riscv64-support-194.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0012-Update-Cirrus-CI-config-to-use-the-latest-FreeBSD-de.patch
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0013-Fixes-implicit-cast-build-error.patch

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-regressions-implement-aff_iterate-for-NetBSD.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-regressions-implement-aff_iterate-for-NetBSD.patch
new file mode 100644
index 000000000..c17aceb0b
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-regressions-implement-aff_iterate-for-NetBSD.patch
@@ -0,0 +1,78 @@
+From 3b551ab5a9a792e372d25be92c19803095b3fbfd Mon Sep 17 00:00:00 2001
+From: David Carlier <devnexen@gmail.com>
+Date: Wed, 30 Jun 2021 23:00:53 +0100
+Subject: [PATCH] regressions: implement aff_iterate() for NetBSD
+
+---
+ configure            |  3 +++
+ regressions/common.h | 36 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+)
+
+diff --git a/configure b/configure
+index 340e05c..6210ad0 100755
+--- a/configure
++++ b/configure
+@@ -741,6 +741,9 @@ elif test "$COMPILER" = "gcc" || test "$COMPILER" = "clang" || test "$COMPILER"
+ 		ENVIRONMENT=64
+ 		PLATFORM=x86_64
+ 	fi
++	if test "$SYSTEM" = "netbsd"; then
++		CFLAGS="$CFLAGS -D_NETBSD_SOURCE"
++	fi
+ else
+ 	assert "" "unknown compiler"
+ fi
+diff --git a/regressions/common.h b/regressions/common.h
+index 9cdc690..dbc51b9 100644
+--- a/regressions/common.h
++++ b/regressions/common.h
+@@ -44,6 +44,9 @@
+ #elif defined(__FreeBSD__)
+ #include <sys/param.h>
+ #include <sys/cpuset.h>
++#elif defined(__NetBSD__)
++#include <pthread.h>
++#include <sched.h>
+ #endif
+ 
+ #if defined(_WIN32)
+@@ -355,6 +358,39 @@ aff_iterate_core(struct affinity *acb CK_CC_UNUSED, unsigned int *core)
+ 	return (cpuset_setaffinity(CPU_LEVEL_WHICH, CPU_WHICH_TID, -1,
+ 	    sizeof(mask), &mask));
+ }
++#elif defined(__NetBSD__)
++CK_CC_UNUSED static int
++aff_iterate(struct affinity *acb CK_CC_UNUSED)
++{
++	unsigned int c;
++	cpuset_t *mask;
++
++	c = ck_pr_faa_uint(&acb->request, acb->delta) % CORES;
++	mask = cpuset_create();
++	if (!mask)
++            return -1;
++	cpuset_zero(mask);
++	cpuset_set(c, mask);
++	int ret = pthread_setaffinity_np(pthread_self(), cpuset_size(mask), mask);
++	cpuset_destroy(mask);
++	return ret;
++}
++
++CK_CC_UNUSED static int
++aff_iterate_core(struct affinity *acb CK_CC_UNUSED, unsigned int *core)
++{
++	cpuset_t *mask;
++
++	*core = ck_pr_faa_uint(&acb->request, acb->delta) % CORES;
++	mask = cpuset_create();
++	if (!mask)
++            return -1;
++	cpuset_zero(mask);
++	cpuset_set(*core, mask);
++	int ret = pthread_setaffinity_np(pthread_self(), cpuset_size(mask), mask);
++	cpuset_destroy(mask);
++	return ret;
++}
+ #else
+ CK_CC_UNUSED static int
+ aff_iterate(struct affinity *acb CK_CC_UNUSED)
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0002-configure-Fix-USE_CC_BUILTINS.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0002-configure-Fix-USE_CC_BUILTINS.patch
new file mode 100644
index 000000000..56345004d
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0002-configure-Fix-USE_CC_BUILTINS.patch
@@ -0,0 +1,25 @@
+From dcb6b232e7555d3d6989a9582fb3cacc8ac045af Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@debian.org>
+Date: Sun, 25 Jul 2021 17:01:19 +0300
+Subject: [PATCH] configure: Fix USE_CC_BUILTINS
+
+include/ck_pr.h uses CK_USE_CC_BUILTINS, not USE_CC_BUILTINS.
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 6210ad0..6a22dca 100755
+--- a/configure
++++ b/configure
+@@ -551,8 +551,8 @@ else
+ fi
+ 
+ if test "$USE_CC_BUILTINS"; then
+-	CFLAGS="$CFLAGS -DCK_CC_BUILTINS"
+-	PC_CFLAGS="-DCK_CC_BULITINS"
++	CFLAGS="$CFLAGS -DCK_USE_CC_BUILTINS=1"
++	PC_CFLAGS="-DCK_USE_CC_BUILTINS=1"
+ fi
+ 
+ # `which` on Solaris sucks
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0003-ck_pr-fix-ptr-output-operand-widths-on-x86-and-x86_6.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0003-ck_pr-fix-ptr-output-operand-widths-on-x86-and-x86_6.patch
new file mode 100644
index 000000000..469219c1d
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0003-ck_pr-fix-ptr-output-operand-widths-on-x86-and-x86_6.patch
@@ -0,0 +1,197 @@
+From 0c7a69aaef84f75793353295a5a63d2349996a73 Mon Sep 17 00:00:00 2001
+From: Mark Johnston <markjdb@gmail.com>
+Date: Wed, 21 Jul 2021 17:00:17 -0400
+Subject: [PATCH] ck_pr: fix ptr output operand widths on x86 and x86_64
+
+Operations on a variable of type "ptr" specify that the output operand
+can be a memory address.  Most such operations specify that the output
+operand is of type char, so it has width 1.  Convert these to uint64_t
+on x86_64 and uint32_t on x86.
+
+No functional change intended.  With clang 12.0.1 there is no difference
+in the generated code before and after this change.
+
+The compiler needs to know the true width of the destination operand in
+some cases.  In particular, when compiling with LLVM's MemorySanitizer
+enabled, the generated code updates shadow state to mark variables as
+initialized (or not) at byte granularity.  When instrumenting inline
+assembly, the compiler uses the width of the output operand(s) to figure
+out how many bytes of shadow state to update.  When the output operand
+is cast to char, the runtime would only update one byte of shadow state
+even though the store modified eight bytes of memory.  This led to false
+positives when enabling MSAN in the FreeBSD kernel.
+---
+ include/gcc/x86/ck_pr.h    | 24 ++++++++++++------------
+ include/gcc/x86_64/ck_pr.h | 26 +++++++++++++-------------
+ 2 files changed, 25 insertions(+), 25 deletions(-)
+
+diff --git a/include/gcc/x86/ck_pr.h b/include/gcc/x86/ck_pr.h
+index 5194dee..12291c8 100644
+--- a/include/gcc/x86/ck_pr.h
++++ b/include/gcc/x86/ck_pr.h
+@@ -120,7 +120,7 @@ CK_PR_FENCE(unlock, CK_MD_X86_MFENCE)
+ 		return v;					\
+ 	}
+ 
+-CK_PR_FAS(ptr, void, void *, char, "xchgl")
++CK_PR_FAS(ptr, void, void *, uint32_t, "xchgl")
+ 
+ #define CK_PR_FAS_S(S, T, I) CK_PR_FAS(S, T, T, T, I)
+ 
+@@ -146,7 +146,7 @@ CK_PR_FAS_S(8,  uint8_t,  "xchgb")
+ 		return (r);						\
+ 	}
+ 
+-CK_PR_LOAD(ptr, void, void *, char, "movl")
++CK_PR_LOAD(ptr, void, void *, uint32_t, "movl")
+ 
+ #define CK_PR_LOAD_S(S, T, I) CK_PR_LOAD(S, T, T, T, I)
+ 
+@@ -171,7 +171,7 @@ CK_PR_LOAD_S(8,  uint8_t,  "movb")
+ 		return;						\
+ 	}
+ 
+-CK_PR_STORE(ptr, void, const void *, char, "movl")
++CK_PR_STORE(ptr, void, const void *, uint32_t, "movl")
+ 
+ #define CK_PR_STORE_S(S, T, I) CK_PR_STORE(S, T, T, T, I)
+ 
+@@ -200,7 +200,7 @@ CK_PR_STORE_S(8,  uint8_t, "movb")
+ 		return (d);						\
+ 	}
+ 
+-CK_PR_FAA(ptr, void, uintptr_t, char, "xaddl")
++CK_PR_FAA(ptr, void, uintptr_t, uint32_t, "xaddl")
+ 
+ #define CK_PR_FAA_S(S, T, I) CK_PR_FAA(S, T, T, T, I)
+ 
+@@ -248,7 +248,7 @@ CK_PR_FAA_S(8,  uint8_t,  "xaddb")
+ #define CK_PR_UNARY_S(K, S, T, I) CK_PR_UNARY(K, S, T, T, I)
+ 
+ #define CK_PR_GENERATE(K)				\
+-	CK_PR_UNARY(K, ptr, void, char, #K "l") 	\
++	CK_PR_UNARY(K, ptr, void, uint32_t, #K "l") 	\
+ 	CK_PR_UNARY_S(K, char, char, #K "b")		\
+ 	CK_PR_UNARY_S(K, int, int, #K "l")		\
+ 	CK_PR_UNARY_S(K, uint, unsigned int, #K "l")	\
+@@ -288,7 +288,7 @@ CK_PR_GENERATE(not)
+ #define CK_PR_BINARY_S(K, S, T, I) CK_PR_BINARY(K, S, T, T, T, I)
+ 
+ #define CK_PR_GENERATE(K)					\
+-	CK_PR_BINARY(K, ptr, void, uintptr_t, char, #K "l")	\
++	CK_PR_BINARY(K, ptr, void, uintptr_t, uint32_t, #K "l")	\
+ 	CK_PR_BINARY_S(K, char, char, #K "b")			\
+ 	CK_PR_BINARY_S(K, int, int, #K "l")			\
+ 	CK_PR_BINARY_S(K, uint, unsigned int, #K "l")		\
+@@ -369,7 +369,7 @@ CK_PR_GENERATE(xor)
+ 	}
+ #endif
+ 
+-CK_PR_CAS(ptr, void, void *, char, "cmpxchgl")
++CK_PR_CAS(ptr, void, void *, uint32_t, "cmpxchgl")
+ 
+ #define CK_PR_CAS_S(S, T, I) CK_PR_CAS(S, T, T, T, I)
+ 
+@@ -401,11 +401,11 @@ CK_PR_CAS_S(8,  uint8_t,  "cmpxchgb")
+ 
+ #define CK_PR_BT_S(K, S, T, I) CK_PR_BT(K, S, T, T, T, I)
+ 
+-#define CK_PR_GENERATE(K)					\
+-	CK_PR_BT(K, ptr, void, uint32_t, char, #K "l %2, %0")	\
+-	CK_PR_BT_S(K, uint, unsigned int, #K "l %2, %0")	\
+-	CK_PR_BT_S(K, int, int, #K "l %2, %0")			\
+-	CK_PR_BT_S(K, 32, uint32_t, #K "l %2, %0")		\
++#define CK_PR_GENERATE(K)						\
++	CK_PR_BT(K, ptr, void, uint32_t, uint32_t, #K "l %2, %0")	\
++	CK_PR_BT_S(K, uint, unsigned int, #K "l %2, %0")		\
++	CK_PR_BT_S(K, int, int, #K "l %2, %0")				\
++	CK_PR_BT_S(K, 32, uint32_t, #K "l %2, %0")			\
+ 	CK_PR_BT_S(K, 16, uint16_t, #K "w %w2, %0")
+ 
+ CK_PR_GENERATE(btc)
+diff --git a/include/gcc/x86_64/ck_pr.h b/include/gcc/x86_64/ck_pr.h
+index 4222729..37678b1 100644
+--- a/include/gcc/x86_64/ck_pr.h
++++ b/include/gcc/x86_64/ck_pr.h
+@@ -149,7 +149,7 @@ ck_pr_rfo(const void *m)
+ 		return v;					\
+ 	}
+ 
+-CK_PR_FAS(ptr, void, void *, char, "xchgq")
++CK_PR_FAS(ptr, void, void *, uint64_t, "xchgq")
+ 
+ #define CK_PR_FAS_S(S, T, I) CK_PR_FAS(S, T, T, T, I)
+ 
+@@ -182,7 +182,7 @@ CK_PR_FAS_S(8,  uint8_t,  "xchgb")
+ 		return (r);					\
+ 	}
+ 
+-CK_PR_LOAD(ptr, void, void *, char, "movq")
++CK_PR_LOAD(ptr, void, void *, uint64_t, "movq")
+ 
+ #define CK_PR_LOAD_S(S, T, I) CK_PR_LOAD(S, T, T, T, I)
+ 
+@@ -264,7 +264,7 @@ CK_PR_LOAD_2(8, 16, uint8_t)
+ 		return;						\
+ 	}
+ 
+-CK_PR_STORE_IMM(ptr, void, const void *, char, "movq", CK_CC_IMM_U32)
++CK_PR_STORE_IMM(ptr, void, const void *, uint64_t, "movq", CK_CC_IMM_U32)
+ #ifndef CK_PR_DISABLE_DOUBLE
+ CK_PR_STORE(double, double, double, double, "movq")
+ #endif
+@@ -298,7 +298,7 @@ CK_PR_STORE_S(8,  uint8_t, "movb", CK_CC_IMM_U32)
+ 		return (d);						\
+ 	}
+ 
+-CK_PR_FAA(ptr, void, uintptr_t, char, "xaddq")
++CK_PR_FAA(ptr, void, uintptr_t, uint64_t, "xaddq")
+ 
+ #define CK_PR_FAA_S(S, T, I) CK_PR_FAA(S, T, T, T, I)
+ 
+@@ -347,7 +347,7 @@ CK_PR_FAA_S(8,  uint8_t,  "xaddb")
+ #define CK_PR_UNARY_S(K, S, T, I) CK_PR_UNARY(K, S, T, T, I)
+ 
+ #define CK_PR_GENERATE(K)				\
+-	CK_PR_UNARY(K, ptr, void, char, #K "q") 	\
++	CK_PR_UNARY(K, ptr, void, uint64_t, #K "q") 	\
+ 	CK_PR_UNARY_S(K, char, char, #K "b")		\
+ 	CK_PR_UNARY_S(K, int, int, #K "l")		\
+ 	CK_PR_UNARY_S(K, uint, unsigned int, #K "l")	\
+@@ -388,7 +388,7 @@ CK_PR_GENERATE(not)
+ #define CK_PR_BINARY_S(K, S, T, I, O) CK_PR_BINARY(K, S, T, T, T, I, O)
+ 
+ #define CK_PR_GENERATE(K)							\
+-	CK_PR_BINARY(K, ptr, void, uintptr_t, char, #K "q", CK_CC_IMM_U32)	\
++	CK_PR_BINARY(K, ptr, void, uintptr_t, uint64_t, #K "q", CK_CC_IMM_U32)	\
+ 	CK_PR_BINARY_S(K, char, char, #K "b", CK_CC_IMM_S32)			\
+ 	CK_PR_BINARY_S(K, int, int, #K "l", CK_CC_IMM_S32)			\
+ 	CK_PR_BINARY_S(K, uint, unsigned int, #K "l", CK_CC_IMM_U32)		\
+@@ -470,7 +470,7 @@ CK_PR_GENERATE(xor)
+ 	}
+ #endif
+ 
+-CK_PR_CAS(ptr, void, void *, char, "cmpxchgq")
++CK_PR_CAS(ptr, void, void *, uint64_t, "cmpxchgq")
+ 
+ #define CK_PR_CAS_S(S, T, I) CK_PR_CAS(S, T, T, T, I)
+ 
+@@ -594,12 +594,12 @@ CK_PR_CAS_V(8, 16, uint8_t)
+ 
+ #define CK_PR_BT_S(K, S, T, I) CK_PR_BT(K, S, T, T, T, I)
+ 
+-#define CK_PR_GENERATE(K)					\
+-	CK_PR_BT(K, ptr, void, uint64_t, char, #K "q %2, %0")	\
+-	CK_PR_BT_S(K, uint, unsigned int, #K "l %2, %0")	\
+-	CK_PR_BT_S(K, int, int, #K "l %2, %0")			\
+-	CK_PR_BT_S(K, 64, uint64_t, #K "q %2, %0")		\
+-	CK_PR_BT_S(K, 32, uint32_t, #K "l %2, %0")		\
++#define CK_PR_GENERATE(K)						\
++	CK_PR_BT(K, ptr, void, uint64_t, uint64_t, #K "q %2, %0")	\
++	CK_PR_BT_S(K, uint, unsigned int, #K "l %2, %0")		\
++	CK_PR_BT_S(K, int, int, #K "l %2, %0")				\
++	CK_PR_BT_S(K, 64, uint64_t, #K "q %2, %0")			\
++	CK_PR_BT_S(K, 32, uint32_t, #K "l %2, %0")			\
+ 	CK_PR_BT_S(K, 16, uint16_t, #K "w %w2, %0")
+ 
+ CK_PR_GENERATE(btc)
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0004-x86-Don-t-pass-msse-msse2-with-disable-sse.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0004-x86-Don-t-pass-msse-msse2-with-disable-sse.patch
new file mode 100644
index 000000000..7ff8018f1
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0004-x86-Don-t-pass-msse-msse2-with-disable-sse.patch
@@ -0,0 +1,32 @@
+From 928a59d17ae09dcdb241852cd334315424655b66 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@debian.org>
+Date: Wed, 25 Aug 2021 17:24:07 +0300
+Subject: [PATCH] x86: Don't pass -msse -msse2 with --disable-sse
+
+---
+ build/ck.build.x86 | 2 +-
+ configure          | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/build/ck.build.x86 b/build/ck.build.x86
+index 6e12783..4d07fa4 100644
+--- a/build/ck.build.x86
++++ b/build/ck.build.x86
+@@ -1,2 +1,2 @@
+-CFLAGS+=-m32 -D__x86__ -msse -msse2
++CFLAGS+=-m32 -D__x86__
+ LDFLAGS+=-m32
+diff --git a/configure b/configure
+index 6a22dca..742adfe 100755
+--- a/configure
++++ b/configure
+@@ -424,6 +424,9 @@ case $PLATFORM in
+ 		LDFLAGS="-m64 $LDFLAGS"
+ 		;;
+ 	i386|i486|i586|i686|i586_i686|pentium*|athlon*|k5|k6|k6_2|k6_3)
++		if test "${SSE_DISABLE}" = "CK_MD_SSE_ENABLE"; then
++			CFLAGS="$CFLAGS -msse -msse2"
++		fi
+ 		LSE_ENABLE="CK_MD_LSE_DISABLE"
+ 		MM="${MM:-"CK_MD_TSO"}"
+ 		case $SYSTEM in
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0005-regressions-porting-to-dragonflybsd.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0005-regressions-porting-to-dragonflybsd.patch
new file mode 100644
index 000000000..e1ed2af94
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0005-regressions-porting-to-dragonflybsd.patch
@@ -0,0 +1,70 @@
+From 1c4755bbc7ff7494280e0b7a48cb334e78943d4f Mon Sep 17 00:00:00 2001
+From: DC <devnexen@gmail.com>
+Date: Sun, 22 Aug 2021 17:02:45 +0100
+Subject: [PATCH] regressions porting to dragonflybsd
+
+---
+ configure            |  5 ++++-
+ regressions/common.h | 12 ++++++++++--
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 742adfe..1259ae2 100755
+--- a/configure
++++ b/configure
+@@ -738,7 +738,7 @@ elif test "$COMPILER" = "gcc" || test "$COMPILER" = "clang" || test "$COMPILER"
+ 		fi
+ 	fi
+ 
+-	CFLAGS="-D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -std=gnu99 -pedantic -Wall -W -Wundef -Wendif-labels -Wshadow -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wdisabled-optimization -fstrict-aliasing -O2 -pipe -Wno-parentheses $CFLAGS"
++	CFLAGS="-D_BSD_SOURCE -D_DEFAULT_SOURCE -std=gnu99 -pedantic -Wall -W -Wundef -Wendif-labels -Wshadow -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wdisabled-optimization -fstrict-aliasing -O2 -pipe -Wno-parentheses $CFLAGS"
+ 	PTHREAD_CFLAGS="-pthread"
+ 	if test "$COMPILER" = "mingw64"; then
+ 		ENVIRONMENT=64
+@@ -747,6 +747,9 @@ elif test "$COMPILER" = "gcc" || test "$COMPILER" = "clang" || test "$COMPILER"
+ 	if test "$SYSTEM" = "netbsd"; then
+ 		CFLAGS="$CFLAGS -D_NETBSD_SOURCE"
+ 	fi
++	if test "$SYSTEM" != "dragonflybsd"; then
++		CFLAGS="$CFLAGS -D_XOPEN_SOURCE=600"
++	fi
+ else
+ 	assert "" "unknown compiler"
+ fi
+diff --git a/regressions/common.h b/regressions/common.h
+index dbc51b9..9d01c83 100644
+--- a/regressions/common.h
++++ b/regressions/common.h
+@@ -34,10 +34,14 @@
+ #include <stdlib.h>
+ #include <sys/time.h>
+ 
+-#ifdef __linux__
++#if defined(__linux__) || defined(__DragonFly__)
+ #include <sched.h>
+ #include <sys/types.h>
+ #include <sys/syscall.h>
++#if defined(__DragonFly__)
++#include <sys/sched.h>
++#include <pthread_np.h>
++#endif
+ #elif defined(__MACH__)
+ #include <mach/mach.h>
+ #include <mach/thread_policy.h>
+@@ -269,11 +273,15 @@ struct affinity {
+ 
+ #define AFFINITY_INITIALIZER {0, 0}
+ 
+-#ifdef __linux__
++#if defined(__linux__) || defined(__DragonFly__)
+ static pid_t
+ common_gettid(void)
+ {
++#if defined(__linux__)
+ 	return syscall(__NR_gettid);
++#else
++	return pthread_getthreadid_np();
++#endif
+ }
+ 
+ CK_CC_UNUSED static int
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0006-Add-CodeSee-architecture-diagram-workflow-to-reposit.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0006-Add-CodeSee-architecture-diagram-workflow-to-reposit.patch
new file mode 100644
index 000000000..cea52e252
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0006-Add-CodeSee-architecture-diagram-workflow-to-reposit.patch
@@ -0,0 +1,98 @@
+From 683b2b981d7b3925bba8fedec363d2f2e8f522bf Mon Sep 17 00:00:00 2001
+From: "codesee-architecture-diagrams[bot]"
+ <86324825+codesee-architecture-diagrams[bot]@users.noreply.github.com>
+Date: Wed, 20 Oct 2021 23:48:26 +0000
+Subject: [PATCH] Add CodeSee architecture diagram workflow to repository
+
+---
+ .github/workflows/codesee-arch-diagram.yml | 81 ++++++++++++++++++++++
+ 1 file changed, 81 insertions(+)
+ create mode 100644 .github/workflows/codesee-arch-diagram.yml
+
+diff --git a/.github/workflows/codesee-arch-diagram.yml b/.github/workflows/codesee-arch-diagram.yml
+new file mode 100644
+index 0000000..5b4e581
+--- /dev/null
++++ b/.github/workflows/codesee-arch-diagram.yml
+@@ -0,0 +1,81 @@
++on:
++  push:
++    branches:
++      - master
++  pull_request_target:
++    types: [opened, synchronize, reopened]
++
++name: CodeSee Map
++
++jobs:
++  test_map_action:
++    runs-on: ubuntu-latest
++    continue-on-error: true
++    name: Run CodeSee Map Analysis
++    steps:
++      - name: checkout
++        id: checkout
++        uses: actions/checkout@v2
++        with:
++          repository: ${{ github.event.pull_request.head.repo.full_name }}
++          ref: ${{ github.event.pull_request.head.ref }}
++          fetch-depth: 0
++
++      # codesee-detect-languages has an output with id languages.
++      - name: Detect Languages
++        id: detect-languages
++        uses: Codesee-io/codesee-detect-languages-action@latest
++
++      - name: Configure JDK 16
++        uses: actions/setup-java@v2
++        if: ${{ fromJSON(steps.detect-languages.outputs.languages).java }}
++        with:
++          java-version: '16'
++          distribution: 'zulu'
++
++      # CodeSee Maps Go support uses a static binary so there's no setup step required.
++
++      - name: Configure Node.js 14
++        uses: actions/setup-node@v2
++        if: ${{ fromJSON(steps.detect-languages.outputs.languages).javascript }}
++        with:
++          node-version: '14'
++
++      - name: Configure Python 3.x
++        uses: actions/setup-python@v2
++        if: ${{ fromJSON(steps.detect-languages.outputs.languages).python }}
++        with:
++          python-version: '3.x'
++          architecture: 'x64'
++
++      - name: Configure Ruby '3.x'
++        uses: ruby/setup-ruby@v1
++        if: ${{ fromJSON(steps.detect-languages.outputs.languages).ruby }}
++        with:
++          ruby-version: '3.0'
++
++      # CodeSee Maps Rust support uses a static binary so there's no setup step required.
++
++      - name: Generate Map
++        id: generate-map
++        uses: Codesee-io/codesee-map-action@latest
++        with:
++          step: map
++          github_ref: ${{ github.ref }}
++          languages: ${{ steps.detect-languages.outputs.languages }}
++
++      - name: Upload Map
++        id: upload-map
++        uses: Codesee-io/codesee-map-action@latest
++        with:
++          step: mapUpload
++          api_token: ${{ secrets.CODESEE_ARCH_DIAG_API_TOKEN }}
++          github_ref: ${{ github.ref }}
++      
++      - name: Insights
++        id: insights
++        uses: Codesee-io/codesee-map-action@latest
++        with:
++          step: insights
++          api_token: ${{ secrets.CODESEE_ARCH_DIAG_API_TOKEN }}
++          github_ref: ${{ github.ref }}
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0007-Fix-tests-on-1-core-VM.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0007-Fix-tests-on-1-core-VM.patch
new file mode 100644
index 000000000..0e5fca9ce
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0007-Fix-tests-on-1-core-VM.patch
@@ -0,0 +1,23 @@
+From 56849a89c21dced0afd8b04483b5b34f15cd5c8a Mon Sep 17 00:00:00 2001
+From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
+Date: Fri, 5 Nov 2021 10:37:31 +0100
+Subject: [PATCH] Fix tests on 1-core VM
+
+Fixes #181
+---
+ regressions/ck_sequence/validate/ck_sequence.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regressions/ck_sequence/validate/ck_sequence.c b/regressions/ck_sequence/validate/ck_sequence.c
+index 47de852..5c85d44 100644
+--- a/regressions/ck_sequence/validate/ck_sequence.c
++++ b/regressions/ck_sequence/validate/ck_sequence.c
+@@ -124,7 +124,7 @@ main(int argc, char *argv[])
+ 
+ 	n_threads = atoi(argv[1]) - 1;
+ 	if (n_threads <= 0) {
+-		ck_error("ERROR: Number of threads must be greater than 0\n");
++		return 0; /* nothing to do */
+ 	}
+ 
+ 	threads = malloc(sizeof(pthread_t) * n_threads);
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0008-doc-update-ck_epoch_register-in-docs-to-send-three-a.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0008-doc-update-ck_epoch_register-in-docs-to-send-three-a.patch
new file mode 100644
index 000000000..86af8d6c0
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0008-doc-update-ck_epoch_register-in-docs-to-send-three-a.patch
@@ -0,0 +1,69 @@
+From 45dd434d320a6d70988c61ecf441fe2b1b2bf4be Mon Sep 17 00:00:00 2001
+From: Michael Grunder <michael.grunder@gmail.com>
+Date: Fri, 7 Jan 2022 16:28:11 -0800
+Subject: [PATCH] doc: update ck_epoch_register in docs to send three
+ arguments. (#187)
+
+Small change so the docs show the third void *cl argument to
+ck_epoch_register.
+
+From Michael Grunder.
+---
+ doc/ck_epoch_barrier     | 2 +-
+ doc/ck_epoch_call        | 2 +-
+ doc/ck_epoch_recycle     | 2 +-
+ doc/ck_epoch_synchronize | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/doc/ck_epoch_barrier b/doc/ck_epoch_barrier
+index a586145..2343800 100644
+--- a/doc/ck_epoch_barrier
++++ b/doc/ck_epoch_barrier
+@@ -68,7 +68,7 @@ function(void)
+ 	ck_stack_entry_t *s;
+ 
+ 	record = malloc(sizeof *record);
+-	ck_epoch_register(&epoch, record);
++	ck_epoch_register(&epoch, record, NULL);
+ 
+ 	/*
+ 	 * We are using an epoch section here to guarantee no
+diff --git a/doc/ck_epoch_call b/doc/ck_epoch_call
+index 7390642..fb6302d 100644
+--- a/doc/ck_epoch_call
++++ b/doc/ck_epoch_call
+@@ -89,7 +89,7 @@ function(void)
+ 	struct object *n;
+ 
+ 	record = malloc(sizeof *record);
+-	ck_epoch_register(&epoch, record);
++	ck_epoch_register(&epoch, record, NULL);
+ 
+ 	n = malloc(sizeof *n);
+ 	if (n == NULL)
+diff --git a/doc/ck_epoch_recycle b/doc/ck_epoch_recycle
+index 530079c..cfaa9f3 100644
+--- a/doc/ck_epoch_recycle
++++ b/doc/ck_epoch_recycle
+@@ -64,7 +64,7 @@ function(void)
+ 		if (record == NULL)
+ 			return;
+ 
+-		ck_epoch_register(&epoch, record);
++		ck_epoch_register(&epoch, record, NULL);
+ 	}
+ 
+ 	/*
+diff --git a/doc/ck_epoch_synchronize b/doc/ck_epoch_synchronize
+index 6e5f73d..7b4bf74 100644
+--- a/doc/ck_epoch_synchronize
++++ b/doc/ck_epoch_synchronize
+@@ -73,7 +73,7 @@ function(void)
+ 	ck_stack_entry_t *s;
+ 
+ 	record = malloc(sizeof *record);
+-	ck_epoch_register(&epoch, record);
++	ck_epoch_register(&epoch, record, NULL);
+ 
+ 	/*
+ 	 * We are using an epoch section here to guarantee no
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0009-Ignore-KERN_NOT_SUPPORTED-from-thread_policy_set-on-.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0009-Ignore-KERN_NOT_SUPPORTED-from-thread_policy_set-on-.patch
new file mode 100644
index 000000000..4d97cebaf
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0009-Ignore-KERN_NOT_SUPPORTED-from-thread_policy_set-on-.patch
@@ -0,0 +1,44 @@
+From 595f25589be8bc6affce331927e139b2e5d133ea Mon Sep 17 00:00:00 2001
+From: M Joonas Pihlaja <jpihlaja@backtrace.io>
+Date: Thu, 10 Feb 2022 15:23:30 +0200
+Subject: [PATCH] Ignore KERN_NOT_SUPPORTED from thread_policy_set on mach
+
+The `thread_policy_set` call in `aff_iterate` fails with
+`KERN_NOT_SUPPORTED` on M1 macbooks. The reported error from the
+regression tests is "Success" because `thread_policy_set` doesn't set
+errno.
+
+This patch converts `KERN_NOT_SUPPORTED` into a successful return and
+sets errno to `EINVAL` on other errors.  This is ok in the regression
+tests as there affinity binding is only advisory.
+
+Fixes #186
+---
+ regressions/common.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/regressions/common.h b/regressions/common.h
+index 9d01c83..0e682f4 100644
+--- a/regressions/common.h
++++ b/regressions/common.h
+@@ -320,13 +320,19 @@ aff_iterate(struct affinity *acb)
+ {
+ 	thread_affinity_policy_data_t policy;
+ 	unsigned int c;
++	int err;
+ 
+ 	c = ck_pr_faa_uint(&acb->request, acb->delta) % CORES;
+ 	policy.affinity_tag = c;
+-	return thread_policy_set(mach_thread_self(),
++	err = thread_policy_set(mach_thread_self(),
+ 				 THREAD_AFFINITY_POLICY,
+ 				 (thread_policy_t)&policy,
+ 				 THREAD_AFFINITY_POLICY_COUNT);
++	if (err == KERN_NOT_SUPPORTED)
++		return 0;
++	if (err != 0)
++		errno = EINVAL;
++	return err;
+ }
+ 
+ CK_CC_UNUSED static int
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0010-regressions-common-Add-missing-include-for-errno-on-.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0010-regressions-common-Add-missing-include-for-errno-on-.patch
new file mode 100644
index 000000000..9b6bc2369
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0010-regressions-common-Add-missing-include-for-errno-on-.patch
@@ -0,0 +1,23 @@
+From 85b930554baaa733074a3629e435850271b341d1 Mon Sep 17 00:00:00 2001
+From: M Joonas Pihlaja <jpihlaja@backtrace.io>
+Date: Fri, 11 Feb 2022 13:31:07 +0200
+Subject: [PATCH] regressions/common: Add missing include for errno on mach
+
+Didn't build everything from scratch when fixing #186 and missed
+that errno.h wasn't included on mach.
+---
+ regressions/common.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/regressions/common.h b/regressions/common.h
+index 0e682f4..c779a93 100644
+--- a/regressions/common.h
++++ b/regressions/common.h
+@@ -43,6 +43,7 @@
+ #include <pthread_np.h>
+ #endif
+ #elif defined(__MACH__)
++#include <errno.h>
+ #include <mach/mach.h>
+ #include <mach/thread_policy.h>
+ #elif defined(__FreeBSD__)
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0011-build-Add-riscv32-and-riscv64-support-194.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0011-build-Add-riscv32-and-riscv64-support-194.patch
new file mode 100644
index 000000000..d9480d2d0
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0011-build-Add-riscv32-and-riscv64-support-194.patch
@@ -0,0 +1,57 @@
+From e6b40afa7cb5631a0092797f6f0a5ae67cb2e66b Mon Sep 17 00:00:00 2001
+From: Lv 'ZETALOG' Zheng <zhenglv@hotmail.com>
+Date: Tue, 12 Jul 2022 01:16:28 +0800
+Subject: [PATCH] build: Add riscv32 and riscv64 support (#194)
+
+This patch adds riscv32/riscv64 cross compilation support. Notice
+that this patch only enforces default psABI for RV32G and RV64G.
+
+Reference: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc
+Signed-off-by: Lv Zheng <zhenglv@smart-core.cn>
+
+Co-authored-by: Lv Zheng <zhenglv@smart-core.cn>
+---
+ build/ck.build.riscv   |  1 +
+ build/ck.build.riscv64 |  1 +
+ configure              | 12 ++++++++++++
+ 3 files changed, 14 insertions(+)
+ create mode 100644 build/ck.build.riscv
+ create mode 100644 build/ck.build.riscv64
+
+diff --git a/build/ck.build.riscv b/build/ck.build.riscv
+new file mode 100644
+index 0000000..61e0033
+--- /dev/null
++++ b/build/ck.build.riscv
+@@ -0,0 +1 @@
++CFLAGS+=-mabi=ilp32
+diff --git a/build/ck.build.riscv64 b/build/ck.build.riscv64
+new file mode 100644
+index 0000000..9f89791
+--- /dev/null
++++ b/build/ck.build.riscv64
+@@ -0,0 +1 @@
++CFLAGS+=-mabi=lp64
+diff --git a/configure b/configure
+index 1259ae2..9066abb 100755
+--- a/configure
++++ b/configure
+@@ -526,6 +526,18 @@ case $PLATFORM in
+ 		PLATFORM=aarch64
+ 		ENVIRONMENT=64
+ 		;;
++	"riscv32"|"riscv")
++		RTM_ENABLE="CK_MD_RTM_DISABLE"
++		MM="${MM:-"CK_MD_RMO"}"
++		PLATFORM=riscv
++		ENVIRONMENT=32
++		;;
++	"riscv64")
++		RTM_ENABLE="CK_MD_RTM_DISABLE"
++		MM="${MM:-"CK_MD_RMO"}"
++		PLATFORM=riscv64
++		ENVIRONMENT=64
++		;;
+ 	"s390x")
+ 		RTM_ENABLE="CK_MD_RTM_DISABLE"
+ 		LSE_ENABLE="CK_MD_LSE_DISABLE"
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0012-Update-Cirrus-CI-config-to-use-the-latest-FreeBSD-de.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0012-Update-Cirrus-CI-config-to-use-the-latest-FreeBSD-de.patch
new file mode 100644
index 000000000..f8b8fc1ee
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0012-Update-Cirrus-CI-config-to-use-the-latest-FreeBSD-de.patch
@@ -0,0 +1,35 @@
+From 1fa64c1a53449b8ac3d6423804121efe75058d05 Mon Sep 17 00:00:00 2001
+From: Li-Wen Hsu <lwhsu@lwhsu.org>
+Date: Tue, 12 Jul 2022 01:16:40 +0800
+Subject: [PATCH] Update Cirrus CI config to use the latest FreeBSD development
+ versions (#195)
+
+---
+ .cirrus.yml | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/.cirrus.yml b/.cirrus.yml
+index 3960a06..52c1861 100644
+--- a/.cirrus.yml
++++ b/.cirrus.yml
+@@ -3,10 +3,16 @@ env:
+   ARCH: amd64
+ 
+ task:
+-  freebsd_instance:
+-    matrix:
+-      image: freebsd-12-0-release-amd64
+-      image: freebsd-11-2-release-amd64
++  matrix:
++   - name: freebsd12-amd64
++     freebsd_instance:
++       image_family: freebsd-12-3-snap
++   - name: freebsd13-amd64
++     freebsd_instance:
++       image_family: freebsd-13-1-snap
++   - name: freebsd14-amd64
++     freebsd_instance:
++       image_family: freebsd-14-0-snap
+   script:
+    - cc --version
+    - export CFLAGS="-DITERATE=400 -DPAIRS_S=100 -DITERATIONS=24"
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0013-Fixes-implicit-cast-build-error.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0013-Fixes-implicit-cast-build-error.patch
new file mode 100644
index 000000000..67457d220
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0013-Fixes-implicit-cast-build-error.patch
@@ -0,0 +1,22 @@
+From b684da82cbd2d583872608d596a0ddef6e950d18 Mon Sep 17 00:00:00 2001
+From: hankedan000 <dany32412@gmail.com>
+Date: Wed, 3 Aug 2022 04:33:51 +0100
+Subject: [PATCH] Fixes implicit cast build error
+
+---
+ include/ck_ring.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/ck_ring.h b/include/ck_ring.h
+index 9f6754e..3a52276 100644
+--- a/include/ck_ring.h
++++ b/include/ck_ring.h
+@@ -282,7 +282,7 @@ _ck_ring_enqueue_reserve_mp(struct ck_ring *ring,
+ 				if (size != NULL)
+ 					*size = (producer - consumer) & mask;
+ 
+-				return false;
++				return NULL;
+ 			}
+ 
+ 			producer = new_producer;
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 277fac9f7..c2f459ee2 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -7,12 +7,26 @@ LICENSE = "BSD-2-Clause & Apache-2.0"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"
 
-PV = "0.7.0+git${SRCPV}"
-SRCREV = "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
+PV = "0.7.1"
+SRCREV = "351415ccaa78798332e556f661fc7e832447f3da"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
 SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
            file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch \
-           file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch"
+           file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch \
+           file://0001-regressions-implement-aff_iterate-for-NetBSD.patch \
+           file://0002-configure-Fix-USE_CC_BUILTINS.patch \
+           file://0003-ck_pr-fix-ptr-output-operand-widths-on-x86-and-x86_6.patch \
+           file://0004-x86-Don-t-pass-msse-msse2-with-disable-sse.patch \
+           file://0005-regressions-porting-to-dragonflybsd.patch \
+           file://0006-Add-CodeSee-architecture-diagram-workflow-to-reposit.patch \
+           file://0007-Fix-tests-on-1-core-VM.patch \
+           file://0008-doc-update-ck_epoch_register-in-docs-to-send-three-a.patch \
+           file://0009-Ignore-KERN_NOT_SUPPORTED-from-thread_policy_set-on-.patch \
+           file://0010-regressions-common-Add-missing-include-for-errno-on-.patch \
+           file://0011-build-Add-riscv32-and-riscv64-support-194.patch \
+           file://0012-Update-Cirrus-CI-config-to-use-the-latest-FreeBSD-de.patch \
+           file://0013-Fixes-implicit-cast-build-error.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2024898869318455939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4910 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:dbf35acbc2e8cabdd21b19195d64d6fc9fb0078c"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 149 Local 138 Mirrors 0 Missed 11 Current 143 (92% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 155 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 159 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 160 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe concurrencykit-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe concurrencykit-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 266 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_fetch)
NOTE: Running setscene task 233 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 235 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe concurrencykit-0.7.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe concurrencykit-0.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 267 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 239 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe concurrencykit-0.7.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 247 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 249 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe concurrencykit-0.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 741 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_patch)
NOTE: recipe concurrencykit-0.7.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 292 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 860 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 871 of 886 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_collect_spdx_deps)
NOTE: recipe concurrencykit-0.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe concurrencykit-0.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe concurrencykit-0.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe concurrencykit-0.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe concurrencykit-0.7.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 871 tasks of which 866 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103115551.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103115551.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: concurrencykit-0.7.1-r0 do_patch: Applying patch '0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/concurrencykit/0.7.1/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/concurrencykit/0.7.1/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch
can't find file to patch at input line 20
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 00f822ab79b6c06936147af4d832e439cecf0fc0 Mon Sep 17 00:00:00 2001
|From: Khem Raj <raj.khem@gmail.com>
|Date: Sat, 7 Jan 2023 19:31:58 -0800
|Subject: [PATCH] build: Use ilp32d abi on riscv32 and lp64d on rv64
|
|ilp32d is common ABI used for linux distributions therefore a better
|default, similarily lp64d is common ABI for rv64 linux
|
|Upstream-Status: Submitted [https://github.com/concurrencykit/ck/pull/204]
|Signed-off-by: Khem Raj <raj.khem@gmail.com>
|---
| build/ck.build.riscv   | 2 +-
| build/ck.build.riscv64 | 2 +-
| 2 files changed, 2 insertions(+), 2 deletions(-)
|
|diff --git a/build/ck.build.riscv b/build/ck.build.riscv
|index 61e0033..11ac840 100644
|--- a/build/ck.build.riscv
|+++ b/build/ck.build.riscv
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 27
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/build/ck.build.riscv64 b/build/ck.build.riscv64
|index 9f89791..7639bd6 100644
|--- a/build/ck.build.riscv64
|+++ b/build/ck.build.riscv64
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/concurrencykit/0.7.1/temp/log.do_patch.4086535
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb:do_patch) failed with exit code '1'

--===============2024898869318455939==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-concurrencykit-upgrade-0.7.0-0.7.1.patch"

RnJvbSAzYWE5ODY1MDRmMzMyNGJmYmIzZWY1YzY0MTE0NzM3Y2E5ODQyNGQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxMTo1NjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNv
bmN1cnJlbmN5a2l0OiB1cGdyYWRlIDAuNy4wIC0+IDAuNy4xCgotLS0KIC4uLm9ucy1pbXBsZW1l
bnQtYWZmX2l0ZXJhdGUtZm9yLU5ldEJTRC5wYXRjaCB8ICA3OCArKysrKysrCiAuLi4vMDAwMi1j
b25maWd1cmUtRml4LVVTRV9DQ19CVUlMVElOUy5wYXRjaCAgfCAgMjUgKysrCiAuLi50cHV0LW9w
ZXJhbmQtd2lkdGhzLW9uLXg4Ni1hbmQteDg2XzYucGF0Y2ggfCAxOTcgKysrKysrKysrKysrKysr
KysrCiAuLi5uLXQtcGFzcy1tc3NlLW1zc2UyLXdpdGgtZGlzYWJsZS1zc2UucGF0Y2ggfCAgMzIg
KysrCiAuLi4tcmVncmVzc2lvbnMtcG9ydGluZy10by1kcmFnb25mbHlic2QucGF0Y2ggfCAgNzAg
KysrKysrKwogLi4uaXRlY3R1cmUtZGlhZ3JhbS13b3JrZmxvdy10by1yZXBvc2l0LnBhdGNoIHwg
IDk4ICsrKysrKysrKwogLi4uLzAwMDctRml4LXRlc3RzLW9uLTEtY29yZS1WTS5wYXRjaCAgICAg
ICAgIHwgIDIzICsrCiAuLi5vY2hfcmVnaXN0ZXItaW4tZG9jcy10by1zZW5kLXRocmVlLWEucGF0
Y2ggfCAgNjkgKysrKysrCiAuLi5TVVBQT1JURUQtZnJvbS10aHJlYWRfcG9saWN5X3NldC1vbi0u
cGF0Y2ggfCAgNDQgKysrKwogLi4ub24tQWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItZXJybm8tb24t
LnBhdGNoIHwgIDIzICsrCiAuLi4tQWRkLXJpc2N2MzItYW5kLXJpc2N2NjQtc3VwcG9ydC0xOTQu
cGF0Y2ggfCAgNTcgKysrKysKIC4uLi1jb25maWctdG8tdXNlLXRoZS1sYXRlc3QtRnJlZUJTRC1k
ZS5wYXRjaCB8ICAzNSArKysrCiAuLi4wMDEzLUZpeGVzLWltcGxpY2l0LWNhc3QtYnVpbGQtZXJy
b3IucGF0Y2ggfCAgMjIgKysKIC4uLi9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdF9naXQu
YmIgICAgICB8ICAyMCArLQogMTQgZmlsZXMgY2hhbmdlZCwgNzkwIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDEtcmVncmVzc2lvbnMtaW1wbGVtZW50
LWFmZl9pdGVyYXRlLWZvci1OZXRCU0QucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAwMi1jb25m
aWd1cmUtRml4LVVTRV9DQ19CVUlMVElOUy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEt
b2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDAzLWNr
X3ByLWZpeC1wdHItb3V0cHV0LW9wZXJhbmQtd2lkdGhzLW9uLXg4Ni1hbmQteDg2XzYucGF0Y2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lr
aXQvY29uY3VycmVuY3lraXQvMDAwNC14ODYtRG9uLXQtcGFzcy1tc3NlLW1zc2UyLXdpdGgtZGlz
YWJsZS1zc2UucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9v
bHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAwNS1yZWdyZXNzaW9ucy1wb3J0aW5n
LXRvLWRyYWdvbmZseWJzZC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDA2LUFkZC1Db2RlU2Vl
LWFyY2hpdGVjdHVyZS1kaWFncmFtLXdvcmtmbG93LXRvLXJlcG9zaXQucGF0Y2gKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3Vy
cmVuY3lraXQvMDAwNy1GaXgtdGVzdHMtb24tMS1jb3JlLVZNLnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5
a2l0LzAwMDgtZG9jLXVwZGF0ZS1ja19lcG9jaF9yZWdpc3Rlci1pbi1kb2NzLXRvLXNlbmQtdGhy
ZWUtYS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9j
b25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDA5LUlnbm9yZS1LRVJOX05PVF9TVVBQT1JU
RUQtZnJvbS10aHJlYWRfcG9saWN5X3NldC1vbi0ucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAx
MC1yZWdyZXNzaW9ucy1jb21tb24tQWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItZXJybm8tb24tLnBh
dGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJl
bmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMTEtYnVpbGQtQWRkLXJpc2N2MzItYW5kLXJpc2N2NjQt
c3VwcG9ydC0xOTQucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAxMi1VcGRhdGUtQ2lycnVzLUNJ
LWNvbmZpZy10by11c2UtdGhlLWxhdGVzdC1GcmVlQlNELWRlLnBhdGNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5
a2l0LzAwMTMtRml4ZXMtaW1wbGljaXQtY2FzdC1idWlsZC1lcnJvci5wYXRjaAoKZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtp
dC8wMDAxLXJlZ3Jlc3Npb25zLWltcGxlbWVudC1hZmZfaXRlcmF0ZS1mb3ItTmV0QlNELnBhdGNo
IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0
LzAwMDEtcmVncmVzc2lvbnMtaW1wbGVtZW50LWFmZl9pdGVyYXRlLWZvci1OZXRCU0QucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5jMTdhY2ViMGIKLS0tIC9kZXYv
bnVsbAorKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3Vy
cmVuY3lraXQvMDAwMS1yZWdyZXNzaW9ucy1pbXBsZW1lbnQtYWZmX2l0ZXJhdGUtZm9yLU5ldEJT
RC5wYXRjaApAQCAtMCwwICsxLDc4IEBACitGcm9tIDNiNTUxYWI1YTlhNzkyZTM3MmQyNWJlOTJj
MTk4MDMwOTViM2ZiZmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBEYXZpZCBDYXJs
aWVyIDxkZXZuZXhlbkBnbWFpbC5jb20+CitEYXRlOiBXZWQsIDMwIEp1biAyMDIxIDIzOjAwOjUz
ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHJlZ3Jlc3Npb25zOiBpbXBsZW1lbnQgYWZmX2l0ZXJh
dGUoKSBmb3IgTmV0QlNECisKKy0tLQorIGNvbmZpZ3VyZSAgICAgICAgICAgIHwgIDMgKysrCisg
cmVncmVzc2lvbnMvY29tbW9uLmggfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKKyAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBh
L2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQoraW5kZXggMzQwZTA1Yy4uNjIxMGFkMCAxMDA3NTUKKy0t
LSBhL2NvbmZpZ3VyZQorKysrIGIvY29uZmlndXJlCitAQCAtNzQxLDYgKzc0MSw5IEBAIGVsaWYg
dGVzdCAiJENPTVBJTEVSIiA9ICJnY2MiIHx8IHRlc3QgIiRDT01QSUxFUiIgPSAiY2xhbmciIHx8
IHRlc3QgIiRDT01QSUxFUiIKKyAJCUVOVklST05NRU5UPTY0CisgCQlQTEFURk9STT14ODZfNjQK
KyAJZmkKKysJaWYgdGVzdCAiJFNZU1RFTSIgPSAibmV0YnNkIjsgdGhlbgorKwkJQ0ZMQUdTPSIk
Q0ZMQUdTIC1EX05FVEJTRF9TT1VSQ0UiCisrCWZpCisgZWxzZQorIAlhc3NlcnQgIiIgInVua25v
d24gY29tcGlsZXIiCisgZmkKK2RpZmYgLS1naXQgYS9yZWdyZXNzaW9ucy9jb21tb24uaCBiL3Jl
Z3Jlc3Npb25zL2NvbW1vbi5oCitpbmRleCA5Y2RjNjkwLi5kYmM1MWI5IDEwMDY0NAorLS0tIGEv
cmVncmVzc2lvbnMvY29tbW9uLmgKKysrKyBiL3JlZ3Jlc3Npb25zL2NvbW1vbi5oCitAQCAtNDQs
NiArNDQsOSBAQAorICNlbGlmIGRlZmluZWQoX19GcmVlQlNEX18pCisgI2luY2x1ZGUgPHN5cy9w
YXJhbS5oPgorICNpbmNsdWRlIDxzeXMvY3B1c2V0Lmg+CisrI2VsaWYgZGVmaW5lZChfX05ldEJT
RF9fKQorKyNpbmNsdWRlIDxwdGhyZWFkLmg+CisrI2luY2x1ZGUgPHNjaGVkLmg+CisgI2VuZGlm
CisgCisgI2lmIGRlZmluZWQoX1dJTjMyKQorQEAgLTM1NSw2ICszNTgsMzkgQEAgYWZmX2l0ZXJh
dGVfY29yZShzdHJ1Y3QgYWZmaW5pdHkgKmFjYiBDS19DQ19VTlVTRUQsIHVuc2lnbmVkIGludCAq
Y29yZSkKKyAJcmV0dXJuIChjcHVzZXRfc2V0YWZmaW5pdHkoQ1BVX0xFVkVMX1dISUNILCBDUFVf
V0hJQ0hfVElELCAtMSwKKyAJICAgIHNpemVvZihtYXNrKSwgJm1hc2spKTsKKyB9CisrI2VsaWYg
ZGVmaW5lZChfX05ldEJTRF9fKQorK0NLX0NDX1VOVVNFRCBzdGF0aWMgaW50CisrYWZmX2l0ZXJh
dGUoc3RydWN0IGFmZmluaXR5ICphY2IgQ0tfQ0NfVU5VU0VEKQorK3sKKysJdW5zaWduZWQgaW50
IGM7CisrCWNwdXNldF90ICptYXNrOworKworKwljID0gY2tfcHJfZmFhX3VpbnQoJmFjYi0+cmVx
dWVzdCwgYWNiLT5kZWx0YSkgJSBDT1JFUzsKKysJbWFzayA9IGNwdXNldF9jcmVhdGUoKTsKKysJ
aWYgKCFtYXNrKQorKyAgICAgICAgICAgIHJldHVybiAtMTsKKysJY3B1c2V0X3plcm8obWFzayk7
CisrCWNwdXNldF9zZXQoYywgbWFzayk7CisrCWludCByZXQgPSBwdGhyZWFkX3NldGFmZmluaXR5
X25wKHB0aHJlYWRfc2VsZigpLCBjcHVzZXRfc2l6ZShtYXNrKSwgbWFzayk7CisrCWNwdXNldF9k
ZXN0cm95KG1hc2spOworKwlyZXR1cm4gcmV0OworK30KKysKKytDS19DQ19VTlVTRUQgc3RhdGlj
IGludAorK2FmZl9pdGVyYXRlX2NvcmUoc3RydWN0IGFmZmluaXR5ICphY2IgQ0tfQ0NfVU5VU0VE
LCB1bnNpZ25lZCBpbnQgKmNvcmUpCisreworKwljcHVzZXRfdCAqbWFzazsKKysKKysJKmNvcmUg
PSBja19wcl9mYWFfdWludCgmYWNiLT5yZXF1ZXN0LCBhY2ItPmRlbHRhKSAlIENPUkVTOworKwlt
YXNrID0gY3B1c2V0X2NyZWF0ZSgpOworKwlpZiAoIW1hc2spCisrICAgICAgICAgICAgcmV0dXJu
IC0xOworKwljcHVzZXRfemVybyhtYXNrKTsKKysJY3B1c2V0X3NldCgqY29yZSwgbWFzayk7Cisr
CWludCByZXQgPSBwdGhyZWFkX3NldGFmZmluaXR5X25wKHB0aHJlYWRfc2VsZigpLCBjcHVzZXRf
c2l6ZShtYXNrKSwgbWFzayk7CisrCWNwdXNldF9kZXN0cm95KG1hc2spOworKwlyZXR1cm4gcmV0
OworK30KKyAjZWxzZQorIENLX0NDX1VOVVNFRCBzdGF0aWMgaW50CisgYWZmX2l0ZXJhdGUoc3Ry
dWN0IGFmZmluaXR5ICphY2IgQ0tfQ0NfVU5VU0VEKQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDItY29uZmlndXJl
LUZpeC1VU0VfQ0NfQlVJTFRJTlMucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29u
Y3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAwMi1jb25maWd1cmUtRml4LVVTRV9DQ19CVUlM
VElOUy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjU2MzQ1MDA0
ZAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5j
eWtpdC9jb25jdXJyZW5jeWtpdC8wMDAyLWNvbmZpZ3VyZS1GaXgtVVNFX0NDX0JVSUxUSU5TLnBh
dGNoCkBAIC0wLDAgKzEsMjUgQEAKK0Zyb20gZGNiNmIyMzJlNzU1NWQzZDY5ODlhOTU4MmZiM2Nh
Y2M4YWMwNDVhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEFkcmlhbiBCdW5rIDxi
dW5rQGRlYmlhbi5vcmc+CitEYXRlOiBTdW4sIDI1IEp1bCAyMDIxIDE3OjAxOjE5ICswMzAwCitT
dWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogRml4IFVTRV9DQ19CVUlMVElOUworCitpbmNsdWRl
L2NrX3ByLmggdXNlcyBDS19VU0VfQ0NfQlVJTFRJTlMsIG5vdCBVU0VfQ0NfQlVJTFRJTlMuCist
LS0KKyBjb25maWd1cmUgfCA0ICsrLS0KKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCitp
bmRleCA2MjEwYWQwLi42YTIyZGNhIDEwMDc1NQorLS0tIGEvY29uZmlndXJlCisrKysgYi9jb25m
aWd1cmUKK0BAIC01NTEsOCArNTUxLDggQEAgZWxzZQorIGZpCisgCisgaWYgdGVzdCAiJFVTRV9D
Q19CVUlMVElOUyI7IHRoZW4KKy0JQ0ZMQUdTPSIkQ0ZMQUdTIC1EQ0tfQ0NfQlVJTFRJTlMiCist
CVBDX0NGTEFHUz0iLURDS19DQ19CVUxJVElOUyIKKysJQ0ZMQUdTPSIkQ0ZMQUdTIC1EQ0tfVVNF
X0NDX0JVSUxUSU5TPTEiCisrCVBDX0NGTEFHUz0iLURDS19VU0VfQ0NfQlVJTFRJTlM9MSIKKyBm
aQorIAorICMgYHdoaWNoYCBvbiBTb2xhcmlzIHN1Y2tzCmRpZmYgLS1naXQgYS9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAwMy1ja19wci1m
aXgtcHRyLW91dHB1dC1vcGVyYW5kLXdpZHRocy1vbi14ODYtYW5kLXg4Nl82LnBhdGNoIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDMt
Y2tfcHItZml4LXB0ci1vdXRwdXQtb3BlcmFuZC13aWR0aHMtb24teDg2LWFuZC14ODZfNi5wYXRj
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjQ2OTIxOWMxZAotLS0gL2Rl
di9udWxsCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25j
dXJyZW5jeWtpdC8wMDAzLWNrX3ByLWZpeC1wdHItb3V0cHV0LW9wZXJhbmQtd2lkdGhzLW9uLXg4
Ni1hbmQteDg2XzYucGF0Y2gKQEAgLTAsMCArMSwxOTcgQEAKK0Zyb20gMGM3YTY5YWFlZjg0Zjc1
NzkzMzUzMjk1YTVhNjNkMjM0OTk5NmE3MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IE1hcmsgSm9obnN0b24gPG1hcmtqZGJAZ21haWwuY29tPgorRGF0ZTogV2VkLCAyMSBKdWwgMjAy
MSAxNzowMDoxNyAtMDQwMAorU3ViamVjdDogW1BBVENIXSBja19wcjogZml4IHB0ciBvdXRwdXQg
b3BlcmFuZCB3aWR0aHMgb24geDg2IGFuZCB4ODZfNjQKKworT3BlcmF0aW9ucyBvbiBhIHZhcmlh
YmxlIG9mIHR5cGUgInB0ciIgc3BlY2lmeSB0aGF0IHRoZSBvdXRwdXQgb3BlcmFuZAorY2FuIGJl
IGEgbWVtb3J5IGFkZHJlc3MuICBNb3N0IHN1Y2ggb3BlcmF0aW9ucyBzcGVjaWZ5IHRoYXQgdGhl
IG91dHB1dAorb3BlcmFuZCBpcyBvZiB0eXBlIGNoYXIsIHNvIGl0IGhhcyB3aWR0aCAxLiAgQ29u
dmVydCB0aGVzZSB0byB1aW50NjRfdAorb24geDg2XzY0IGFuZCB1aW50MzJfdCBvbiB4ODYuCisK
K05vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLiAgV2l0aCBjbGFuZyAxMi4wLjEgdGhlcmUg
aXMgbm8gZGlmZmVyZW5jZQoraW4gdGhlIGdlbmVyYXRlZCBjb2RlIGJlZm9yZSBhbmQgYWZ0ZXIg
dGhpcyBjaGFuZ2UuCisKK1RoZSBjb21waWxlciBuZWVkcyB0byBrbm93IHRoZSB0cnVlIHdpZHRo
IG9mIHRoZSBkZXN0aW5hdGlvbiBvcGVyYW5kIGluCitzb21lIGNhc2VzLiAgSW4gcGFydGljdWxh
ciwgd2hlbiBjb21waWxpbmcgd2l0aCBMTFZNJ3MgTWVtb3J5U2FuaXRpemVyCitlbmFibGVkLCB0
aGUgZ2VuZXJhdGVkIGNvZGUgdXBkYXRlcyBzaGFkb3cgc3RhdGUgdG8gbWFyayB2YXJpYWJsZXMg
YXMKK2luaXRpYWxpemVkIChvciBub3QpIGF0IGJ5dGUgZ3JhbnVsYXJpdHkuICBXaGVuIGluc3Ry
dW1lbnRpbmcgaW5saW5lCithc3NlbWJseSwgdGhlIGNvbXBpbGVyIHVzZXMgdGhlIHdpZHRoIG9m
IHRoZSBvdXRwdXQgb3BlcmFuZChzKSB0byBmaWd1cmUKK291dCBob3cgbWFueSBieXRlcyBvZiBz
aGFkb3cgc3RhdGUgdG8gdXBkYXRlLiAgV2hlbiB0aGUgb3V0cHV0IG9wZXJhbmQKK2lzIGNhc3Qg
dG8gY2hhciwgdGhlIHJ1bnRpbWUgd291bGQgb25seSB1cGRhdGUgb25lIGJ5dGUgb2Ygc2hhZG93
IHN0YXRlCitldmVuIHRob3VnaCB0aGUgc3RvcmUgbW9kaWZpZWQgZWlnaHQgYnl0ZXMgb2YgbWVt
b3J5LiAgVGhpcyBsZWQgdG8gZmFsc2UKK3Bvc2l0aXZlcyB3aGVuIGVuYWJsaW5nIE1TQU4gaW4g
dGhlIEZyZWVCU0Qga2VybmVsLgorLS0tCisgaW5jbHVkZS9nY2MveDg2L2NrX3ByLmggICAgfCAy
NCArKysrKysrKysrKystLS0tLS0tLS0tLS0KKyBpbmNsdWRlL2djYy94ODZfNjQvY2tfcHIuaCB8
IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCisgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2luY2x1ZGUvZ2NjL3g4
Ni9ja19wci5oIGIvaW5jbHVkZS9nY2MveDg2L2NrX3ByLmgKK2luZGV4IDUxOTRkZWUuLjEyMjkx
YzggMTAwNjQ0CistLS0gYS9pbmNsdWRlL2djYy94ODYvY2tfcHIuaAorKysrIGIvaW5jbHVkZS9n
Y2MveDg2L2NrX3ByLmgKK0BAIC0xMjAsNyArMTIwLDcgQEAgQ0tfUFJfRkVOQ0UodW5sb2NrLCBD
S19NRF9YODZfTUZFTkNFKQorIAkJcmV0dXJuIHY7CQkJCQlcCisgCX0KKyAKKy1DS19QUl9GQVMo
cHRyLCB2b2lkLCB2b2lkICosIGNoYXIsICJ4Y2hnbCIpCisrQ0tfUFJfRkFTKHB0ciwgdm9pZCwg
dm9pZCAqLCB1aW50MzJfdCwgInhjaGdsIikKKyAKKyAjZGVmaW5lIENLX1BSX0ZBU19TKFMsIFQs
IEkpIENLX1BSX0ZBUyhTLCBULCBULCBULCBJKQorIAorQEAgLTE0Niw3ICsxNDYsNyBAQCBDS19Q
Ul9GQVNfUyg4LCAgdWludDhfdCwgICJ4Y2hnYiIpCisgCQlyZXR1cm4gKHIpOwkJCQkJCVwKKyAJ
fQorIAorLUNLX1BSX0xPQUQocHRyLCB2b2lkLCB2b2lkICosIGNoYXIsICJtb3ZsIikKKytDS19Q
Ul9MT0FEKHB0ciwgdm9pZCwgdm9pZCAqLCB1aW50MzJfdCwgIm1vdmwiKQorIAorICNkZWZpbmUg
Q0tfUFJfTE9BRF9TKFMsIFQsIEkpIENLX1BSX0xPQUQoUywgVCwgVCwgVCwgSSkKKyAKK0BAIC0x
NzEsNyArMTcxLDcgQEAgQ0tfUFJfTE9BRF9TKDgsICB1aW50OF90LCAgIm1vdmIiKQorIAkJcmV0
dXJuOwkJCQkJCVwKKyAJfQorIAorLUNLX1BSX1NUT1JFKHB0ciwgdm9pZCwgY29uc3Qgdm9pZCAq
LCBjaGFyLCAibW92bCIpCisrQ0tfUFJfU1RPUkUocHRyLCB2b2lkLCBjb25zdCB2b2lkICosIHVp
bnQzMl90LCAibW92bCIpCisgCisgI2RlZmluZSBDS19QUl9TVE9SRV9TKFMsIFQsIEkpIENLX1BS
X1NUT1JFKFMsIFQsIFQsIFQsIEkpCisgCitAQCAtMjAwLDcgKzIwMCw3IEBAIENLX1BSX1NUT1JF
X1MoOCwgIHVpbnQ4X3QsICJtb3ZiIikKKyAJCXJldHVybiAoZCk7CQkJCQkJXAorIAl9CisgCist
Q0tfUFJfRkFBKHB0ciwgdm9pZCwgdWludHB0cl90LCBjaGFyLCAieGFkZGwiKQorK0NLX1BSX0ZB
QShwdHIsIHZvaWQsIHVpbnRwdHJfdCwgdWludDMyX3QsICJ4YWRkbCIpCisgCisgI2RlZmluZSBD
S19QUl9GQUFfUyhTLCBULCBJKSBDS19QUl9GQUEoUywgVCwgVCwgVCwgSSkKKyAKK0BAIC0yNDgs
NyArMjQ4LDcgQEAgQ0tfUFJfRkFBX1MoOCwgIHVpbnQ4X3QsICAieGFkZGIiKQorICNkZWZpbmUg
Q0tfUFJfVU5BUllfUyhLLCBTLCBULCBJKSBDS19QUl9VTkFSWShLLCBTLCBULCBULCBJKQorIAor
ICNkZWZpbmUgQ0tfUFJfR0VORVJBVEUoSykJCQkJXAorLQlDS19QUl9VTkFSWShLLCBwdHIsIHZv
aWQsIGNoYXIsICNLICJsIikgCVwKKysJQ0tfUFJfVU5BUlkoSywgcHRyLCB2b2lkLCB1aW50MzJf
dCwgI0sgImwiKSAJXAorIAlDS19QUl9VTkFSWV9TKEssIGNoYXIsIGNoYXIsICNLICJiIikJCVwK
KyAJQ0tfUFJfVU5BUllfUyhLLCBpbnQsIGludCwgI0sgImwiKQkJXAorIAlDS19QUl9VTkFSWV9T
KEssIHVpbnQsIHVuc2lnbmVkIGludCwgI0sgImwiKQlcCitAQCAtMjg4LDcgKzI4OCw3IEBAIENL
X1BSX0dFTkVSQVRFKG5vdCkKKyAjZGVmaW5lIENLX1BSX0JJTkFSWV9TKEssIFMsIFQsIEkpIENL
X1BSX0JJTkFSWShLLCBTLCBULCBULCBULCBJKQorIAorICNkZWZpbmUgQ0tfUFJfR0VORVJBVEUo
SykJCQkJCVwKKy0JQ0tfUFJfQklOQVJZKEssIHB0ciwgdm9pZCwgdWludHB0cl90LCBjaGFyLCAj
SyAibCIpCVwKKysJQ0tfUFJfQklOQVJZKEssIHB0ciwgdm9pZCwgdWludHB0cl90LCB1aW50MzJf
dCwgI0sgImwiKQlcCisgCUNLX1BSX0JJTkFSWV9TKEssIGNoYXIsIGNoYXIsICNLICJiIikJCQlc
CisgCUNLX1BSX0JJTkFSWV9TKEssIGludCwgaW50LCAjSyAibCIpCQkJXAorIAlDS19QUl9CSU5B
UllfUyhLLCB1aW50LCB1bnNpZ25lZCBpbnQsICNLICJsIikJCVwKK0BAIC0zNjksNyArMzY5LDcg
QEAgQ0tfUFJfR0VORVJBVEUoeG9yKQorIAl9CisgI2VuZGlmCisgCistQ0tfUFJfQ0FTKHB0ciwg
dm9pZCwgdm9pZCAqLCBjaGFyLCAiY21weGNoZ2wiKQorK0NLX1BSX0NBUyhwdHIsIHZvaWQsIHZv
aWQgKiwgdWludDMyX3QsICJjbXB4Y2hnbCIpCisgCisgI2RlZmluZSBDS19QUl9DQVNfUyhTLCBU
LCBJKSBDS19QUl9DQVMoUywgVCwgVCwgVCwgSSkKKyAKK0BAIC00MDEsMTEgKzQwMSwxMSBAQCBD
S19QUl9DQVNfUyg4LCAgdWludDhfdCwgICJjbXB4Y2hnYiIpCisgCisgI2RlZmluZSBDS19QUl9C
VF9TKEssIFMsIFQsIEkpIENLX1BSX0JUKEssIFMsIFQsIFQsIFQsIEkpCisgCistI2RlZmluZSBD
S19QUl9HRU5FUkFURShLKQkJCQkJXAorLQlDS19QUl9CVChLLCBwdHIsIHZvaWQsIHVpbnQzMl90
LCBjaGFyLCAjSyAibCAlMiwgJTAiKQlcCistCUNLX1BSX0JUX1MoSywgdWludCwgdW5zaWduZWQg
aW50LCAjSyAibCAlMiwgJTAiKQlcCistCUNLX1BSX0JUX1MoSywgaW50LCBpbnQsICNLICJsICUy
LCAlMCIpCQkJXAorLQlDS19QUl9CVF9TKEssIDMyLCB1aW50MzJfdCwgI0sgImwgJTIsICUwIikJ
CVwKKysjZGVmaW5lIENLX1BSX0dFTkVSQVRFKEspCQkJCQkJXAorKwlDS19QUl9CVChLLCBwdHIs
IHZvaWQsIHVpbnQzMl90LCB1aW50MzJfdCwgI0sgImwgJTIsICUwIikJXAorKwlDS19QUl9CVF9T
KEssIHVpbnQsIHVuc2lnbmVkIGludCwgI0sgImwgJTIsICUwIikJCVwKKysJQ0tfUFJfQlRfUyhL
LCBpbnQsIGludCwgI0sgImwgJTIsICUwIikJCQkJXAorKwlDS19QUl9CVF9TKEssIDMyLCB1aW50
MzJfdCwgI0sgImwgJTIsICUwIikJCQlcCisgCUNLX1BSX0JUX1MoSywgMTYsIHVpbnQxNl90LCAj
SyAidyAldzIsICUwIikKKyAKKyBDS19QUl9HRU5FUkFURShidGMpCitkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9nY2MveDg2XzY0L2NrX3ByLmggYi9pbmNsdWRlL2djYy94ODZfNjQvY2tfcHIuaAoraW5k
ZXggNDIyMjcyOS4uMzc2NzhiMSAxMDA2NDQKKy0tLSBhL2luY2x1ZGUvZ2NjL3g4Nl82NC9ja19w
ci5oCisrKysgYi9pbmNsdWRlL2djYy94ODZfNjQvY2tfcHIuaAorQEAgLTE0OSw3ICsxNDksNyBA
QCBja19wcl9yZm8oY29uc3Qgdm9pZCAqbSkKKyAJCXJldHVybiB2OwkJCQkJXAorIAl9CisgCist
Q0tfUFJfRkFTKHB0ciwgdm9pZCwgdm9pZCAqLCBjaGFyLCAieGNoZ3EiKQorK0NLX1BSX0ZBUyhw
dHIsIHZvaWQsIHZvaWQgKiwgdWludDY0X3QsICJ4Y2hncSIpCisgCisgI2RlZmluZSBDS19QUl9G
QVNfUyhTLCBULCBJKSBDS19QUl9GQVMoUywgVCwgVCwgVCwgSSkKKyAKK0BAIC0xODIsNyArMTgy
LDcgQEAgQ0tfUFJfRkFTX1MoOCwgIHVpbnQ4X3QsICAieGNoZ2IiKQorIAkJcmV0dXJuIChyKTsJ
CQkJCVwKKyAJfQorIAorLUNLX1BSX0xPQUQocHRyLCB2b2lkLCB2b2lkICosIGNoYXIsICJtb3Zx
IikKKytDS19QUl9MT0FEKHB0ciwgdm9pZCwgdm9pZCAqLCB1aW50NjRfdCwgIm1vdnEiKQorIAor
ICNkZWZpbmUgQ0tfUFJfTE9BRF9TKFMsIFQsIEkpIENLX1BSX0xPQUQoUywgVCwgVCwgVCwgSSkK
KyAKK0BAIC0yNjQsNyArMjY0LDcgQEAgQ0tfUFJfTE9BRF8yKDgsIDE2LCB1aW50OF90KQorIAkJ
cmV0dXJuOwkJCQkJCVwKKyAJfQorIAorLUNLX1BSX1NUT1JFX0lNTShwdHIsIHZvaWQsIGNvbnN0
IHZvaWQgKiwgY2hhciwgIm1vdnEiLCBDS19DQ19JTU1fVTMyKQorK0NLX1BSX1NUT1JFX0lNTShw
dHIsIHZvaWQsIGNvbnN0IHZvaWQgKiwgdWludDY0X3QsICJtb3ZxIiwgQ0tfQ0NfSU1NX1UzMikK
KyAjaWZuZGVmIENLX1BSX0RJU0FCTEVfRE9VQkxFCisgQ0tfUFJfU1RPUkUoZG91YmxlLCBkb3Vi
bGUsIGRvdWJsZSwgZG91YmxlLCAibW92cSIpCisgI2VuZGlmCitAQCAtMjk4LDcgKzI5OCw3IEBA
IENLX1BSX1NUT1JFX1MoOCwgIHVpbnQ4X3QsICJtb3ZiIiwgQ0tfQ0NfSU1NX1UzMikKKyAJCXJl
dHVybiAoZCk7CQkJCQkJXAorIAl9CisgCistQ0tfUFJfRkFBKHB0ciwgdm9pZCwgdWludHB0cl90
LCBjaGFyLCAieGFkZHEiKQorK0NLX1BSX0ZBQShwdHIsIHZvaWQsIHVpbnRwdHJfdCwgdWludDY0
X3QsICJ4YWRkcSIpCisgCisgI2RlZmluZSBDS19QUl9GQUFfUyhTLCBULCBJKSBDS19QUl9GQUEo
UywgVCwgVCwgVCwgSSkKKyAKK0BAIC0zNDcsNyArMzQ3LDcgQEAgQ0tfUFJfRkFBX1MoOCwgIHVp
bnQ4X3QsICAieGFkZGIiKQorICNkZWZpbmUgQ0tfUFJfVU5BUllfUyhLLCBTLCBULCBJKSBDS19Q
Ul9VTkFSWShLLCBTLCBULCBULCBJKQorIAorICNkZWZpbmUgQ0tfUFJfR0VORVJBVEUoSykJCQkJ
XAorLQlDS19QUl9VTkFSWShLLCBwdHIsIHZvaWQsIGNoYXIsICNLICJxIikgCVwKKysJQ0tfUFJf
VU5BUlkoSywgcHRyLCB2b2lkLCB1aW50NjRfdCwgI0sgInEiKSAJXAorIAlDS19QUl9VTkFSWV9T
KEssIGNoYXIsIGNoYXIsICNLICJiIikJCVwKKyAJQ0tfUFJfVU5BUllfUyhLLCBpbnQsIGludCwg
I0sgImwiKQkJXAorIAlDS19QUl9VTkFSWV9TKEssIHVpbnQsIHVuc2lnbmVkIGludCwgI0sgImwi
KQlcCitAQCAtMzg4LDcgKzM4OCw3IEBAIENLX1BSX0dFTkVSQVRFKG5vdCkKKyAjZGVmaW5lIENL
X1BSX0JJTkFSWV9TKEssIFMsIFQsIEksIE8pIENLX1BSX0JJTkFSWShLLCBTLCBULCBULCBULCBJ
LCBPKQorIAorICNkZWZpbmUgQ0tfUFJfR0VORVJBVEUoSykJCQkJCQkJXAorLQlDS19QUl9CSU5B
UlkoSywgcHRyLCB2b2lkLCB1aW50cHRyX3QsIGNoYXIsICNLICJxIiwgQ0tfQ0NfSU1NX1UzMikJ
XAorKwlDS19QUl9CSU5BUlkoSywgcHRyLCB2b2lkLCB1aW50cHRyX3QsIHVpbnQ2NF90LCAjSyAi
cSIsIENLX0NDX0lNTV9VMzIpCVwKKyAJQ0tfUFJfQklOQVJZX1MoSywgY2hhciwgY2hhciwgI0sg
ImIiLCBDS19DQ19JTU1fUzMyKQkJCVwKKyAJQ0tfUFJfQklOQVJZX1MoSywgaW50LCBpbnQsICNL
ICJsIiwgQ0tfQ0NfSU1NX1MzMikJCQlcCisgCUNLX1BSX0JJTkFSWV9TKEssIHVpbnQsIHVuc2ln
bmVkIGludCwgI0sgImwiLCBDS19DQ19JTU1fVTMyKQkJXAorQEAgLTQ3MCw3ICs0NzAsNyBAQCBD
S19QUl9HRU5FUkFURSh4b3IpCisgCX0KKyAjZW5kaWYKKyAKKy1DS19QUl9DQVMocHRyLCB2b2lk
LCB2b2lkICosIGNoYXIsICJjbXB4Y2hncSIpCisrQ0tfUFJfQ0FTKHB0ciwgdm9pZCwgdm9pZCAq
LCB1aW50NjRfdCwgImNtcHhjaGdxIikKKyAKKyAjZGVmaW5lIENLX1BSX0NBU19TKFMsIFQsIEkp
IENLX1BSX0NBUyhTLCBULCBULCBULCBJKQorIAorQEAgLTU5NCwxMiArNTk0LDEyIEBAIENLX1BS
X0NBU19WKDgsIDE2LCB1aW50OF90KQorIAorICNkZWZpbmUgQ0tfUFJfQlRfUyhLLCBTLCBULCBJ
KSBDS19QUl9CVChLLCBTLCBULCBULCBULCBJKQorIAorLSNkZWZpbmUgQ0tfUFJfR0VORVJBVEUo
SykJCQkJCVwKKy0JQ0tfUFJfQlQoSywgcHRyLCB2b2lkLCB1aW50NjRfdCwgY2hhciwgI0sgInEg
JTIsICUwIikJXAorLQlDS19QUl9CVF9TKEssIHVpbnQsIHVuc2lnbmVkIGludCwgI0sgImwgJTIs
ICUwIikJXAorLQlDS19QUl9CVF9TKEssIGludCwgaW50LCAjSyAibCAlMiwgJTAiKQkJCVwKKy0J
Q0tfUFJfQlRfUyhLLCA2NCwgdWludDY0X3QsICNLICJxICUyLCAlMCIpCQlcCistCUNLX1BSX0JU
X1MoSywgMzIsIHVpbnQzMl90LCAjSyAibCAlMiwgJTAiKQkJXAorKyNkZWZpbmUgQ0tfUFJfR0VO
RVJBVEUoSykJCQkJCQlcCisrCUNLX1BSX0JUKEssIHB0ciwgdm9pZCwgdWludDY0X3QsIHVpbnQ2
NF90LCAjSyAicSAlMiwgJTAiKQlcCisrCUNLX1BSX0JUX1MoSywgdWludCwgdW5zaWduZWQgaW50
LCAjSyAibCAlMiwgJTAiKQkJXAorKwlDS19QUl9CVF9TKEssIGludCwgaW50LCAjSyAibCAlMiwg
JTAiKQkJCQlcCisrCUNLX1BSX0JUX1MoSywgNjQsIHVpbnQ2NF90LCAjSyAicSAlMiwgJTAiKQkJ
CVwKKysJQ0tfUFJfQlRfUyhLLCAzMiwgdWludDMyX3QsICNLICJsICUyLCAlMCIpCQkJXAorIAlD
S19QUl9CVF9TKEssIDE2LCB1aW50MTZfdCwgI0sgIncgJXcyLCAlMCIpCisgCisgQ0tfUFJfR0VO
RVJBVEUoYnRjKQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJl
bmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDQteDg2LURvbi10LXBhc3MtbXNzZS1tc3NlMi13aXRo
LWRpc2FibGUtc3NlLnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5
a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDQteDg2LURvbi10LXBhc3MtbXNzZS1tc3NlMi13aXRoLWRp
c2FibGUtc3NlLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uN2Zm
ODAxOGYxCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1
cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDQteDg2LURvbi10LXBhc3MtbXNzZS1tc3NlMi13
aXRoLWRpc2FibGUtc3NlLnBhdGNoCkBAIC0wLDAgKzEsMzIgQEAKK0Zyb20gOTI4YTU5ZDE3YWUw
OWRjZGIyNDE4NTJjZDMzNDMxNTQyNDY1NWI2NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b206IEFkcmlhbiBCdW5rIDxidW5rQGRlYmlhbi5vcmc+CitEYXRlOiBXZWQsIDI1IEF1ZyAyMDIx
IDE3OjI0OjA3ICswMzAwCitTdWJqZWN0OiBbUEFUQ0hdIHg4NjogRG9uJ3QgcGFzcyAtbXNzZSAt
bXNzZTIgd2l0aCAtLWRpc2FibGUtc3NlCisKKy0tLQorIGJ1aWxkL2NrLmJ1aWxkLng4NiB8IDIg
Ky0KKyBjb25maWd1cmUgICAgICAgICAgfCAzICsrKworIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9idWlsZC9jay5idWlsZC54
ODYgYi9idWlsZC9jay5idWlsZC54ODYKK2luZGV4IDZlMTI3ODMuLjRkMDdmYTQgMTAwNjQ0Cist
LS0gYS9idWlsZC9jay5idWlsZC54ODYKKysrKyBiL2J1aWxkL2NrLmJ1aWxkLng4NgorQEAgLTEs
MiArMSwyIEBACistQ0ZMQUdTKz0tbTMyIC1EX194ODZfXyAtbXNzZSAtbXNzZTIKKytDRkxBR1Mr
PS1tMzIgLURfX3g4Nl9fCisgTERGTEFHUys9LW0zMgorZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBi
L2NvbmZpZ3VyZQoraW5kZXggNmEyMmRjYS4uNzQyYWRmZSAxMDA3NTUKKy0tLSBhL2NvbmZpZ3Vy
ZQorKysrIGIvY29uZmlndXJlCitAQCAtNDI0LDYgKzQyNCw5IEBAIGNhc2UgJFBMQVRGT1JNIGlu
CisgCQlMREZMQUdTPSItbTY0ICRMREZMQUdTIgorIAkJOzsKKyAJaTM4NnxpNDg2fGk1ODZ8aTY4
NnxpNTg2X2k2ODZ8cGVudGl1bSp8YXRobG9uKnxrNXxrNnxrNl8yfGs2XzMpCisrCQlpZiB0ZXN0
ICIke1NTRV9ESVNBQkxFfSIgPSAiQ0tfTURfU1NFX0VOQUJMRSI7IHRoZW4KKysJCQlDRkxBR1M9
IiRDRkxBR1MgLW1zc2UgLW1zc2UyIgorKwkJZmkKKyAJCUxTRV9FTkFCTEU9IkNLX01EX0xTRV9E
SVNBQkxFIgorIAkJTU09IiR7TU06LSJDS19NRF9UU08ifSIKKyAJCWNhc2UgJFNZU1RFTSBpbgpk
aWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1
cnJlbmN5a2l0LzAwMDUtcmVncmVzc2lvbnMtcG9ydGluZy10by1kcmFnb25mbHlic2QucGF0Y2gg
Yi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQv
MDAwNS1yZWdyZXNzaW9ucy1wb3J0aW5nLXRvLWRyYWdvbmZseWJzZC5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmUxZWQyYWY5NAotLS0gL2Rldi9udWxsCisrKyBi
L21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8w
MDA1LXJlZ3Jlc3Npb25zLXBvcnRpbmctdG8tZHJhZ29uZmx5YnNkLnBhdGNoCkBAIC0wLDAgKzEs
NzAgQEAKK0Zyb20gMWM0NzU1YmJjN2ZmNzQ5NDI4MGUwYjdhNDhjYjMzNGU3ODk0M2Q0ZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IERDIDxkZXZuZXhlbkBnbWFpbC5jb20+CitEYXRl
OiBTdW4sIDIyIEF1ZyAyMDIxIDE3OjAyOjQ1ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHJlZ3Jl
c3Npb25zIHBvcnRpbmcgdG8gZHJhZ29uZmx5YnNkCisKKy0tLQorIGNvbmZpZ3VyZSAgICAgICAg
ICAgIHwgIDUgKysrKy0KKyByZWdyZXNzaW9ucy9jb21tb24uaCB8IDEyICsrKysrKysrKystLQor
IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlm
ZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQoraW5kZXggNzQyYWRmZS4uMTI1OWFlMiAx
MDA3NTUKKy0tLSBhL2NvbmZpZ3VyZQorKysrIGIvY29uZmlndXJlCitAQCAtNzM4LDcgKzczOCw3
IEBAIGVsaWYgdGVzdCAiJENPTVBJTEVSIiA9ICJnY2MiIHx8IHRlc3QgIiRDT01QSUxFUiIgPSAi
Y2xhbmciIHx8IHRlc3QgIiRDT01QSUxFUiIKKyAJCWZpCisgCWZpCisgCistCUNGTEFHUz0iLURf
WE9QRU5fU09VUkNFPTYwMCAtRF9CU0RfU09VUkNFIC1EX0RFRkFVTFRfU09VUkNFIC1zdGQ9Z251
OTkgLXBlZGFudGljIC1XYWxsIC1XIC1XdW5kZWYgLVdlbmRpZi1sYWJlbHMgLVdzaGFkb3cgLVdw
b2ludGVyLWFyaXRoIC1XY2FzdC1hbGlnbiAtV2Nhc3QtcXVhbCAtV3dyaXRlLXN0cmluZ3MgLVdz
dHJpY3QtcHJvdG90eXBlcyAtV21pc3NpbmctcHJvdG90eXBlcyAtV25lc3RlZC1leHRlcm5zIC1X
aW5saW5lIC1XZGlzYWJsZWQtb3B0aW1pemF0aW9uIC1mc3RyaWN0LWFsaWFzaW5nIC1PMiAtcGlw
ZSAtV25vLXBhcmVudGhlc2VzICRDRkxBR1MiCisrCUNGTEFHUz0iLURfQlNEX1NPVVJDRSAtRF9E
RUZBVUxUX1NPVVJDRSAtc3RkPWdudTk5IC1wZWRhbnRpYyAtV2FsbCAtVyAtV3VuZGVmIC1XZW5k
aWYtbGFiZWxzIC1Xc2hhZG93IC1XcG9pbnRlci1hcml0aCAtV2Nhc3QtYWxpZ24gLVdjYXN0LXF1
YWwgLVd3cml0ZS1zdHJpbmdzIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdtaXNzaW5nLXByb3RvdHlw
ZXMgLVduZXN0ZWQtZXh0ZXJucyAtV2lubGluZSAtV2Rpc2FibGVkLW9wdGltaXphdGlvbiAtZnN0
cmljdC1hbGlhc2luZyAtTzIgLXBpcGUgLVduby1wYXJlbnRoZXNlcyAkQ0ZMQUdTIgorIAlQVEhS
RUFEX0NGTEFHUz0iLXB0aHJlYWQiCisgCWlmIHRlc3QgIiRDT01QSUxFUiIgPSAibWluZ3c2NCI7
IHRoZW4KKyAJCUVOVklST05NRU5UPTY0CitAQCAtNzQ3LDYgKzc0Nyw5IEBAIGVsaWYgdGVzdCAi
JENPTVBJTEVSIiA9ICJnY2MiIHx8IHRlc3QgIiRDT01QSUxFUiIgPSAiY2xhbmciIHx8IHRlc3Qg
IiRDT01QSUxFUiIKKyAJaWYgdGVzdCAiJFNZU1RFTSIgPSAibmV0YnNkIjsgdGhlbgorIAkJQ0ZM
QUdTPSIkQ0ZMQUdTIC1EX05FVEJTRF9TT1VSQ0UiCisgCWZpCisrCWlmIHRlc3QgIiRTWVNURU0i
ICE9ICJkcmFnb25mbHlic2QiOyB0aGVuCisrCQlDRkxBR1M9IiRDRkxBR1MgLURfWE9QRU5fU09V
UkNFPTYwMCIKKysJZmkKKyBlbHNlCisgCWFzc2VydCAiIiAidW5rbm93biBjb21waWxlciIKKyBm
aQorZGlmZiAtLWdpdCBhL3JlZ3Jlc3Npb25zL2NvbW1vbi5oIGIvcmVncmVzc2lvbnMvY29tbW9u
LmgKK2luZGV4IGRiYzUxYjkuLjlkMDFjODMgMTAwNjQ0CistLS0gYS9yZWdyZXNzaW9ucy9jb21t
b24uaAorKysrIGIvcmVncmVzc2lvbnMvY29tbW9uLmgKK0BAIC0zNCwxMCArMzQsMTQgQEAKKyAj
aW5jbHVkZSA8c3RkbGliLmg+CisgI2luY2x1ZGUgPHN5cy90aW1lLmg+CisgCistI2lmZGVmIF9f
bGludXhfXworKyNpZiBkZWZpbmVkKF9fbGludXhfXykgfHwgZGVmaW5lZChfX0RyYWdvbkZseV9f
KQorICNpbmNsdWRlIDxzY2hlZC5oPgorICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KKyAjaW5jbHVk
ZSA8c3lzL3N5c2NhbGwuaD4KKysjaWYgZGVmaW5lZChfX0RyYWdvbkZseV9fKQorKyNpbmNsdWRl
IDxzeXMvc2NoZWQuaD4KKysjaW5jbHVkZSA8cHRocmVhZF9ucC5oPgorKyNlbmRpZgorICNlbGlm
IGRlZmluZWQoX19NQUNIX18pCisgI2luY2x1ZGUgPG1hY2gvbWFjaC5oPgorICNpbmNsdWRlIDxt
YWNoL3RocmVhZF9wb2xpY3kuaD4KK0BAIC0yNjksMTEgKzI3MywxNSBAQCBzdHJ1Y3QgYWZmaW5p
dHkgeworIAorICNkZWZpbmUgQUZGSU5JVFlfSU5JVElBTElaRVIgezAsIDB9CisgCistI2lmZGVm
IF9fbGludXhfXworKyNpZiBkZWZpbmVkKF9fbGludXhfXykgfHwgZGVmaW5lZChfX0RyYWdvbkZs
eV9fKQorIHN0YXRpYyBwaWRfdAorIGNvbW1vbl9nZXR0aWQodm9pZCkKKyB7CisrI2lmIGRlZmlu
ZWQoX19saW51eF9fKQorIAlyZXR1cm4gc3lzY2FsbChfX05SX2dldHRpZCk7CisrI2Vsc2UKKysJ
cmV0dXJuIHB0aHJlYWRfZ2V0dGhyZWFkaWRfbnAoKTsKKysjZW5kaWYKKyB9CisgCisgQ0tfQ0Nf
VU5VU0VEIHN0YXRpYyBpbnQKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9j
b25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDA2LUFkZC1Db2RlU2VlLWFyY2hpdGVjdHVy
ZS1kaWFncmFtLXdvcmtmbG93LXRvLXJlcG9zaXQucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAwNi1BZGQtQ29kZVNlZS1hcmNo
aXRlY3R1cmUtZGlhZ3JhbS13b3JrZmxvdy10by1yZXBvc2l0LnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uY2VhNTJlMjUyCi0tLSAvZGV2L251bGwKKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDYt
QWRkLUNvZGVTZWUtYXJjaGl0ZWN0dXJlLWRpYWdyYW0td29ya2Zsb3ctdG8tcmVwb3NpdC5wYXRj
aApAQCAtMCwwICsxLDk4IEBACitGcm9tIDY4M2IyYjk4MWQ3YjM5MjViYmE4ZmVkZWMzNjNkMmYy
ZThmNTIyYmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiAiY29kZXNlZS1hcmNoaXRl
Y3R1cmUtZGlhZ3JhbXNbYm90XSIKKyA8ODYzMjQ4MjUrY29kZXNlZS1hcmNoaXRlY3R1cmUtZGlh
Z3JhbXNbYm90XUB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+CitEYXRlOiBXZWQsIDIwIE9jdCAy
MDIxIDIzOjQ4OjI2ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIEFkZCBDb2RlU2VlIGFyY2hpdGVj
dHVyZSBkaWFncmFtIHdvcmtmbG93IHRvIHJlcG9zaXRvcnkKKworLS0tCisgLmdpdGh1Yi93b3Jr
Zmxvd3MvY29kZXNlZS1hcmNoLWRpYWdyYW0ueW1sIHwgODEgKysrKysrKysrKysrKysrKysrKysr
KworIDEgZmlsZSBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCisgY3JlYXRlIG1vZGUgMTAwNjQ0
IC5naXRodWIvd29ya2Zsb3dzL2NvZGVzZWUtYXJjaC1kaWFncmFtLnltbAorCitkaWZmIC0tZ2l0
IGEvLmdpdGh1Yi93b3JrZmxvd3MvY29kZXNlZS1hcmNoLWRpYWdyYW0ueW1sIGIvLmdpdGh1Yi93
b3JrZmxvd3MvY29kZXNlZS1hcmNoLWRpYWdyYW0ueW1sCituZXcgZmlsZSBtb2RlIDEwMDY0NAor
aW5kZXggMDAwMDAwMC4uNWI0ZTU4MQorLS0tIC9kZXYvbnVsbAorKysrIGIvLmdpdGh1Yi93b3Jr
Zmxvd3MvY29kZXNlZS1hcmNoLWRpYWdyYW0ueW1sCitAQCAtMCwwICsxLDgxIEBACisrb246Cisr
ICBwdXNoOgorKyAgICBicmFuY2hlczoKKysgICAgICAtIG1hc3RlcgorKyAgcHVsbF9yZXF1ZXN0
X3RhcmdldDoKKysgICAgdHlwZXM6IFtvcGVuZWQsIHN5bmNocm9uaXplLCByZW9wZW5lZF0KKysK
KytuYW1lOiBDb2RlU2VlIE1hcAorKworK2pvYnM6CisrICB0ZXN0X21hcF9hY3Rpb246CisrICAg
IHJ1bnMtb246IHVidW50dS1sYXRlc3QKKysgICAgY29udGludWUtb24tZXJyb3I6IHRydWUKKysg
ICAgbmFtZTogUnVuIENvZGVTZWUgTWFwIEFuYWx5c2lzCisrICAgIHN0ZXBzOgorKyAgICAgIC0g
bmFtZTogY2hlY2tvdXQKKysgICAgICAgIGlkOiBjaGVja291dAorKyAgICAgICAgdXNlczogYWN0
aW9ucy9jaGVja291dEB2MgorKyAgICAgICAgd2l0aDoKKysgICAgICAgICAgcmVwb3NpdG9yeTog
JHt7IGdpdGh1Yi5ldmVudC5wdWxsX3JlcXVlc3QuaGVhZC5yZXBvLmZ1bGxfbmFtZSB9fQorKyAg
ICAgICAgICByZWY6ICR7eyBnaXRodWIuZXZlbnQucHVsbF9yZXF1ZXN0LmhlYWQucmVmIH19Cisr
ICAgICAgICAgIGZldGNoLWRlcHRoOiAwCisrCisrICAgICAgIyBjb2Rlc2VlLWRldGVjdC1sYW5n
dWFnZXMgaGFzIGFuIG91dHB1dCB3aXRoIGlkIGxhbmd1YWdlcy4KKysgICAgICAtIG5hbWU6IERl
dGVjdCBMYW5ndWFnZXMKKysgICAgICAgIGlkOiBkZXRlY3QtbGFuZ3VhZ2VzCisrICAgICAgICB1
c2VzOiBDb2Rlc2VlLWlvL2NvZGVzZWUtZGV0ZWN0LWxhbmd1YWdlcy1hY3Rpb25AbGF0ZXN0Cisr
CisrICAgICAgLSBuYW1lOiBDb25maWd1cmUgSkRLIDE2CisrICAgICAgICB1c2VzOiBhY3Rpb25z
L3NldHVwLWphdmFAdjIKKysgICAgICAgIGlmOiAke3sgZnJvbUpTT04oc3RlcHMuZGV0ZWN0LWxh
bmd1YWdlcy5vdXRwdXRzLmxhbmd1YWdlcykuamF2YSB9fQorKyAgICAgICAgd2l0aDoKKysgICAg
ICAgICAgamF2YS12ZXJzaW9uOiAnMTYnCisrICAgICAgICAgIGRpc3RyaWJ1dGlvbjogJ3p1bHUn
CisrCisrICAgICAgIyBDb2RlU2VlIE1hcHMgR28gc3VwcG9ydCB1c2VzIGEgc3RhdGljIGJpbmFy
eSBzbyB0aGVyZSdzIG5vIHNldHVwIHN0ZXAgcmVxdWlyZWQuCisrCisrICAgICAgLSBuYW1lOiBD
b25maWd1cmUgTm9kZS5qcyAxNAorKyAgICAgICAgdXNlczogYWN0aW9ucy9zZXR1cC1ub2RlQHYy
CisrICAgICAgICBpZjogJHt7IGZyb21KU09OKHN0ZXBzLmRldGVjdC1sYW5ndWFnZXMub3V0cHV0
cy5sYW5ndWFnZXMpLmphdmFzY3JpcHQgfX0KKysgICAgICAgIHdpdGg6CisrICAgICAgICAgIG5v
ZGUtdmVyc2lvbjogJzE0JworKworKyAgICAgIC0gbmFtZTogQ29uZmlndXJlIFB5dGhvbiAzLngK
KysgICAgICAgIHVzZXM6IGFjdGlvbnMvc2V0dXAtcHl0aG9uQHYyCisrICAgICAgICBpZjogJHt7
IGZyb21KU09OKHN0ZXBzLmRldGVjdC1sYW5ndWFnZXMub3V0cHV0cy5sYW5ndWFnZXMpLnB5dGhv
biB9fQorKyAgICAgICAgd2l0aDoKKysgICAgICAgICAgcHl0aG9uLXZlcnNpb246ICczLngnCisr
ICAgICAgICAgIGFyY2hpdGVjdHVyZTogJ3g2NCcKKysKKysgICAgICAtIG5hbWU6IENvbmZpZ3Vy
ZSBSdWJ5ICczLngnCisrICAgICAgICB1c2VzOiBydWJ5L3NldHVwLXJ1YnlAdjEKKysgICAgICAg
IGlmOiAke3sgZnJvbUpTT04oc3RlcHMuZGV0ZWN0LWxhbmd1YWdlcy5vdXRwdXRzLmxhbmd1YWdl
cykucnVieSB9fQorKyAgICAgICAgd2l0aDoKKysgICAgICAgICAgcnVieS12ZXJzaW9uOiAnMy4w
JworKworKyAgICAgICMgQ29kZVNlZSBNYXBzIFJ1c3Qgc3VwcG9ydCB1c2VzIGEgc3RhdGljIGJp
bmFyeSBzbyB0aGVyZSdzIG5vIHNldHVwIHN0ZXAgcmVxdWlyZWQuCisrCisrICAgICAgLSBuYW1l
OiBHZW5lcmF0ZSBNYXAKKysgICAgICAgIGlkOiBnZW5lcmF0ZS1tYXAKKysgICAgICAgIHVzZXM6
IENvZGVzZWUtaW8vY29kZXNlZS1tYXAtYWN0aW9uQGxhdGVzdAorKyAgICAgICAgd2l0aDoKKysg
ICAgICAgICAgc3RlcDogbWFwCisrICAgICAgICAgIGdpdGh1Yl9yZWY6ICR7eyBnaXRodWIucmVm
IH19CisrICAgICAgICAgIGxhbmd1YWdlczogJHt7IHN0ZXBzLmRldGVjdC1sYW5ndWFnZXMub3V0
cHV0cy5sYW5ndWFnZXMgfX0KKysKKysgICAgICAtIG5hbWU6IFVwbG9hZCBNYXAKKysgICAgICAg
IGlkOiB1cGxvYWQtbWFwCisrICAgICAgICB1c2VzOiBDb2Rlc2VlLWlvL2NvZGVzZWUtbWFwLWFj
dGlvbkBsYXRlc3QKKysgICAgICAgIHdpdGg6CisrICAgICAgICAgIHN0ZXA6IG1hcFVwbG9hZAor
KyAgICAgICAgICBhcGlfdG9rZW46ICR7eyBzZWNyZXRzLkNPREVTRUVfQVJDSF9ESUFHX0FQSV9U
T0tFTiB9fQorKyAgICAgICAgICBnaXRodWJfcmVmOiAke3sgZ2l0aHViLnJlZiB9fQorKyAgICAg
IAorKyAgICAgIC0gbmFtZTogSW5zaWdodHMKKysgICAgICAgIGlkOiBpbnNpZ2h0cworKyAgICAg
ICAgdXNlczogQ29kZXNlZS1pby9jb2Rlc2VlLW1hcC1hY3Rpb25AbGF0ZXN0CisrICAgICAgICB3
aXRoOgorKyAgICAgICAgICBzdGVwOiBpbnNpZ2h0cworKyAgICAgICAgICBhcGlfdG9rZW46ICR7
eyBzZWNyZXRzLkNPREVTRUVfQVJDSF9ESUFHX0FQSV9UT0tFTiB9fQorKyAgICAgICAgICBnaXRo
dWJfcmVmOiAke3sgZ2l0aHViLnJlZiB9fQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRl
dnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDctRml4LXRlc3RzLW9uLTEt
Y29yZS1WTS5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9j
b25jdXJyZW5jeWtpdC8wMDA3LUZpeC10ZXN0cy1vbi0xLWNvcmUtVk0ucGF0Y2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4wZTVmY2E5Y2UKLS0tIC9kZXYvbnVsbAorKysg
Yi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQv
MDAwNy1GaXgtdGVzdHMtb24tMS1jb3JlLVZNLnBhdGNoCkBAIC0wLDAgKzEsMjMgQEAKK0Zyb20g
NTY4NDlhODljMjFkY2VkMGFmZDhiMDQ0ODNiNWIzNGYxNWNkNWM4YSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206ICJCZXJuaGFyZCBNLiBXaWVkZW1hbm4iIDxid2llZGVtYW5uQHN1c2Uu
ZGU+CitEYXRlOiBGcmksIDUgTm92IDIwMjEgMTA6Mzc6MzEgKzAxMDAKK1N1YmplY3Q6IFtQQVRD
SF0gRml4IHRlc3RzIG9uIDEtY29yZSBWTQorCitGaXhlcyAjMTgxCistLS0KKyByZWdyZXNzaW9u
cy9ja19zZXF1ZW5jZS92YWxpZGF0ZS9ja19zZXF1ZW5jZS5jIHwgMiArLQorIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvcmVncmVz
c2lvbnMvY2tfc2VxdWVuY2UvdmFsaWRhdGUvY2tfc2VxdWVuY2UuYyBiL3JlZ3Jlc3Npb25zL2Nr
X3NlcXVlbmNlL3ZhbGlkYXRlL2NrX3NlcXVlbmNlLmMKK2luZGV4IDQ3ZGU4NTIuLjVjODVkNDQg
MTAwNjQ0CistLS0gYS9yZWdyZXNzaW9ucy9ja19zZXF1ZW5jZS92YWxpZGF0ZS9ja19zZXF1ZW5j
ZS5jCisrKysgYi9yZWdyZXNzaW9ucy9ja19zZXF1ZW5jZS92YWxpZGF0ZS9ja19zZXF1ZW5jZS5j
CitAQCAtMTI0LDcgKzEyNCw3IEBAIG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKKyAKKyAJ
bl90aHJlYWRzID0gYXRvaShhcmd2WzFdKSAtIDE7CisgCWlmIChuX3RocmVhZHMgPD0gMCkgewor
LQkJY2tfZXJyb3IoIkVSUk9SOiBOdW1iZXIgb2YgdGhyZWFkcyBtdXN0IGJlIGdyZWF0ZXIgdGhh
biAwXG4iKTsKKysJCXJldHVybiAwOyAvKiBub3RoaW5nIHRvIGRvICovCisgCX0KKyAKKyAJdGhy
ZWFkcyA9IG1hbGxvYyhzaXplb2YocHRocmVhZF90KSAqIG5fdGhyZWFkcyk7CmRpZmYgLS1naXQg
YS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQv
MDAwOC1kb2MtdXBkYXRlLWNrX2Vwb2NoX3JlZ2lzdGVyLWluLWRvY3MtdG8tc2VuZC10aHJlZS1h
LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJl
bmN5a2l0LzAwMDgtZG9jLXVwZGF0ZS1ja19lcG9jaF9yZWdpc3Rlci1pbi1kb2NzLXRvLXNlbmQt
dGhyZWUtYS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjg2YWY4
ZDZjMAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJy
ZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDA4LWRvYy11cGRhdGUtY2tfZXBvY2hfcmVnaXN0ZXIt
aW4tZG9jcy10by1zZW5kLXRocmVlLWEucGF0Y2gKQEAgLTAsMCArMSw2OSBAQAorRnJvbSA0NWRk
NDM0ZDMyMGE2ZDcwOTg4YzYxZWNmNDQxZmUyYjFiMmJmNGJlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogTWljaGFlbCBHcnVuZGVyIDxtaWNoYWVsLmdydW5kZXJAZ21haWwuY29tPgor
RGF0ZTogRnJpLCA3IEphbiAyMDIyIDE2OjI4OjExIC0wODAwCitTdWJqZWN0OiBbUEFUQ0hdIGRv
YzogdXBkYXRlIGNrX2Vwb2NoX3JlZ2lzdGVyIGluIGRvY3MgdG8gc2VuZCB0aHJlZQorIGFyZ3Vt
ZW50cy4gKCMxODcpCisKK1NtYWxsIGNoYW5nZSBzbyB0aGUgZG9jcyBzaG93IHRoZSB0aGlyZCB2
b2lkICpjbCBhcmd1bWVudCB0bworY2tfZXBvY2hfcmVnaXN0ZXIuCisKK0Zyb20gTWljaGFlbCBH
cnVuZGVyLgorLS0tCisgZG9jL2NrX2Vwb2NoX2JhcnJpZXIgICAgIHwgMiArLQorIGRvYy9ja19l
cG9jaF9jYWxsICAgICAgICB8IDIgKy0KKyBkb2MvY2tfZXBvY2hfcmVjeWNsZSAgICAgfCAyICst
CisgZG9jL2NrX2Vwb2NoX3N5bmNocm9uaXplIHwgMiArLQorIDQgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvZG9jL2NrX2Vwb2No
X2JhcnJpZXIgYi9kb2MvY2tfZXBvY2hfYmFycmllcgoraW5kZXggYTU4NjE0NS4uMjM0MzgwMCAx
MDA2NDQKKy0tLSBhL2RvYy9ja19lcG9jaF9iYXJyaWVyCisrKysgYi9kb2MvY2tfZXBvY2hfYmFy
cmllcgorQEAgLTY4LDcgKzY4LDcgQEAgZnVuY3Rpb24odm9pZCkKKyAJY2tfc3RhY2tfZW50cnlf
dCAqczsKKyAKKyAJcmVjb3JkID0gbWFsbG9jKHNpemVvZiAqcmVjb3JkKTsKKy0JY2tfZXBvY2hf
cmVnaXN0ZXIoJmVwb2NoLCByZWNvcmQpOworKwlja19lcG9jaF9yZWdpc3RlcigmZXBvY2gsIHJl
Y29yZCwgTlVMTCk7CisgCisgCS8qCisgCSAqIFdlIGFyZSB1c2luZyBhbiBlcG9jaCBzZWN0aW9u
IGhlcmUgdG8gZ3VhcmFudGVlIG5vCitkaWZmIC0tZ2l0IGEvZG9jL2NrX2Vwb2NoX2NhbGwgYi9k
b2MvY2tfZXBvY2hfY2FsbAoraW5kZXggNzM5MDY0Mi4uZmI2MzAyZCAxMDA2NDQKKy0tLSBhL2Rv
Yy9ja19lcG9jaF9jYWxsCisrKysgYi9kb2MvY2tfZXBvY2hfY2FsbAorQEAgLTg5LDcgKzg5LDcg
QEAgZnVuY3Rpb24odm9pZCkKKyAJc3RydWN0IG9iamVjdCAqbjsKKyAKKyAJcmVjb3JkID0gbWFs
bG9jKHNpemVvZiAqcmVjb3JkKTsKKy0JY2tfZXBvY2hfcmVnaXN0ZXIoJmVwb2NoLCByZWNvcmQp
OworKwlja19lcG9jaF9yZWdpc3RlcigmZXBvY2gsIHJlY29yZCwgTlVMTCk7CisgCisgCW4gPSBt
YWxsb2Moc2l6ZW9mICpuKTsKKyAJaWYgKG4gPT0gTlVMTCkKK2RpZmYgLS1naXQgYS9kb2MvY2tf
ZXBvY2hfcmVjeWNsZSBiL2RvYy9ja19lcG9jaF9yZWN5Y2xlCitpbmRleCA1MzAwNzljLi5jZmFh
OWYzIDEwMDY0NAorLS0tIGEvZG9jL2NrX2Vwb2NoX3JlY3ljbGUKKysrKyBiL2RvYy9ja19lcG9j
aF9yZWN5Y2xlCitAQCAtNjQsNyArNjQsNyBAQCBmdW5jdGlvbih2b2lkKQorIAkJaWYgKHJlY29y
ZCA9PSBOVUxMKQorIAkJCXJldHVybjsKKyAKKy0JCWNrX2Vwb2NoX3JlZ2lzdGVyKCZlcG9jaCwg
cmVjb3JkKTsKKysJCWNrX2Vwb2NoX3JlZ2lzdGVyKCZlcG9jaCwgcmVjb3JkLCBOVUxMKTsKKyAJ
fQorIAorIAkvKgorZGlmZiAtLWdpdCBhL2RvYy9ja19lcG9jaF9zeW5jaHJvbml6ZSBiL2RvYy9j
a19lcG9jaF9zeW5jaHJvbml6ZQoraW5kZXggNmU1ZjczZC4uN2I0YmY3NCAxMDA2NDQKKy0tLSBh
L2RvYy9ja19lcG9jaF9zeW5jaHJvbml6ZQorKysrIGIvZG9jL2NrX2Vwb2NoX3N5bmNocm9uaXpl
CitAQCAtNzMsNyArNzMsNyBAQCBmdW5jdGlvbih2b2lkKQorIAlja19zdGFja19lbnRyeV90ICpz
OworIAorIAlyZWNvcmQgPSBtYWxsb2Moc2l6ZW9mICpyZWNvcmQpOworLQlja19lcG9jaF9yZWdp
c3RlcigmZXBvY2gsIHJlY29yZCk7CisrCWNrX2Vwb2NoX3JlZ2lzdGVyKCZlcG9jaCwgcmVjb3Jk
LCBOVUxMKTsKKyAKKyAJLyoKKyAJICogV2UgYXJlIHVzaW5nIGFuIGVwb2NoIHNlY3Rpb24gaGVy
ZSB0byBndWFyYW50ZWUgbm8KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9j
b25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDA5LUlnbm9yZS1LRVJOX05PVF9TVVBQT1JU
RUQtZnJvbS10aHJlYWRfcG9saWN5X3NldC1vbi0ucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAwOS1JZ25vcmUtS0VSTl9OT1Rf
U1VQUE9SVEVELWZyb20tdGhyZWFkX3BvbGljeV9zZXQtb24tLnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uNGQ5N2NlYmFmCi0tLSAvZGV2L251bGwKKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMDkt
SWdub3JlLUtFUk5fTk9UX1NVUFBPUlRFRC1mcm9tLXRocmVhZF9wb2xpY3lfc2V0LW9uLS5wYXRj
aApAQCAtMCwwICsxLDQ0IEBACitGcm9tIDU5NWYyNTU4OWJlOGJjNmFmZmNlMzMxOTI3ZTEzOWIy
ZTVkMTMzZWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBNIEpvb25hcyBQaWhsYWph
IDxqcGlobGFqYUBiYWNrdHJhY2UuaW8+CitEYXRlOiBUaHUsIDEwIEZlYiAyMDIyIDE1OjIzOjMw
ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIElnbm9yZSBLRVJOX05PVF9TVVBQT1JURUQgZnJvbSB0
aHJlYWRfcG9saWN5X3NldCBvbiBtYWNoCisKK1RoZSBgdGhyZWFkX3BvbGljeV9zZXRgIGNhbGwg
aW4gYGFmZl9pdGVyYXRlYCBmYWlscyB3aXRoCitgS0VSTl9OT1RfU1VQUE9SVEVEYCBvbiBNMSBt
YWNib29rcy4gVGhlIHJlcG9ydGVkIGVycm9yIGZyb20gdGhlCityZWdyZXNzaW9uIHRlc3RzIGlz
ICJTdWNjZXNzIiBiZWNhdXNlIGB0aHJlYWRfcG9saWN5X3NldGAgZG9lc24ndCBzZXQKK2Vycm5v
LgorCitUaGlzIHBhdGNoIGNvbnZlcnRzIGBLRVJOX05PVF9TVVBQT1JURURgIGludG8gYSBzdWNj
ZXNzZnVsIHJldHVybiBhbmQKK3NldHMgZXJybm8gdG8gYEVJTlZBTGAgb24gb3RoZXIgZXJyb3Jz
LiAgVGhpcyBpcyBvayBpbiB0aGUgcmVncmVzc2lvbgordGVzdHMgYXMgdGhlcmUgYWZmaW5pdHkg
YmluZGluZyBpcyBvbmx5IGFkdmlzb3J5LgorCitGaXhlcyAjMTg2CistLS0KKyByZWdyZXNzaW9u
cy9jb21tb24uaCB8IDggKysrKysrKy0KKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9yZWdyZXNzaW9ucy9jb21tb24uaCBiL3Jl
Z3Jlc3Npb25zL2NvbW1vbi5oCitpbmRleCA5ZDAxYzgzLi4wZTY4MmY0IDEwMDY0NAorLS0tIGEv
cmVncmVzc2lvbnMvY29tbW9uLmgKKysrKyBiL3JlZ3Jlc3Npb25zL2NvbW1vbi5oCitAQCAtMzIw
LDEzICszMjAsMTkgQEAgYWZmX2l0ZXJhdGUoc3RydWN0IGFmZmluaXR5ICphY2IpCisgeworIAl0
aHJlYWRfYWZmaW5pdHlfcG9saWN5X2RhdGFfdCBwb2xpY3k7CisgCXVuc2lnbmVkIGludCBjOwor
KwlpbnQgZXJyOworIAorIAljID0gY2tfcHJfZmFhX3VpbnQoJmFjYi0+cmVxdWVzdCwgYWNiLT5k
ZWx0YSkgJSBDT1JFUzsKKyAJcG9saWN5LmFmZmluaXR5X3RhZyA9IGM7CistCXJldHVybiB0aHJl
YWRfcG9saWN5X3NldChtYWNoX3RocmVhZF9zZWxmKCksCisrCWVyciA9IHRocmVhZF9wb2xpY3lf
c2V0KG1hY2hfdGhyZWFkX3NlbGYoKSwKKyAJCQkJIFRIUkVBRF9BRkZJTklUWV9QT0xJQ1ksCisg
CQkJCSAodGhyZWFkX3BvbGljeV90KSZwb2xpY3ksCisgCQkJCSBUSFJFQURfQUZGSU5JVFlfUE9M
SUNZX0NPVU5UKTsKKysJaWYgKGVyciA9PSBLRVJOX05PVF9TVVBQT1JURUQpCisrCQlyZXR1cm4g
MDsKKysJaWYgKGVyciAhPSAwKQorKwkJZXJybm8gPSBFSU5WQUw7CisrCXJldHVybiBlcnI7Cisg
fQorIAorIENLX0NDX1VOVVNFRCBzdGF0aWMgaW50CmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAxMC1yZWdyZXNzaW9u
cy1jb21tb24tQWRkLW1pc3NpbmctaW5jbHVkZS1mb3ItZXJybm8tb24tLnBhdGNoIGIvbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMTAtcmVn
cmVzc2lvbnMtY29tbW9uLUFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWVycm5vLW9uLS5wYXRjaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjliNmJjMjM2OQotLS0gL2Rldi9u
dWxsCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJy
ZW5jeWtpdC8wMDEwLXJlZ3Jlc3Npb25zLWNvbW1vbi1BZGQtbWlzc2luZy1pbmNsdWRlLWZvci1l
cnJuby1vbi0ucGF0Y2gKQEAgLTAsMCArMSwyMyBAQAorRnJvbSA4NWI5MzA1NTRiYWFhNzMzMDc0
YTM2MjllNDM1ODUwMjcxYjM0MWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogTSBK
b29uYXMgUGlobGFqYSA8anBpaGxhamFAYmFja3RyYWNlLmlvPgorRGF0ZTogRnJpLCAxMSBGZWIg
MjAyMiAxMzozMTowNyArMDIwMAorU3ViamVjdDogW1BBVENIXSByZWdyZXNzaW9ucy9jb21tb246
IEFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yIGVycm5vIG9uIG1hY2gKKworRGlkbid0IGJ1aWxkIGV2
ZXJ5dGhpbmcgZnJvbSBzY3JhdGNoIHdoZW4gZml4aW5nICMxODYgYW5kIG1pc3NlZAordGhhdCBl
cnJuby5oIHdhc24ndCBpbmNsdWRlZCBvbiBtYWNoLgorLS0tCisgcmVncmVzc2lvbnMvY29tbW9u
LmggfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKKworZGlmZiAtLWdpdCBh
L3JlZ3Jlc3Npb25zL2NvbW1vbi5oIGIvcmVncmVzc2lvbnMvY29tbW9uLmgKK2luZGV4IDBlNjgy
ZjQuLmM3NzlhOTMgMTAwNjQ0CistLS0gYS9yZWdyZXNzaW9ucy9jb21tb24uaAorKysrIGIvcmVn
cmVzc2lvbnMvY29tbW9uLmgKK0BAIC00Myw2ICs0Myw3IEBACisgI2luY2x1ZGUgPHB0aHJlYWRf
bnAuaD4KKyAjZW5kaWYKKyAjZWxpZiBkZWZpbmVkKF9fTUFDSF9fKQorKyNpbmNsdWRlIDxlcnJu
by5oPgorICNpbmNsdWRlIDxtYWNoL21hY2guaD4KKyAjaW5jbHVkZSA8bWFjaC90aHJlYWRfcG9s
aWN5Lmg+CisgI2VsaWYgZGVmaW5lZChfX0ZyZWVCU0RfXykKZGlmZiAtLWdpdCBhL21ldGEtb2Uv
cmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDExLWJ1aWxk
LUFkZC1yaXNjdjMyLWFuZC1yaXNjdjY0LXN1cHBvcnQtMTk0LnBhdGNoIGIvbWV0YS1vZS9yZWNp
cGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMTEtYnVpbGQtQWRk
LXJpc2N2MzItYW5kLXJpc2N2NjQtc3VwcG9ydC0xOTQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwLi5kOTQ4MGQyZDAKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAxMS1idWls
ZC1BZGQtcmlzY3YzMi1hbmQtcmlzY3Y2NC1zdXBwb3J0LTE5NC5wYXRjaApAQCAtMCwwICsxLDU3
IEBACitGcm9tIGU2YjQwYWZhN2NiNTYzMWEwMDkyNzk3ZjZmMGE1YWU2N2NiMmU2NmIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBMdiAnWkVUQUxPRycgWmhlbmcgPHpoZW5nbHZAaG90
bWFpbC5jb20+CitEYXRlOiBUdWUsIDEyIEp1bCAyMDIyIDAxOjE2OjI4ICswODAwCitTdWJqZWN0
OiBbUEFUQ0hdIGJ1aWxkOiBBZGQgcmlzY3YzMiBhbmQgcmlzY3Y2NCBzdXBwb3J0ICgjMTk0KQor
CitUaGlzIHBhdGNoIGFkZHMgcmlzY3YzMi9yaXNjdjY0IGNyb3NzIGNvbXBpbGF0aW9uIHN1cHBv
cnQuIE5vdGljZQordGhhdCB0aGlzIHBhdGNoIG9ubHkgZW5mb3JjZXMgZGVmYXVsdCBwc0FCSSBm
b3IgUlYzMkcgYW5kIFJWNjRHLgorCitSZWZlcmVuY2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di1ub24taXNhL3Jpc2N2LWVsZi1wc2FiaS1kb2MvYmxvYi9tYXN0ZXIvcmlzY3YtY2MuYWRvYwor
U2lnbmVkLW9mZi1ieTogTHYgWmhlbmcgPHpoZW5nbHZAc21hcnQtY29yZS5jbj4KKworQ28tYXV0
aG9yZWQtYnk6IEx2IFpoZW5nIDx6aGVuZ2x2QHNtYXJ0LWNvcmUuY24+CistLS0KKyBidWlsZC9j
ay5idWlsZC5yaXNjdiAgIHwgIDEgKworIGJ1aWxkL2NrLmJ1aWxkLnJpc2N2NjQgfCAgMSArCisg
Y29uZmlndXJlICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysrKworIDMgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQorIGNyZWF0ZSBtb2RlIDEwMDY0NCBidWlsZC9jay5idWlsZC5y
aXNjdgorIGNyZWF0ZSBtb2RlIDEwMDY0NCBidWlsZC9jay5idWlsZC5yaXNjdjY0CisKK2RpZmYg
LS1naXQgYS9idWlsZC9jay5idWlsZC5yaXNjdiBiL2J1aWxkL2NrLmJ1aWxkLnJpc2N2CituZXcg
ZmlsZSBtb2RlIDEwMDY0NAoraW5kZXggMDAwMDAwMC4uNjFlMDAzMworLS0tIC9kZXYvbnVsbAor
KysrIGIvYnVpbGQvY2suYnVpbGQucmlzY3YKK0BAIC0wLDAgKzEgQEAKKytDRkxBR1MrPS1tYWJp
PWlscDMyCitkaWZmIC0tZ2l0IGEvYnVpbGQvY2suYnVpbGQucmlzY3Y2NCBiL2J1aWxkL2NrLmJ1
aWxkLnJpc2N2NjQKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi45Zjg5Nzkx
CistLS0gL2Rldi9udWxsCisrKysgYi9idWlsZC9jay5idWlsZC5yaXNjdjY0CitAQCAtMCwwICsx
IEBACisrQ0ZMQUdTKz0tbWFiaT1scDY0CitkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmln
dXJlCitpbmRleCAxMjU5YWUyLi45MDY2YWJiIDEwMDc1NQorLS0tIGEvY29uZmlndXJlCisrKysg
Yi9jb25maWd1cmUKK0BAIC01MjYsNiArNTI2LDE4IEBAIGNhc2UgJFBMQVRGT1JNIGluCisgCQlQ
TEFURk9STT1hYXJjaDY0CisgCQlFTlZJUk9OTUVOVD02NAorIAkJOzsKKysJInJpc2N2MzIifCJy
aXNjdiIpCisrCQlSVE1fRU5BQkxFPSJDS19NRF9SVE1fRElTQUJMRSIKKysJCU1NPSIke01NOi0i
Q0tfTURfUk1PIn0iCisrCQlQTEFURk9STT1yaXNjdgorKwkJRU5WSVJPTk1FTlQ9MzIKKysJCTs7
CisrCSJyaXNjdjY0IikKKysJCVJUTV9FTkFCTEU9IkNLX01EX1JUTV9ESVNBQkxFIgorKwkJTU09
IiR7TU06LSJDS19NRF9STU8ifSIKKysJCVBMQVRGT1JNPXJpc2N2NjQKKysJCUVOVklST05NRU5U
PTY0CisrCQk7OworIAkiczM5MHgiKQorIAkJUlRNX0VOQUJMRT0iQ0tfTURfUlRNX0RJU0FCTEUi
CisgCQlMU0VfRU5BQkxFPSJDS19NRF9MU0VfRElTQUJMRSIKZGlmZiAtLWdpdCBhL21ldGEtb2Uv
cmVjaXBlcy1kZXZ0b29scy9jb25jdXJyZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDEyLVVwZGF0
ZS1DaXJydXMtQ0ktY29uZmlnLXRvLXVzZS10aGUtbGF0ZXN0LUZyZWVCU0QtZGUucGF0Y2ggYi9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXQvMDAx
Mi1VcGRhdGUtQ2lycnVzLUNJLWNvbmZpZy10by11c2UtdGhlLWxhdGVzdC1GcmVlQlNELWRlLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uZjhiOGZjMWVlCi0tLSAv
ZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2Nv
bmN1cnJlbmN5a2l0LzAwMTItVXBkYXRlLUNpcnJ1cy1DSS1jb25maWctdG8tdXNlLXRoZS1sYXRl
c3QtRnJlZUJTRC1kZS5wYXRjaApAQCAtMCwwICsxLDM1IEBACitGcm9tIDFmYTY0YzFhNTM0NDli
OGFjM2Q2NDIzODA0MTIxZWZlNzUwNThkMDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBMaS1XZW4gSHN1IDxsd2hzdUBsd2hzdS5vcmc+CitEYXRlOiBUdWUsIDEyIEp1bCAyMDIyIDAx
OjE2OjQwICswODAwCitTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSBDaXJydXMgQ0kgY29uZmlnIHRv
IHVzZSB0aGUgbGF0ZXN0IEZyZWVCU0QgZGV2ZWxvcG1lbnQKKyB2ZXJzaW9ucyAoIzE5NSkKKwor
LS0tCisgLmNpcnJ1cy55bWwgfCAxNCArKysrKysrKysrLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvLmNpcnJ1cy55
bWwgYi8uY2lycnVzLnltbAoraW5kZXggMzk2MGEwNi4uNTJjMTg2MSAxMDA2NDQKKy0tLSBhLy5j
aXJydXMueW1sCisrKysgYi8uY2lycnVzLnltbAorQEAgLTMsMTAgKzMsMTYgQEAgZW52OgorICAg
QVJDSDogYW1kNjQKKyAKKyB0YXNrOgorLSAgZnJlZWJzZF9pbnN0YW5jZToKKy0gICAgbWF0cml4
OgorLSAgICAgIGltYWdlOiBmcmVlYnNkLTEyLTAtcmVsZWFzZS1hbWQ2NAorLSAgICAgIGltYWdl
OiBmcmVlYnNkLTExLTItcmVsZWFzZS1hbWQ2NAorKyAgbWF0cml4OgorKyAgIC0gbmFtZTogZnJl
ZWJzZDEyLWFtZDY0CisrICAgICBmcmVlYnNkX2luc3RhbmNlOgorKyAgICAgICBpbWFnZV9mYW1p
bHk6IGZyZWVic2QtMTItMy1zbmFwCisrICAgLSBuYW1lOiBmcmVlYnNkMTMtYW1kNjQKKysgICAg
IGZyZWVic2RfaW5zdGFuY2U6CisrICAgICAgIGltYWdlX2ZhbWlseTogZnJlZWJzZC0xMy0xLXNu
YXAKKysgICAtIG5hbWU6IGZyZWVic2QxNC1hbWQ2NAorKyAgICAgZnJlZWJzZF9pbnN0YW5jZToK
KysgICAgICAgaW1hZ2VfZmFtaWx5OiBmcmVlYnNkLTE0LTAtc25hcAorICAgc2NyaXB0OgorICAg
IC0gY2MgLS12ZXJzaW9uCisgICAgLSBleHBvcnQgQ0ZMQUdTPSItRElURVJBVEU9NDAwIC1EUEFJ
UlNfUz0xMDAgLURJVEVSQVRJT05TPTI0IgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRl
dnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0LzAwMTMtRml4ZXMtaW1wbGljaXQt
Y2FzdC1idWlsZC1lcnJvci5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jb25jdXJy
ZW5jeWtpdC9jb25jdXJyZW5jeWtpdC8wMDEzLUZpeGVzLWltcGxpY2l0LWNhc3QtYnVpbGQtZXJy
b3IucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi42NzQ1N2QyMjAK
LS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lr
aXQvY29uY3VycmVuY3lraXQvMDAxMy1GaXhlcy1pbXBsaWNpdC1jYXN0LWJ1aWxkLWVycm9yLnBh
dGNoCkBAIC0wLDAgKzEsMjIgQEAKK0Zyb20gYjY4NGRhODJjYmQyZDU4Mzg3MjYwOGQ1OTZhMGRk
ZWY2ZTk1MGQxOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGhhbmtlZGFuMDAwIDxk
YW55MzI0MTJAZ21haWwuY29tPgorRGF0ZTogV2VkLCAzIEF1ZyAyMDIyIDA0OjMzOjUxICswMTAw
CitTdWJqZWN0OiBbUEFUQ0hdIEZpeGVzIGltcGxpY2l0IGNhc3QgYnVpbGQgZXJyb3IKKworLS0t
CisgaW5jbHVkZS9ja19yaW5nLmggfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL2NrX3JpbmcuaCBiL2lu
Y2x1ZGUvY2tfcmluZy5oCitpbmRleCA5ZjY3NTRlLi4zYTUyMjc2IDEwMDY0NAorLS0tIGEvaW5j
bHVkZS9ja19yaW5nLmgKKysrKyBiL2luY2x1ZGUvY2tfcmluZy5oCitAQCAtMjgyLDcgKzI4Miw3
IEBAIF9ja19yaW5nX2VucXVldWVfcmVzZXJ2ZV9tcChzdHJ1Y3QgY2tfcmluZyAqcmluZywKKyAJ
CQkJaWYgKHNpemUgIT0gTlVMTCkKKyAJCQkJCSpzaXplID0gKHByb2R1Y2VyIC0gY29uc3VtZXIp
ICYgbWFzazsKKyAKKy0JCQkJcmV0dXJuIGZhbHNlOworKwkJCQlyZXR1cm4gTlVMTDsKKyAJCQl9
CisgCisgCQkJcHJvZHVjZXIgPSBuZXdfcHJvZHVjZXI7CmRpZmYgLS1naXQgYS9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXRfZ2l0LmJiIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0X2dpdC5i
YgppbmRleCAyNzdmYWM5ZjcuLmMyZjQ1OWVlMiAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVz
LWRldnRvb2xzL2NvbmN1cnJlbmN5a2l0L2NvbmN1cnJlbmN5a2l0X2dpdC5iYgorKysgYi9tZXRh
LW9lL3JlY2lwZXMtZGV2dG9vbHMvY29uY3VycmVuY3lraXQvY29uY3VycmVuY3lraXRfZ2l0LmJi
CkBAIC03LDEyICs3LDI2IEBAIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlICYgQXBhY2hlLTIuMCIK
IEhPTUVQQUdFID0gImh0dHA6Ly9jb25jdXJyZW5jeWtpdC5vcmciCiBTRUNUSU9OID0gImJhc2Ui
CiAKLVBWID0gIjAuNy4wK2dpdCR7U1JDUFZ9IgotU1JDUkVWID0gIjZlOGU1YmVjMmUyZjhjZWYy
MDcyYTY4NTc5Y2JiMDdhYmFiZjMzMzEiCitQViA9ICIwLjcuMSIKK1NSQ1JFViA9ICIzNTE0MTVj
Y2FhNzg3OTgzMzJlNTU2ZjY2MWZjN2U4MzI0NDdmM2RhIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9YTBiMjRjMWE4ZjlhZDUxNmEyOTdkMDU1YjAyOTQyMzEiCiBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20vY29uY3VycmVuY3lraXQvY2suZ2l0O2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtRml4
LWNvbXBvaWxlci1kZXRlY3Rpb24tbG9naWMtZm9yLWNyb3NzLWNvLnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtYnVpbGQtVXNlLWlscDMyZC1hYmktb24tcmlzY3YzMi1hbmQtbHA2NGQt
b24tcnY2NC5wYXRjaCIKKyAgICAgICAgICAgZmlsZTovLzAwMDEtYnVpbGQtVXNlLWlscDMyZC1h
Ymktb24tcmlzY3YzMi1hbmQtbHA2NGQtb24tcnY2NC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDAxLXJlZ3Jlc3Npb25zLWltcGxlbWVudC1hZmZfaXRlcmF0ZS1mb3ItTmV0QlNELnBhdGNo
IFwKKyAgICAgICAgICAgZmlsZTovLzAwMDItY29uZmlndXJlLUZpeC1VU0VfQ0NfQlVJTFRJTlMu
cGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMy1ja19wci1maXgtcHRyLW91dHB1dC1vcGVy
YW5kLXdpZHRocy1vbi14ODYtYW5kLXg4Nl82LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAw
MDQteDg2LURvbi10LXBhc3MtbXNzZS1tc3NlMi13aXRoLWRpc2FibGUtc3NlLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovLzAwMDUtcmVncmVzc2lvbnMtcG9ydGluZy10by1kcmFnb25mbHlic2Qu
cGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwNi1BZGQtQ29kZVNlZS1hcmNoaXRlY3R1cmUt
ZGlhZ3JhbS13b3JrZmxvdy10by1yZXBvc2l0LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAw
MDctRml4LXRlc3RzLW9uLTEtY29yZS1WTS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA4
LWRvYy11cGRhdGUtY2tfZXBvY2hfcmVnaXN0ZXItaW4tZG9jcy10by1zZW5kLXRocmVlLWEucGF0
Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwOS1JZ25vcmUtS0VSTl9OT1RfU1VQUE9SVEVELWZy
b20tdGhyZWFkX3BvbGljeV9zZXQtb24tLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMTAt
cmVncmVzc2lvbnMtY29tbW9uLUFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWVycm5vLW9uLS5wYXRj
aCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDExLWJ1aWxkLUFkZC1yaXNjdjMyLWFuZC1yaXNjdjY0
LXN1cHBvcnQtMTk0LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMTItVXBkYXRlLUNpcnJ1
cy1DSS1jb25maWctdG8tdXNlLXRoZS1sYXRlc3QtRnJlZUJTRC1kZS5wYXRjaCBcCisgICAgICAg
ICAgIGZpbGU6Ly8wMDEzLUZpeGVzLWltcGxpY2l0LWNhc3QtYnVpbGQtZXJyb3IucGF0Y2ggXAor
ICAgICAgICAgICAiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============2024898869318455939==--

