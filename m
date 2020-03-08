Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5905F61678
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 15:15:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t24so3537706pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xyl07C/wtVP19KT5+XYr2xhiz0dnFyRwvtgvmaR525U=;
	b=eJAMVzTdrI7645yIvauzUKlmJKH8OpOe6sCiM/g410fD2tfUdwbHD2hVXQtZ3K9W2a
	yat41/xxBjslsJ+N0hSaC5k3QlieAtRPLJ2iGNXC9mj/TnxnK3DfEq83fS1IhI4iiQq7
	qF2h1jb1S4EE7dnY15NOyw9s4t62ZP7bgdM3rFF4GOdUeE3v8A4JTzgXYZdUFVbpzZgv
	0dB07U3i/UZO0dv3/AmGD6hvX7PoXF/pJX7rVmwuP6Jk9v81aGpRxv4u7ed3zDscFgUg
	uqt3xpQBzRqjRmpbO3C5m3yX2KxYJOEHRk5d/ARg2/kHBV4mACsoXlvzmXBpOinW74Zv
	4PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xyl07C/wtVP19KT5+XYr2xhiz0dnFyRwvtgvmaR525U=;
	b=BsVrjiTjiVh6Q3+eSnQH1R4QXK0fU6/CwsdrWKl0/pcwQCytsh2OcrJOQuxrXLyWpq
	LssFgutDf2nDNsKVeQpqFPv09XNw/ewMwPLneSxw7EVK0vcoi5A9NXMe8oYf2WZvL4D6
	6ExJbYKhgLAnO91dqARWOJFW805hHFQdr9HOZ4LVojWSbkqymffYuCWwiAyf7toSbC3m
	IcUs8j/7EyVU4wYILqeGfckcWNEQJs7RofM+Pj9QPMjsBgtVJQU1oLAaeeQx12QXVItG
	FEsIwJuCwXC/rb36YX5CDVOc4WLgLIuTFUisEU63Be4PSN+P126nkM85pSSl8Djn4cp9
	XEqQ==
X-Gm-Message-State: ANhLgQ0P3j2Irhkrp6eN2zXhhzhGb2vt9RM9dUlPwZHomoSFQ8uzZcv4
	/YXLccN/BfJHqgxBRiPa2bFuXQL0ncg=
X-Google-Smtp-Source: ADFU+vv6PKF3nW+xfqDvZzJqA6aPPmHi6q7Lik8fK4DNkahrWcLyPQimyyE2iEpHp2tLHHRY+Ogl+Q==
X-Received: by 2002:a65:5b0f:: with SMTP id y15mr12266036pgq.258.1583680501279;
	Sun, 08 Mar 2020 08:15:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	d186sm23877392pfc.8.2020.03.08.08.15.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 08:15:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 08:15:09 -0700
Message-Id: <20200308151509.1573831-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308151509.1573831-1-raj.khem@gmail.com>
References: <20200308151509.1573831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] nss,nspr: Add recipes
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
X-List-Received-Date: Sun, 08 Mar 2020 15:15:02 -0000
Content-Transfer-Encoding: 8bit

oe-core has punted them, but they are still needed by many packages e.g.
mozjs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nspr/0001-md-Fix-build-with-musl.patch    |  31 ++
 .../nspr/nspr/0002-Add-nios2-support.patch    | 102 +++++++
 ...remove-_BUILD_STRING-and-_BUILD_TIME.patch | 103 +++++++
 .../nspr/nspr/fix-build-on-x86_64.patch       |  52 ++++
 meta-oe/recipes-support/nspr/nspr/nspr.pc.in  |  11 +
 .../nspr/nspr/remove-rpath-from-tests.patch   |  26 ++
 .../remove-srcdir-from-configure-in.patch     |  19 ++
 meta-oe/recipes-support/nspr/nspr_4.25.bb     | 197 +++++++++++++
 ...figure-option-to-disable-ARM-HW-cryp.patch |  52 ++++
 ...0001-nss-fix-support-cross-compiling.patch |  48 +++
 .../recipes-support/nss/nss/blank-cert9.db    | Bin 0 -> 28672 bytes
 meta-oe/recipes-support/nss/nss/blank-key4.db | Bin 0 -> 36864 bytes
 .../nss/nss/disable-Wvarargs-with-clang.patch |  33 +++
 .../nss-fix-incorrect-shebang-of-perl.patch   | 110 +++++++
 .../nss/nss/nss-fix-nsinstall-build.patch     |  36 +++
 .../nss-no-rpath-for-cross-compiling.patch    |  26 ++
 meta-oe/recipes-support/nss/nss/nss.pc.in     |  11 +
 .../nss/nss/pqg.c-ULL_addend.patch            |  23 ++
 meta-oe/recipes-support/nss/nss/signlibs.sh   |  20 ++
 .../recipes-support/nss/nss/system-pkcs11.txt |   5 +
 meta-oe/recipes-support/nss/nss_3.50.bb       | 273 ++++++++++++++++++
 21 files changed, 1178 insertions(+)
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr/nspr.pc.in
 create mode 100644 meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
 create mode 100644 meta-oe/recipes-support/nspr/nspr_4.25.bb
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/blank-cert9.db
 create mode 100644 meta-oe/recipes-support/nss/nss/blank-key4.db
 create mode 100644 meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/nss.pc.in
 create mode 100644 meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/signlibs.sh
 create mode 100644 meta-oe/recipes-support/nss/nss/system-pkcs11.txt
 create mode 100644 meta-oe/recipes-support/nss/nss_3.50.bb

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch b/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..f3cd670026
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
@@ -0,0 +1,31 @@
+From 147f3c2acbd96d44025cec11800ded0282327764 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Sep 2017 17:22:43 -0700
+Subject: [PATCH] md: Fix build with musl
+
+The MIPS specific header <sgidefs.h> is not provided by musl
+linux kernel headers provide <asm/sgidefs.h> which has same definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ pr/include/md/_linux.cfg | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index 640b19c..31296a8 100644
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -499,7 +499,7 @@
+ #elif defined(__mips__)
+ 
+ /* For _ABI64 */
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ 
+ #ifdef __MIPSEB__
+ #define IS_BIG_ENDIAN 1
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
new file mode 100644
index 0000000000..3a04d426a8
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
@@ -0,0 +1,102 @@
+From 95bda64fb4cf1825fea745e918cfe8202843f0ba Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Sat, 30 Jan 2016 07:18:02 +0100
+Subject: [PATCH] Add nios2 support
+
+Add support for the nios2 CPU.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1244421 ]
+---
+ nspr/pr/include/md/_linux.cfg | 45 +++++++++++++++++++++++++++++++++++++++++++
+ nspr/pr/include/md/_linux.h   | 14 ++++++++++++++
+ 2 files changed, 59 insertions(+)
+
+Index: nspr/pr/include/md/_linux.cfg
+===================================================================
+--- nspr.orig/pr/include/md/_linux.cfg
++++ nspr/pr/include/md/_linux.cfg
+@@ -975,6 +975,51 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__nios2__)
++
++#define IS_LITTLE_ENDIAN    1
++#undef  IS_BIG_ENDIAN
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #elif defined(__or1k__)
+ 
+ #undef  IS_LITTLE_ENDIAN
+Index: nspr/pr/include/md/_linux.h
+===================================================================
+--- nspr.orig/pr/include/md/_linux.h
++++ nspr/pr/include/md/_linux.h
+@@ -55,6 +55,8 @@
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
++#elif defined(__nios2__)
++#define _PR_SI_ARCHITECTURE "nios2"
+ #elif defined(__or1k__)
+ #define _PR_SI_ARCHITECTURE "or1k"
+ #elif defined(__riscv) && (__riscv_xlen == 32)
+@@ -129,6 +131,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
+ #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
+ #endif
+ 
++#if defined(__nios2__)
++#if defined(__GNUC__)
++/* Use GCC built-in functions */
++#define _PR_HAVE_ATOMIC_OPS
++#define _MD_INIT_ATOMIC()
++#define _MD_ATOMIC_INCREMENT(ptr) __sync_add_and_fetch(ptr, 1)
++#define _MD_ATOMIC_DECREMENT(ptr) __sync_sub_and_fetch(ptr, 1)
++#define _MD_ATOMIC_ADD(ptr, i) __sync_add_and_fetch(ptr, i)
++#define _MD_ATOMIC_SET(ptr, nv) __sync_lock_test_and_set(ptr, nv)
++#endif
++#endif
++
+ #if defined(__or1k__)
+ #if defined(__GNUC__)
+ /* Use GCC built-in functions */
diff --git a/meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch b/meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
new file mode 100644
index 0000000000..90fe45f34d
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
@@ -0,0 +1,103 @@
+From 8a592e4ead4ed6befe6044da3dd2dc7523c33905 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 16 Nov 2018 13:52:49 +0800
+Subject: [PATCH] Makefile.in: remove _BUILD_STRING and _BUILD_TIME
+
+Remove _BUILD_STRING and _BUILD_TIME to avoid
+adding timestamp to _pl_bld.h which can result
+in adding timestamp in library file such as
+libnspr4.so.
+ $ readelf --wide --decompress --hex-dump=.rodata libnspr4.so
+ [snip]
+  0x00004000 32303138 2d31312d 31352030 353a3439 2018-11-15 05:49
+ [snip]
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ lib/ds/Makefile.in        | 8 +-------
+ lib/libc/src/Makefile.in  | 8 +-------
+ lib/prstreams/Makefile.in | 8 +-------
+ pr/src/Makefile.in        | 8 +-------
+ 4 files changed, 4 insertions(+), 28 deletions(-)
+
+diff --git a/lib/ds/Makefile.in b/lib/ds/Makefile.in
+index e737791..b578476 100644
+--- a/lib/ds/Makefile.in
++++ b/lib/ds/Makefile.in
+@@ -114,13 +114,7 @@ GARBAGE += $(TINC)
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
+diff --git a/lib/libc/src/Makefile.in b/lib/libc/src/Makefile.in
+index e8a6d9f..978ed28 100644
+--- a/lib/libc/src/Makefile.in
++++ b/lib/libc/src/Makefile.in
+@@ -116,13 +116,7 @@ GARBAGE += $(TINC)
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
+diff --git a/lib/prstreams/Makefile.in b/lib/prstreams/Makefile.in
+index aeb2944..f318097 100644
+--- a/lib/prstreams/Makefile.in
++++ b/lib/prstreams/Makefile.in
+@@ -116,13 +116,7 @@ endif
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
+diff --git a/pr/src/Makefile.in b/pr/src/Makefile.in
+index 19c5a69..b4ac31c 100644
+--- a/pr/src/Makefile.in
++++ b/pr/src/Makefile.in
+@@ -326,13 +326,7 @@ GARBAGE += $(TINC)
+ 
+ $(TINC):
+ 	@$(MAKE_OBJDIR)
+-	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
+-	@if test ! -z "$(SH_NOW)"; then \
+-	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
+-	else \
+-	    true; \
+-	fi
+-	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
++	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
+ 
+ 
+ $(OBJDIR)/prvrsion.$(OBJ_SUFFIX): prvrsion.c $(TINC)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch b/meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
new file mode 100644
index 0000000000..f12acc8548
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
@@ -0,0 +1,52 @@
+Fix build failure on x86_64
+
+When the target_cpu is x86_64, we should assume that the pkg uses 64bit,
+only if USE_N32 is set, we can assume that the pkg uses 32bit. It used a
+opposite logic before.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ configure.in |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+Index: nspr/configure.in
+===================================================================
+--- nspr.orig/configure.in
++++ nspr/configure.in
+@@ -1875,28 +1875,24 @@ tools are selected during the Xcode/Deve
+         PR_MD_ASFILES=os_Linux_ia64.s
+         ;;
+     x86_64)
+-        if test -n "$USE_64"; then
+-            PR_MD_ASFILES=os_Linux_x86_64.s
+-        elif test -n "$USE_X32"; then
++        if test -n "$USE_X32"; then
++            AC_DEFINE(i386)
+             PR_MD_ASFILES=os_Linux_x86_64.s
+             CC="$CC -mx32"
+             CXX="$CXX -mx32"
+         else
+-            AC_DEFINE(i386)
+-            PR_MD_ASFILES=os_Linux_x86.s
+-            CC="$CC -m32"
+-            CXX="$CXX -m32"
++            PR_MD_ASFILES=os_Linux_x86_64.s
+         fi
+         ;;
+     ppc|powerpc)
+         PR_MD_ASFILES=os_Linux_ppc.s
+         ;;
+     powerpc64)
+-        if test -n "$USE_64"; then
++        if test -n "$USE_N32"; then
++            PR_MD_ASFILES=os_Linux_ppc.s
++        else
+             CC="$CC -m64"
+             CXX="$CXX -m64"
+-        else
+-            PR_MD_ASFILES=os_Linux_ppc.s
+         fi
+         ;;
+     esac    
diff --git a/meta-oe/recipes-support/nspr/nspr/nspr.pc.in b/meta-oe/recipes-support/nspr/nspr/nspr.pc.in
new file mode 100644
index 0000000000..1f15d19cfa
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/nspr.pc.in
@@ -0,0 +1,11 @@
+os_libs=-lpthread -ldl
+prefix=OEPREFIX
+exec_prefix=OEEXECPREFIX
+libdir=OELIBDIR
+includedir=OEINCDIR
+
+Name: NSPR
+Description: The Netscape Portable Runtime
+Version: NSPRVERSION
+Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
+Cflags: -I${includedir}/nspr
diff --git a/meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch b/meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
new file mode 100644
index 0000000000..7ba59ed644
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
@@ -0,0 +1,26 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Thu Feb 9 00:03:38 2012 +0200
+
+Avoid QA warnings by removing hardcoded rpath from binaries.
+
+[...]
+WARNING: QA Issue: package nspr contains bad RPATH {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/nspr-4.8.9/mozilla/nsprpub/pr/tests/../../dist/lib
+in file {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/packages-split/nspr/usr/lib/nspr/tests/multiwait
+[...]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: nspr/pr/tests/Makefile.in
+===================================================================
+--- nspr.orig/pr/tests/Makefile.in
++++ nspr/pr/tests/Makefile.in
+@@ -316,7 +316,7 @@ ifeq ($(OS_ARCH), SunOS)
+ endif # SunOS
+ 
+ ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
+-    LDOPTS += -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
++    LDOPTS += -Xlinker
+     ifeq ($(USE_PTHREADS),1)
+         EXTRA_LIBS = -lpthread
+     endif
diff --git a/meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch b/meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
new file mode 100644
index 0000000000..bde715c5dc
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
@@ -0,0 +1,19 @@
+the $srcdir is not defined at the time of gnu-configurize.
+
+Upstream-Status: Inappropriate [OE-Core specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: nspr/configure.in
+===================================================================
+--- nspr.orig/configure.in
++++ nspr/configure.in
+@@ -8,7 +8,7 @@ AC_PREREQ(2.61)
+ AC_INIT
+ AC_CONFIG_SRCDIR([pr/include/nspr.h])
+ 
+-AC_CONFIG_AUX_DIR(${srcdir}/build/autoconf)
++AC_CONFIG_AUX_DIR(build/autoconf)
+ AC_CANONICAL_TARGET
+ 
+ dnl ========================================================
diff --git a/meta-oe/recipes-support/nspr/nspr_4.25.bb b/meta-oe/recipes-support/nspr/nspr_4.25.bb
new file mode 100644
index 0000000000..1de26e1eed
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr_4.25.bb
@@ -0,0 +1,197 @@
+SUMMARY = "Netscape Portable Runtime Library"
+HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
+LICENSE = "GPL-2.0 | MPL-2.0 | LGPL-2.1"
+LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=6;md5=90c2fdee38e45d6302abcfe475c8b5c5 \
+                    file://Makefile.in;beginline=4;endline=38;md5=beda1dbb98a515f557d3e58ef06bca99"
+SECTION = "libs/network"
+
+SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
+           file://remove-rpath-from-tests.patch \
+           file://fix-build-on-x86_64.patch \
+           file://remove-srcdir-from-configure-in.patch \
+           file://0002-Add-nios2-support.patch \
+           file://0001-md-Fix-build-with-musl.patch \
+           file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
+           file://nspr.pc.in \
+"
+
+CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
+                                          -D_PR_HAVE_OFF64_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
+                                          -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO \
+                                          -D_PR_INET6_PROBE -DNO_DLOPEN_NULL'"
+
+UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
+
+SRC_URI[md5sum] = "4ca4d75a424f30fcdc766296bb103d17"
+SRC_URI[sha256sum] = "0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256"
+
+CVE_PRODUCT = "netscape_portable_runtime"
+
+S = "${WORKDIR}/nspr-${PV}/nspr"
+
+RDEPENDS_${PN}-dev += "perl"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+TESTS = " \
+    accept \
+    acceptread \
+    acceptreademu \
+    affinity \
+    alarm \
+    anonfm \
+    atomic \
+    attach \
+    bigfile \
+    cleanup \
+    cltsrv  \
+    concur \
+    cvar \
+    cvar2 \
+    dlltest \
+    dtoa \
+    errcodes \
+    exit \
+    fdcach \
+    fileio \
+    foreign \
+    formattm \
+    fsync \
+    gethost \
+    getproto \
+    i2l \
+    initclk \
+    inrval \
+    instrumt \
+    intrio \
+    intrupt \
+    io_timeout \
+    ioconthr \
+    join \
+    joinkk \
+    joinku \
+    joinuk \
+    joinuu \
+    layer \
+    lazyinit \
+    libfilename \
+    lltest \
+    lock \
+    lockfile \
+    logfile \
+    logger \
+    many_cv \
+    multiwait \
+    nameshm1 \
+    nblayer \
+    nonblock \
+    ntioto \
+    ntoh \
+    op_2long \
+    op_excl \
+    op_filnf \
+    op_filok \
+    op_nofil \
+    parent \
+    parsetm \
+    peek \
+    perf \
+    pipeping \
+    pipeping2 \
+    pipeself \
+    poll_nm \
+    poll_to \
+    pollable \
+    prftest \
+    primblok \
+    provider \
+    prpollml \
+    ranfile \
+    randseed \
+    reinit \
+    rwlocktest \
+    sel_spd \
+    selct_er \
+    selct_nm \
+    selct_to \
+    selintr \
+    sema \
+    semaerr \
+    semaping \
+    sendzlf \
+    server_test \
+    servr_kk \
+    servr_uk \
+    servr_ku \
+    servr_uu \
+    short_thread \
+    sigpipe \
+    socket \
+    sockopt \
+    sockping \
+    sprintf \
+    stack \
+    stdio \
+    str2addr \
+    strod \
+    switch \
+    system \
+    testbit \
+    testfile \
+    threads \
+    timemac \
+    timetest \
+    tpd \
+    udpsrv \
+    vercheck \
+    version \
+    writev \
+    xnotify \
+    zerolen"
+
+inherit autotools multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/nspr-config"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+# Do not install nspr in usr/include, but in usr/include/nspr, the
+# preferred path upstream.
+EXTRA_OECONF += "--includedir=${includedir}/nspr"
+
+do_compile_prepend() {
+	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
+}
+
+do_compile_append() {
+	oe_runmake -C pr/tests
+}
+
+do_install_append() {
+    install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
+    sed -i  \
+    -e 's:NSPRVERSION:${PV}:g' \
+    -e 's:OEPREFIX:${prefix}:g' \
+    -e 's:OELIBDIR:${libdir}:g' \
+    -e 's:OEINCDIR:${includedir}:g' \
+    -e 's:OEEXECPREFIX:${exec_prefix}:g' \
+    ${D}${libdir}/pkgconfig/nspr.pc
+
+    mkdir -p ${D}${libdir}/nspr/tests
+    install -m 0755 ${S}/pr/tests/runtests.pl ${D}${libdir}/nspr/tests
+    install -m 0755 ${S}/pr/tests/runtests.sh ${D}${libdir}/nspr/tests
+    cd ${B}/pr/tests
+    install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
+
+    # delete compile-et.pl and perr.properties from ${bindir} because these are
+    # only used to generate prerr.c and prerr.h files from prerr.et at compile
+    # time
+    rm ${D}${bindir}/compile-et.pl ${D}${bindir}/prerr.properties
+}
+
+FILES_${PN} = "${libdir}/lib*.so"
+FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
+                ${includedir}/* ${datadir}/aclocal/* "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
new file mode 100644
index 0000000000..c380c14491
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -0,0 +1,52 @@
+From 5595e9651aca39af945931c73eb524a0f8bd130d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 18 Dec 2019 12:29:50 +0100
+Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
+
+Not all current hardware supports it, particularly anything
+prior to armv8 does not.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ nss/lib/freebl/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -125,6 +125,9 @@ else
+         DEFINES += -DNSS_X86
+ endif
+ endif
++
++ifdef NSS_USE_ARM_HW_CRYPTO
++    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
+ ifeq ($(CPU_ARCH),aarch64)
+     DEFINES += -DUSE_HW_AES
+     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
+@@ -146,6 +149,7 @@ ifeq ($(CPU_ARCH),arm)
+         endif
+     endif
+ endif
++endif
+ 
+ ifeq ($(OS_TARGET),OSF1)
+     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -17,6 +17,7 @@
+ 
+ #include <limits.h>
+ 
++#ifdef NSS_USE_ARM_HW_CRYPTO
+ /* old gcc doesn't support some poly64x2_t intrinsic */
+ #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
+     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
+@@ -25,6 +26,7 @@
+ /* We don't test on big endian platform, so disable this on big endian. */
+ #define USE_ARM_GCM
+ #endif
++#endif
+ 
+ /* Forward declarations */
+ SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
new file mode 100644
index 0000000000..d5403397e7
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -0,0 +1,48 @@
+From 0cf47ee432cc26a706864fcc09b2c3adc342a679 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 22 Feb 2017 11:36:11 +0200
+Subject: [PATCH] nss: fix support cross compiling
+
+Let some make variables be assigned from outside makefile.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ nss/coreconf/arch.mk    | 2 +-
+ nss/lib/freebl/Makefile | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
+index 06c276f..9c1eb51 100644
+--- a/nss/coreconf/arch.mk
++++ b/nss/coreconf/arch.mk
+@@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
+ ifeq ($(OS_TEST),i86pc)
+     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
+ else
+-    OS_RELEASE := $(shell uname -r)
++    OS_RELEASE ?= $(shell uname -r)
+ endif
+ 
+ #
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 0ce1425..ebeb411 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -36,6 +36,12 @@ ifdef USE_64
+ 	DEFINES += -DNSS_USE_64
+ endif
+ 
++ifeq ($(OS_TEST),mips)
++ifndef USE_64
++       DEFINES += -DNS_PTR_LE_32
++endif
++endif
++
+ ifdef USE_ABI32_FPU
+ 	DEFINES += -DNSS_USE_ABI32_FPU
+ endif
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/nss/nss/blank-cert9.db b/meta-oe/recipes-support/nss/nss/blank-cert9.db
new file mode 100644
index 0000000000000000000000000000000000000000..7d4bcf2582d510f7b51d4306706746178c41fbbc
GIT binary patch
literal 28672
zcmeH~OK;Oa6ou_RTxhB2E<!9aOCljO58HJ%sA+4Yh?2G;mFNOhcH&Bb(26FJSh8cs
zo*x9ii4|h*_1I~<VaFmmmVA3=?%XpopQn-L?dj2YR*1{%n@`zH7;ne(eQ!?)&+~ly
zZrHba)~#5p8ul;c|MmFZ3-M$7@oz8K{Np`(`1t46udT0Jd$xfG1V8`;KmY_l00ck)
z1pYgLy&z~bn*RCtYE*m~e$2+BtLgM)o=?WZje~yL8Kk1yJ51jR&WYomsPp1krlfAY
zTxW+fc9>*&F{wuccN{o(-@&vF*Mi2=rvIMnr}O+nF`U&7>vtSn_P&Rbs?}Ky8c(Wy
zjHlCiaZ{VD-7zVX_dOET`quV08qKEvy)(=5Nl};AV#WCkI{QcIZ4Tp+IO%uabo%Gw
zb$Tw&dfn5rlx8?M?!7wd9t=ch|F}PRE;4CfWnXPyLz+9NM^RTo&4ii>H)%)`Qiv$T
z6m}^j6xtLr3b_q!wvuIJM@b$^mh+H{l4PSK`6x+7N|KY3WThl|DM@BZ4k^0jmFr_?
zU21mL?5x>Yv$JMr&CZ&g4ObbiGF)Z2%5YW8*_g92XJgLBWtKf-_T1%>%ttXG%{$eS
zYBldv^J+tBAFZg{N%A#3+VE(@qivFhlmlr@$fQC^bB9bSWKto|8uF|mf0u}BBX*0}
zE#lf?5t-0LWa%XNI!POIl4fv{w&*17(@6s8BvC9SLveCZ#&}%sqAae;;>B{Ttd?VC
zwHzy}<ycwyT3Ic}%F5TuTfTH=Xkyz-2ggY|Jx<aQa&okg#X?@zk`F>THeW0!r{#>I
zOpbCUp3t|IjGe}YCgyXi+by*cG}5N;l|Le%C-z2vk<Dk<+`g#)gD+GqSM5*j1Nyn$
zrm#Z+4+ww&2!H?xfB*=900@8p2!H?xfWWd6*rbi&{=clB7yAMM5C8!X009sH0T2KI
z5C8!X00Aa|`#%l>2!H?xfB*=900@8p2!H?xfB*<AKLOnTm;W1Mhadm~AOHd&00JNY
z0w4eaAOHd&fcrnr00@8p2!H?xfB*=900@8p2!H?xEI$F<|Cj$8V}~FB0w4eaAOHd&
O00JNY0w4eaAn+IM<WtiC

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-support/nss/nss/blank-key4.db b/meta-oe/recipes-support/nss/nss/blank-key4.db
new file mode 100644
index 0000000000000000000000000000000000000000..d47f08d04fe82197bc6a39ef9bf216b61c3dc77a
GIT binary patch
literal 36864
zcmeI)Pj3@P7zXfN$JsbGQBr~AB4lZNXcZIG&g?%N!~w@RZQ3*mZcvLjSnGHJQ-_q;
zfnEyAB}g2&RFzt!s;9Q+svn?82vt4w)Lub+1tcV(r_THCZkH&E#0_CRt9bl+XXe@2
z-!3E@BtAW}*d2u8!p7!$Fc6M0WtgUMN(jR+GWs>HU&&_aBAa~B@8(POer3jZPkcWy
z`P|6mo5q3c<o&|$h3f?`|0Lhc-`j5z_Co*y5P$##AOHafyh#GRv9V&QWNyz4f_5)l
z4+p{NU=Sqlxq7ovTWyHd+T3D8Bzwhlw<A`X3!l`Q=fua2bK>mM!kM!TvAiVe%S-c%
z3-wjeY^*HS>WyPU|Gc`cqBpzpe$Fb^OQzAi(h0xnU+wA6R<JeL;Loijzon9De9p3p
z#j<&x2dsS&bURo2{gut`wO|mA#fw{5I^FnOa3?Jx9U!IyCGE<oQO@{`GkQTg?4?7j
zT^ZcDC&Q`CXRYFqve}B3z16-Pt_{+R(Ont+sC!R}lB!Z4v5JS2v+4HxTj6FJlid{)
z_3lZjs>-dC=2)>@Ht*E=lBEG@m5HOG%a-ncl?zv!TW+o%6M@t(ecb|EzZ|N02klX`
zt4bfM^s&kxX-L(j#-qlk<~TJ~YG$bksA=nFmZN0Ua-yURC8Og|ijowgB;_bcK}u4R
zk`$#RWhqHvO0H2GFE3gjC)-iY$u=k3oNRNl&B-<=+nnt1EQe<~Jj>x(4$tzr*XLfJ
zdwuTpqh8MRIrBJ=WFN&qHlL|2X|By@YV&GcsW)5E?zp5}heta++Tqc<lZQkDX^hKK
zuB2nTEakG4%SUzjs4ia@kLP-v=5d<GbJs%8aUG8$<C1dYl1?lx=?HO2rx=%Xo^eTl
zaY>3%$tZD|PGg>UZ#vCSrupe|beSwim&tN;nJh<_Nv<xF<>)fW)#XdMbkER%^<KJh
z;*##3xTISsE<0%%rsakIOTH1JvF&s@ZCXyp3uLFw;#In~lG$mj>-c=%+OriWV--Ir
z@Ap?=`e(JJ(t1RHN6FE5l?iI5sKEvS2tWV=5P$##AOHafKmY;|fWWW{<mtrl{6DOh
z7v}{52tWV=5P$##AOHafKmY;|U;#Y;<3@l01Rwwb2tWV=5P$##AOHaf48H)L|A+q?
z;|w7H0SG_<0uX=z1Rwwb2tWV=c>c#d009U<00Izz00bZa0SG_<0uUH}0X+W?|24)L
zLI45~fB*y_009U<00Izz00ij&|2HRpH1roX2tWV=5P$##AOHafKmY;|fB*zuk3h>D
zExFsdFN1#n`o?DG@A=!mz4-R0mFHhS{`aGMCw_gf{mystq@1=2M|VElc{X7l7&S-a
z;q0N#(b>ECcfWb-&&$6&y8G8Z_h0;R>*tJVW~XMJ>|DC|(5t=u;D?(BCuVNYzyF()
mPYwNr4FV8=00bZa0SG_<0uX=z1Rwx`ArdHzl*W_aDEtSkqPYeD

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
new file mode 100644
index 0000000000..de812d27ba
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
@@ -0,0 +1,33 @@
+clang 3.9 add this warning to rightly flag undefined
+behavior, we relegate this to be just a warning instead
+of error and keep the behavior as it was. Right fix would
+be to not pass enum to the function with variadic arguments
+as last named argument
+
+Fixes errors like
+ocsp.c:2220:22: error: passing an object that undergoes default argument promotion to 'va_start' has undefined behavior [-Werror,-Wvarargs]
+        va_start(ap, responseType0);
+                     ^
+ocsp.c:2200:43: note: parameter of type 'SECOidTag' is declared here
+                                SECOidTag responseType0, ...)
+
+see
+https://www.securecoding.cert.org/confluence/display/cplusplus/EXP58-CPP.+Pass+an+object+of+the+correct+type+to+va_start
+for more details
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: nss-3.37.1/nss/coreconf/Werror.mk
+===================================================================
+--- nss-3.37.1.orig/nss/coreconf/Werror.mk
++++ nss-3.37.1/nss/coreconf/Werror.mk
+@@ -56,7 +56,7 @@ ifndef WARNING_CFLAGS
+     ifdef CC_IS_CLANG
+       # -Qunused-arguments : clang objects to arguments that it doesn't understand
+       #    and fixing this would require rearchitecture
+-      WARNING_CFLAGS += -Qunused-arguments
++      WARNING_CFLAGS += -Qunused-arguments -Wno-error=varargs
+       # -Wno-parentheses-equality : because clang warns about macro expansions
+       WARNING_CFLAGS += $(call disable_warning,parentheses-equality)
+       ifdef BUILD_OPT
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch b/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
new file mode 100644
index 0000000000..547594d5b6
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
@@ -0,0 +1,110 @@
+nss: fix incorrect shebang of perl
+
+Replace incorrect shebang of perl with `#!/usr/bin/env perl'.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Pending
+---
+ nss/cmd/smimetools/smime  | 2 +-
+ nss/coreconf/cpdist.pl    | 2 +-
+ nss/coreconf/import.pl    | 2 +-
+ nss/coreconf/jniregen.pl  | 2 +-
+ nss/coreconf/outofdate.pl | 2 +-
+ nss/coreconf/release.pl   | 2 +-
+ nss/coreconf/version.pl   | 2 +-
+ nss/tests/clean_tbx       | 2 +-
+ nss/tests/path_uniq       | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/nss/cmd/smimetools/smime b/nss/cmd/smimetools/smime
+--- a/nss/cmd/smimetools/smime
++++ b/nss/cmd/smimetools/smime
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/perl
++#!/usr/bin/env perl
+ 
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/cpdist.pl b/nss/coreconf/cpdist.pl
+index 800edfb..652187f 100755
+--- a/nss/coreconf/cpdist.pl
++++ b/nss/coreconf/cpdist.pl
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/perl
++#!/usr/bin/env perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/import.pl b/nss/coreconf/import.pl
+index dd2d177..428eaa5 100755
+--- a/nss/coreconf/import.pl
++++ b/nss/coreconf/import.pl
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/perl
++#!/usr/bin/env perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/jniregen.pl b/nss/coreconf/jniregen.pl
+index 2039180..5f4f69c 100755
+--- a/nss/coreconf/jniregen.pl
++++ b/nss/coreconf/jniregen.pl
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/perl
++#!/usr/bin/env perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/outofdate.pl b/nss/coreconf/outofdate.pl
+index 33d80bb..01fc097 100755
+--- a/nss/coreconf/outofdate.pl
++++ b/nss/coreconf/outofdate.pl
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/perl
++#!/usr/bin/env perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/release.pl b/nss/coreconf/release.pl
+index 7cde19d..b5df2f6 100755
+--- a/nss/coreconf/release.pl
++++ b/nss/coreconf/release.pl
+@@ -1,4 +1,4 @@
+-#! /usr/local/bin/perl
++#!/usr/bin/env perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/coreconf/version.pl b/nss/coreconf/version.pl
+index d2a4942..79359fe 100644
+--- a/nss/coreconf/version.pl
++++ b/nss/coreconf/version.pl
+@@ -1,4 +1,4 @@
+-#!/usr/sbin/perl
++#!/usr/bin/env perl
+ #
+ # This Source Code Form is subject to the terms of the Mozilla Public
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+diff --git a/nss/tests/clean_tbx b/nss/tests/clean_tbx
+index 4de9555..a7def9f 100755
+--- a/nss/tests/clean_tbx
++++ b/nss/tests/clean_tbx
+@@ -1,4 +1,4 @@
+-#! /bin/perl
++#!/usr/bin/env perl
+ 
+ #######################################################################
+ #
+diff --git a/nss/tests/path_uniq b/nss/tests/path_uniq
+index f29f60a..08fbffa 100755
+--- a/nss/tests/path_uniq
++++ b/nss/tests/path_uniq
+@@ -1,4 +1,4 @@
+-#! /bin/perl
++#!/usr/bin/env perl
+ 
+ ########################################################################
+ #
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
new file mode 100644
index 0000000000..43c09d13ea
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -0,0 +1,36 @@
+Fix nss multilib build on openSUSE 11.x 32bit
+
+While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
+fail with error:
+
+* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled
+
+It caused by the '-m64' option which passed to host gcc.
+
+The nsinstall was built first while nss starting to build, it only runs
+on host to install built files, it doesn't need any cross-compling or
+multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
+error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+===================================================
+Index: nss-3.24/nss/coreconf/nsinstall/Makefile
+===================================================================
+--- nss-3.24.orig/nss/coreconf/nsinstall/Makefile
++++ nss-3.24/nss/coreconf/nsinstall/Makefile
+@@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
+ 
+ include $(DEPTH)/coreconf/config.mk
+ 
++# nsinstall is unfit for cross-compiling/multilib-build since it was
++# always run on local host to install built files. This change intends
++# to clean the '-m64' from ARCHFLAG and LDFLAGS.
++ARCHFLAG =
++LDFLAGS =
++# CFLAGS =
++
+ ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
+ PROGRAM		=
+ else
diff --git a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
new file mode 100644
index 0000000000..7661dc93a0
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
@@ -0,0 +1,26 @@
+nss:no rpath for cross compiling
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ nss/cmd/platlibs.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
+--- a/nss/cmd/platlibs.mk
++++ b/nss/cmd/platlibs.mk
+@@ -18,9 +18,9 @@ endif
+ 
+ ifeq ($(OS_ARCH), Linux)
+ ifeq ($(USE_64), 1)
+-EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
++#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
+ else
+-EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
++#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
+ endif
+ endif
+ 
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-support/nss/nss/nss.pc.in b/meta-oe/recipes-support/nss/nss/nss.pc.in
new file mode 100644
index 0000000000..402b4ecb33
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/nss.pc.in
@@ -0,0 +1,11 @@
+prefix=OEPREFIX
+exec_prefix=OEEXECPREFIX
+libdir=OELIBDIR
+includedir=OEINCDIR
+
+Name: NSS
+Description: Network Security Services
+Version: %NSS_VERSION%
+Requires: nspr >= %NSPR_VERSION%
+Libs: -L${libdir} -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
+Cflags: -IOEINCDIR
diff --git a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
new file mode 100644
index 0000000000..3a817faaa6
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
@@ -0,0 +1,23 @@
+nss does not build on mips with clang because wrong types are used?
+
+pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
+     if (addend < MP_DIGIT_MAX) {
+       ~~~~~~ ^ ~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: nss-3.37.1/nss/lib/freebl/pqg.c
+===================================================================
+--- nss-3.37.1.orig/nss/lib/freebl/pqg.c
++++ nss-3.37.1/nss/lib/freebl/pqg.c
+@@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_in
+ 
+ static SECStatus
+ addToSeed(const SECItem *seed,
+-          unsigned long addend,
+-          int seedlen, /* g in 186-1 */
++          unsigned long long  addend,
++          int                 seedlen, /* g in 186-1 */
+           SECItem *seedout)
+ {
+     mp_int s, sum, modulus, tmp;
diff --git a/meta-oe/recipes-support/nss/nss/signlibs.sh b/meta-oe/recipes-support/nss/nss/signlibs.sh
new file mode 100644
index 0000000000..a74e499f8c
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/signlibs.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# signlibs.sh
+#
+# (c)2010 Wind River Systems, Inc.
+#
+# regenerates the .chk files for the NSS libraries that require it
+# since the ones that are built have incorrect checksums that were
+# calculated on the host where they really need to be done on the
+# target
+
+CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
+SIGN_BINARY=`which shlibsign`
+for I in $CHK_FILES
+do
+       DN=`dirname $I`
+       BN=`basename $I .chk`
+       FN=$DN/$BN.so
+       $SIGN_BINARY -i $FN
+done
diff --git a/meta-oe/recipes-support/nss/nss/system-pkcs11.txt b/meta-oe/recipes-support/nss/nss/system-pkcs11.txt
new file mode 100644
index 0000000000..1a264e9cc4
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/system-pkcs11.txt
@@ -0,0 +1,5 @@
+library=
+name=NSS Internal PKCS #11 Module
+parameters=configdir='sql:/etc/pki/nssdb' certPrefix='' keyPrefix='' secmod='secmod.db' flags= updatedir='' updateCertPrefix='' updateKeyPrefix='' updateid='' updateTokenDescription='' 
+NSS=Flags=internal,critical trustOrder=75 cipherOrder=100 slotParams=(1={slotFlags=[ECC,RSA,DSA,DH,RC2,RC4,DES,RANDOM,SHA1,MD5,MD2,SSL,TLS,AES,Camellia,SEED,SHA256,SHA512] askpw=any timeout=30})
+
diff --git a/meta-oe/recipes-support/nss/nss_3.50.bb b/meta-oe/recipes-support/nss/nss_3.50.bb
new file mode 100644
index 0000000000..e9855d7a7e
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss_3.50.bb
@@ -0,0 +1,273 @@
+SUMMARY = "Mozilla's SSL and TLS implementation"
+DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
+designed to support cross-platform development of \
+security-enabled client and server applications. \
+Applications built with NSS can support SSL v2 and v3, \
+TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
+v3 certificates, and other security standards."
+HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
+SECTION = "libs"
+
+DEPENDS = "sqlite3 nspr zlib nss-native"
+DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
+
+LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
+
+LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
+                    file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
+
+VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
+
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
+           file://nss.pc.in \
+           file://signlibs.sh \
+           file://0001-nss-fix-support-cross-compiling.patch \
+           file://nss-no-rpath-for-cross-compiling.patch \
+           file://nss-fix-incorrect-shebang-of-perl.patch \
+           file://disable-Wvarargs-with-clang.patch \
+           file://pqg.c-ULL_addend.patch \
+           file://blank-cert9.db \
+           file://blank-key4.db \
+           file://system-pkcs11.txt \
+           file://nss-fix-nsinstall-build.patch \
+           file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           "
+
+SRC_URI[md5sum] = "e0366615e12b147cebc136c915baea37"
+SRC_URI[sha256sum] = "185df319775243f5f5daa9d49b7f9cc5f2b389435be3247c3376579bee063ba7"
+
+UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
+UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
+
+inherit siteinfo
+
+TD = "${S}/tentative-dist"
+TDS = "${S}/tentative-dist-staging"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure_prepend_libc-musl () {
+    sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
+}
+
+do_compile_prepend_class-native() {
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
+    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
+    export NSS_ENABLE_WERROR=0
+}
+
+do_compile_prepend_class-nativesdk() {
+    export LDFLAGS=""
+}
+
+do_compile_prepend_class-native() {
+    # Need to set RPATH so that chrpath will do its job correctly
+    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
+}
+
+do_compile() {
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
+
+    export CROSS_COMPILE=1
+    export NATIVE_CC="${BUILD_CC}"
+    # Additional defines needed on Centos 7
+    export NATIVE_FLAGS="${BUILD_CFLAGS} -DLINUX -Dlinux"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+    export FREEBL_LOWHASH=1
+
+    export LIBDIR=${libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    ${@bb.utils.contains("TUNE_FEATURES", "crypto", "export NSS_USE_ARM_HW_CRYPTO=1", "", d)}
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
+        OS_TEST=mips
+    elif [ "${TARGET_ARCH}" = "aarch64_be" ]; then
+        OS_TEST="aarch64"
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
+        export USE_X32=1
+    fi
+
+    export NSS_DISABLE_GTESTS=1
+
+    # We can modify CC in the environment, but if we set it via an
+    # argument to make, nsinstall, a host program, will also build with it!
+    #
+    # nss pretty much does its own thing with CFLAGS, so we put them into CC.
+    # Optimization will get clobbered, but most of the stuff will survive.
+    # The motivation for this is to point to the correct place for debug
+    # source files and CFLAGS does that.  Nothing uses CCC.
+    #
+    export CC="${CC} ${CFLAGS}"
+    make -C ./nss CCC="${CXX} -g" \
+        OS_TEST=${OS_TEST} \
+        RPATH="${RPATH}"
+}
+
+do_compile[vardepsexclude] += "SITEINFO_BITS"
+
+do_install_prepend_class-nativesdk() {
+    export LDFLAGS=""
+}
+
+do_install() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="${BUILD_CC}"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+
+    export LIBDIR=${libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
+        OS_TEST=mips
+    elif [ "${TARGET_ARCH}" = "aarch64_be" ]; then
+        CPU_ARCH=aarch64
+        OS_TEST="aarch64"
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
+        export USE_X32=1
+    fi
+
+    export NSS_DISABLE_GTESTS=1
+
+    make -C ./nss \
+        CCC="${CXX}" \
+        OS_TEST=${OS_TEST} \
+        SOURCE_LIB_DIR="${TD}/${libdir}" \
+        SOURCE_BIN_DIR="${TD}/${bindir}" \
+        install
+
+    install -d ${D}/${libdir}/
+    for file in ${S}/dist/*.OBJ/lib/*.so; do
+        echo "Installing `basename $file`..."
+        cp $file  ${D}/${libdir}/
+    done
+
+    for shared_lib in ${TD}/${libdir}/*.so.*; do
+        if [ -f $shared_lib ]; then
+            cp $shared_lib ${D}/${libdir}
+            ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename $shared_lib .1oe)
+        fi
+    done
+    for shared_lib in ${TD}/${libdir}/*.so; do
+        if [ -f $shared_lib -a ! -e ${D}/${libdir}/$shared_lib ]; then
+            cp $shared_lib ${D}/${libdir}
+        fi
+    done
+
+    install -d ${D}/${includedir}/nss3
+    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
+
+    install -d ${D}/${bindir}
+    for binary in ${TD}/${bindir}/*; do
+        install -m 755 -t ${D}/${bindir} $binary
+    done
+}
+
+do_install[vardepsexclude] += "SITEINFO_BITS"
+
+do_install_append() {
+    # Create empty .chk files for the NSS libraries at build time. They could
+    # be regenerated at target's boot time.
+    for file in libsoftokn3.chk libfreebl3.chk libnssdbm3.chk; do
+        touch ${D}/${libdir}/$file
+        chmod 755 ${D}/${libdir}/$file
+    done
+    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
+
+    install -d ${D}${libdir}/pkgconfig/
+    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
+}
+
+do_install_append_class-target() {
+    # It used to call certutil to create a blank certificate with empty password at
+    # build time, but the checksum of key4.db changes every time when certutil is called.
+    # It causes non-determinism issue, so provide databases with a blank certificate
+    # which are originally from output of nss in qemux86-64 build. You can get these
+    # databases by:
+    # certutil -N -d sql:/database/path/ --empty-password
+    install -d ${D}${sysconfdir}/pki/nssdb/
+    install -m 0644 ${WORKDIR}/blank-cert9.db ${D}${sysconfdir}/pki/nssdb/cert9.db
+    install -m 0644 ${WORKDIR}/blank-key4.db ${D}${sysconfdir}/pki/nssdb/key4.db
+    install -m 0644 ${WORKDIR}/system-pkcs11.txt ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
+}
+
+PACKAGE_WRITE_DEPS += "nss-native"
+pkg_postinst_${PN} () {
+    if [ -n "$D" ]; then
+        for I in $D${libdir}/lib*.chk; do
+            DN=`dirname $I`
+            BN=`basename $I .chk`
+            FN=$DN/$BN.so
+            shlibsign -i $FN
+            if [ $? -ne 0 ]; then
+                exit 1
+            fi
+        done
+    else
+        signlibs.sh
+    fi
+}
+
+PACKAGES =+ "${PN}-smime"
+FILES_${PN}-smime = "\
+    ${bindir}/smime \
+"
+
+FILES_${PN} = "\
+    ${sysconfdir} \
+    ${bindir} \
+    ${libdir}/lib*.chk \
+    ${libdir}/lib*.so \
+    "
+
+FILES_${PN}-dev = "\
+    ${libdir}/nss \
+    ${libdir}/pkgconfig/* \
+    ${includedir}/* \
+    "
+
+RDEPENDS_${PN}-smime = "perl"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


