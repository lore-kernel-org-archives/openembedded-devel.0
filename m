Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFCE60123
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 05:57:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K5vRcO020164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:57:30 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 22:57:27 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Sep 2016 01:57:25 -0400
Message-ID: <1474351045-153359-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: upgrade to 7.6.7
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
X-List-Received-Date: Tue, 20 Sep 2016 05:57:30 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* fix CVEs CVE-2014-3634, CVE-2014-3683

* rebase the patch use-pkgconfig-to-check-libgcrypt.patch

* backport fixes for build error:
  lexer.l:34:14: error: expected identifier or '(' before '__extension__'

* replace the old configure option '--enable-cached-man-pages' with
  '--disable-generate-man-pages'

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...include-config.h-before-any-other-headers.patch | 51 ++++++++++++++++++++++
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch | 25 +++++------
 .../rsyslog/{rsyslog_7.6.1.bb => rsyslog_7.6.7.bb} |  7 +--
 3 files changed, 66 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_7.6.1.bb => rsyslog_7.6.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch
new file mode 100644
index 0000000..1048b42
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/bugfix-include-config.h-before-any-other-headers.patch
@@ -0,0 +1,51 @@
+Backport below commit for fixing:
+
+lexer.l:34:14: error: expected identifier or '(' before '__extension__'
+
+From 876bdd1c85353f7e254f4b4c3e228484860cea57 Mon Sep 17 00:00:00 2001
+From: Tomas Heinrich <theinric@redhat.com>
+Date: Mon, 17 Nov 2014 20:53:22 +0100
+Subject: [PATCH] bugfix: include config.h before any other headers
+
+For some reason, flex used to prepend several standard headers before
+config.h. This prevented some conditional extension in these headers
+from being defined.
+
+The explicit prototype for strdup() shouldn't be required anymore as
+it should be provided by string.h.
+
+Upstream-Status: Backport
+---
+ grammar/lexer.l | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/grammar/lexer.l b/grammar/lexer.l
+index 359cf9f..c834ef7 100644
+--- a/grammar/lexer.l
++++ b/grammar/lexer.l
+@@ -28,10 +28,12 @@
+   * limitations under the License.
+   */
+ 
+-%{
++%top{
+ #include "config.h"
++}
++
++%{
+ #include "parserif.h"
+-extern char *strdup(__const char*); /* somehow we may not get this from string.h... */
+ %}
+ 
+ %option noyywrap nodefault case-insensitive yylineno
+@@ -67,6 +69,7 @@ extern char *strdup(__const char*); /* somehow we may not get this from string.h
+ #include <ctype.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <strings.h>
+ #include <libestr.h>
+ #include "rainerscript.h"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
index ebc1070..46eddd6 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -9,34 +9,31 @@ libgcrypt does no longer provide libgcrypt-config, and provide
 *.pc, so we should use pkgconfig to check
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ---
- configure.ac |   19 +------------------
- 1 file changed, 1 insertion(+), 18 deletions(-)
+ configure.ac | 15 +--------------
+ 1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 017116e..1b880f8 100644
+index 0f31869..d35db42 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -784,24 +784,7 @@ AC_ARG_ENABLE(libgcrypt,
+@@ -777,20 +777,7 @@ AC_ARG_ENABLE(libgcrypt,
          [enable_libgcrypt=yes]
  )
  if test "x$enable_libgcrypt" = "xyes"; then
--        AC_CHECK_PROG(
--      	    [HAVE_LIBGCRYPT_CONFIG],
--            [libgcrypt-config],
--            [yes],,,
--            )
--        if test "x${HAVE_LIBGCRYPT_CONFIG}" != "xyes"; then
+-	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
+-        if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
 -           AC_MSG_FAILURE([libgcrypt-config not found in PATH])
 -        fi
 -        AC_CHECK_LIB(
 -		[gcrypt],
 -        	[gcry_cipher_open],
--        	[LIBGCRYPT_CFLAGS="`libgcrypt-config --cflags`"
--        	LIBGCRYPT_LIBS="`libgcrypt-config --libs`"
+-        	[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
+-        	LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
 -        	],
 -        	[AC_MSG_FAILURE([libgcrypt is missing])],
--        	[`libgcrypt-config --libs --cflags`]
+-        	[`${LIBGCRYPT_CONFIG} --libs --cflags`]
 -        	)
 -	AC_DEFINE([ENABLE_LIBGCRYPT], [1], [Indicator that LIBGCRYPT is present])
 +	PKG_CHECK_MODULES(LIBGCRYPT, libgcrypt)
@@ -44,5 +41,5 @@ index 017116e..1b880f8 100644
  AM_CONDITIONAL(ENABLE_LIBGCRYPT, test x$enable_libgcrypt = xyes)
  AC_SUBST(LIBGCRYPT_CFLAGS)
 -- 
-1.7.9.5
+2.8.1
 
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
index c1d923c..664ab9f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.7.bb
@@ -27,15 +27,16 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://json-0.12-fix.patch \
            file://replace_deprecated_GnuTLS_functions.patch \
            file://use_gnutls_certificate_type_set_priority_only_if_available.patch \
+           file://bugfix-include-config.h-before-any-other-headers.patch \
            file://enable_tls_ptests.patch \
 "
 
-SRC_URI[md5sum] = "093c462a5245012bd9e7b82dd8aedffb"
-SRC_URI[sha256sum] = "357f089d866c351d5fe5b7139fa85b010223d77b3c21f29b2a1baa8688926111"
+SRC_URI[md5sum] = "fa78a6e675fe78a811edcdf7eb6f1975"
+SRC_URI[sha256sum] = "fc29d2d9cbf3396091dd0bab2eb6f847aed4a44ef73138a97ddf9447446125ee"
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
 
-EXTRA_OECONF += "--enable-cached-man-pages"
+EXTRA_OECONF += "--disable-generate-man-pages"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.8.1


