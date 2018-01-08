Return-Path: <Jose.DiazdeGrenu@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.14])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA977893F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 11:49:33 +0000 (UTC)
Received: from [216.82.251.44] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-14.bemta-12.messagelabs.com id 3B/D8-03139-FCA535A5;
	Mon, 08 Jan 2018 11:49:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsXi5LtOQPdcVHC
	UwZYF6hYXDy9ltvj51saByePcxhWMHtvXXmUKYIpizcxLyq9IYM1Ydfgpa8HqwIoNPxawNjD+
	du9i5OIQEljJKPHs1ER2CGcVo8SF3uuMXYycHGwCJhJXZuxkBrFFBPQlls7eA2YzCxhKrNmyk
	QnEFhaIlDh4p4ENxGYRUJHo+HkQLM4r4Clx5uNtdhBbQkBO4ua5TmaIuKDEyZlPWCDmSEgcfP
	ECLC4koCbRNmcCkM0BVC8v8be3bAIj7ywkHbOQdCxgZFrFqFGcWlSWWqRrYqKXVJSZnlGSm5i
	Zo2toaKSXm1pcnJiempOYVKyXnJ+7iREYUPUMDIw7GD/sjz7EKMnBpCTKK+ocECXEl5SfUpmR
	WJwRX1Sak1p8iFGGg0NJgrcuMjhKSLAoNT21Ii0zBxjaMGkJDh4lEd5UkDRvcUFibnFmOkTqF
	KMxx7OZrxuYOaZdbW1iFmLJy89LlRLnrQQpFQApzSjNgxsEi7lLjLJSwryMDAwMQjwFqUW5mS
	Wo8q8YxTkYlYR5a0Gm8GTmlcDtewV0ChPQKe/2BYKcUpKIkJJqYFyVf6Pz2bFmUZ4Le6rvc2b
	PXVfEICX86Jui2fHcHSGyS3kf6B/YlfLIRFithrGFQ/SE6T6zScdaJlktaIvdXV39ULvoh9gJ
	qT9GojlRj96cD9U8f7WUo/+sucoZjTqNP3VfD+U+/mKkm/Vu8aEs2co3D5bkRgtcjrtZ8CInU
	vbfxK/NLwNWr1FiKc5INNRiLipOBAAi76kQtAIAAA==
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-6.tower-200.messagelabs.com!1515412174!37518311!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16524 invoked from network); 8 Jan 2018 11:49:34 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-6.tower-200.messagelabs.com with SMTP;
	8 Jan 2018 11:49:34 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 8 Jan 2018 05:49:31 -0600
Received: from localhost.localdomain (10.101.2.92) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 8 Jan 2018 12:49:29 +0100
From: Jose Diaz de Grenu <Jose.DiazdeGrenu@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jan 2018 12:49:17 +0100
Message-ID: <1515412157-30726-1-git-send-email-Jose.DiazdeGrenu@digi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.101.2.92]
Subject: [meta-java][PATCH] openjdk-7: fix compile errors with current poky master (gcc6)
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
X-List-Received-Date: Mon, 08 Jan 2018 11:49:34 -0000
Content-Type: text/plain

From: Richard Leitner <richard.leitner@skidata.com>

Using the current poky master openjdk-7 wasn't buildable. This patch
fixes those problems by adding three more patches to openjdk-7.

These patches basically add/fix GCC6 support. Furthermore the
LDFLAGS_HASH_STYLE variable (which was removed by the
icedtea-crosscompile-fix.patch) is re-introduced and set to "both" for
compatibility reasons.

Following two patches were originally written by Abdur Rehman and taken
from meta-mentor [1]:
	icedtea-flags-to-compile-with-GCC-6.patch
	icedtea-specify-overloaded-variant-of-fmod.patch

[1] https://github.com/MentorEmbedded/meta-mentor

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
Signed-off-by: Jose Diaz de Grenu <Jose.DiazdeGrenu@digi.com>
---
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb      | 12 +++-
 .../icedtea-crosscompile-fix.patch                 |  3 +-
 .../icedtea-flags-to-compile-with-GCC-6.patch      | 74 ++++++++++++++++++++++
 ...icedtea-hotspot-fix-string-literal-marcos.patch | 26 ++++++++
 ...cedtea-specify-overloaded-variant-of-fmod.patch | 28 ++++++++
 5 files changed, 141 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-flags-to-compile-with-GCC-6.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-hotspot-fix-string-literal-marcos.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-7/icedtea-specify-overloaded-variant-of-fmod.patch

diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index eba353ec4a8c..aa165f5075a3 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -51,6 +51,9 @@ ICEDTEAPATCHES = "\
     file://icedtea-xawt-crosscompile-fix.patch;apply=no \
     file://icedtea-jdk-unzip.patch;apply=no \
     file://icedtea-dtrace-std_h.patch;apply=no \
+    file://icedtea-hotspot-fix-string-literal-marcos.patch;apply=no \
+    file://icedtea-flags-to-compile-with-GCC-6.patch;apply=no \
+    file://icedtea-specify-overloaded-variant-of-fmod.patch;apply=no \
 "
 
 DISTRIBUTION_PATCHES = "\
@@ -61,10 +64,17 @@ DISTRIBUTION_PATCHES = "\
     patches/icedtea-xawt-crosscompile-fix.patch \
     patches/icedtea-jdk-unzip.patch \
     patches/icedtea-dtrace-std_h.patch \
+    patches/icedtea-hotspot-fix-string-literal-marcos.patch \
+    patches/icedtea-flags-to-compile-with-GCC-6.patch \
+    patches/icedtea-specify-overloaded-variant-of-fmod.patch \
 "
 
 export DISTRIBUTION_PATCHES
 
 # readdir_r was deprecated in glibc-2.24. Ignore the error for now
+#
+# Furthermore shifting negative values produces an error in current gcc versions
+# to avoid this error add -fpermissive
+#
 # NOTE: When updating the recipe, please check if this is still needed
-CFLAGS_append = " -Wno-error=deprecated-declarations"
+CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=narrowing -fpermissive"
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-crosscompile-fix.patch
index e957d1e2963b..5d93dbdb0ae5 100644
--- a/recipes-core/openjdk/patches-openjdk-7/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-crosscompile-fix.patch
@@ -53,7 +53,7 @@ index 6fe5191..765fc6d 100644
  
  # Hotspot uses very unstrict aliasing turn this optimization off
  OPT_CFLAGS += -fno-strict-aliasing
-@@ -208,15 +208,7 @@ LFLAGS += -Wl,-relax
+@@ -208,15 +208,8 @@ LFLAGS += -Wl,-relax
  endif
  
  # Enable linker optimization
@@ -66,6 +66,7 @@ index 6fe5191..765fc6d 100644
 -  LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
 -endif
 -LFLAGS += $(LDFLAGS_HASH_STYLE)
++LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
 +LFLAGS += $(OE_LDFLAGS)
  
  # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-flags-to-compile-with-GCC-6.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-flags-to-compile-with-GCC-6.patch
new file mode 100644
index 000000000000..062c6bfa96c1
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-flags-to-compile-with-GCC-6.patch
@@ -0,0 +1,74 @@
+From 732aab80cb1505ef2f4d8a6e141f835aa9f6d985 Mon Sep 17 00:00:00 2001
+From: Abdur Rehman <abdur_rehman@mentor.com>
+Date: Mon, 24 Oct 2016 20:24:32 +0500
+Subject: [PATCH] icedtea flags to compile with GCC 6
+
+Upstream bug filed here:
+https://bugs.openjdk.java.net/browse/JDK-8163032
+
+This patch combines the changes introduced by following commits:
+* http://hg.openjdk.java.net/jdk7u/jdk7u/hotspot/rev/e34324d73cd5
+* http://hg.openjdk.java.net/jdk7u/jdk7u/jdk/rev/9e1264f51bae
+
+Upstream-Status: Backport
+
+Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
+---
+ openjdk/hotspot/make/linux/makefiles/gcc.make | 7 +++++++
+ openjdk/jdk/make/common/Defs-linux.gmk        | 8 +++++++-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
+index 4ef0e49..bca3c5c 100644
+--- openjdk/hotspot/make/linux/makefiles/gcc.make
++++ openjdk/hotspot/make/linux/makefiles/gcc.make
+@@ -83,6 +83,7 @@ ifeq ($(TYPE),SHARK)
+ CFLAGS += $(LIBFFI_CFLAGS)
+ CFLAGS += $(LLVM_CFLAGS)
+ endif
++CFLAGS += -std=gnu++98
+ CFLAGS += $(VM_PICFLAG)
+ CFLAGS += -fno-rtti
+ CFLAGS += -fno-exceptions
+@@ -93,6 +94,12 @@ CFLAGS += -fcheck-new
+ ifneq "$(shell expr \( $(CC_VER_MAJOR) \> 4 \) \| \( \( $(CC_VER_MAJOR) = 4 \) \& \( $(CC_VER_MINOR) \>= 3 \) \))" "0"
+ CFLAGS += -fvisibility=hidden
+ endif
++# GCC 6 has more aggressive dead-store elimination which causes the VM to crash
++# It also optimises away null pointer checks which are still needed.
++# We turn both of these optimisations off.
++ifneq "$(shell expr \( $(CC_VER_MAJOR) \>= 6 \))" "0"
++CFLAGS += -fno-delete-null-pointer-checks -fno-lifetime-dse
++endif
+ 
+ ARCHFLAG = $(ARCHFLAG/$(BUILDARCH))
+ ARCHFLAG/i486    = -m32 -march=i586
+diff --git openjdk/jdk/make/common/Defs-linux.gmk openjdk/jdk/make/common/Defs-linux.gmk
+index f64042c..727593c 100644
+--- openjdk/jdk/make/common/Defs-linux.gmk
++++ openjdk/jdk/make/common/Defs-linux.gmk
+@@ -217,6 +217,12 @@ CFLAGS_REQUIRED_ppc64   += -fno-tree-vectorize
+   CFLAGS_REQUIRED       =  $(CFLAGS_REQUIRED_$(ARCH))
+   LDFLAGS_COMMON        += $(LDFLAGS_COMMON_$(ARCH))
+ endif
++# GCC 6 has more aggressive dead-store elimination which causes the VM to crash
++# It also optimises away null pointer checks which are still needed.
++# We turn both of these optimisations off.
++ifeq ($(shell $(EXPR) $(CC_MAJORVER) \>= 6 ),1)
++ CFLAGS_REQUIRED += -fno-delete-null-pointer-checks -fno-lifetime-dse
++endif
+ 
+ # If this is a --hash-style=gnu system, use --hash-style=both
+ #   The gnu .hash section won't work on some Linux systems like SuSE 10.
+@@ -281,7 +287,7 @@ CFLAGS_OPT      = $(CC_OPT)
+ CFLAGS_DBG      = $(DEBUG_FLAG)
+ CFLAGS_COMMON += $(CFLAGS_REQUIRED)
+ 
+-CXXFLAGS_COMMON = $(GLOBAL_KPIC) -DCC_NOEX $(GCC_WARNINGS)
++CXXFLAGS_COMMON = -std=gnu++98 $(GLOBAL_KPIC) -DCC_NOEX $(GCC_WARNINGS)
+ CXXFLAGS_OPT	= $(CC_OPT)
+ CXXFLAGS_DBG	= $(DEBUG_FLAG)
+ CXXFLAGS_COMMON += $(CFLAGS_REQUIRED)
+-- 
+2.8.1
+
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-hotspot-fix-string-literal-marcos.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-hotspot-fix-string-literal-marcos.patch
new file mode 100644
index 000000000000..533a04afb1ef
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-hotspot-fix-string-literal-marcos.patch
@@ -0,0 +1,26 @@
+--- openjdk/hotspot/src/share/vm/gc_implementation/g1/concurrentMark.cpp
++++ openjdk/hotspot/src/share/vm/gc_implementation/g1/concurrentMark.cpp
+@@ -4378,9 +4378,9 @@
+ #define G1PPRL_DOUBLE_H_FORMAT        "  %14s"
+ 
+ // For summary info
+-#define G1PPRL_SUM_ADDR_FORMAT(tag)    "  "tag":"G1PPRL_ADDR_BASE_FORMAT
+-#define G1PPRL_SUM_BYTE_FORMAT(tag)    "  "tag": "SIZE_FORMAT
+-#define G1PPRL_SUM_MB_FORMAT(tag)      "  "tag": %1.2f MB"
++#define G1PPRL_SUM_ADDR_FORMAT(tag)    "  " tag ":"G1PPRL_ADDR_BASE_FORMAT
++#define G1PPRL_SUM_BYTE_FORMAT(tag)    "  " tag ": "SIZE_FORMAT
++#define G1PPRL_SUM_MB_FORMAT(tag)      "  " tag ": %1.2f MB"
+ #define G1PPRL_SUM_MB_PERC_FORMAT(tag) G1PPRL_SUM_MB_FORMAT(tag)" / %1.2f %%"
+ 
+ G1PrintRegionLivenessInfoClosure::
+--- openjdk/hotspot/src/share/vm/prims/unsafe.cpp
++++ openjdk/hotspot/src/share/vm/prims/unsafe.cpp
+@@ -950,7 +950,7 @@
+   }
+ UNSAFE_END
+ 
+-#define DAC_Args CLS"[B["OBJ
++#define DAC_Args CLS "[B[" OBJ
+ // define a class but do not make it known to the class loader or system dictionary
+ // - host_class:  supplies context for linkage, access control, protection domain, and class loader
+ // - data:  bytes of a class file, a raw memory address (length gives the number of bytes)
diff --git a/recipes-core/openjdk/patches-openjdk-7/icedtea-specify-overloaded-variant-of-fmod.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-specify-overloaded-variant-of-fmod.patch
new file mode 100644
index 000000000000..09fbffe042c4
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-7/icedtea-specify-overloaded-variant-of-fmod.patch
@@ -0,0 +1,28 @@
+From 64a8800cd4efa15bf625227b7cd3a2e15ebfa359 Mon Sep 17 00:00:00 2001
+From: Abdur Rehman <abdur_rehman@mentor.com>
+Date: Tue, 25 Oct 2016 13:29:51 +0500
+Subject: [PATCH] arm32JIT.cpp: specify overloaded variant of fmod
+
+Upstream-Status: Pending
+
+Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
+---
+ openjdk/hotspot/src/cpu/zero/vm/arm32JIT.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git openjdk/hotspot/src/cpu/zero/vm/arm32JIT.cpp openjdk/hotspot/src/cpu/zero/vm/arm32JIT.cpp
+index 089a1c9..4482fd6 100644
+--- openjdk/hotspot/src/cpu/zero/vm/arm32JIT.cpp
++++ openjdk/hotspot/src/cpu/zero/vm/arm32JIT.cpp
+@@ -8185,7 +8185,7 @@ handlers[H_INVOKEINTERFACE] = (unsigned)(cb->hp + INVOKEINTERFACE_STUB);
+ 
+   handlers[H_DREM] = out_pos(&codebuf);
+   stm(&codebuf, (1<<ARM_LR), ARM_SP, PUSH_FD, 1);
+-  mov_imm(&codebuf, ARM_IP, (u32)fmod);
++  mov_imm(&codebuf, ARM_IP, (u32)(double (*)(double, double))fmod);
+ #ifdef __ARM_PCS_VFP
+   vmov_reg_d_toVFP(&codebuf, VFP_D0, ARM_R0, ARM_R1);
+   vmov_reg_d_toVFP(&codebuf, VFP_D1, ARM_R2, ARM_R3);
+-- 
+2.8.1
+

