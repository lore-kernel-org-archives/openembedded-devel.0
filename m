Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.5816.1612516322186709659
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 01:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1159BP5t023390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Feb 2021 01:11:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 01:11:23 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 5 Feb 2021 01:11:23 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] openldap: 2.4.57 -> 2.5.0
Date: Fri, 5 Feb 2021 01:11:23 -0800
Message-ID: <20210205091123.86718-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In order to build with autoconf 2.7, update openldap to 2.5.0
there is no tarball available, so turn to git

Refresh patches:
- install-strip.patch
- openldap-2.4.28-gnutls-gcrypt.patch
- use-urandom.patch

Drop patches:
- openldap-CVE-2015-3276.patch
- openldap-m4-pthread.patch
- thread_stub.patch

Remove unrecognized options:
...
|configure: WARNING: unrecognized options: --enable-bdb, --enable-hdb, --enable-monitor, --enable-shell
...

Licence-Update: Minor changes
- Update year: 1998-2020
- Update license OpenLDAP ver 2.8

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openldap/openldap/install-strip.patch     | 10 ++-
 .../openldap-2.4.28-gnutls-gcrypt.patch       | 24 +++++--
 .../openldap/openldap-CVE-2015-3276.patch     | 63 -------------------
 .../openldap/openldap-m4-pthread.patch        | 22 -------
 .../openldap/openldap/thread_stub.patch       | 20 ------
 .../openldap/openldap/use-urandom.patch       | 25 ++++++--
 .../{openldap_2.4.57.bb => openldap_2.5.0.bb} | 29 ++-------
 7 files changed, 50 insertions(+), 143 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/thread_stub.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.57.bb => openldap_2.5.0.bb} (88%)

diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
index 7c675962b..19639c711 100644
--- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
+++ b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
@@ -4,9 +4,10 @@
 
 Upstream-Status: Pending
 
---- openldap-2.2.24/.pc/install-strip.patch/build/top.mk	2005-01-20 09:00:55.000000000 -0800
-+++ openldap-2.2.24/build/top.mk	2005-04-16 13:48:20.536710376 -0700
-@@ -116,7 +116,7 @@
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+--- a/build/top.mk
++++ b/build/top.mk
+@@ -121,7 +121,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
  LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
  	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
  
@@ -15,3 +16,6 @@ Upstream-Status: Pending
  LTFINISH = $(LIBTOOL) --mode=finish
  
  # Misc UNIX commands used in build environment
+-- 
+2.27.0
+
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
index 86d0767a4..131ce720a 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
@@ -1,17 +1,29 @@
-From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
+From 8d24bfcb9671a56aa0eed95387d30e78c26a6bca Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 4 Feb 2021 02:15:56 -0800
+Subject: [PATCH 1/3] From 
+ http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
 
 Upstream-status: Pending
 
---
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- openldap-2.4.28/configure.in.orig	2012-02-11 22:40:36.004360795 +0000
-+++ openldap-2.4.28/configure.in	2012-02-11 22:40:13.410986851 +0000
-@@ -1214,7 +1214,7 @@
- 				ol_with_tls=gnutls
+diff --git a/configure.ac b/configure.ac
+index 79d4ec161..da8eccc01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1215,7 +1215,7 @@ if test $ol_link_tls = no ; then
  				ol_link_tls=yes
+ 				WITH_TLS_TYPE=gnutls
  
 -				TLS_LIBS="-lgnutls"
 +				TLS_LIBS="-lgnutls -lgcrypt"
  
  				AC_DEFINE(HAVE_GNUTLS, 1, 
  					[define if you have GNUtls])
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
deleted file mode 100644
index ce8b47ae4..000000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-openldap CVE-2015-3276
-
-the patch comes from:
-https://bugzilla.redhat.com/show_bug.cgi?id=1238322
-https://bugzilla.redhat.com/attachment.cgi?id=1055640
-
-The nss_parse_ciphers function in libraries/libldap/tls_m.c in
-OpenLDAP does not properly parse OpenSSL-style multi-keyword mode
-cipher strings, which might cause a weaker than intended cipher to
-be used and allow remote attackers to have unspecified impact via
-unknown vectors.
-
-Upstream-Status: Pending
-
-CVE: CVE-2015-3276
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- libraries/libldap/tls_m.c |   27 ++++++++++++++++-----------
- 1 file changed, 16 insertions(+), 11 deletions(-)
-
-diff --git a/libraries/libldap/tls_m.c b/libraries/libldap/tls_m.c
-index 9b101f9..e6f3051 100644
---- a/libraries/libldap/tls_m.c
-+++ b/libraries/libldap/tls_m.c
-@@ -621,18 +621,23 @@ nss_parse_ciphers(const char *cipherstr, int cipher_list[ciphernum])
- 			 */
- 			if (mask || strength || protocol) {
- 				for (i=0; i<ciphernum; i++) {
--					if (((ciphers_def[i].attr & mask) ||
--						 (ciphers_def[i].strength & strength) ||
--						 (ciphers_def[i].version & protocol)) &&
--						(cipher_list[i] != -1)) {
--						/* Enable the NULL ciphers only if explicity
--						 * requested */
--						if (ciphers_def[i].attr & SSL_eNULL) {
--							if (mask & SSL_eNULL)
--								cipher_list[i] = action;
--						} else
-+					/* if more than one mask is provided
-+					 * then AND logic applies (to match openssl)
-+					 */
-+					if ( cipher_list[i] == -1) )
-+						continue;
-+					if ( mask && ! (ciphers_def[i].attr & mask) )
-+						continue;
-+					if ( strength && ! (ciphers_def[i].strength & strength) )
-+						continue;
-+					if ( protocol && ! (ciphers_def[i].version & protocol) )
-+						continue;
-+					/* Enable the NULL ciphers only if explicity requested */
-+					if (ciphers_def[i].attr & SSL_eNULL) {
-+						if (mask & SSL_eNULL)
- 							cipher_list[i] = action;
--					}
-+					} else
-+						cipher_list[i] = action;
- 				}
- 			} else {
- 				for (i=0; i<ciphernum; i++) {
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
deleted file mode 100644
index 38c0a5af2..000000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
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
diff --git a/meta-oe/recipes-support/openldap/openldap/thread_stub.patch b/meta-oe/recipes-support/openldap/openldap/thread_stub.patch
deleted file mode 100644
index 540ba4a63..000000000
--- a/meta-oe/recipes-support/openldap/openldap/thread_stub.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-openldap: set pointer
-
-When the function ldap_pvt_thread_pool_getkey() succeeds, it
-must set the value of *data since the caller may try to use it.
-
-Upstream-Status: pending
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
-
---- a/libraries/libldap_r/thr_stub.c
-+++ b/libraries/libldap_r/thr_stub.c
-@@ -217,6 +217,7 @@ ldap_pvt_thread_pool_unidle ( ldap_pvt_t
- int ldap_pvt_thread_pool_getkey (
- 	void *ctx, void *key, void **data, ldap_pvt_thread_pool_keyfree_t **kfree )
- {
-+	if (data) *data = NULL;  /* avoid problems with uninitialized *data */
- 	return(0);
- }
- 
diff --git a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
index e7b988faf..14d12e14e 100644
--- a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
+++ b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
@@ -1,4 +1,7 @@
-openldap: assume /dev/urandom exists
+From 94b5d225e01481410fb72710ea18c4a16e8491ca Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 4 Feb 2021 02:17:22 -0800
+Subject: [PATCH] openldap: assume /dev/urandom exists
 
 When we are cross-compiling, we want to assume
 that /dev/urandom exists.  We could change the source
@@ -8,10 +11,16 @@ Upstream-Status: pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
 
---- a/configure.in
-+++ b/configure.in
-@@ -2142,8 +2142,8 @@ fi
+diff --git a/configure.ac b/configure.ac
+index da8eccc01..c6951702c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2040,8 +2040,8 @@ fi
  
  dnl ----------------------------------------------------------------
  dnl Check for entropy sources
@@ -21,10 +30,11 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  	if test -r /dev/urandom ; then
  		dev="/dev/urandom";
  	elif test -r /idev/urandom ; then
-@@ -2156,9 +2156,11 @@ if test $cross_compiling != yes && test 
+@@ -2053,10 +2053,11 @@ if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
+ 	elif test -r /idev/random ; then
  		dev="/idev/random";
  	fi
- 
+-
 -	if test $dev != no ; then
 -		AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
 -	fi
@@ -36,3 +46,6 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  fi
  
  dnl ----------------------------------------------------------------
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-oe/recipes-support/openldap/openldap_2.5.0.bb
similarity index 88%
rename from meta-oe/recipes-support/openldap/openldap_2.4.57.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.0.bb
index a282523a3..7affa7ac3 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.0.bb
@@ -7,26 +7,24 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2de7a707a245fc949b49801cce6875f7 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
 
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
-SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
-    file://openldap-m4-pthread.patch \
+SRC_URI = "git://git.openldap.org/openldap/openldap.git;protocol=https;branch=OPENLDAP_REL_ENG_2_5 \
     file://openldap-2.4.28-gnutls-gcrypt.patch \
     file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
-    file://thread_stub.patch \
-    file://openldap-CVE-2015-3276.patch \
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
-SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
+SRCREV = "7e717b033a73e47e7fadeee378e6aae28884e050"
+
+S = "${WORKDIR}/git"
 
 DEPENDS = "util-linux groff-native"
 
@@ -51,7 +49,7 @@ EXTRA_OECONF += "--with-yielding-select=yes"
 EXTRA_OECONF += "--enable-dynamic"
 
 PACKAGECONFIG ??= "gnutls modules \
-                   mdb ldap meta monitor null passwd shell proxycache dnssrv \
+                   mdb ldap meta null passwd proxycache dnssrv \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
@@ -79,18 +77,10 @@ EXTRA_OECONF += "--enable-crypt"
 # DB4.  To use the gdbm (or other) API the Berkely database module must
 # be removed from the build.
 md = "${libexecdir}/openldap"
-#
-#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
-# The Berkely DB is the standard choice.  This version of OpenLDAP requires
-# the version 4 implementation or better.
-PACKAGECONFIG[bdb] = "--enable-bdb=yes,--enable-bdb=no,db"
 
 #--enable-dnssrv       enable dnssrv backend no|yes|mod no
 PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
 
-#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
-PACKAGECONFIG[hdb] = "--enable-hdb=yes,--enable-hdb=no,db"
-
 #--enable-ldap         enable ldap backend no|yes|mod no
 PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
 
@@ -100,9 +90,6 @@ PACKAGECONFIG[mdb] = "--enable-mdb=yes,--enable-mdb=no,"
 #--enable-meta         enable metadirectory backend no|yes|mod no
 PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
 
-#--enable-monitor      enable monitor backend no|yes|mod yes
-PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
-
 #--enable-ndb          enable MySQL NDB Cluster backend no|yes|mod [no]
 PACKAGECONFIG[ndb] = "--enable-ndb=mod,--enable-ndb=no,"
 
@@ -121,10 +108,6 @@ PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
 #--enable-relay        enable relay backend no|yes|mod [yes]
 PACKAGECONFIG[relay] = "--enable-relay=mod,--enable-relay=no,"
 
-#--enable-shell        enable shell backend no|yes|mod no
-# configure: WARNING: Use of --without-threads is recommended with back-shell
-PACKAGECONFIG[shell] = "--enable-shell=mod --without-threads,--enable-shell=no,"
-
 #--enable-sock         enable sock backend no|yes|mod [no]
 PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"
 
-- 
2.29.2

