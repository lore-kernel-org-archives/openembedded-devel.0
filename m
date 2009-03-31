Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LoZwe-0000Ph-IP
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 11:07:44 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 57E2DDB15BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 11:05:33 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 097A5DB0C0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 11:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178116121.adsl.alicedsl.de
	[85.178.116.121]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 11:05:30 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 70B943C218; Tue, 31 Mar 2009 11:05:30 +0200 (CEST)
Date: Tue, 31 Mar 2009 11:05:30 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090331090529.GA10532@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: update for liboil
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
X-List-Received-Date: Tue, 31 Mar 2009 09:07:44 -0000
X-Groupsio-MsgNum: 8858
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

sorry for the to early checkin of liboil update. 

Attached is the patch for review, because its delete the older versions
and it only keeps the versions which OM prefers. The new liboil
is needed to get latest schroedinger package to be build.

Bye Henning

--r5Pyd7+fXNt84Ff3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0003-liboil-update-to-latest-liboil-needed-for-latest-s.patch"

From f25144e99b769aac83bcde613edf684441bbef27 Mon Sep 17 00:00:00 2001
From: woglinde <heinold@inf.fu-berlin.de>
Date: Sat, 28 Mar 2009 16:29:10 +0100
Subject: [PATCH 3/6] liboil: update to latest liboil, needed for latest schroedinger
 * remove older version and introduce an inc-file
 * keep 0.3.15 because om relays on it

---
 conf/checksums.ini                                |   18 +++---------------
 recipes/liboil/files/autotools.patch              |   21 +++++++++++++++++++++
 recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch |   11 -----------
 recipes/liboil/liboil-0.3.15/autotools.patch      |   21 ---------------------
 recipes/liboil/liboil.inc                         |   14 ++++++++++++++
 recipes/liboil/liboil_0.3.10.bb                   |   11 -----------
 recipes/liboil/liboil_0.3.11.bb                   |   15 ---------------
 recipes/liboil/liboil_0.3.14.bb                   |   17 -----------------
 recipes/liboil/liboil_0.3.15.bb                   |   17 ++---------------
 recipes/liboil/liboil_0.3.16.bb                   |    3 +++
 recipes/liboil/liboil_0.3.9.bb                    |   11 -----------
 11 files changed, 43 insertions(+), 116 deletions(-)
 create mode 100644 recipes/liboil/files/autotools.patch
 delete mode 100644 recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
 delete mode 100644 recipes/liboil/liboil-0.3.15/autotools.patch
 create mode 100644 recipes/liboil/liboil.inc
 delete mode 100644 recipes/liboil/liboil_0.3.10.bb
 delete mode 100644 recipes/liboil/liboil_0.3.11.bb
 delete mode 100644 recipes/liboil/liboil_0.3.14.bb
 create mode 100644 recipes/liboil/liboil_0.3.16.bb
 delete mode 100644 recipes/liboil/liboil_0.3.9.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 6ce967d..bb833c8 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -13398,25 +13398,13 @@ sha256=bae29e79fbc50bbedf1235852094b71c8c910a1ef0cd42fe4163b7b545630b65
 md5=461d7097bf47864b872085a94ff94e10
 sha256=01453d561255b5fcb361997904752860e4f8c6b9742f290578a44615fcc94356
 
-[http://liboil.freedesktop.org/download/liboil-0.3.10.tar.gz]
-md5=770f656bca8166dab33b322d5886a4bf
-sha256=4587753a023550a066abe59a7e467c1af35b9f5e81bfb40a12463ad2df8f088c
-
-[http://liboil.freedesktop.org/download/liboil-0.3.11.tar.gz]
-md5=65ce3266be385d0c7cd9a1157433332f
-sha256=deb6530d40ecad2b849d68912500e6d03bab4ac63de7a97340d05af1d7cf0ad4
-
-[http://liboil.freedesktop.org/download/liboil-0.3.14.tar.gz]
-md5=7a9f719e50656b795c06c0167012a84f
-sha256=a40c09db6ee24e03aa81f58329a57e45e55462a2e0f619b3796d4bf942c23f2f
-
 [http://liboil.freedesktop.org/download/liboil-0.3.15.tar.gz]
 md5=11dd39b1ca13ce2e0618d4df8303f137
 sha256=ae5e3b03a72dd4d12accbe7a6022e4e8570fa309defec9846341384d0a657fd4
 
-[http://liboil.freedesktop.org/download/liboil-0.3.9.tar.gz]
-md5=5d139b1fb16f0e93f0c84290ad2aaff8
-sha256=dd4d680ce95e586a1bbe767e1a7b25e1c53f842b8be6cf4e30e89cfa8232dd90
+[http://liboil.freedesktop.org/download/liboil-0.3.16.tar.gz]
+md5=febb1d9f9bc4c440fcf622dc90f8b6b7
+sha256=009115b0fc888dfe28903fecfe806707c544ccad6554ebabdeb3a1d88ec1e9d
 
 [http://www.balabit.com/downloads/files/libol/0.3/libol-0.3.16.tar.gz]
 md5=1f29be3f4bcddb5b2f3d965e78f04006
diff --git a/recipes/liboil/files/autotools.patch b/recipes/liboil/files/autotools.patch
new file mode 100644
index 0000000..53501e3
--- /dev/null
+++ b/recipes/liboil/files/autotools.patch
@@ -0,0 +1,21 @@
+Index: liboil-0.3.15/configure.ac
+===================================================================
+--- liboil-0.3.15.orig/configure.ac	2008-07-01 06:45:53.000000000 +0200
++++ liboil-0.3.15/configure.ac	2008-09-25 13:44:18.633758105 +0200
+@@ -187,16 +187,6 @@
+     true)
+ fi
+ 
+-if test x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes ; then
+-  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
+-    [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
+-    true)
+-  #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
+-  #  [VFP_CFLAGS="$VFP_CFLAGS -mfloat-abi=softfp"],
+-  #  true)
+-fi
+-AC_SUBST(VFP_CFLAGS)
+-
+ #AS_COMPILER_FLAG(["-fasm-blocks"], HAVE_ASM_BLOCKS=yes, HAVE_ASM_BLOCKS=no)
+ HAVE_ASM_BLOCKS=no
+ if test "x$HAVE_ASM_BLOCKS" = "xyes"
diff --git a/recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch b/recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
deleted file mode 100644
index 49485e3..0000000
--- a/recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /m4/orig-as-gcc-inline-assembly.m4	2007-03-17 04:03:30.000000000 +0200
-+++ /m4/as-gcc-inline-assembly.m4	2007-11-20 12:20:24.000000000 +0200
-@@ -38,7 +38,7 @@
- [
-   AC_MSG_CHECKING([if compiler supports FPU instructions on PowerPC])
- 
--  AC_TRY_COMPILE([], [__asm__ ("fadd 0,0,0"::) ], [flag_ok=yes], [flag_ok=no])
-+  AC_TRY_COMPILE([], [double x = 0; __asm__ ("fadd 0,0,0"::"f" (x):"32") ], [flag_ok=yes], [flag_ok=no])
- 
-   if test "X$flag_ok" = Xyes ; then
-     $1
diff --git a/recipes/liboil/liboil-0.3.15/autotools.patch b/recipes/liboil/liboil-0.3.15/autotools.patch
deleted file mode 100644
index 53501e3..0000000
--- a/recipes/liboil/liboil-0.3.15/autotools.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: liboil-0.3.15/configure.ac
-===================================================================
---- liboil-0.3.15.orig/configure.ac	2008-07-01 06:45:53.000000000 +0200
-+++ liboil-0.3.15/configure.ac	2008-09-25 13:44:18.633758105 +0200
-@@ -187,16 +187,6 @@
-     true)
- fi
- 
--if test x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes ; then
--  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
--    [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
--    true)
--  #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
--  #  [VFP_CFLAGS="$VFP_CFLAGS -mfloat-abi=softfp"],
--  #  true)
--fi
--AC_SUBST(VFP_CFLAGS)
--
- #AS_COMPILER_FLAG(["-fasm-blocks"], HAVE_ASM_BLOCKS=yes, HAVE_ASM_BLOCKS=no)
- HAVE_ASM_BLOCKS=no
- if test "x$HAVE_ASM_BLOCKS" = "xyes"
diff --git a/recipes/liboil/liboil.inc b/recipes/liboil/liboil.inc
new file mode 100644
index 0000000..728941f
--- /dev/null
+++ b/recipes/liboil/liboil.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
+HOMEPAGE = "http://liboil.freedesktop.org/"
+LICENSE = "various"
+
+DEPENDS = "glib-2.0"
+
+SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
+          "
+
+inherit autotools pkgconfig
+
+do_stage() {
+        autotools_stage_all
+}
diff --git a/recipes/liboil/liboil_0.3.10.bb b/recipes/liboil/liboil_0.3.10.bb
deleted file mode 100644
index 94471a2..0000000
--- a/recipes/liboil/liboil_0.3.10.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "various"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/liboil/liboil_0.3.11.bb b/recipes/liboil/liboil_0.3.11.bb
deleted file mode 100644
index 44b4b5e..0000000
--- a/recipes/liboil/liboil_0.3.11.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "various"
-PR ="r2"
-
-DEPENDS = "glib-2.0"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
-           file://ppc-detect-fpu.patch;patch=1"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/liboil/liboil_0.3.14.bb b/recipes/liboil/liboil_0.3.14.bb
deleted file mode 100644
index ebbe6cf..0000000
--- a/recipes/liboil/liboil_0.3.14.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "various"
-
-# The configure script seems to have bogus checks, so let's not make it the default
-DEFAULT_PREFERENCE = "-1"
-
-DEPENDS = "glib-2.0"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
-          "
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/liboil/liboil_0.3.15.bb b/recipes/liboil/liboil_0.3.15.bb
index 338121a..dfc66fe 100644
--- a/recipes/liboil/liboil_0.3.15.bb
+++ b/recipes/liboil/liboil_0.3.15.bb
@@ -1,16 +1,3 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "various"
-PR = "r2"
+require liboil.inc
 
-DEPENDS = "glib-2.0"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
-	   file://autotools.patch;patch=1 \
-          "
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
+SRC_URI =+ "file://autotools.patch;patch=1"
diff --git a/recipes/liboil/liboil_0.3.16.bb b/recipes/liboil/liboil_0.3.16.bb
new file mode 100644
index 0000000..dfc66fe
--- /dev/null
+++ b/recipes/liboil/liboil_0.3.16.bb
@@ -0,0 +1,3 @@
+require liboil.inc
+
+SRC_URI =+ "file://autotools.patch;patch=1"
diff --git a/recipes/liboil/liboil_0.3.9.bb b/recipes/liboil/liboil_0.3.9.bb
deleted file mode 100644
index 94471a2..0000000
--- a/recipes/liboil/liboil_0.3.9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "various"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
-- 
1.6.2.1


--r5Pyd7+fXNt84Ff3--
