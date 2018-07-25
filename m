Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC5B87893C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 03:27:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P3RfSG010305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:27:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 24 Jul 2018 20:27:40 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:27:26 +0800
Message-ID: <1532489252-246963-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
References: <1532489252-246963-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] freeradius: upgrade 3.0.15 -> 3.0.17
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
X-List-Received-Date: Wed, 25 Jul 2018 03:27:40 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...dius-configure.ac-allow-cross-compilation.patch |  12 ++-
 ...ius-fix-issues-related-to-m4-include-path.patch | 106 ++++++---------------
 .../{freeradius_3.0.15.bb => freeradius_3.0.17.bb} |   4 +-
 3 files changed, 39 insertions(+), 83 deletions(-)
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.15.bb => freeradius_3.0.17.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
index 30497a6..38e7c36 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
@@ -1,3 +1,6 @@
+From 0780b7053fb0d33d721aa70ab2ecd75299e5ba31 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 15:03:39 +0800
 Subject: [PATCH] configure.ac: allow cross-compilation
 
 The checking OpenSSL library and header version consistency will
@@ -8,17 +11,20 @@ Upstream-Status: Inappropriate[embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+update to new version 3.0.17 to fix patch warning
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  src/modules/rlm_krb5/configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
-index eb43534..113a079 100644
+index efc9f29..98a97e4 100644
 --- a/src/modules/rlm_krb5/configure.ac
 +++ b/src/modules/rlm_krb5/configure.ac
 @@ -137,7 +137,8 @@ if test x$with_[]modname != xno; then
  		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
- 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" == xyes; then
+ 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
  			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
 -				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
 +				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
@@ -27,5 +33,5 @@ index eb43534..113a079 100644
  	else
  		krb5threadsafe=""
 -- 
-2.10.2
+2.7.4
 
diff --git a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
index d29b2ac..638d950 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
@@ -1,32 +1,33 @@
-From d8e251ef97869ab2c1c82bd374016f402083997c Mon Sep 17 00:00:00 2001
-From: Jorge Pereira <jpereiran@gmail.com>
-Date: Mon, 7 Dec 2015 16:51:07 -0200
-Subject: [PATCH] Fixing issues related to m4 include path
+From 69cb6d4bb5dd56a48695c0581a7d853e427b0ea3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 24 Jul 2018 14:54:41 +0800
+Subject: [PATCH] freeradius: Fixing issues related to m4 include path
 
 Upstream-Status: Submitted [1]
 
 [1]: https://github.com/FreeRADIUS/freeradius-server/pull/1428
 
 Submmited by: Jorge Pereira <jpereiran@gmail.com>
+
+Update to version 3.0.17
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- src/modules/rlm_example/config.h.in                | 39 ++--------------------
- src/modules/rlm_ldap/configure                     |  2 +-
- src/modules/rlm_pam/config.h.in                    |  3 ++
- src/modules/rlm_perl/config.h.in                   |  3 ++
- src/modules/rlm_perl/configure.ac                  |  2 +-
- src/modules/rlm_radutmp/config.h.in                |  3 ++
- src/modules/rlm_ruby/configure                     |  1 +
- src/modules/rlm_ruby/configure.ac                  |  9 ++---
- src/modules/rlm_smsotp/config.h.in                 |  3 ++
- .../rlm_sql/drivers/rlm_sql_mysql/config.h.in      |  3 ++
- src/modules/rlm_unix/config.h.in                   |  6 ++++
- 11 files changed, 32 insertions(+), 42 deletions(-)
+ src/modules/rlm_example/config.h.in | 35 +++--------------------------------
+ src/modules/rlm_pam/config.h.in     |  3 +++
+ src/modules/rlm_perl/config.h.in    |  3 +++
+ src/modules/rlm_perl/configure.ac   |  2 +-
+ src/modules/rlm_radutmp/config.h.in |  3 +++
+ src/modules/rlm_ruby/configure.ac   |  8 ++++----
+ src/modules/rlm_smsotp/config.h.in  |  3 +++
+ src/modules/rlm_unix/config.h.in    |  3 +++
+ 8 files changed, 23 insertions(+), 37 deletions(-)
 
 diff --git a/src/modules/rlm_example/config.h.in b/src/modules/rlm_example/config.h.in
-index 2a81ef5..f80de9c 100644
+index 2a81ef5..4dbb8f4 100644
 --- a/src/modules/rlm_example/config.h.in
 +++ b/src/modules/rlm_example/config.h.in
-@@ -1,38 +1,5 @@
+@@ -1,37 +1,5 @@
  /* config.h.in.  Generated from configure.ac by autoheader.  */
  
 -/* Define to 1 if you have the <inttypes.h> header file. */
@@ -61,11 +62,10 @@ index 2a81ef5..f80de9c 100644
 -
 -/* Define to 1 if you have the <unistd.h> header file. */
 -#undef HAVE_UNISTD_H
--
+ 
  /* Define to the address where bug reports for this package should be sent. */
  #undef PACKAGE_BUGREPORT
- 
-@@ -45,8 +12,8 @@
+@@ -45,6 +13,9 @@
  /* Define to the one symbol short name of this package. */
  #undef PACKAGE_TARNAME
  
@@ -74,22 +74,7 @@ index 2a81ef5..f80de9c 100644
 +
  /* Define to the version of this package. */
  #undef PACKAGE_VERSION
--
--/* Define to 1 if you have the ANSI C header files. */
--#undef STDC_HEADERS
-diff --git a/src/modules/rlm_ldap/configure b/src/modules/rlm_ldap/configure
-index e0c15d9..cdf96d5 100755
---- a/src/modules/rlm_ldap/configure
-+++ b/src/modules/rlm_ldap/configure
-@@ -3992,7 +3992,7 @@ smart_prefix=
- $as_echo "#define WITH_SASL 1" >>confdefs.h
- 
- 	    SASL=sasl.c
--          fi
-+	  fi
- 	fi
- 
- 	targetname=rlm_ldap
+ 
 diff --git a/src/modules/rlm_pam/config.h.in b/src/modules/rlm_pam/config.h.in
 index 32ef6ff..1ad20c5 100644
 --- a/src/modules/rlm_pam/config.h.in
@@ -118,7 +103,7 @@ index 989ed53..f80de9c 100644
  /* Define to the version of this package. */
  #undef PACKAGE_VERSION
 diff --git a/src/modules/rlm_perl/configure.ac b/src/modules/rlm_perl/configure.ac
-index 44c5fc9..6b2a043 100644
+index 4b3ff42..69c79cb 100644
 --- a/src/modules/rlm_perl/configure.ac
 +++ b/src/modules/rlm_perl/configure.ac
 @@ -3,7 +3,7 @@ AC_INIT(rlm_perl.c)
@@ -144,23 +129,11 @@ index 9a883cc..750b434 100644
  /* Define to the version of this package. */
  #undef PACKAGE_VERSION
  
-diff --git a/src/modules/rlm_ruby/configure b/src/modules/rlm_ruby/configure
-index 15868ab..c728af2 100755
---- a/src/modules/rlm_ruby/configure
-+++ b/src/modules/rlm_ruby/configure
-@@ -1875,6 +1875,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
- 
-+
- # ===========================================================================
- #    http://www.gnu.org/software/autoconf-archive/ax_compare_version.html
- # ===========================================================================
 diff --git a/src/modules/rlm_ruby/configure.ac b/src/modules/rlm_ruby/configure.ac
-index 9306382..f1c8118 100644
+index 9306382..ae86a14 100644
 --- a/src/modules/rlm_ruby/configure.ac
 +++ b/src/modules/rlm_ruby/configure.ac
-@@ -3,15 +3,16 @@ AC_INIT(rlm_ruby.c)
+@@ -3,15 +3,15 @@ AC_INIT(rlm_ruby.c)
  AC_REVISION($Revision: 1.9 $)
  AC_DEFUN(modname,[rlm_ruby])
  
@@ -174,7 +147,6 @@ index 9306382..f1c8118 100644
 -m4_include([ax_compare_version.m4])
 -m4_include([ax_prog_ruby_version.m4])
 -m4_include([ax_ruby_devel.m4])
-+
 +m4_include([m4/ax_compare_version.m4])
 +m4_include([m4/ax_prog_ruby_version.m4])
 +m4_include([m4/ax_ruby_devel.m4])
@@ -195,33 +167,11 @@ index 5feaf91..9e69f85 100644
  /* Define to the version of this package. */
  #undef PACKAGE_VERSION
  
-diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in b/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in
-index e03d1a9..6262c48 100644
---- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in
-+++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/config.h.in
-@@ -18,5 +18,8 @@
- /* Define to the one symbol short name of this package. */
- #undef PACKAGE_TARNAME
- 
-+/* Define to the home page for this package. */
-+#undef PACKAGE_URL
-+
- /* Define to the version of this package. */
- #undef PACKAGE_VERSION
 diff --git a/src/modules/rlm_unix/config.h.in b/src/modules/rlm_unix/config.h.in
-index dcb9aa2..70b4680 100644
+index dcb9aa2..16107b8 100644
 --- a/src/modules/rlm_unix/config.h.in
 +++ b/src/modules/rlm_unix/config.h.in
-@@ -1,5 +1,8 @@
- /* config.h.in.  Generated from configure.ac by autoheader.  */
- 
-+/* Define to 1 if you have the `getpwnam' function. */
-+#undef HAVE_GETPWNAM
-+
- /* Define to 1 if you have the `getspnam' function. */
- #undef HAVE_GETSPNAM
- 
-@@ -54,6 +57,9 @@
+@@ -54,6 +54,9 @@
  /* Define to the one symbol short name of this package. */
  #undef PACKAGE_TARNAME
  
@@ -232,5 +182,5 @@ index dcb9aa2..70b4680 100644
  #undef PACKAGE_VERSION
  
 -- 
-2.3.5
+2.7.4
 
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.15.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.15.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index 4155a40..1b45e78 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.15.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -30,8 +30,8 @@ SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.b
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
-SRC_URI[md5sum] = "0c81a4464ccf1d04f7ef1218a029d37a"
-SRC_URI[sha256sum] = "23267d8505e7b2909f5bdbf3938ca077c1fe122290dc969304d4f3b594f7e3ba"
+SRC_URI[md5sum] = "1f4ad38f32101a7d50d818afa6f17339"
+SRC_URI[sha256sum] = "3f03404b6e4a4f410e1f15ea2ababfec7f8a7ae8a49836d8a0c137436d913b96"
 
 PARALLEL_MAKE = ""
 
-- 
2.7.4


