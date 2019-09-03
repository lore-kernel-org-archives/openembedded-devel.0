Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8947D9D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 01:17:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x831Gsux002714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Sep 2019 18:17:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 18:16:43 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Sep 2019 09:16:42 +0800
Message-ID: <1567473402-404175-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] freeradius: upgrade 3.0.17 -> 3.0.19
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
X-List-Received-Date: Tue, 03 Sep 2019 01:17:14 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...s-correct-version-number-of-libssl-defect.patch |  44 -----
 ...radius-configure.ac-add-option-for-libcap.patch |  24 +--
 ...ius-fix-issues-related-to-m4-include-path.patch | 186 ---------------------
 .../files/freeradius-libtool-detection.patch       |  21 +--
 .../{freeradius_3.0.17.bb => freeradius_3.0.19.bb} |  15 +-
 5 files changed, 32 insertions(+), 258 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.17.bb => freeradius_3.0.19.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch
deleted file mode 100644
index 9e1f5b2..0000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-freeradius-correct-version-number-of-libssl-defect.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fecf974b63f72eeb12d3b43522e948ca2bc704d4 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 11 Oct 2018 09:45:52 +0800
-Subject: [PATCH] freeradius: correct version number of libssl defect
-
-Upstream-Status: Backport [https://github.com/FreeRADIUS/freeradius-server
-                 /commit/ad039347beca4ded297813a1da6eabb61fcf2ddd]
-
-upstream have refactored this part code into
-src/lib/tls/base.c, and problem also have fixed
-by commit ad039347beca
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/main/tls.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/main/tls.c b/src/main/tls.c
-index acbfe79..d9c91f1 100644
---- a/src/main/tls.c
-+++ b/src/main/tls.c
-@@ -72,15 +72,15 @@ typedef struct libssl_defect {
- static libssl_defect_t libssl_defects[] =
- {
- 	{
--		.low		= 0x01010101f,		/* 1.1.0a */
--		.high		= 0x01010101f,		/* 1.1.0a */
-+		.low		= 0x01010001f,		/* 1.1.0a */
-+		.high		= 0x01010001f,		/* 1.1.0a */
- 		.id		= "CVE-2016-6309",
- 		.name		= "OCSP status request extension",
- 		.comment	= "For more information see https://www.openssl.org/news/secadv/20160926.txt"
- 	},
- 	{
--		.low		= 0x01010100f,		/* 1.1.0  */
--		.high		= 0x01010100f,		/* 1.1.0  */
-+		.low		= 0x010100000f,		/* 1.1.0  */
-+		.high		= 0x01010000f,		/* 1.1.0  */
- 		.id		= "CVE-2016-6304",
- 		.name		= "OCSP status request extension",
- 		.comment	= "For more information see https://www.openssl.org/news/secadv/20160922.txt"
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
index 71b7809..4719358 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
@@ -1,20 +1,21 @@
-From 74eed61dec8702c89f3e121d577ea9db25c961a4 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 11 Jan 2016 02:52:16 -0500
-Subject: [PATCH] configure.ac: add option for libcap
+From 98a9eff357959d1113e33a615c2178751d5b2054 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 22 Aug 2019 10:50:21 +0800
+Subject: [PATCH 2/2] configure.ac: add option for libcap
 
 Upstream-Status: Pending
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- configure.ac | 37 ++++++++++++++++++++++++++++---------
- 1 file changed, 28 insertions(+), 9 deletions(-)
+ configure.ac | 36 +++++++++++++++++++++++++++---------
+ 1 file changed, 27 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 066d3d7..6e4266b 100644
+index 65db61e..6486aac 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -948,6 +948,23 @@ fi
+@@ -977,6 +977,22 @@ fi
  dnl Set by FR_SMART_CHECKLIB
  LIBS="${old_LIBS}"
  
@@ -34,11 +35,10 @@ index 066d3d7..6e4266b 100644
 +  esac ]
 +)
 +
-+
  dnl Check for cap
  dnl extra argument: --with-cap-lib-dir=DIR
  cap_lib_dir=
-@@ -981,15 +998,17 @@ AC_ARG_WITH(cap-include-dir,
+@@ -1010,15 +1026,17 @@ AC_ARG_WITH(cap-include-dir,
        ;;
    esac])
  
@@ -64,7 +64,7 @@ index 066d3d7..6e4266b 100644
 +  fi
  fi
  
- VL_LIB_READLINE
+ dnl #
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
deleted file mode 100644
index 638d950..0000000
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From 69cb6d4bb5dd56a48695c0581a7d853e427b0ea3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 14:54:41 +0800
-Subject: [PATCH] freeradius: Fixing issues related to m4 include path
-
-Upstream-Status: Submitted [1]
-
-[1]: https://github.com/FreeRADIUS/freeradius-server/pull/1428
-
-Submmited by: Jorge Pereira <jpereiran@gmail.com>
-
-Update to version 3.0.17
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/modules/rlm_example/config.h.in | 35 +++--------------------------------
- src/modules/rlm_pam/config.h.in     |  3 +++
- src/modules/rlm_perl/config.h.in    |  3 +++
- src/modules/rlm_perl/configure.ac   |  2 +-
- src/modules/rlm_radutmp/config.h.in |  3 +++
- src/modules/rlm_ruby/configure.ac   |  8 ++++----
- src/modules/rlm_smsotp/config.h.in  |  3 +++
- src/modules/rlm_unix/config.h.in    |  3 +++
- 8 files changed, 23 insertions(+), 37 deletions(-)
-
-diff --git a/src/modules/rlm_example/config.h.in b/src/modules/rlm_example/config.h.in
-index 2a81ef5..4dbb8f4 100644
---- a/src/modules/rlm_example/config.h.in
-+++ b/src/modules/rlm_example/config.h.in
-@@ -1,37 +1,5 @@
- /* config.h.in.  Generated from configure.ac by autoheader.  */
- 
--/* Define to 1 if you have the <inttypes.h> header file. */
--#undef HAVE_INTTYPES_H
--
--/* Define to 1 if you have the <memory.h> header file. */
--#undef HAVE_MEMORY_H
--
--/* Define to 1 if you have the `printf' function. */
--#undef HAVE_PRINTF
--
--/* Define to 1 if you have the <stdint.h> header file. */
--#undef HAVE_STDINT_H
--
--/* Define to 1 if you have the <stdio.h> header file. */
--#undef HAVE_STDIO_H
--
--/* Define to 1 if you have the <stdlib.h> header file. */
--#undef HAVE_STDLIB_H
--
--/* Define to 1 if you have the <strings.h> header file. */
--#undef HAVE_STRINGS_H
--
--/* Define to 1 if you have the <string.h> header file. */
--#undef HAVE_STRING_H
--
--/* Define to 1 if you have the <sys/stat.h> header file. */
--#undef HAVE_SYS_STAT_H
--
--/* Define to 1 if you have the <sys/types.h> header file. */
--#undef HAVE_SYS_TYPES_H
--
--/* Define to 1 if you have the <unistd.h> header file. */
--#undef HAVE_UNISTD_H
- 
- /* Define to the address where bug reports for this package should be sent. */
- #undef PACKAGE_BUGREPORT
-@@ -45,6 +13,9 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
- 
-diff --git a/src/modules/rlm_pam/config.h.in b/src/modules/rlm_pam/config.h.in
-index 32ef6ff..1ad20c5 100644
---- a/src/modules/rlm_pam/config.h.in
-+++ b/src/modules/rlm_pam/config.h.in
-@@ -45,6 +45,9 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
- 
-diff --git a/src/modules/rlm_perl/config.h.in b/src/modules/rlm_perl/config.h.in
-index 989ed53..f80de9c 100644
---- a/src/modules/rlm_perl/config.h.in
-+++ b/src/modules/rlm_perl/config.h.in
-@@ -12,5 +12,8 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
-diff --git a/src/modules/rlm_perl/configure.ac b/src/modules/rlm_perl/configure.ac
-index 4b3ff42..69c79cb 100644
---- a/src/modules/rlm_perl/configure.ac
-+++ b/src/modules/rlm_perl/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(rlm_perl.c)
- AC_REVISION($Revision$)
- AC_DEFUN(modname,[rlm_perl])
- 
--m4_include([ax_with_prog.m4])
-+m4_include([m4/ax_with_prog.m4])
- 
- if test x$with_[]modname != xno; then
- 	AC_PROG_CC
-diff --git a/src/modules/rlm_radutmp/config.h.in b/src/modules/rlm_radutmp/config.h.in
-index 9a883cc..750b434 100644
---- a/src/modules/rlm_radutmp/config.h.in
-+++ b/src/modules/rlm_radutmp/config.h.in
-@@ -42,6 +42,9 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
- 
-diff --git a/src/modules/rlm_ruby/configure.ac b/src/modules/rlm_ruby/configure.ac
-index 9306382..ae86a14 100644
---- a/src/modules/rlm_ruby/configure.ac
-+++ b/src/modules/rlm_ruby/configure.ac
-@@ -3,15 +3,15 @@ AC_INIT(rlm_ruby.c)
- AC_REVISION($Revision: 1.9 $)
- AC_DEFUN(modname,[rlm_ruby])
- 
--m4_include([ax_with_prog.m4])
-+m4_include([m4/ax_with_prog.m4])
- 
- AC_DEFUN([AX_WITH_RUBY],[
-     AX_WITH_PROG([RUBY],[ruby],[not-found],[${PATH}:/usr/bin:/usr/local/bin])
- ])
- 
--m4_include([ax_compare_version.m4])
--m4_include([ax_prog_ruby_version.m4])
--m4_include([ax_ruby_devel.m4])
-+m4_include([m4/ax_compare_version.m4])
-+m4_include([m4/ax_prog_ruby_version.m4])
-+m4_include([m4/ax_ruby_devel.m4])
- 
- targetname=modname
- mod_cflags=
-diff --git a/src/modules/rlm_smsotp/config.h.in b/src/modules/rlm_smsotp/config.h.in
-index 5feaf91..9e69f85 100644
---- a/src/modules/rlm_smsotp/config.h.in
-+++ b/src/modules/rlm_smsotp/config.h.in
-@@ -42,6 +42,9 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
- 
-diff --git a/src/modules/rlm_unix/config.h.in b/src/modules/rlm_unix/config.h.in
-index dcb9aa2..16107b8 100644
---- a/src/modules/rlm_unix/config.h.in
-+++ b/src/modules/rlm_unix/config.h.in
-@@ -54,6 +54,9 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
index 4eb61ff..4265f9d 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
@@ -1,7 +1,7 @@
-From 56ef434e454bcc82c162a83d9bcb076d4fc72b7f Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 9 Jan 2014 14:30:26 +0800
-Subject: [PATCH] Fix libtool detection
+From bfe4d7ed72edc9d4ae1a0f0d2dd84367d6214886 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 22 Aug 2019 10:45:46 +0800
+Subject: [PATCH 1/2] Fix libtool detection
 
 Upstream-Status: pending
 
@@ -16,18 +16,19 @@ Also patch autogen.sh so it uses autoreconf, which handles libtoolize better.
 
 Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  autogen.sh   |  5 +----
  configure.ac | 36 ++++++++++++++++++++++++++++++++++++
  2 files changed, 37 insertions(+), 4 deletions(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 3418673..e42c3d5 100755
+index a1d08a6..959182b 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -5,10 +5,7 @@ parentdir=`dirname $0`
- cd $parentdir
+@@ -6,10 +6,7 @@ cd $parentdir
  parentdir=`pwd`
+ m4include="-I$parentdir -I$parentdir/m4 -Im4"
  
 -libtoolize -f -c
 -#aclocal
@@ -38,10 +39,10 @@ index 3418673..e42c3d5 100755
  mysubdirs="$mysubdirs `find src/modules/ -name configure -print | sed 's%/configure%%'`"
  mysubdirs=`echo $mysubdirs`
 diff --git a/configure.ac b/configure.ac
-index e73e4ad..066d3d7 100644
+index a7abf00..65db61e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -205,6 +205,42 @@ dnl #  See if we have Git.
+@@ -220,6 +220,42 @@ dnl #  See if we have Git.
  dnl #
  AC_CHECK_PROG(GIT, git, yes, no)
  
@@ -85,5 +86,5 @@ index e73e4ad..066d3d7 100644
  dnl AC_ARG_WITH(disablemodulefoo,
  dnl [  --without-rlm_foo         Disables module compilation.  Module list:]
 -- 
-1.8.3
+2.7.4
 
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
index e0b04c1..ded1a67 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
@@ -13,12 +13,11 @@ LICENSE = "GPLv2 & LGPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 
-SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.bz2 \
+SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x; \
     file://freeradius \
     file://volatiles.58_radiusd \
     file://freeradius-enble-user-in-conf.patch \
     file://freeradius-configure.ac-allow-cross-compilation.patch \
-    file://freeradius-fix-issues-related-to-m4-include-path.patch \
     file://freeradius-libtool-detection.patch \
     file://freeradius-configure.ac-add-option-for-libcap.patch \
     file://freeradius-avoid-searching-host-dirs.patch \
@@ -29,14 +28,16 @@ SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.b
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
-    file://0001-freeradius-correct-version-number-of-libssl-defect.patch \
 "
-SRC_URI[md5sum] = "1f4ad38f32101a7d50d818afa6f17339"
-SRC_URI[sha256sum] = "3f03404b6e4a4f410e1f15ea2ababfec7f8a7ae8a49836d8a0c137436d913b96"
+
+SRCREV = "ab4c767099f263a7cd4109bcdca80ee74210a769"
 
 PARALLEL_MAKE = ""
 
-S = "${WORKDIR}/freeradius-server-${PV}"
+S = "${WORKDIR}/git"
+
+LDFLAGS_append_powerpc = " -latomic"
+LDFLAGS_append_mipsarch = " -latomic"
 
 EXTRA_OECONF = " --enable-strict-dependencies \
         --with-docdir=${docdir}/freeradius-${PV} \
@@ -59,6 +60,8 @@ EXTRA_OECONF = " --enable-strict-dependencies \
         --without-rlm_sql_oracle \
         --without-rlm_sql_sybase \
         --without-rlm_sqlhpwippool \
+        --without-rlm_securid \
+        --without-rlm_unbound \
         ac_cv_path_PERL=${bindir}/perl \
         ax_cv_cc_builtin_choose_expr=no \
         ax_cv_cc_builtin_types_compatible_p=no \
-- 
2.7.4


