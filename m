Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKcTy-0007Gd-Vq
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 20:55:23 +0100
Received: by ewy6 with SMTP id 6so3878212ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 11:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=rn8VH9clpvkWfU5JAlvS2dTIxVJ2N8sIWEFhEbgBjwc=;
	b=Q/IKqUW8BCPJ5WG4IulTumXDragTEjfIMZLbz6koa5KTY0Xpmdb5D+Fe+3eRJ89ogX
	7qAbDBf5UfrtE9WsqiTHPi0MmKMHN+RI8B0mrYTEW2oiv1OyBcWYXHBfqrcVAl2Ycw8y
	YFOk7NPTneRYZCE6PLTDMlnrYaTm5UiODkNjA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=A5ipaXQZZrDVQvE9x2PLeoxLy4Ts3j2ktEaq5qI8xmIRq2cmf0AKhLml8EMtZvgP9w
	AKvC7xYHIU43Cy0cWVRM3+ROFCkYoeeP3OaPVu+ChwpdQ0pEInqPoVPKVCnec4klZVYR
	5/3dPe61Ic8RiyF7lIJTjoYNDhWp7Dckdcdgk=
Received: by 10.14.37.10 with SMTP id x10mr4329907eea.33.1290455651383;
	Mon, 22 Nov 2010 11:54:11 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id w20sm4981918eeh.18.2010.11.22.11.54.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 11:54:10 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Nov 2010 20:53:59 +0100
Message-Id: <1290455639-7387-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] uclibc++: moved to git head
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
X-List-Received-Date: Mon, 22 Nov 2010 19:55:24 -0000

Removed the 0.1.9 version as it is quite old and does not compile
renamed files dir to uclibc++
added patches to get things compiling.
Patches are gracefully picked from openwrt
(https://dev.openwrt.org/browser/packages/libs/uclibc%2B%2B/patches?rev=24017)

note that it was decided to move to git head instead of the latest release (0.2.2)
because there were quite some patches after 0.2.2 was made and it does not look like there will
be a new release soon (there is hardly any activity last 2 years or so).

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

moved to latest git version
this also eliminated some patches that are now upstream

 recipes/uclibc++/files/defconfig             |   64 --------------------------
 recipes/uclibc++/files/nobash.patch          |   13 -----
 recipes/uclibc++/uclibc++/006-eabi_fix.patch |   42 +++++++++++++++++
 recipes/uclibc++/uclibc++/defconfig          |   53 +++++++++++++++++++++
 recipes/uclibc++/uclibc++_0.1.9.bb           |   54 ----------------------
 recipes/uclibc++/uclibc++_git.bb             |   47 +++++++++++++++++++
 6 files changed, 142 insertions(+), 131 deletions(-)
 delete mode 100644 recipes/uclibc++/files/defconfig
 delete mode 100644 recipes/uclibc++/files/nobash.patch
 create mode 100644 recipes/uclibc++/uclibc++/006-eabi_fix.patch
 create mode 100644 recipes/uclibc++/uclibc++/defconfig
 delete mode 100644 recipes/uclibc++/uclibc++_0.1.9.bb
 create mode 100644 recipes/uclibc++/uclibc++_git.bb

diff --git a/recipes/uclibc++/files/defconfig b/recipes/uclibc++/files/defconfig
deleted file mode 100644
index 19b4aa5..0000000
--- a/recipes/uclibc++/files/defconfig
+++ /dev/null
@@ -1,64 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_arm is not set
-TARGET_i386=y
-# TARGET_powerpc is not set
-
-#
-# Target Architecture Features and Options
-#
-HAVE_ELF=y
-TARGET_ARCH="i386"
-# CONFIG_GENERIC_386 is not set
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMIII is not set
-CONFIG_PENTIUM4=y
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-ARCH_LITTLE_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-UCLIBCXX_HAS_FLOATS=y
-WARNINGS="-Wall"
-HAVE_DOT_CONFIG=y
-
-#
-# String and I/O Stream Support
-#
-# UCLIBCXX_HAS_WCHAR is not set
-UCLIBCXX_IOSTREAM_BUFSIZE=32
-UCLIBCXX_HAS_LFS=y
-UCLIBCXX_SUPPORT_CDIR=y
-UCLIBCXX_SUPPORT_CIN=y
-UCLIBCXX_SUPPORT_COUT=y
-UCLIBCXX_SUPPORT_CERR=y
-
-#
-# STL and Code Expansion
-#
-UCLIBCXX_STL_BUFFER_SIZE=32
-UCLIBCXX_CODE_EXPANSION=y
-UCLIBCXX_EXPAND_STRING_CHAR=y
-UCLIBCXX_EXPAND_VECTOR_BASIC=y
-UCLIBCXX_EXPAND_ISTREAM_CHAR=y
-UCLIBCXX_EXPAND_OSTREAM_CHAR=y
-UCLIBCXX_EXPAND_FSTREAM_CHAR=y
-
-#
-# Library Installation Options
-#
-UCLIBCXX_RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc"
-UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include"
-UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib"
-UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin"
-UCLIBCXX_EXCEPTION_SUPPORT=y
-IMPORT_LIBSUP=y
-# DODEBUG is not set
diff --git a/recipes/uclibc++/files/nobash.patch b/recipes/uclibc++/files/nobash.patch
deleted file mode 100644
index 657c47b..0000000
--- a/recipes/uclibc++/files/nobash.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: uClibc++/bin/Makefile
-===================================================================
---- uClibc++.orig/bin/Makefile	2005-01-18 12:22:26.000000000 -0500
-+++ uClibc++/bin/Makefile	2005-03-10 18:19:30.799531304 -0500
-@@ -26,7 +26,7 @@
- 	$(INSTALL) -m 755 $(WRAPPER) $(PREFIX)$(UCLIBCXX_RUNTIME_PREFIX)$(UCLIBCXX_RUNTIME_BIN_SUBDIR)
- 
- $(WRAPPER):
--	echo "#!/bin/bash" > $(WRAPPER)
-+	echo "#!/bin/sh" > $(WRAPPER)
- 	echo "" >> $(WRAPPER)
- 	echo "OPTIONS=\"$(INITIALOPTIONS)\"" >> $(WRAPPER)
- 	echo 'INCLIB="Y"' >> $(WRAPPER)
diff --git a/recipes/uclibc++/uclibc++/006-eabi_fix.patch b/recipes/uclibc++/uclibc++/006-eabi_fix.patch
new file mode 100644
index 0000000..bc970a7
--- /dev/null
+++ b/recipes/uclibc++/uclibc++/006-eabi_fix.patch
@@ -0,0 +1,42 @@
+Index: uClibc++-0.2.2/include/typeinfo
+===================================================================
+--- uClibc++-0.2.2.orig/include/typeinfo	2008-02-13 00:37:04.000000000 +0100
++++ uClibc++-0.2.2/include/typeinfo	2008-02-13 00:37:34.000000000 +0100
+@@ -44,6 +44,7 @@
+   class __class_type_info;
+ } // namespace __cxxabiv1
+ 
++#ifndef __GXX_MERGED_TYPEINFO_NAMES
+ #if !__GXX_WEAK__
+   // If weak symbols are not supported, typeinfo names are not merged.
+   #define __GXX_MERGED_TYPEINFO_NAMES 0
+@@ -51,6 +52,7 @@
+   // On platforms that support weak symbols, typeinfo names are merged.
+   #define __GXX_MERGED_TYPEINFO_NAMES 1
+ #endif
++#endif
+ 
+ namespace std 
+ {
+Index: uClibc++-0.2.2/include/unwind-cxx.h
+===================================================================
+--- uClibc++-0.2.2.orig/include/unwind-cxx.h	2008-02-13 00:38:04.000000000 +0100
++++ uClibc++-0.2.2/include/unwind-cxx.h	2008-02-13 00:40:32.000000000 +0100
+@@ -135,6 +135,7 @@
+ 
+ // This is the exception class we report -- "GNUCC++\0".
+ const _Unwind_Exception_Class __gxx_exception_class
++#ifndef __ARM_EABI_UNWINDER__
+ = ((((((((_Unwind_Exception_Class) 'G' 
+ 	 << 8 | (_Unwind_Exception_Class) 'N')
+ 	<< 8 | (_Unwind_Exception_Class) 'U')
+@@ -143,6 +144,9 @@
+      << 8 | (_Unwind_Exception_Class) '+')
+     << 8 | (_Unwind_Exception_Class) '+')
+    << 8 | (_Unwind_Exception_Class) '\0');
++#else
++= "GNUC++";
++#endif
+ 
+ // GNU C++ personality routine, Version 0.
+ extern "C" _Unwind_Reason_Code __gxx_personality_v0
diff --git a/recipes/uclibc++/uclibc++/defconfig b/recipes/uclibc++/uclibc++/defconfig
new file mode 100644
index 0000000..168e9a4
--- /dev/null
+++ b/recipes/uclibc++/uclibc++/defconfig
@@ -0,0 +1,53 @@
+#
+# Automatically generated make config: don't edit
+#
+
+#
+# Target Features and Options
+#
+# UCLIBCXX_HAS_FLOATS is not set
+UCLIBCXX_HAS_TLS=y
+WARNINGS="-Wall"
+BUILD_EXTRA_LIBRARIES=""
+HAVE_DOT_CONFIG=y
+
+#
+# String and I/O Stream Support
+#
+# UCLIBCXX_HAS_WCHAR is not set
+UCLIBCXX_IOSTREAM_BUFSIZE=32
+UCLIBCXX_HAS_LFS=y
+UCLIBCXX_SUPPORT_CDIR=y
+UCLIBCXX_SUPPORT_CIN=y
+UCLIBCXX_SUPPORT_COUT=y
+UCLIBCXX_SUPPORT_CERR=y
+# UCLIBCXX_SUPPORT_CLOG is not set
+
+#
+# STL and Code Expansion
+#
+UCLIBCXX_STL_BUFFER_SIZE=32
+UCLIBCXX_CODE_EXPANSION=y
+UCLIBCXX_EXPAND_CONSTRUCTORS_DESTRUCTORS=y
+UCLIBCXX_EXPAND_STRING_CHAR=y
+UCLIBCXX_EXPAND_VECTOR_BASIC=y
+UCLIBCXX_EXPAND_IOS_CHAR=y
+UCLIBCXX_EXPAND_STREAMBUF_CHAR=y
+UCLIBCXX_EXPAND_ISTREAM_CHAR=y
+UCLIBCXX_EXPAND_OSTREAM_CHAR=y
+UCLIBCXX_EXPAND_FSTREAM_CHAR=y
+UCLIBCXX_EXPAND_SSTREAM_CHAR=y
+
+#
+# Library Installation Options
+#
+UCLIBCXX_RUNTIME_PREFIX="/usr/uClibc++"
+UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include"
+UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib"
+UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin"
+UCLIBCXX_EXCEPTION_SUPPORT=y
+IMPORT_LIBSUP=y
+IMPORT_LIBGCC_EH=y
+BUILD_STATIC_LIB=y
+# BUILD_ONLY_STATIC_LIB is not set
+# DODEBUG is not set
diff --git a/recipes/uclibc++/uclibc++_0.1.9.bb b/recipes/uclibc++/uclibc++_0.1.9.bb
deleted file mode 100644
index be1ac14..0000000
--- a/recipes/uclibc++/uclibc++_0.1.9.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-DESCRIPTION = "A C++ standard library targeted towards the embedded \
-systems/software market."
-HOMEPAGE = "http://cxx.uclibc.org/"
-LICENSE = "LGPL"
-PRIORITY = "optional"
-SECTION = "libs"
-
-PR = "r2"
-
-SRC_URI = "http://cxx.uclibc.org/src/uClibc++-${PV}.tbz2 \
-	   file://nobash.patch \
-	   file://defconfig"
-S = "${WORKDIR}/uClibc++"
-
-# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(TARGET_ARCH)-linux-uclibc] (NEW)
-# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [/include] (NEW)
-# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (NEW)
-# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) [/bin] (NEW)
-
-do_unpack_real () {
-	bzcat uClibc++-${PV}.tbz2 | tar -xvf -
-}
-do_unpack_real[dirs] = "${WORKDIR}"
-addtask unpack_real before do_patch after do_unpack
-
-EXTRA_OEMAKE = "'OPTIMIZATION=' 'XWARNINGS=' 'XARCH_CFLAGS=${CFLAGS}' \
-		'CPU_FLAGS=' 'STRIPTOOL=true' 'LD=${LD}'"
-configmangle = 's,^UCLIBCXX_RUNTIME_PREFIX=.*,UCLIBCXX_RUNTIME_PREFIX="${exec_prefix}",; \
-		s,^UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=.*,UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include/c++-uc",; \
-		s,^UCLIBCXX_RUNTIME_LIB_SUBDIR=.*,UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib",; \
-		s,^UCLIBCXX_RUNTIME_BIN_SUBDIR=.*,UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin",;'
-PARALLEL_MAKE = ""
-
-do_configure () {
-	cp ${WORKDIR}/defconfig ${S}/.config
-
-	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
-	perl -i -p -e '${configmangle}' ${S}/.config
-
-	oe_runmake oldconfig
-}
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install
-	chmod +x ${D}${libdir}/libuClibc++.so.*
-}
-
-PACKAGES = "g++-uc libuclibc++ libuclibc++-dev"
-FILES_g++-uc = "${bindir}/g++-uc"
-FILES_libuclibc++ = "${libdir}/*.so.*"
-FILES_libuclibc++-dev = "${FILES_uclibc++-dev}"
-
-SRC_URI[md5sum] = "ebf58e04d72eab5c131c2c9118737024"
-SRC_URI[sha256sum] = "82342a5d6088421e79699dd7af614ebecf6dd335eabce07690902a379f5ea8de"
diff --git a/recipes/uclibc++/uclibc++_git.bb b/recipes/uclibc++/uclibc++_git.bb
new file mode 100644
index 0000000..5b0d374
--- /dev/null
+++ b/recipes/uclibc++/uclibc++_git.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "A C++ standard library targeted towards the embedded \
+systems/software market."
+HOMEPAGE = "http://cxx.uclibc.org/"
+LICENSE = "LGPL"
+PRIORITY = "optional"
+SECTION = "libs"
+
+PR = "r0"
+
+SRCREV = "7efcc107b6bf7a59a85beaf7c7f35da6de0f321e"
+
+SRC_URI = "git://git.busybox.net/uClibc++;protocol=git \
+	   file://006-eabi_fix.patch \
+	   file://defconfig"
+S = "${WORKDIR}/git"
+
+# uClibc++ runtime prefix directory (UCLIBCXX_RUNTIME_PREFIX) [/usr/$(TARGET_ARCH)-linux-uclibc] (NEW)
+# uClibc++ header file subdirectory (UCLIBCXX_RUNTIME_INCLUDE_SUBDIR) [/include] (NEW)
+# uClibc++ library subdirectory (UCLIBCXX_RUNTIME_LIB_SUBDIR) [/lib] (NEW)
+# uClibc++ application file subdirectory (UCLIBCXX_RUNTIME_BIN_SUBDIR) [/bin] (NEW)
+
+EXTRA_OEMAKE = "'OPTIMIZATION=' 'XWARNINGS=' 'XARCH_CFLAGS=${CFLAGS}' \
+		'CPU_FLAGS=' 'STRIPTOOL=true' 'LD=${LD}'"
+configmangle = 's,^UCLIBCXX_RUNTIME_PREFIX=.*,UCLIBCXX_RUNTIME_PREFIX="${exec_prefix}",; \
+		s,^UCLIBCXX_RUNTIME_INCLUDE_SUBDIR=.*,UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include/c++-uc",; \
+		s,^UCLIBCXX_RUNTIME_LIB_SUBDIR=.*,UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib",; \
+		s,^UCLIBCXX_RUNTIME_BIN_SUBDIR=.*,UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin",;'
+PARALLEL_MAKE = ""
+
+do_configure () {
+	cp ${WORKDIR}/defconfig ${S}/.config
+
+	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
+	perl -i -p -e '${configmangle}' ${S}/.config
+
+	oe_runmake oldconfig
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+	chmod +x ${D}${libdir}/libuClibc++.so.*
+}
+
+PACKAGES = "g++-uc libuclibc++ libuclibc++-dev"
+FILES_g++-uc = "${bindir}/g++-uc"
+FILES_libuclibc++ = "${libdir}/*.so.*"
+FILES_libuclibc++-dev = "${FILES_uclibc++-dev}"
-- 
1.6.4.2



