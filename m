Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Oenfx-0006pX-SZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 13:22:57 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o6UBMSah032012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 30 Jul 2010 13:22:29 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OenfX-0001wn-Pz; Fri, 30 Jul 2010 13:22:27 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 13:22:25 +0200
Message-Id: <1280488945-6196-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.2
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] liboil: removed old cruft before 0.3.15
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
X-List-Received-Date: Fri, 30 Jul 2010 11:22:58 -0000

Versions before 0.3.15 are more than 2 years old and not referenced
anywhere.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch |   11 -----------
 recipes/liboil/liboil_0.3.10.bb                   |   15 ---------------
 recipes/liboil/liboil_0.3.11.bb                   |   18 ------------------
 recipes/liboil/liboil_0.3.14.bb                   |   21 ---------------------
 recipes/liboil/liboil_0.3.9.bb                    |   15 ---------------
 5 files changed, 0 insertions(+), 80 deletions(-)
 delete mode 100644 recipes/liboil/liboil-0.3.11/ppc-detect-fpu.patch
 delete mode 100644 recipes/liboil/liboil_0.3.10.bb
 delete mode 100644 recipes/liboil/liboil_0.3.11.bb
 delete mode 100644 recipes/liboil/liboil_0.3.14.bb
 delete mode 100644 recipes/liboil/liboil_0.3.9.bb

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
diff --git a/recipes/liboil/liboil_0.3.10.bb b/recipes/liboil/liboil_0.3.10.bb
deleted file mode 100644
index 7e5f951..0000000
--- a/recipes/liboil/liboil_0.3.10.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "liboil"
-PR = "r1"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
-
-SRC_URI[md5sum] = "770f656bca8166dab33b322d5886a4bf"
-SRC_URI[sha256sum] = "4587753a023550a066abe59a7e467c1af35b9f5e81bfb40a12463ad2df8f088c"
diff --git a/recipes/liboil/liboil_0.3.11.bb b/recipes/liboil/liboil_0.3.11.bb
deleted file mode 100644
index d8e055a..0000000
--- a/recipes/liboil/liboil_0.3.11.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "liboil"
-PR ="r3"
-
-DEPENDS = "glib-2.0"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
-           file://ppc-detect-fpu.patch"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
-
-SRC_URI[md5sum] = "65ce3266be385d0c7cd9a1157433332f"
-SRC_URI[sha256sum] = "deb6530d40ecad2b849d68912500e6d03bab4ac63de7a97340d05af1d7cf0ad4"
diff --git a/recipes/liboil/liboil_0.3.14.bb b/recipes/liboil/liboil_0.3.14.bb
deleted file mode 100644
index 92db760..0000000
--- a/recipes/liboil/liboil_0.3.14.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "liboil"
-PR = "r1"
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
-
-SRC_URI[md5sum] = "7a9f719e50656b795c06c0167012a84f"
-SRC_URI[sha256sum] = "a40c09db6ee24e03aa81f58329a57e45e55462a2e0f619b3796d4bf942c23f2f"
diff --git a/recipes/liboil/liboil_0.3.9.bb b/recipes/liboil/liboil_0.3.9.bb
deleted file mode 100644
index c066fa4..0000000
--- a/recipes/liboil/liboil_0.3.9.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
-HOMEPAGE = "http://liboil.freedesktop.org/"
-LICENSE = "liboil"
-PR = "r1"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
-
-SRC_URI[md5sum] = "5d139b1fb16f0e93f0c84290ad2aaff8"
-SRC_URI[sha256sum] = "dd4d680ce95e586a1bbe767e1a7b25e1c53f842b8be6cf4e30e89cfa8232dd90"
-- 
1.7.2



