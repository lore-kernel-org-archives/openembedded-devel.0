Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F76C7EE26
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:36 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.87640.1682921130180929110
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hFduQMX+;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b62d2f729so1545426b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921129; x=1685513129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBIVe2KcCCY9EZSEqXLS25wVyB+OL49MAmGsf8J4te0=;
        b=hFduQMX+Pciuy9qEveTkDvHMgxHHMwS/QJfoxCYacdLPnJ8kVs6DGQo6aslHxvsQyz
         78mQQ3vgO3B+3VNWq/ZjsWgK5Lkb7cD9Nt9ozao/nwMQEyp9VPgQtNieOG8Av/e4qZdP
         7qI3msUMPX+q0rtkeLlPYW8ZaAD41xcmwTjTBIUWJ/jvMXlfAA19xa7Aml9g3W/yvZLS
         khEEo5CN9KvRxqorHOsY9wn359+Lk5kqEveBFY7pDRalnd+4bVfVrofZCSIvyjJ3IeUY
         a/xspu4GfVZhKZM6lYXqahjIFk7OhoYdXDRQ/NlD7vQgDZ2WsMnvvd4tbu62vITwbEFS
         u1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921129; x=1685513129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBIVe2KcCCY9EZSEqXLS25wVyB+OL49MAmGsf8J4te0=;
        b=ApfiUg+z+YNJQ9Tw2wiLY/dI6CCvNygkieaBBDeAcTiAOPweUp0DEi0wN30jmoqpc6
         +t6abbTbsSAQg6cpL50x0j60LeUfRn2WxG0q+DgGruzk4P+5MolJzp3DsjjlwZwv8jKF
         KmjeEz48unARLqhSc+m2MX/7JpCOiqC2xarY8V4fICGKlLEgwp4UpJNuCmIjC1vvsg9s
         LM0rMLSAheEnZvCUwJJOdT0/MYc8Brfnm/3atk0gRgxAcy5ir0U6Jd3TeWREo9ALIe5D
         29zBdzBx67k011KF2vy02K2S0gzxBGWYRYpzqu5m+OE5vt/dFVl7smFmq7DQlQJViVxF
         CBmg==
X-Gm-Message-State: AC+VfDx99DgOa5EvZEyNFYK/MdA0TcSbQe2w0VdjI1ySbv6MksrHoeof
	XX2ecNxvd73sRQKC4CBD7jBy8EF88Nzogg==
X-Google-Smtp-Source: ACHHUZ7U4U5BdhHzVUCL4V3OsMJUXUDzHx99tPo9t/fWwaW6ReQvmfTsOXdWAyJ4XLQtdmlFxoLtTg==
X-Received: by 2002:a05:6a20:54a2:b0:d6:7264:f44e with SMTP id i34-20020a056a2054a200b000d67264f44emr17290483pzk.3.1682921129186;
        Sun, 30 Apr 2023 23:05:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/13] srecord: Upgrade to 1.65.0
Date: Sun, 30 Apr 2023 23:05:18 -0700
Message-Id: <20230501060518.3505068-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102242

Add two patches to fix cross build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../srecord/files/0001-Disable-doxygen.patch  | 85 +++++++++++++++++++
 ...-to-compute-library-dependencies-dur.patch | 45 ++++++++++
 ...-Fix-AC_CHECK_LIB-test-for-gpg-error.patch | 29 -------
 .../files/add-option-to-remove-docs.patch     | 57 -------------
 .../srecord/files/libtool.patch               | 67 ---------------
 .../recipes-support/srecord/srecord_1.64.bb   | 34 --------
 .../recipes-support/srecord/srecord_1.65.0.bb | 19 +++++
 7 files changed, 149 insertions(+), 187 deletions(-)
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-Disable-doxygen.patch
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch
 delete mode 100644 meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch
 delete mode 100644 meta-oe/recipes-support/srecord/files/add-option-to-remove-docs.patch
 delete mode 100644 meta-oe/recipes-support/srecord/files/libtool.patch
 delete mode 100644 meta-oe/recipes-support/srecord/srecord_1.64.bb
 create mode 100644 meta-oe/recipes-support/srecord/srecord_1.65.0.bb

diff --git a/meta-oe/recipes-support/srecord/files/0001-Disable-doxygen.patch b/meta-oe/recipes-support/srecord/files/0001-Disable-doxygen.patch
new file mode 100644
index 0000000000..0ed9e87771
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-Disable-doxygen.patch
@@ -0,0 +1,85 @@
+From d75193671c235e4b3bd02417b40516f3bfeb55b6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 30 Apr 2023 14:09:21 -0700
+Subject: [PATCH] Disable doxygen
+
+doxygen (dot) detect does not work in cross environment here with cmake
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ etc/configure.cmake    | 2 +-
+ srecord/CMakeLists.txt | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+--- a/etc/configure.cmake
++++ b/etc/configure.cmake
+@@ -103,32 +103,3 @@ option(_TANDEM_SOURCE ON)
+ # Enable general extensions on Solaris.
+ option(__EXTENSIONS__ ON)
+ 
+-# Doxygen configuration
+-find_package(Doxygen REQUIRED doxygen dot)
+-
+-set(DOXYGEN_DOT_GRAPH_MAX_NODES 150)
+-set(DOXYGEN_ALPHABETICAL_INDEX NO)
+-set(DOXYGEN_BUILTIN_STL_SUPPORT YES)
+-set(DOXYGEN_CASE_SENSE_NAMES NO)
+-set(DOXYGEN_CLASS_DIAGRAMS YES)
+-set(DOXYGEN_DISTRIBUTE_GROUP_DOC YES)
+-set(DOXYGEN_EXCLUDE bin)
+-set(DOXYGEN_EXTRACT_ALL YES)
+-set(DOXYGEN_EXTRACT_LOCAL_CLASSES NO)
+-set(DOXYGEN_FILE_PATTERNS *.h)
+-set(DOXYGEN_GENERATE_TREEVIEW YES)
+-set(DOXYGEN_HIDE_FRIEND_COMPOUNDS YES)
+-set(DOXYGEN_HIDE_IN_BODY_DOCS YES)
+-set(DOXYGEN_HIDE_UNDOC_CLASSES YES)
+-set(DOXYGEN_HIDE_UNDOC_MEMBERS YES)
+-set(DOXYGEN_JAVADOC_AUTOBRIEF YES)
+-set(DOXYGEN_QT_AUTOBRIEF YES)
+-set(DOXYGEN_QUIET YES)
+-set(DOXYGEN_RECURSIVE YES)
+-set(DOXYGEN_REFERENCED_BY_RELATION YES)
+-set(DOXYGEN_REFERENCES_RELATION YES)
+-set(DOXYGEN_SORT_BY_SCOPE_NAME YES)
+-set(DOXYGEN_SORT_MEMBER_DOCS NO)
+-set(DOXYGEN_SOURCE_BROWSER YES)
+-set(DOXYGEN_STRIP_CODE_COMMENTS NO)
+-set(DOXYGEN_GENERATE_HTML YES)
+--- a/srecord/CMakeLists.txt
++++ b/srecord/CMakeLists.txt
+@@ -34,9 +34,9 @@ install(DIRECTORY ${CMAKE_CURRENT_SOURCE
+         FILES_MATCHING PATTERN "*.h")
+ 
+ # Install the Doxygen output for the website
+-install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html
+-        DESTINATION ${CMAKE_INSTALL_DOCDIR}/htdocs/srecord
+- 	COMPONENT website)
++#install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html
++#        DESTINATION ${CMAKE_INSTALL_DOCDIR}/htdocs/srecord
++# 	COMPONENT website)
+ 
+ # Generate config.h to suit local environment
+ configure_file(config.h.in config.h @ONLY)
+@@ -44,6 +44,6 @@ configure_file(patchlevel.h.in patchleve
+ include_directories(${CMAKE_CURRENT_BINARY_DIR})
+ 
+ # Generate doxygen content
+-doxygen_add_docs(doxygen
+-                 ${LIB_SRECORD_HDR}
+-		 ALL)
++#doxygen_add_docs(doxygen
++#                 ${LIB_SRECORD_HDR}
++#		 ALL)
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -55,7 +55,7 @@ enable_testing()
+ add_subdirectory(test)
+ 
+ # Documentation & Man Pages
+-add_subdirectory(doc)
++# add_subdirectory(doc)
+ 
+ # Package SRecord
+ include(CPack)
diff --git a/meta-oe/recipes-support/srecord/files/0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch b/meta-oe/recipes-support/srecord/files/0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch
new file mode 100644
index 0000000000..524dc74611
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch
@@ -0,0 +1,45 @@
+From 756169511ed13e4c7adc06c7c108d365ac66b9f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 30 Apr 2023 22:58:47 -0700
+Subject: [PATCH] cmake: Do not try to compute library dependencies during
+ install
+
+Since we are cross-building the dependencies are not in final install
+location but in a staging area in recipe specific sysroot and it wont be
+able to resolve the libraries all the time
+
+Fixes
+| CMake Error at srec_cat/cmake_install.cmake:66 (file):
+|   file Could not resolve runtime dependencies:
+|
+|     libc++.so.1
+|     libc.so
+| Call Stack (most recent call first):
+|   cmake_install.cmake:52 (include)
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ etc/packaging.cmake | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/etc/packaging.cmake b/etc/packaging.cmake
+index ee2a32c..9804fd8 100644
+--- a/etc/packaging.cmake
++++ b/etc/packaging.cmake
+@@ -45,12 +45,6 @@ FUNCTION(INSTALL_SRECORD_EXECUTABLE_TARGET target)
+ 
+   install(IMPORTED_RUNTIME_ARTIFACTS ${target}
+     RUNTIME_DEPENDENCY_SET ${PROJECT_NAME}_dlls COMPONENT ${target})
+-  install(RUNTIME_DEPENDENCY_SET ${PROJECT_NAME}_dlls
+-    PRE_EXCLUDE_REGEXES "api-ms-" "ext-ms-"
+-    POST_EXCLUDE_REGEXES ".*system32/.*\\.dll"
+-    DIRECTORIES ${DLL_SEARCH_DIRS}
+-    COMPONENT ${target}
+-    )
+ ENDFUNCTION()
+ 
+ # Packaging
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch b/meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch
deleted file mode 100644
index 9a411f05d4..0000000000
--- a/meta-oe/recipes-support/srecord/files/0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From f9e50aba10f9d2c58e5d88f51810ca7143f4372b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 13:20:01 -0700
-Subject: [PATCH] configure: Fix AC_CHECK_LIB test for gpg-error
-
-Use check function which is found in libgpg-error
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- etc/configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/etc/configure.ac b/etc/configure.ac
-index d4ae290..ea0936d 100644
---- a/etc/configure.ac
-+++ b/etc/configure.ac
-@@ -30,7 +30,7 @@ AC_CHECK_PROGS(SOELIM, gsoelim soelim roffpp)
- AC_CHECK_FUNCS(snprintf vsnprintf)
- 
- dnl! This is needed for MingGW build, but not for Unix or Linux, etc.
--AC_CHECK_LIB(gpg-error, main)
-+AC_CHECK_LIB(gpg-error, gpg_strerror_r)
- 
- dnl! @synopsis AC_ADD_CFLAGS
- dnl!
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/srecord/files/add-option-to-remove-docs.patch b/meta-oe/recipes-support/srecord/files/add-option-to-remove-docs.patch
deleted file mode 100644
index 9b2bd99795..0000000000
--- a/meta-oe/recipes-support/srecord/files/add-option-to-remove-docs.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Add option to build this utility without a documentation.
-
-For full documentation building are necessary utilities like
-groff and ps2pdf. Full documentation can takes a lot of space.
-So it can be disabled by overloading makefile variable WITHOUT_DOC.
-
-Upstream-Status: Inappropriate [Other]
-Workaround specific to our build system.
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/Makefile.in b/Makefile.in
-index 9bdd8f1..a2b5494 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -141,6 +141,14 @@ GROFF = @GROFF@
- #
- SOELIM = @SOELIM@
- 
-+# Option to build this utility without building and installing the documentation.
-+WITHOUT_DOC ?= 0
-+ifeq ($(WITHOUT_DOC),0)
-+	BUILD_DOC = all-doc
-+	INST_DOC = install-doc
-+	CLR_DOC = clean-doc
-+endif
-+
- # ---------------------------------------------------------
- # You should not need to change anything below this line.
- 
-@@ -4090,7 +4098,7 @@ bin/test_url_decode: $(test_url_decode_obj) .bin srecord/libsrecord.la
- 	$(LIBTOOL) --mode=link --tag=CXX $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ \
- 		$(test_url_decode_obj) srecord/libsrecord.la $(LDFLAGS) $(LIBS)
- 
--all: all-bin all-doc
-+all: all-bin $(BUILD_DOC)
- 
- all-bin: bin/srec_cat bin/srec_cmp bin/srec_info bin/test_arglex_ambiguous \
- 		bin/test_crc16 bin/test_fletcher16 bin/test_gecos \
-@@ -4156,7 +4164,7 @@ test_files = t0001a t0002a t0003a t0004a t0005a t0006a t0007a t0008a t0009a \
- sure: $(test_files)
- 	@echo Passed All Tests
- 
--clean: clean-bin clean-doc clean-misc clean-obj
-+clean: clean-bin $(CLR_DOC) clean-misc clean-obj
- 
- clean-bin:
- 	rm -f bin/srec_cat bin/srec_cmp bin/srec_info bin/test_arglex_ambiguous
-@@ -4443,7 +4451,7 @@ distclean-directories:
- 	rm -rf test/fletcher16/.libs test/gecos/.libs test/hyphen/.libs
- 	rm -rf test/url_decode/.libs
- 
--install: install-bin install-doc install-include install-libdir install-man
-+install: install-bin $(INST_DOC) install-include install-libdir install-man
- 
- install-bin: $(bindir)/srec_cat $(bindir)/srec_cmp $(bindir)/srec_info
- 
diff --git a/meta-oe/recipes-support/srecord/files/libtool.patch b/meta-oe/recipes-support/srecord/files/libtool.patch
deleted file mode 100644
index 95063cea59..0000000000
--- a/meta-oe/recipes-support/srecord/files/libtool.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Instead of just looking for a libtool binary, actually configure libtool.
-
-As the build doesn't use automake we need to manually set top_builddir in the Makefile.
-
-Upstream-Status: Inactive-Upstream [2014]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/Makefile.in b/Makefile.in
-index a2b5494..aa0b8ca 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -36,6 +36,7 @@
- #
- srcdir = @srcdir@
- VPATH = @srcdir@
-+top_builddir = @srcdir@
-
- #
- # the name of the install program to use
-diff --git a/etc/configure.ac b/etc/configure.ac
-index e444543..b137443 100644
---- a/etc/configure.ac
-+++ b/etc/configure.ac
-@@ -161,42 +161,7 @@ AS_IF([test "x$with_gcrypt" != xno], AC_GCRYPT_SETUP())
- dnl!
- dnl!  Now look for libtool.
- dnl!
--AC_CHECK_PROGS(LIBTOOL, libtool)
--if test -z "$LIBTOOL"
--then
--  AC_MSG_RESULT([
--        You must have GNU Libtool installed to build srecord.
--        Homepage: http://www.gnu.org/software/libtool/])
--  OK=no
--  if apt-get --version > /dev/null 2> /dev/null; then
--    AC_MSG_RESULT([
--        The following command may be used to install it:
--        sudo apt-get install libtool
--    ])
--    OK=yes
--  fi
--  if yum --version > /dev/null 2> /dev/null; then
--    AC_MSG_RESULT([
--        The following command may be used to install it:
--        sudo yum install libtool
--    ])
--    OK=yes
--  fi
--  if pkg_info -a > /dev/null 2> /dev/null; then
--    AC_MSG_RESULT([
--        The following command may be used to install it:
--        sudo pkg_add -r libtool
--    ])
--    OK=yes
--  fi
--  if test "$OK" != "yes"; then
--    AC_MSG_RESULT([
--        If you are using a package based install, you will need the
--        libtool package.
--    ])
--  fi
--  exit 1
--fi
-+LT_INIT
-
- dnl
- dnl     If the soelim program exists, and understands the -I option,
diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/recipes-support/srecord/srecord_1.64.bb
deleted file mode 100644
index 0629c0f648..0000000000
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "A collection of powerful tools for manipulating EPROM load files."
-SECTION = "devel"
-LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8dfcbf2f0a144b97f0931b6394debea7"
-
-SRC_URI = " \
-    http://srecord.sourceforge.net/srecord-${PV}.tar.gz \
-    file://add-option-to-remove-docs.patch \
-    file://libtool.patch \
-    file://0001-configure-Fix-AC_CHECK_LIB-test-for-gpg-error.patch \
-"
-
-SRC_URI[md5sum] = "4de4a7497472d7972645c2af91313769"
-SRC_URI[sha256sum] = "49a4418733c508c03ad79a29e95acec9a2fbc4c7306131d2a8f5ef32012e67e2"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/srecord/files/releases"
-
-DEPENDS = "boost groff-native"
-
-inherit autotools-brokensep
-
-do_configure:prepend() {
-    # To autoreconf we need the script in ${S}, we can't tell autotools to use
-    # etc/ because then it can't find the Makefile.in
-    ln -sf ${S}/etc/configure.ac ${S}
-}
-
-PACKAGECONFIG ??= "gcrypt"
-PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,libgcrypt"
-
-# Set variable WITHOUT_DOC=0 to enable documentation generation
-EXTRA_OEMAKE = "WITHOUT_DOC=1"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
new file mode 100644
index 0000000000..06ce48e65c
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A collection of powerful tools for manipulating EPROM load files."
+SECTION = "devel"
+LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = " \
+    https://sourceforge.net/projects/${BPN}/files/srecord/${@oe.utils.trim_version('${PV}', 2)}/${BP}-Source.tar.gz \
+    file://0001-Disable-doxygen.patch \
+    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch"
+SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
+S = "${WORKDIR}/${BP}-Source"
+
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/releases"
+
+DEPENDS = "boost libgcrypt"
+
+inherit cmake
+
+BBCLASSEXTEND = "native"
-- 
2.40.1


