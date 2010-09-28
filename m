Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1P0dGK-0003OU-6Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 18:42:42 +0200
Received: from localhost.localdomain (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CCD463041B;
	Tue, 28 Sep 2010 12:42:23 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Sep 2010 09:42:15 -0700
Message-Id: <1285692135-11955-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
References: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CCD463041B.50249
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: [PATCH v2] grep: update 2.6.3 to 2.7
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
X-List-Received-Date: Tue, 28 Sep 2010 16:42:43 -0000

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/grep/grep-2.6.3/uclibc-fix.patch    |   50 ---------------------------
 recipes/grep/grep-2.7/uclibc_libiconv.patch |   18 ++++++++++
 recipes/grep/{grep_2.6.3.bb => grep_2.7.bb} |   29 +++++++--------
 3 files changed, 31 insertions(+), 66 deletions(-)
 delete mode 100644 recipes/grep/grep-2.6.3/uclibc-fix.patch
 create mode 100644 recipes/grep/grep-2.7/uclibc_libiconv.patch
 rename recipes/grep/{grep_2.6.3.bb => grep_2.7.bb} (65%)

diff --git a/recipes/grep/grep-2.6.3/uclibc-fix.patch b/recipes/grep/grep-2.6.3/uclibc-fix.patch
deleted file mode 100644
index 2e1c584..0000000
--- a/recipes/grep/grep-2.6.3/uclibc-fix.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Fix to use mempcpy instead of __mempcpy. This is needed for uclibc which
-doesn't define __mempcpy only mempcpy. Since both uclibc and glibc have
-mempcpy we'll just use that instead.
-
-Index: grep-2.6.3/lib/getopt.c
-===================================================================
---- grep-2.6.3.orig/lib/getopt.c	2010-03-21 00:34:02.000000000 -0700
-+++ grep-2.6.3/lib/getopt.c	2010-05-22 21:37:11.352740539 -0700
-@@ -41,6 +41,10 @@
- # include <wchar.h>
- #endif
- 
-+#ifdef __UCLIBC__
-+#define __mempcpy mempcpy
-+#endif
-+
- /* This version of `getopt' appears to the caller like standard Unix `getopt'
-    but it behaves differently for the user, since it allows the user
-    to intersperse the options with the other arguments.
-Index: grep-2.6.3/gnulib-tests/setenv.c
-===================================================================
---- grep-2.6.3.orig/gnulib-tests/setenv.c	2010-05-22 21:37:53.655168151 -0700
-+++ grep-2.6.3/gnulib-tests/setenv.c	2010-05-22 21:38:42.792745476 -0700
-@@ -68,6 +68,10 @@ __libc_lock_define_initialized (static, 
- # define tsearch __tsearch
- #endif
- 
-+#ifdef __UCLIBC__
-+#define __mempcpy mempcpy
-+#endif
-+
- /* In the GNU C library implementation we try to be more clever and
-    allow arbitrarily many changes of the environment given that the used
-    values are from a small set.  Outside glibc this will eat up all
-Index: grep-2.6.3/lib/regexec.c
-===================================================================
---- grep-2.6.3.orig/lib/regexec.c	2010-05-22 21:36:02.655154671 -0700
-+++ grep-2.6.3/lib/regexec.c	2010-05-22 21:37:26.212743273 -0700
-@@ -22,6 +22,11 @@
- 
- #include "verify.h"
- #include "intprops.h"
-+
-+#ifdef __UCLIBC__
-+#define __mempcpy mempcpy
-+#endif
-+
- static reg_errcode_t match_ctx_init (re_match_context_t *cache, int eflags,
- 				     Idx n) internal_function;
- static void match_ctx_clean (re_match_context_t *mctx) internal_function;
diff --git a/recipes/grep/grep-2.7/uclibc_libiconv.patch b/recipes/grep/grep-2.7/uclibc_libiconv.patch
new file mode 100644
index 0000000..de83a61
--- /dev/null
+++ b/recipes/grep/grep-2.7/uclibc_libiconv.patch
@@ -0,0 +1,18 @@
+# Needed to get grep to build with uclibc.
+# Patch submitted by Bruno Haible to the grep ML on 2010-09-23.
+#
+# Signed-off-by: Scott Garman <sgarman@zenlinux.com>
+diff -ur grep-2.7.orig/src/Makefile.am grep-2.7/src/Makefile.am
+--- grep-2.7.orig/src/Makefile.am	2010-04-04 05:22:24.000000000 -0700
++++ grep-2.7/src/Makefile.am	2010-09-27 21:07:39.370222501 -0700
+@@ -36,7 +36,9 @@
+ # must precede $(LIBINTL) in order to ensure we use GNU getopt.
+ # But libgreputils.a must also follow $(LIBINTL), since libintl uses
+ # replacement functions defined in libgreputils.a.
+-LDADD = libgrep.a ../lib/libgreputils.a $(LIBINTL) ../lib/libgreputils.a
++LDADD = \
++	libgrep.a \
++	../lib/libgreputils.a $(LIBINTL) ../lib/libgreputils.a $(LIBICONV)
+ 
+ grep_LDADD = $(LDADD) $(LIB_PCRE)
+ localedir = $(datadir)/locale
diff --git a/recipes/grep/grep_2.6.3.bb b/recipes/grep/grep_2.7.bb
similarity index 65%
rename from recipes/grep/grep_2.6.3.bb
rename to recipes/grep/grep_2.7.bb
index 25c2a19..6267162 100644
--- a/recipes/grep/grep_2.6.3.bb
+++ b/recipes/grep/grep_2.7.bb
@@ -1,19 +1,24 @@
-LICENSE = "GPL"
-SECTION = "console/utils"
 DESCRIPTION = "grep GNU utility"
-PR = "r2"
+SECTION = "console/utils"
+HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
+LICENSE = "GPLv3"
+
+PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.gz \
-           file://uclibc-fix.patch"
+           file://uclibc_libiconv.patch"
+
+SRC_URI[md5sum] = "e848f07e3e79aa7899345d17c7e4115e"
+SRC_URI[sha256sum] = "ad14831015a79cea36785aa47415f6c0653a6ac4eaf9c15456f0d9d09c9e1bad"
 
 inherit autotools gettext
 
-EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
-EXTRA_OECONF_virtclass-native = "--with-included-regex --disable-ncurses"
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "--disable-perl-regexp"
 
-do_configure () {
+do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
-	autotools_do_configure
 }
 
 do_install () {
@@ -24,10 +29,6 @@ do_install () {
 	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
 }
 
-do_install_virtclass-native () {
-	autotools_do_install
-}
-
 pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/grep grep grep.${PN} 100
 	update-alternatives --install ${base_bindir}/egrep egrep egrep.${PN} 100
@@ -39,7 +40,3 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove egrep egrep.${PN}
 	update-alternatives --remove fgrep fgrep.${PN}
 }
-
-BBCLASSEXTEND = "native"
-SRC_URI[md5sum] = "3095b57837b312f087c0680559de7f13"
-SRC_URI[sha256sum] = "a340e5d1544d9a964072196be627bad3e434ff7a87f3a57ea15aaccbbea4d666"
-- 
1.6.3.3



