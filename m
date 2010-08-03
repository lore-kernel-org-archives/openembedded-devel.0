Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OgNPZ-0001Vq-Ac
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 21:44:34 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 629A53B3E3; Tue,  3 Aug 2010 23:44:20 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 23:44:13 +0400
Message-Id: <1280864653-31148-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openldap: remove versions 2.2.29 and 2.3.11
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
X-List-Received-Date: Tue, 03 Aug 2010 19:44:35 -0000

Both are almost 5 years old and seem to be unmaintained, also not supported
by upstream authors and probably containing tons of known vulnerabilities.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 conf/distro/include/preferred-om-2008-versions.inc |    1 -
 .../openldap-2.2.29/openldap-autoconf.patch        |  179 ------------
 recipes/openldap/openldap-2.2.29/ucgendat.patch    |   36 ---
 .../openldap-2.3.11/openldap-m4-pthread.patch      |   20 --
 recipes/openldap/openldap_2.2.29.bb                |  256 -----------------
 recipes/openldap/openldap_2.3.11.bb                |  295 --------------------
 6 files changed, 0 insertions(+), 787 deletions(-)
 delete mode 100644 recipes/openldap/openldap-2.2.29/openldap-autoconf.patch
 delete mode 100644 recipes/openldap/openldap-2.2.29/ucgendat.patch
 delete mode 100644 recipes/openldap/openldap-2.3.11/openldap-m4-pthread.patch
 delete mode 100644 recipes/openldap/openldap_2.2.29.bb
 delete mode 100644 recipes/openldap/openldap_2.3.11.bb

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index 79dde2e..c2e68a9 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -1355,7 +1355,6 @@ PREFERRED_VERSION_openal ?= "0.0.8"
 PREFERRED_VERSION_openh323 ?= "1.13.5.4"
 PREFERRED_VERSION_openjade ?= "1.3.2"
 PREFERRED_VERSION_openjade-native ?= "1.3.2"
-PREFERRED_VERSION_openldap ?= "2.3.11"
 PREFERRED_VERSION_openntpd ?= "3.9p1"
 PREFERRED_VERSION_openobex ?= "1.3"
 PREFERRED_VERSION_openpbx.org ?= "1.2_rc3"
diff --git a/recipes/openldap/openldap-2.2.29/openldap-autoconf.patch b/recipes/openldap/openldap-2.2.29/openldap-autoconf.patch
deleted file mode 100644
index c173838..0000000
--- a/recipes/openldap/openldap-2.2.29/openldap-autoconf.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-# This patch makes the configure stuff work with autoconf 2.59
-#
---- openldap-2.2.24/.pc/openldap-autoconf.patch/build/openldap.m4	2005-03-12 19:03:12.000000000 -0800
-+++ openldap-2.2.24/build/openldap.m4	2005-04-16 12:47:49.897651408 -0700
-@@ -65,7 +65,7 @@
- dnl
- dnl ====================================================================
- dnl
--AC_DEFUN(AC_COMPILE_CHECK_SIZEOF,
-+AC_DEFUN([AC_COMPILE_CHECK_SIZEOF],
- [changequote(<<, >>)dnl 
- dnl The name to #define. 
- define(<<AC_TYPE_NAME>>, translit(sizeof_$1, [a-z *], [A-Z_P]))dnl 
-@@ -173,7 +173,7 @@
- dnl
- dnl --------------------------------------------------------------------
- dnl OpenLDAP version of STDC header check w/ EBCDIC support
--AC_DEFUN(OL_HEADER_STDC,
-+AC_DEFUN([OL_HEADER_STDC],
- [AC_REQUIRE_CPP()dnl
- AC_REQUIRE([OL_CPP_EBCDIC])dnl
- AC_CACHE_CHECK([for ANSI C header files], ol_cv_header_stdc,
-@@ -1016,7 +1016,7 @@
- dnl Early MIPS compilers (used in Ultrix 4.2) don't like
- dnl "int x; int *volatile a = &x; *a = 0;"
- dnl 	-- borrowed from PDKSH
--AC_DEFUN(OL_C_VOLATILE,
-+AC_DEFUN([OL_C_VOLATILE],
-  [AC_CACHE_CHECK(if compiler understands volatile, ol_cv_c_volatile,
-     [AC_TRY_COMPILE([int x, y, z;],
-       [volatile int a; int * volatile b = x ? &y : &z;
-@@ -1052,7 +1052,7 @@
- dnl
- dnl ====================================================================
- dnl Define sig_atomic_t if not defined in signal.h
--AC_DEFUN(OL_TYPE_SIG_ATOMIC_T,
-+AC_DEFUN([OL_TYPE_SIG_ATOMIC_T],
-  [AC_CACHE_CHECK(for sig_atomic_t, ol_cv_type_sig_atomic_t,
-     [AC_TRY_COMPILE([#include <signal.h>], [sig_atomic_t atomic;],
- 		ol_cv_type_sig_atomic_t=yes, ol_cv_type_sig_atomic_t=no)])
-@@ -1064,7 +1064,7 @@
- dnl
- dnl ====================================================================
- dnl Define socklen_t if not defined in sys/types.h or sys/socket.h
--AC_DEFUN(OL_TYPE_SOCKLEN_T,
-+AC_DEFUN([OL_TYPE_SOCKLEN_T],
-  [AC_CACHE_CHECK(for socklen_t, ol_cv_type_socklen_t,
-     [AC_TRY_COMPILE([
- #ifdef HAVE_SYS_TYPES_H
-@@ -1083,7 +1083,7 @@
- dnl
- dnl ====================================================================
- dnl Define inet_aton is available
--AC_DEFUN(OL_FUNC_INET_ATON,
-+AC_DEFUN([OL_FUNC_INET_ATON],
-  [AC_CACHE_CHECK([for inet_aton()], ol_cv_func_inet_aton,
-     [AC_TRY_LINK([
- #ifdef HAVE_SYS_TYPES_H
-@@ -1110,7 +1110,7 @@
- dnl
- dnl ====================================================================
- dnl check no of arguments for ctime_r
--AC_DEFUN(OL_FUNC_CTIME_R_NARGS,
-+AC_DEFUN([OL_FUNC_CTIME_R_NARGS],
-  [AC_CACHE_CHECK(number of arguments of ctime_r, ol_cv_func_ctime_r_nargs,
-    [AC_TRY_COMPILE([#include <time.h>],
- 		[time_t ti; char *buffer; ctime_r(&ti,buffer,32);],
-@@ -1145,7 +1145,7 @@
- dnl
- dnl --------------------------------------------------------------------
- dnl check return type of ctime_r()
--AC_DEFUN(OL_FUNC_CTIME_R_TYPE,
-+AC_DEFUN([OL_FUNC_CTIME_R_TYPE],
-  [AC_CACHE_CHECK(return type of ctime_r, ol_cv_func_ctime_r_type,
-    [AC_TRY_COMPILE([#include <time.h>],
- 		[extern int (ctime_r)();],
-@@ -1157,7 +1157,7 @@
- ])dnl
- dnl ====================================================================
- dnl check no of arguments for gethostbyname_r
--AC_DEFUN(OL_FUNC_GETHOSTBYNAME_R_NARGS,
-+AC_DEFUN([OL_FUNC_GETHOSTBYNAME_R_NARGS],
-  [AC_CACHE_CHECK(number of arguments of gethostbyname_r,
- 	ol_cv_func_gethostbyname_r_nargs,
- 	[AC_TRY_COMPILE([#include <sys/types.h>
-@@ -1207,7 +1207,7 @@
- ])dnl
- dnl
- dnl check no of arguments for gethostbyaddr_r
--AC_DEFUN(OL_FUNC_GETHOSTBYADDR_R_NARGS,
-+AC_DEFUN([OL_FUNC_GETHOSTBYADDR_R_NARGS],
-  [AC_CACHE_CHECK(number of arguments of gethostbyaddr_r,
- 	[ol_cv_func_gethostbyaddr_r_nargs],
- 	[AC_TRY_COMPILE([#include <sys/types.h>
-@@ -1283,7 +1283,7 @@
- ])
- dnl ====================================================================
- dnl check for msg_accrights in msghdr
--AC_DEFUN(OL_MSGHDR_MSG_ACCRIGHTS,
-+AC_DEFUN([OL_MSGHDR_MSG_ACCRIGHTS],
-  [AC_CACHE_CHECK(for msg_accrights in msghdr, ol_cv_msghdr_msg_accrights,
-    [AC_TRY_COMPILE([#include <sys/socket.h>],
- 		[struct msghdr m; m.msg_accrightslen=0],
---- openldap-2.2.24/.pc/openldap-autoconf.patch/configure.in	2005-03-14 09:06:26.000000000 -0800
-+++ openldap-2.2.24/configure.in	2005-04-16 12:52:48.802211008 -0700
-@@ -590,8 +591,8 @@
- 
- dnl ----------------------------------------------------------------
- dnl Checks for system services
--AC_CYGWIN
--AC_MINGW32
-+dnl obsolete: sets CYGWIN (and this is not used in openldap!) AC_CYGWIN
-+dnl obsolete: sets MINGW32 (and this is not used in openldap!) AC_MINGW32
- AC_EXEEXT
- AC_OBJEXT
- 
-@@ -1771,7 +1772,7 @@
- fi
- 
- if test $ol_link_threads != no ; then
--	AC_DEFINE(LDAP_API_FEATURE_X_OPENLDAP_THREAD_SAFE,1)
-+	AC_DEFINE(LDAP_API_FEATURE_X_OPENLDAP_THREAD_SAFE,1,[is -lldap_r available or not])
- fi
- 
- dnl ----------------------------------------------------------------
-@@ -2133,7 +2134,7 @@
- 			[have_setproctitle=yes
- 			LUTIL_LIBS="$LUTIL_LIBS -lutil"],
- 			[have_setproctitle=no
--			LIBOBJS="$LIBOBJS setproctitle.o"
-+			AC_LIBOBJ([setproctitle])
- 			LIBSRCS="$LIBSRCS setproctitle.c"])])
- 
- 	if test $have_setproctitle = yes ; then
-@@ -2174,7 +2175,7 @@
- AC_TYPE_MODE_T
- AC_TYPE_OFF_T
- AC_TYPE_PID_T
--AM_TYPE_PTRDIFF_T
-+#obsolete: AM_TYPE_PTRDIFF_T
- AC_TYPE_SIGNAL
- AC_TYPE_SIZE_T
- 
-@@ -2212,14 +2213,14 @@
- if test "$ac_cv_sizeof_int" -lt 4 ; then
- 	AC_MSG_WARN([OpenLDAP requires 'int' to be 32 bits or greater.])
- 
--	AC_DEFINE(LBER_INT_T,long)
-+	AC_DEFINE(LBER_INT_T,long,[LBER boolean, enum, integers (32 bits or larger)])
- else
- 	AC_DEFINE(LBER_INT_T,int)
- fi
- 
--AC_DEFINE(LBER_LEN_T,long)
--AC_DEFINE(LBER_SOCKET_T,int)
--AC_DEFINE(LBER_TAG_T,long)
-+AC_DEFINE(LBER_LEN_T,long,[LBER lengths (32 bits or larger)])
-+AC_DEFINE(LBER_SOCKET_T,int,[LBER socket descriptor])
-+AC_DEFINE(LBER_TAG_T,long,[LBER tags (32 bits or larger)])
- 
- dnl ----------------------------------------------------------------
- dnl Checks for library functions.
-@@ -2364,14 +2365,14 @@
- 		[define this to add syslog code])
- fi
- if test "$ol_link_kbind" != no ; then
--	AC_DEFINE(LDAP_API_FEATURE_X_OPENLDAP_V2_KBIND,LDAP_VENDOR_VERSION)
-+	AC_DEFINE(LDAP_API_FEATURE_X_OPENLDAP_V2_KBIND,LDAP_VENDOR_VERSION,[LDAP v2 Kerberos Bind])
- fi
- if test "$ol_enable_proctitle" != no ; then
- 	AC_DEFINE(LDAP_PROCTITLE,1,
- 		[define this for LDAP process title support])
- fi
- if test "$ol_enable_referrals" != no ; then
--	AC_DEFINE(LDAP_API_FEATURE_X_OPENLDAP_V2_REFERRALS,LDAP_VENDOR_VERSION)
-+	AC_DEFINE(LDAP_API_FEATURE_X_OPENLDAP_V2_REFERRALS,LDAP_VENDOR_VERSION,[LDAP v2 Referrals])
- fi
- if test "$ol_enable_local" != no; then
- 	AC_DEFINE(LDAP_PF_LOCAL,1,[define to support PF_LOCAL])
diff --git a/recipes/openldap/openldap-2.2.29/ucgendat.patch b/recipes/openldap/openldap-2.2.29/ucgendat.patch
deleted file mode 100644
index 6f04844..0000000
--- a/recipes/openldap/openldap-2.2.29/ucgendat.patch
+++ /dev/null
@@ -1,36 +0,0 @@
---- openldap-2.2.24/.pc/ucgendat.patch/libraries/liblunicode/Makefile.in	2005-01-20 09:01:03.000000000 -0800
-+++ openldap-2.2.24/libraries/liblunicode/Makefile.in	2005-04-18 07:57:11.364118488 -0700
-@@ -31,16 +31,30 @@
- 
- ucgendat: $(XLIBS) ucgendat.o
- 	$(LTLINK) -o $@ ucgendat.o $(LIBS)
--	./ucgendat $(srcdir)/UnicodeData.txt -x $(srcdir)/CompositionExclusions.txt
-+	./ucgendat $(srcdir)/UnicodeData.txt -x $(srcdir)/CompositionExclusions.txt || \
-+		touch ./nodat
- 
- DATFILES = case.dat cmbcl.dat comp.dat ctype.dat decomp.dat num.dat kdecomp.dat
- 
-+# This deals with cross compilation - ucgendat must be run on the host after
-+# the install!
- install-local: $(PROGRAMS) FORCE
- 	-$(MKDIR) $(DESTDIR)$(datadir)/ucdata
--	@for i in $(DATFILES); do \
-+	@if test -e nodat;\
-+	then\
-+		echo $(LTINSTALL) $(INSTALLFLAGS) -s -m 755 ucgendat $(DESTDIR)$(datadir)/ucdata;\
-+		$(LTINSTALL) $(INSTALLFLAGS) -s -m 755 ucgendat $(DESTDIR)$(datadir)/ucdata;\
-+		for i in UnicodeData.txt CompositionExclusions.txt;\
-+		do\
-+			echo $(INSTALL) $(INSTALLFLAGS) -m 644 $$i $(DESTDIR)$(datadir)/ucdata;\
-+			$(INSTALL) $(INSTALLFLAGS) -m 644 $$i $(DESTDIR)$(datadir)/ucdata;\
-+		done;\
-+	else\
-+	for i in $(DATFILES); do \
- 		echo $(INSTALL) $(INSTALLFLAGS) -m 644 $$i $(DESTDIR)$(datadir)/ucdata; \
- 		$(INSTALL) $(INSTALLFLAGS) -m 644 $$i $(DESTDIR)$(datadir)/ucdata; \
--	done
-+	done;\
-+	fi
- 
- .links :
- 	@for i in $(XXSRCS) $(XXHEADERS); do \
diff --git a/recipes/openldap/openldap-2.3.11/openldap-m4-pthread.patch b/recipes/openldap/openldap-2.3.11/openldap-m4-pthread.patch
deleted file mode 100644
index b669b72..0000000
--- a/recipes/openldap/openldap-2.3.11/openldap-m4-pthread.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- openldap-2.3.11/build/openldap.m4.orig	2005-11-11 00:11:18.604322590 -0800
-+++ openldap-2.3.11/build/openldap.m4	2005-11-11 00:26:21.621145856 -0800
-@@ -788,7 +788,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
- ]])
- 
- AC_DEFUN([OL_PTHREAD_TEST_PROGRAM],
--AC_LANG_SOURCE([OL_PTHREAD_TEST_INCLUDES
-+[AC_LANG_SOURCE([[OL_PTHREAD_TEST_INCLUDES
- 
- int main(argc, argv)
- 	int argc;
-@@ -796,7 +796,7 @@ int main(argc, argv)
- {
- OL_PTHREAD_TEST_FUNCTION
- }
--]))
-+]])])
- dnl --------------------------------------------------------------------
- AC_DEFUN([OL_PTHREAD_TRY], [# Pthread try link: $1 ($2)
- if test "$ol_link_threads" = no ; then
diff --git a/recipes/openldap/openldap_2.2.29.bb b/recipes/openldap/openldap_2.2.29.bb
deleted file mode 100644
index 8d17e47..0000000
--- a/recipes/openldap/openldap_2.2.29.bb
+++ /dev/null
@@ -1,256 +0,0 @@
-# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
-#
-DESCRIPTION = "OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol."
-HOMEPAGE = "http://www.OpenLDAP.org/license.html"
-PRIORITY = "optional"
-# The OpenLDAP Public License - see the HOMEPAGE - defines
-# the license.  www.openldap.org claims this is Open Source
-# (see http://www.openldap.org), the license appears to be
-# basically BSD.  opensource.org does not record this license
-# at present (so it is apparently not OSI certified).
-LICENSE = "OpenLDAP"
-SECTION = "libs"
-
-PR = "r0"
-
-SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz"
-SRC_URI += "file://openldap-autoconf.patch"
-# The build tries to run a host executable, this fails.  The patch
-# causes the executable and its data to be installed instead of
-# the output - ucgendat must be run after the ipkg install!
-SRC_URI += "file://ucgendat.patch"
-# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
-# installing .so and executables, this fails in cross compilation
-# environments
-SRC_URI += "file://install-strip.patch"
-
-inherit autotools
-
-# OPTIONS
-# The following two variables can be set in a distro or local.conf
-# to switch features on.  Each feature foo defines OPENLDAP_OPTION_foo
-# and OPENLDAP_DEPENDS_foo in this file - to include feature foo add
-# the two variables into the setting of the options below (please use
-# += because that means this can be done in *both* distro.conf and
-# local.conf!
-OPENLDAP_OPTIONS ?= ""
-OPENLDAP_DEPENDS ?= ""
-
-# CONFIG DEFINITIONS
-# The following is necessary because it cannot be determined for a
-# cross compile automagically.  Select should yield fine on all OE
-# systems...
-EXTRA_OECONF += "--with-yielding-select=yes"
-# Shared libraries are nice...
-EXTRA_OECONF += "--enable-dynamic"
-#
-# Disable TLS to remove the need for openssl/libcrypto
-OPENLDAP_OPTION_tls  ?= "--without-tls"
-# set the following to " openssl" to build tls support
-OPENLDAP_DEPENDS_tls ?=
-EXTRA_OECONF += "${OPENLDAP_OPTION_tls}"
-DEPENDS += "${OPENLDAP_DEPENDS_tls}"
-
-# SLAPD options
-#
-# UNIX crypt(3) passwd support:
-EXTRA_OECONF += "--enable-crypt"
-#
-# Enable dynamic module loading.  If this is *disabled* the
-# dependency on libtool is removed (to disable set the following
-# to variables to "" in a .conf file).
-OPENLDAP_OPTION_modules += "lt_cv_dlopen_self=yes --enable-modules"
-OPENLDAP_DEPENDS_modules += "libtool"
-EXTRA_OECONF += " ${OPENLDAP_OPTION_modules}"
-DEPENDS += "${OPENLDAP_DEPENDS_modules}"
-
-# SLAPD BACKEND
-#
-# The backend must be set by the configuration.  This controls the
-# required database, the default database, bdb, is turned off but
-# can be turned back on again and it *is* below!  The monitor backend
-# is also disabled.  If you try to change the backends but fail to
-# enable a single one the build will fail in an obvious way.
-#
-EXTRA_OECONF += "--disable-bdb --disable-monitor"
-#
-# Backends="bdb dnssrv hdb ldap ldbm meta monitor null passwd perl shell sql"
-#
-# Note that multiple backends can be built.  The ldbm backend requires a
-# build-time choice of database API.  The bdb backend forces this to be
-# DB4.  To use the gdbm (or other) API the Berkely database module must
-# be removed from the build.
-md = "${libexecdir}/openldap"
-#
-#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
-# The Berkely DB is the standard choice.  This version of OpenLDAP requires
-# the version 4 implementation or better.
-# To disable this set all three of the following variables to <empty> in
-# a .conf file (this will allow ldbm to be build with gdbm).
-OPENLDAP_OPTION_bdb   ?= "--enable-bdb=mod"
-OPENLDAP_DEPENDS_bdb  ?= "db"
-OPENLDAP_PACKAGE_bdb  ?= "${PN}-backend-bdb"
-FILES_${PN}-backend-bdb = "${md}/back_bdb.so ${md}/back_bdb.la ${md}/back_bdb-*.so.*"
-EXTRA_OECONF += "${OPENLDAP_OPTION_bdb}"
-DEPENDS += "${OPENLDAP_DEPENDS_bdb}"
-PACKAGES += "${OPENLDAP_PACKAGE_bdb}"
-#
-#--enable-dnssrv       enable dnssrv backend no|yes|mod no
-# This has no dependencies.
-FILES_${PN}-backend-dnssrv = "${md}/back_dnssrv.so ${md}/back_dnssrv.la ${md}/back_dnssrv-*.so.*"
-EXTRA_OECONF += "--enable-dnssrv=mod"
-PACKAGES += "${PN}-backend-dnssrv"
-#
-#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
-# This forces ldbm to use Berkeley too, remove to use gdbm
-OPENLDAP_OPTION_hdb   ?= "--enable-hdb=mod"
-OPENLDAP_DEPENDS_hdb  ?= "db"
-OPENLDAP_PACKAGE_hdb  ?= "${PN}-backend-hdb"
-FILES_${PN}-backend-hdb = "${md}/back_hdb.so ${md}/back_hdb.la ${md}/back_hdb-*.so.*"
-EXTRA_OECONF += "${OPENLDAP_OPTION_hdb}"
-DEPENDS += "${OPENLDAP_DEPENDS_hdb}"
-PACKAGES += "${OPENLDAP_PACKAGE_hdb}"
-#
-#--enable-ldap         enable ldap backend no|yes|mod no
-# This has no dependencies
-EXTRA_OECONF += "--enable-ldap=mod"
-FILES_${PN}-backend-ldap = "${md}/back_ldap.so ${md}/back_ldap.la ${md}/back_ldap-*.so.*"
-PACKAGES += "${PN}-backend-ldap"
-#
-#--enable-ldbm         enable ldbm backend no|yes|mod no
-# ldbm requires further specification of the underlying database API, because
-# bdb is enabled above this must be set to berkeley, however the config
-# defaults this correctly so --with-ldbm-api is *not* set.  The build will
-# fail if bdb is removed (above) but not database is built to provide the
-# support for ldbm (because the 'DEPENDS_ldbm' is empty below.)
-#
-# So to use gdbm set:
-#OPENLDAP_OPTION_ldbm = "--enable-ldbm=mod --with-ldbm-api=gdbm"
-#OPENLDAP_DEPENDS_ldbm = gdbm
-# And clear the bdb and hdb settings.
-OPENLDAP_OPTION_ldbm ?= "--enable-ldbm=mod"
-OPENLDAP_DEPENDS_ldbm ?= ""
-OPENLDAP_PACKAGES_ldbm ?= "${PN}-backend-ldbm"
-FILES_${PN}-backend-ldbm = "${md}/back_ldbm.so ${md}/back_ldbm.la ${md}/back_ldbm-*.so.*"
-EXTRA_OECONF += "${OPENLDAP_OPTION_ldbm}"
-DEPENDS += "${OPENLDAP_DEPENDS_ldbm}"
-PACKAGES += "${PN}-backend-ldbm"
-#
-#--enable-meta         enable metadirectory backend no|yes|mod no
-# No dependencies
-EXTRA_OECONF += "--enable-meta=mod"
-FILES_${PN}-backend-meta = "${md}/back_meta.so ${md}/back_meta.la ${md}/back_meta-*.so.*"
-PACKAGES += "${PN}-backend-meta"
-#
-#--enable-monitor      enable monitor backend no|yes|mod yes
-EXTRA_OECONF += "--enable-monitor=mod"
-FILES_${PN}-backend-monitor = "${md}/back_monitor.so ${md}/back_monitor.la ${md}/back_monitor-*.so.*"
-PACKAGES += "${PN}-backend-monitor"
-#
-#--enable-null         enable null backend no|yes|mod no
-EXTRA_OECONF += "--enable-null=mod"
-FILES_${PN}-backend-null = "${md}/back_null.so ${md}/back_null.la ${md}/back_null-*.so.*"
-PACKAGES += "${PN}-backend-null"
-#
-#--enable-passwd       enable passwd backend no|yes|mod no
-EXTRA_OECONF += " --enable-passwd=mod"
-FILES_${PN}-backend-passwd = "${md}/back_passwd.so ${md}/back_passwd.la ${md}/back_passwd-*.so.*"
-PACKAGES += "${PN}-backend-passwd"
-#
-#--enable-perl         enable perl backend no|yes|mod no
-#  This requires a loadable perl dynamic library, if enabled without
-#  doing something appropriate (building perl?) the build will pick
-#  up the build machine perl - not good.
-OPENLDAP_OPTION_perl ?= "--enable-perl=mod"
-OPENLDAP_DEPENDS_perl ?= "perl"
-OPENLDAP_PACKAGES_perl ?= "${PN}-backend-perl"
-FILES_${PN}-backend-perl = "${md}/back_perl.so ${md}/back_perl.la ${md}/back_perl-*.so.*"
-#EXTRA_OECONF += "${OPENLDAP_OPTION_perl}"
-#DEPENDS += "${OPENLDAP_DEPENDS_perl}"
-#PACKAGES += "${PN}-backend-perl"
-#
-#--enable-shell        enable shell backend no|yes|mod no
-EXTRA_OECONF += "--enable-shell=mod"
-FILES_${PN}-backend-shell = "${md}/back_shell.so ${md}/back_shell.la ${md}/back_shell-*.so.*"
-PACKAGES += "${PN}-backend-shell"
-#
-#--enable-sql          enable sql backend no|yes|mod no
-# sql requires some sql backend which provides sql.h, sqlite* provides
-# sqlite.h (which may be compatible but hasn't been tried.)
-OPENLDAP_OPTION_sql ?= "--enable-sql=mod"
-OPENLDAP_DEPENDS_sql ?= "sql"
-OPENLDAP_PACKAGES_sql ?= "${PN}-backend-sql"
-FILES_${PN}-backend-sql = "${md}/back_sql.so ${md}/back_sql.la ${md}/back_sql-*.so.*"
-#EXTRA_OECONF += "${OPENLDAP_OPTION_sql}"
-#DEPENDS += "${OPENLDAP_DEPENDS_sql}"
-#PACKAGES += "${PN}-backend-sql"
-#
-#--enable-dyngroup     Dynamic Group overlay no|yes|mod no
-#  This is a demo, Proxy Cache defines init_module which conflicts with the
-#  same symbol in dyngroup
-#EXTRA_OECONF += "--enable-dyngroup=mod"
-#FILES_${PN}-overlay-dyngroup = "${md}/back_dyngroup.so ${md}/back_dyngroup.la ${md}/back_dyngroup-*.so.*"
-#PACKAGES += "${PN}-overlay-dyngroup"
-#
-#--enable-proxycache   Proxy Cache overlay no|yes|mod no
-EXTRA_OECONF += "--enable-proxycache=mod"
-FILES_${PN}-overlay-proxycache = "${md}/pcache.so ${md}/pcache.la ${md}/pcache-*.so.*"
-PACKAGES += "${PN}-overlay-proxycache"
-#
-# LOCAL OPTION OVERRIDES
-# The distro/lcoal options must be added in *last*
-EXTRA_OECONF += "${OPENLDAP_OPTIONS}"
-DEPENDS      += "${OPENLDAP_DEPENDS}"
-
-do_stage() {
-	autotools_stage_includes
-	# Install the -2.2 versions, but link foo.so to foo-2.2.so ONLY
-	# if the do not exist!
-	oe_libinstall -so -C libraries/libldap/.libs libldap-2.2 ${STAGING_LIBDIR}
-	test -e ${STAGING_LIBDIR}/libldap.so ||
-		ln -s $(basename ${STAGING_LIBDIR}/libldap-2.2.so.*.*.*) ${STAGING_LIBDIR}/libldap.so
-	oe_libinstall -so -C libraries/libldap_r/.libs libldap_r-2.2 ${STAGING_LIBDIR}
-	test -e ${STAGING_LIBDIR}/libldap_r.so ||
-		ln -s $(basename ${STAGING_LIBDIR}/libldap_r-2.2.so.*.*.*) ${STAGING_LIBDIR}/libldap_r.so
-	oe_libinstall -so -C libraries/liblber/.libs liblber-2.2 ${STAGING_LIBDIR}
-	test -e ${STAGING_LIBDIR}/liblber.so ||
-		ln -s $(basename ${STAGING_LIBDIR}/liblber-2.2.so.*.*.*) ${STAGING_LIBDIR}/liblber.so
-}
-
-LEAD_SONAME = "libldap-2.2.so.*"
-
-# The executables go in a separate package.  This allows the
-# installation of the libraries with no daemon support.
-# Each module also has its own package - see above.
-PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
-
-# Package contents - shift most standard contents to -bin
-FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
-FILES_${PN}-slapd = "${libexecdir}/slapd ${sbindir} ${datadir}/openldap/ucdata \
-	${localstatedir}/run ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema"
-FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run"
-FILES_${PN}-bin = "${bindir}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a"
-
-# Run ucgendat, and remove it.
-# This is a painful and annoying way around the use of machine-generated
-# tables within the build.  The alternative is to rewrite the ucgendat
-# stuff and associated liblunicode code to use machine-independent data
-# files - the current code seems to at least assume byte sex.
-DATFILES = "case.dat cmbcl.dat comp.dat ctype.dat decomp.dat num.dat kdecomp.dat"
-pkg_postinst_openldap-slapd() {
-test -n "${DESTDIR}" -o "${BUILD_ARCH}" = "${HOST_ARCH}" || (
-	cd "${datadir}/${PN}/ucdata" &&
-	./ucgendat UnicodeData.txt -x CompositionExclusions.txt &&
-	# This saves about 1MByte
-	rm ucgendat UnicodeData.txt CompositionExclusions.txt
-)
-}
-pkg_prerm_openldap-slapd() {
-test "${BUILD_ARCH}" = "${HOST_ARCH}" || (
-	cd "${datadir}/${PN}/ucdata" && rm ${DATFILES}
-)
-}
-
-SRC_URI[md5sum] = "6c4c72a1336aa45b463e738034c078d6"
-SRC_URI[sha256sum] = "82ed5a27d2b340826b2e10625e687627ccefc883a426314952e4a253d5a6af29"
diff --git a/recipes/openldap/openldap_2.3.11.bb b/recipes/openldap/openldap_2.3.11.bb
deleted file mode 100644
index 23b0dae..0000000
--- a/recipes/openldap/openldap_2.3.11.bb
+++ /dev/null
@@ -1,295 +0,0 @@
-# OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
-#
-DESCRIPTION = "OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol."
-HOMEPAGE = "http://www.OpenLDAP.org/license.html"
-PRIORITY = "optional"
-# The OpenLDAP Public License - see the HOMEPAGE - defines
-# the license.  www.openldap.org claims this is Open Source
-# (see http://www.openldap.org), the license appears to be
-# basically BSD.  opensource.org does not record this license
-# at present (so it is apparently not OSI certified).
-LICENSE = "OpenLDAP"
-SECTION = "libs"
-
-PR = "r5"
-
-LDAP_VER = "${@'.'.join(bb.data.getVar('PV',d,1).split('.')[0:2])}"
-
-SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz"
-SRC_URI += "file://openldap-m4-pthread.patch"
-SRC_URI += "file://initscript"
-# The build tries to run a host executable, this fails.  The patch
-# causes the executable and its data to be installed instead of
-# the output - ucgendat must be run after the ipkg install!
-#SRC_URI += "file://ucgendat.patch"
-# The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
-# installing .so and executables, this fails in cross compilation
-# environments
-SRC_URI += "file://install-strip.patch"
-
-inherit autotools
-
-# OPTIONS
-# The following two variables can be set in a distro or local.conf
-# to switch features on.  Each feature foo defines OPENLDAP_OPTION_foo
-# and OPENLDAP_DEPENDS_foo in this file - to include feature foo add
-# the two variables into the setting of the options below (please use
-# += because that means this can be done in *both* distro.conf and
-# local.conf!
-OPENLDAP_OPTIONS ?= ""
-OPENLDAP_DEPENDS ?= ""
-
-# CV SETTINGS
-# Required to work round AC_FUNC_MEMCMP which gets the wrong answer
-# when cross compiling (should be in site?)
-EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
-
-# CONFIG DEFINITIONS
-# The following is necessary because it cannot be determined for a
-# cross compile automagically.  Select should yield fine on all OE
-# systems...
-EXTRA_OECONF += "--with-yielding-select=yes"
-# Shared libraries are nice...
-EXTRA_OECONF += "--enable-dynamic"
-#
-# Disable TLS to remove the need for openssl/libcrypto
-OPENLDAP_OPTION_tls  ?= "--without-tls"
-# set the following to "openssl" to build tls support
-OPENLDAP_DEPENDS_tls ?= ""
-EXTRA_OECONF += "${OPENLDAP_OPTION_tls}"
-DEPENDS += "${OPENLDAP_DEPENDS_tls}"
-#
-# Disable Cyrus SASL, which may or may not be working at present...
-OPENLDAP_OPTION_sasl  ?= "--without-cyrus-sasl"
-# set the following to "cyrus-sasl" to build SASL support
-OPENLDAP_DEPENDS_sasl ?= ""
-EXTRA_OECONF += "${OPENLDAP_OPTION_sasl}"
-DEPENDS += "${OPENLDAP_DEPENDS_sasl}"
-
-# SLAPD options
-#
-# UNIX crypt(3) passwd support:
-EXTRA_OECONF += "--enable-crypt"
-#
-# Enable dynamic module loading.  If this is *disabled* the
-# dependency on libtool is removed (to disable set the following
-# to variables to "" in a .conf file).
-OPENLDAP_OPTION_modules += "lt_cv_dlopen_self=yes --enable-modules"
-OPENLDAP_DEPENDS_modules += "libtool"
-EXTRA_OECONF += " ${OPENLDAP_OPTION_modules}"
-DEPENDS += "${OPENLDAP_DEPENDS_modules}"
-
-# SLAPD BACKEND
-#
-# The backend must be set by the configuration.  This controls the
-# required database, the default database, bdb, is turned off but
-# can be turned back on again and it *is* below!  The monitor backend
-# is also disabled.  If you try to change the backends but fail to
-# enable a single one the build will fail in an obvious way.
-#
-EXTRA_OECONF += "--disable-bdb --disable-monitor"
-#
-# Backends="bdb dnssrv hdb ldap ldbm meta monitor null passwd perl shell sql"
-#
-# Note that multiple backends can be built.  The ldbm backend requires a
-# build-time choice of database API.  The bdb backend forces this to be
-# DB4.  To use the gdbm (or other) API the Berkely database module must
-# be removed from the build.
-md = "${libexecdir}/openldap"
-#
-#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
-# The Berkely DB is the standard choice.  This version of OpenLDAP requires
-# the version 4 implementation or better.
-# To disable this set all three of the following variables to <empty> in
-# a .conf file (this will allow ldbm to be build with gdbm).
-OPENLDAP_OPTION_bdb   ?= "--enable-bdb=mod"
-OPENLDAP_DEPENDS_bdb  ?= "db"
-OPENLDAP_PACKAGE_bdb  ?= "${PN}-backend-bdb"
-FILES_${PN}-backend-bdb = "${md}/back_bdb.so ${md}/back_bdb.la ${md}/back_bdb-*.so.*"
-EXTRA_OECONF += "${OPENLDAP_OPTION_bdb}"
-DEPENDS += "${OPENLDAP_DEPENDS_bdb}"
-PACKAGES += "${OPENLDAP_PACKAGE_bdb}"
-#
-#--enable-dnssrv       enable dnssrv backend no|yes|mod no
-# This has no dependencies.
-FILES_${PN}-backend-dnssrv = "${md}/back_dnssrv.so ${md}/back_dnssrv.la ${md}/back_dnssrv-*.so.*"
-EXTRA_OECONF += "--enable-dnssrv=mod"
-PACKAGES += "${PN}-backend-dnssrv"
-#
-#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
-# This forces ldbm to use Berkeley too, remove to use gdbm
-OPENLDAP_OPTION_hdb   ?= "--enable-hdb=mod"
-OPENLDAP_DEPENDS_hdb  ?= "db"
-OPENLDAP_PACKAGE_hdb  ?= "${PN}-backend-hdb"
-FILES_${PN}-backend-hdb = "${md}/back_hdb.so ${md}/back_hdb.la ${md}/back_hdb-*.so.*"
-EXTRA_OECONF += "${OPENLDAP_OPTION_hdb}"
-DEPENDS += "${OPENLDAP_DEPENDS_hdb}"
-PACKAGES += "${OPENLDAP_PACKAGE_hdb}"
-#
-#--enable-ldap         enable ldap backend no|yes|mod no
-# This has no dependencies
-EXTRA_OECONF += "--enable-ldap=mod"
-FILES_${PN}-backend-ldap = "${md}/back_ldap.so ${md}/back_ldap.la ${md}/back_ldap-*.so.*"
-PACKAGES += "${PN}-backend-ldap"
-#
-#--enable-ldbm         enable ldbm backend no|yes|mod no
-# ldbm requires further specification of the underlying database API, because
-# bdb is enabled above this must be set to berkeley, however the config
-# defaults this correctly so --with-ldbm-api is *not* set.  The build will
-# fail if bdb is removed (above) but not database is built to provide the
-# support for ldbm (because the 'DEPENDS_ldbm' is empty below.)
-#
-# So to use gdbm set:
-#OPENLDAP_OPTION_ldbm = "--enable-ldbm=mod --with-ldbm-api=gdbm"
-#OPENLDAP_DEPENDS_ldbm = gdbm
-# And clear the bdb and hdb settings.
-OPENLDAP_OPTION_ldbm ?= "--enable-ldbm=mod"
-OPENLDAP_DEPENDS_ldbm ?= ""
-OPENLDAP_PACKAGES_ldbm ?= "${PN}-backend-ldbm"
-FILES_${PN}-backend-ldbm = "${md}/back_ldbm.so ${md}/back_ldbm.la ${md}/back_ldbm-*.so.*"
-EXTRA_OECONF += "${OPENLDAP_OPTION_ldbm}"
-DEPENDS += "${OPENLDAP_DEPENDS_ldbm}"
-PACKAGES += "${PN}-backend-ldbm"
-#
-#--enable-meta         enable metadirectory backend no|yes|mod no
-# No dependencies
-EXTRA_OECONF += "--enable-meta=mod"
-FILES_${PN}-backend-meta = "${md}/back_meta.so ${md}/back_meta.la ${md}/back_meta-*.so.*"
-PACKAGES += "${PN}-backend-meta"
-#
-#--enable-monitor      enable monitor backend no|yes|mod yes
-EXTRA_OECONF += "--enable-monitor=mod"
-FILES_${PN}-backend-monitor = "${md}/back_monitor.so ${md}/back_monitor.la ${md}/back_monitor-*.so.*"
-PACKAGES += "${PN}-backend-monitor"
-#
-#--enable-null         enable null backend no|yes|mod no
-EXTRA_OECONF += "--enable-null=mod"
-FILES_${PN}-backend-null = "${md}/back_null.so ${md}/back_null.la ${md}/back_null-*.so.*"
-PACKAGES += "${PN}-backend-null"
-#
-#--enable-passwd       enable passwd backend no|yes|mod no
-EXTRA_OECONF += " --enable-passwd=mod"
-FILES_${PN}-backend-passwd = "${md}/back_passwd.so ${md}/back_passwd.la ${md}/back_passwd-*.so.*"
-PACKAGES += "${PN}-backend-passwd"
-#
-#--enable-perl         enable perl backend no|yes|mod no
-#  This requires a loadable perl dynamic library, if enabled without
-#  doing something appropriate (building perl?) the build will pick
-#  up the build machine perl - not good.
-OPENLDAP_OPTION_perl ?= "--enable-perl=mod"
-OPENLDAP_DEPENDS_perl ?= "perl"
-OPENLDAP_PACKAGES_perl ?= "${PN}-backend-perl"
-FILES_${PN}-backend-perl = "${md}/back_perl.so ${md}/back_perl.la ${md}/back_perl-*.so.*"
-#EXTRA_OECONF += "${OPENLDAP_OPTION_perl}"
-#DEPENDS += "${OPENLDAP_DEPENDS_perl}"
-#PACKAGES += "${PN}-backend-perl"
-#
-#--enable-shell        enable shell backend no|yes|mod no
-EXTRA_OECONF += "--enable-shell=mod"
-FILES_${PN}-backend-shell = "${md}/back_shell.so ${md}/back_shell.la ${md}/back_shell-*.so.*"
-PACKAGES += "${PN}-backend-shell"
-#
-#--enable-sql          enable sql backend no|yes|mod no
-# sql requires some sql backend which provides sql.h, sqlite* provides
-# sqlite.h (which may be compatible but hasn't been tried.)
-OPENLDAP_OPTION_sql ?= "--enable-sql=mod"
-OPENLDAP_DEPENDS_sql ?= "sql"
-OPENLDAP_PACKAGES_sql ?= "${PN}-backend-sql"
-FILES_${PN}-backend-sql = "${md}/back_sql.so ${md}/back_sql.la ${md}/back_sql-*.so.*"
-#EXTRA_OECONF += "${OPENLDAP_OPTION_sql}"
-#DEPENDS += "${OPENLDAP_DEPENDS_sql}"
-#PACKAGES += "${PN}-backend-sql"
-#
-#--enable-dyngroup     Dynamic Group overlay no|yes|mod no
-#  This is a demo, Proxy Cache defines init_module which conflicts with the
-#  same symbol in dyngroup
-#EXTRA_OECONF += "--enable-dyngroup=mod"
-#FILES_${PN}-overlay-dyngroup = "${md}/back_dyngroup.so ${md}/back_dyngroup.la ${md}/back_dyngroup-*.so.*"
-#PACKAGES += "${PN}-overlay-dyngroup"
-#
-#--enable-proxycache   Proxy Cache overlay no|yes|mod no
-EXTRA_OECONF += "--enable-proxycache=mod"
-FILES_${PN}-overlay-proxycache = "${md}/pcache.so ${md}/pcache.la ${md}/pcache-*.so.*"
-PACKAGES += "${PN}-overlay-proxycache"
-#
-# LOCAL OPTION OVERRIDES
-# The distro/lcoal options must be added in *last*
-EXTRA_OECONF += "${OPENLDAP_OPTIONS}"
-DEPENDS      += "${OPENLDAP_DEPENDS}"
-
-CPPFLAGS_append = " -D_GNU_SOURCE"
-
-do_configure() {
-	gnu-configize
-	oe_runconf
-}
-
-#FIXME: this is a hack, at present an openldap build will pick up the header
-# files from staging rather than the local ones (bad -I order), so remove
-# the headers (from openldap-old.x) before compiling...
-do_compile_prepend() {
-	(	cd ${STAGING_INCDIR}
-		rm -f ldap.h ldap_*.h
-	)
-	(	cd ${STAGING_LIBDIR}
-		rm -f libldap* liblber*
-	)
-}
-
-do_stage() {
-	echo "staging libldap-${LDAP_VER}" >&2
-	#
-	autotools_stage_includes
-	# Install the -${LDAP_VER} versions, but link foo.so to foo-x.y.so ONLY
-	# if they do not exist!
-	oe_libinstall -so -C libraries/libldap/.libs libldap-${LDAP_VER} ${STAGING_LIBDIR}
-	test -e ${STAGING_LIBDIR}/libldap.so ||
-		ln -s $(basename ${STAGING_LIBDIR}/libldap-${LDAP_VER}.so.*.*.*) ${STAGING_LIBDIR}/libldap.so
-	oe_libinstall -so -C libraries/libldap_r/.libs libldap_r-${LDAP_VER} ${STAGING_LIBDIR}
-	test -e ${STAGING_LIBDIR}/libldap_r.so ||
-		ln -s $(basename ${STAGING_LIBDIR}/libldap_r-${LDAP_VER}.so.*.*.*) ${STAGING_LIBDIR}/libldap_r.so
-	oe_libinstall -so -C libraries/liblber/.libs liblber-${LDAP_VER} ${STAGING_LIBDIR}
-	test -e ${STAGING_LIBDIR}/liblber.so ||
-		ln -s $(basename ${STAGING_LIBDIR}/liblber-${LDAP_VER}.so.*.*.*) ${STAGING_LIBDIR}/liblber.so
-}
-
-LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
-
-# The executables go in a separate package.  This allows the
-# installation of the libraries with no daemon support.
-# Each module also has its own package - see above.
-PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
-
-# Package contents - shift most standard contents to -bin
-FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
-FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run \
-	${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
-	${sysconfdir}/openldap/DB_CONFIG.example"
-FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run"
-FILES_${PN}-bin = "${bindir}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d
-	cat ${WORKDIR}/initscript > ${D}${sysconfdir}/init.d/openldap
-	chmod 755 ${D}${sysconfdir}/init.d/openldap
-	# This is duplicated in /etc/openldap and is for slapd
-	rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
-}
-
-pkg_postinst_${PN}-slapd () {
-        if test -n "${D}"; then
-                D="-r $D"
-        fi
-        update-rc.d $D openldap defaults
-}
-
-pkg_prerm_${PN}-slapd () {
-        if test -n "${D}"; then
-                D="-r $D"
-        fi
-        update-rc.d $D openldap remove
-}
-
-SRC_URI[md5sum] = "fbde128a8421b8d2ea587a25057a281e"
-SRC_URI[sha256sum] = "63d1c60a49277a4e95dcfb7f45dbb66a902d9e9023f8aca3a01cda4ff221d6a9"
-- 
1.6.4.2



