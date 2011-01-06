Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PapH9-00055n-1z
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 13:49:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 791AF314C868;
	Thu,  6 Jan 2011 13:48:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id cJKbnmSDxFPh; Thu,  6 Jan 2011 13:48:35 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 547BF314C88A;
	Thu,  6 Jan 2011 13:48:34 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 06 Jan 2011 12:48:34 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jan 2011 12:48:30 +0000
Message-Id: <1294318110-23521-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/4] gcc: replace unconditional SRC_URI_append with SRC_URI +=
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
X-List-Received-Date: Thu, 06 Jan 2011 12:49:07 -0000

* Fixes missing leading whitespace character at some locations

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-3.4.4.inc             |    2 +-
 recipes/gcc/gcc-3.4.6.inc             |    2 +-
 recipes/gcc/gcc-4.0.2.inc             |    2 +-
 recipes/gcc/gcc-canadian-sdk_4.2.4.bb |    2 +-
 recipes/gcc/gcc_4.2.2.bb              |    2 +-
 recipes/gcc/gcc_4.2.3.bb              |    2 +-
 recipes/gcc/gcc_4.2.4.bb              |    2 +-
 recipes/gcc/gcc_4.3.1.bb              |    2 +-
 recipes/gcc/gcc_4.3.2.bb              |    2 +-
 recipes/gcc/gcc_4.3.3.bb              |    2 +-
 recipes/gcc/gcc_4.3.4.bb              |    2 +-
 recipes/gcc/gcc_4.4.1.bb              |    2 +-
 recipes/gcc/gcc_4.4.2.bb              |    2 +-
 recipes/gcc/gcc_4.4.4.bb              |    2 +-
 recipes/gcc/gcc_4.5.bb                |    2 +-
 recipes/gcc/gcc_svn.bb                |    2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
index 99e680f..8a3ce02 100644
--- a/recipes/gcc/gcc-3.4.4.inc
+++ b/recipes/gcc/gcc-3.4.4.inc
@@ -26,7 +26,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	   file://gcc-cross-fixincl.patch \
 	   file://gcc-posix-open-fix.patch \
 	   "
-SRC_URI_append = " file://zecke-no-host-includes.patch "
+SRC_URI += "file://zecke-no-host-includes.patch"
 
 SRC_URI[archive.md5sum] = "b594ff4ea4fbef4ba9220887de713dfe"
 SRC_URI[archive.sha256sum] = "3444179840638cb8664e8e53604900c4521d29d57785a5091202ee4937d8d0fd"
diff --git a/recipes/gcc/gcc-3.4.6.inc b/recipes/gcc/gcc-3.4.6.inc
index 5296f26..3991cdc 100644
--- a/recipes/gcc/gcc-3.4.6.inc
+++ b/recipes/gcc/gcc-3.4.6.inc
@@ -23,7 +23,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 
 SRC_URI += "file://gcc34-configure.in.patch"
 SRC_URI += "file://gcc34-thumb-support.patch"
-SRC_URI_append = " file://zecke-no-host-includes.patch "
+SRC_URI += "file://zecke-no-host-includes.patch"
 
 SRC_URI[archive.md5sum] = "4a21ac777d4b5617283ce488b808da7b"
 SRC_URI[archive.sha256sum] = "7791a601878b765669022b8b3409fba33cc72f9e39340fec8af6d0e6f72dec39"
diff --git a/recipes/gcc/gcc-4.0.2.inc b/recipes/gcc/gcc-4.0.2.inc
index 63f9772..9d3c660 100644
--- a/recipes/gcc/gcc-4.0.2.inc
+++ b/recipes/gcc/gcc-4.0.2.inc
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
 	file://zecke-xgcc-cpp.patch "
 
 # uclibc patches below
-SRC_URI_append = " file://100-uclibc-conf.patch   \
+SRC_URI += "file://100-uclibc-conf.patch   \
                    file://200-uclibc-locale.patch \
                    file://301-missing-execinfo_h.patch \
                    file://302-c99-snprintf.patch  \
diff --git a/recipes/gcc/gcc-canadian-sdk_4.2.4.bb b/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
index 7a1402f..08a4c95 100644
--- a/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
+++ b/recipes/gcc/gcc-canadian-sdk_4.2.4.bb
@@ -14,7 +14,7 @@ DEPENDS = "gmp-canadian mpfr-canadian"
 require gcc-configure-canadian-sdk.inc
 require gcc-package-sdk.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch \
+SRC_URI += "file://fortran-cross-compile-hack.patch \
 		  file://pr22133-mingw-path-fixup.patch \
 		  file://pr33281-mingw-host-fragment.patch \
 		  file://pr35916-mingw-__USE_MINGW_ACCESS-everywhere.patch \
diff --git a/recipes/gcc/gcc_4.2.2.bb b/recipes/gcc/gcc_4.2.2.bb
index 30713f8..4822da9 100644
--- a/recipes/gcc/gcc_4.2.2.bb
+++ b/recipes/gcc/gcc_4.2.2.bb
@@ -4,6 +4,6 @@ require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
diff --git a/recipes/gcc/gcc_4.2.3.bb b/recipes/gcc/gcc_4.2.3.bb
index 6fe3028..a174e11 100644
--- a/recipes/gcc/gcc_4.2.3.bb
+++ b/recipes/gcc/gcc_4.2.3.bb
@@ -4,7 +4,7 @@ require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
diff --git a/recipes/gcc/gcc_4.2.4.bb b/recipes/gcc/gcc_4.2.4.bb
index 6fe3028..a174e11 100644
--- a/recipes/gcc/gcc_4.2.4.bb
+++ b/recipes/gcc/gcc_4.2.4.bb
@@ -4,7 +4,7 @@ require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
diff --git a/recipes/gcc/gcc_4.3.1.bb b/recipes/gcc/gcc_4.3.1.bb
index 442c273..38ae714 100644
--- a/recipes/gcc/gcc_4.3.1.bb
+++ b/recipes/gcc/gcc_4.3.1.bb
@@ -4,7 +4,7 @@ require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
diff --git a/recipes/gcc/gcc_4.3.2.bb b/recipes/gcc/gcc_4.3.2.bb
index c73dfc1..998f58c 100644
--- a/recipes/gcc/gcc_4.3.2.bb
+++ b/recipes/gcc/gcc_4.3.2.bb
@@ -8,6 +8,6 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
diff --git a/recipes/gcc/gcc_4.3.3.bb b/recipes/gcc/gcc_4.3.3.bb
index 274f474..263969a 100644
--- a/recipes/gcc/gcc_4.3.3.bb
+++ b/recipes/gcc/gcc_4.3.3.bb
@@ -8,7 +8,7 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
diff --git a/recipes/gcc/gcc_4.3.4.bb b/recipes/gcc/gcc_4.3.4.bb
index ec20085..57ced16 100644
--- a/recipes/gcc/gcc_4.3.4.bb
+++ b/recipes/gcc/gcc_4.3.4.bb
@@ -8,6 +8,6 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
diff --git a/recipes/gcc/gcc_4.4.1.bb b/recipes/gcc/gcc_4.4.1.bb
index 52b09cf..30ab402 100644
--- a/recipes/gcc/gcc_4.4.1.bb
+++ b/recipes/gcc/gcc_4.4.1.bb
@@ -8,7 +8,7 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
diff --git a/recipes/gcc/gcc_4.4.2.bb b/recipes/gcc/gcc_4.4.2.bb
index d1d50ad..55f05b5 100644
--- a/recipes/gcc/gcc_4.4.2.bb
+++ b/recipes/gcc/gcc_4.4.2.bb
@@ -8,7 +8,7 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
diff --git a/recipes/gcc/gcc_4.4.4.bb b/recipes/gcc/gcc_4.4.4.bb
index 271e9d1..6aeac2f 100644
--- a/recipes/gcc/gcc_4.4.4.bb
+++ b/recipes/gcc/gcc_4.4.4.bb
@@ -8,6 +8,6 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
diff --git a/recipes/gcc/gcc_4.5.bb b/recipes/gcc/gcc_4.5.bb
index ad71ada..bc59b14 100644
--- a/recipes/gcc/gcc_4.5.bb
+++ b/recipes/gcc/gcc_4.5.bb
@@ -10,6 +10,6 @@ FILES_${PN} += "\
 	${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto-wrapper \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
diff --git a/recipes/gcc/gcc_svn.bb b/recipes/gcc/gcc_svn.bb
index 9b69a23..0332174 100644
--- a/recipes/gcc/gcc_svn.bb
+++ b/recipes/gcc/gcc_svn.bb
@@ -8,6 +8,6 @@ FILES_${PN} += "\
         ${gcclibdir}/${TARGET_SYS}/*/*.o \
 "
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+SRC_URI += "file://fortran-cross-compile-hack.patch"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-- 
1.7.2.3



