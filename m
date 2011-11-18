Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RRCJq-0004Ur-6a
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 01:28:38 +0100
Received: by iahk25 with SMTP id k25so2910962iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hjDxgqOQ7AYrsQKnfhHL1KCxi50mMqUDFY8ryKOQ2Ns=;
	b=LcfqvN89GUvUKknRI70i2+QkI1LRmiyOf2Nj7tBGzPR+xPA2izkB4d+kod9iJLucg2
	6OBhkarwyXp+Vr+1MCVw8kQlt3BakEHbVjCTB2wd47jidBfoCF9IofXxhZ6J7hpekeTz
	pk89pjPjfwrd2EqdKJihbRugX15Ck3QHLsWEQ=
Received: by 10.42.135.69 with SMTP id o5mr365049ict.34.1321575731755;
	Thu, 17 Nov 2011 16:22:11 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ew6sm35060314igc.4.2011.11.17.16.22.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Nov 2011 16:22:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2011 16:22:06 -0800
Message-Id: <1321575726-25190-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.6: Delete linaro patch that has been committed upstream
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2011 00:28:38 -0000

gcc-4.6-linaro-r106723.patch is actually a fix for PR 47551
and its needed in oe-core therefore we have to delete this
here since now it will be part of oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch    |   63 --------------------
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    1 -
 2 files changed, 0 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch
deleted file mode 100644
index 5271ffa..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106723.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
-
-	gcc/
-	PR target/47551
-	* config/arm/arm.c (coproc_secondary_reload_class): Handle
-	structure modes.  Don't check neon_vector_mem_operand for
-	vector or structure modes.
-
-	gcc/testsuite/
-	PR target/47551
-	* gcc.target/arm/neon-modes-2.c: New test.
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2011-02-21 14:04:51 +0000
-+++ new/gcc/config/arm/arm.c	2011-03-02 11:38:43 +0000
-@@ -9139,11 +9139,14 @@
-       return GENERAL_REGS;
-     }
- 
-+  /* The neon move patterns handle all legitimate vector and struct
-+     addresses.  */
-   if (TARGET_NEON
-+      && MEM_P (x)
-       && (GET_MODE_CLASS (mode) == MODE_VECTOR_INT
--          || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT)
--      && neon_vector_mem_operand (x, 0))
--     return NO_REGS;
-+	  || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT
-+	  || VALID_NEON_STRUCT_MODE (mode)))
-+    return NO_REGS;
- 
-   if (arm_coproc_mem_operand (x, wb) || s_register_operand (x, mode))
-     return NO_REGS;
-
-=== added file 'gcc/testsuite/gcc.target/arm/neon-modes-2.c'
---- old/gcc/testsuite/gcc.target/arm/neon-modes-2.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon-modes-2.c	2011-02-02 10:02:45 +0000
-@@ -0,0 +1,24 @@
-+/* { dg-do compile } */
-+/* { dg-require-effective-target arm_neon_ok } */
-+/* { dg-options "-O1" } */
-+/* { dg-add-options arm_neon } */
-+
-+#include "arm_neon.h"
-+
-+#define SETUP(A) x##A = vld3_u32 (ptr + A * 0x20)
-+#define MODIFY(A) x##A = vld3_lane_u32 (ptr + A * 0x20 + 0x10, x##A, 1)
-+#define STORE(A) vst3_u32 (ptr + A * 0x20, x##A)
-+
-+#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
-+
-+void
-+bar (uint32_t *ptr, int y)
-+{
-+  uint32x2x3_t MANY (SETUP);
-+  int *x = __builtin_alloca (y);
-+  int z[0x1000];
-+  foo (x, z);
-+  MANY (MODIFY);
-+  foo (x, z);
-+  MANY (STORE);
-+}
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 9ed282e..73fe5c8 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -1,6 +1,5 @@
 GCC-4_6-BRANCH-LINARO-BACKPORTS = "        \
 file://linaro/gcc-4.6-linaro-r106720.patch \
-file://linaro/gcc-4.6-linaro-r106723.patch \
 file://linaro/gcc-4.6-linaro-r106733.patch \
 file://linaro/gcc-4.6-linaro-r106737.patch \
 file://linaro/gcc-4.6-linaro-r106738.patch \
-- 
1.7.5.4



