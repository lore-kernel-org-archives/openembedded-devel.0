Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R6oSI-0003FY-4y
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 20:57:06 +0200
Received: by yxj17 with SMTP id 17so3288457yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 11:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ddO/BuHweFBl9VJurXLQDMxrE9ZwNQVf8ExMc6/ZRug=;
	b=aIUwhTIvO0KeT7Gk1QjqRXLm3NWb1GGu/Uh4nl3Zxx1tzq5qvdHzK4A0mqweKa9YIb
	+ZvxnURVjD3uTVH7D5d4pmqPpU2JgvMmfpF7UGIcIVMQHDD6obcCW5i46Vhwsx1dVjKK
	BPGK0B/is5CaTVTfhuI39ka96fZDlHfCy0m9g=
Received: by 10.236.182.66 with SMTP id n42mr15530501yhm.128.1316717505741;
	Thu, 22 Sep 2011 11:51:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id p68sm12650280yhj.16.2011.09.22.11.51.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 11:51:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 11:51:31 -0700
Message-Id: <1316717491-26716-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.5: Fix cross-gcc build for 64 bit targets
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
X-List-Received-Date: Thu, 22 Sep 2011 18:57:06 -0000

Building gcc-cross-intermediate for x86_64
failed since the notion of multlib has changed
in oe-core. So we needed to sync 64bit hack
patch from oe-core/gcc-4.6 into meta-oe 4.5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |    2 +-
 .../recipes-devtools/gcc/gcc-4.5/64bithack.patch   |   64 +++++++++++++++++---
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 59be317..579280f 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r42"
+PR = "r43"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
index b5ba8a4..7033014 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/64bithack.patch
@@ -1,20 +1,68 @@
-By default gcc places 64 bit libs in a lib64 directory. This makes it use 
-"lib" instead.
+Upstream-Status: Inappropriate [embedded specific]
 
-RP 25/7/10
+GCC has internal multilib handling code but it assumes a very specific rigid directory
+layout. The build system implementation of multilib layout is very generic and allows
+complete customisation of the library directories.
 
-Index: gcc-4.5.0/gcc/config/i386/t-linux64
+This patch is a partial solution to allow any custom directories to be passed into gcc
+and handled correctly. It forces gcc to use the base_libdir (which is the current 
+directory, "."). We need to do this for each multilib that is configured as we don't
+know which compiler options may be being passed into the compiler. Since we have a compiler
+per mulitlib at this point that isn't an issue.
+
+The one problem is the target compiler is only going to work for the default multlilib at
+this point. Ideally we'd figure out which multilibs were being enabled with which paths
+and be able to patch these entries with a complete set of correct paths but this we
+don't have such code at this point. This is something the target gcc recipe should do 
+and override these platform defaults in its build config.
+
+RP 15/8/11
+
+Index: gcc-4_5-branch/gcc/config/i386/t-linux64
 ===================================================================
---- gcc-4.5.0.orig/gcc/config/i386/t-linux64	2010-08-10 15:47:42.000000000 +0100
-+++ gcc-4.5.0/gcc/config/i386/t-linux64	2010-08-10 15:47:47.000000000 +0100
+--- gcc-4_5-branch.orig/gcc/config/i386/t-linux64	2011-09-22 11:37:51.188913390 -0700
++++ gcc-4_5-branch/gcc/config/i386/t-linux64	2011-09-22 11:37:56.818913303 -0700
 @@ -24,8 +24,8 @@
  # MULTILIB_OSDIRNAMES according to what is found on the target.
  
  MULTILIB_OPTIONS = m64/m32
 -MULTILIB_DIRNAMES = 64 32 
 -MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
-+MULTILIB_DIRNAMES = . 32 
-+MULTILIB_OSDIRNAMES = . $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
++MULTILIB_DIRNAMES = . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
  
  LIBGCC = stmp-multilib
  INSTALL_LIBGCC = install-multilib
+Index: gcc-4_5-branch/gcc/config/mips/t-linux64
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/mips/t-linux64	2011-06-16 17:59:02.000000000 -0700
++++ gcc-4_5-branch/gcc/config/mips/t-linux64	2011-09-22 11:37:56.838913302 -0700
+@@ -17,8 +17,8 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+-MULTILIB_DIRNAMES = n32 32 64
+-MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ 
+ EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
+ 
+Index: gcc-4_5-branch/gcc/config/rs6000/t-linux64
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/rs6000/t-linux64	2011-06-16 17:58:58.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/t-linux64	2011-09-22 11:37:56.838913302 -0700
+@@ -32,11 +32,11 @@ TARGET_LIBGCC2_CFLAGS += -mno-minimal-to
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+ MULTILIB_OPTIONS        = m64/m32 msoft-float
+-MULTILIB_DIRNAMES       = 64 32 nof
++MULTILIB_DIRNAMES       = . . .
+ MULTILIB_EXTRA_OPTS     = fPIC mstrict-align
+ MULTILIB_EXCEPTIONS     = m64/msoft-float
+ MULTILIB_EXCLUSIONS     = m64/!m32/msoft-float
+-MULTILIB_OSDIRNAMES	= ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) nof
++MULTILIB_OSDIRNAMES	= ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ MULTILIB_MATCHES        = $(MULTILIB_MATCHES_FLOAT)
+ 
+ softfp_wrap_start := '\#ifndef __powerpc64__'
-- 
1.7.5.4



