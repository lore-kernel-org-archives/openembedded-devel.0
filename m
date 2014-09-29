Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86BDF65F77
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 10:09:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8TA9Bm2028058
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 03:09:12 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Sep 2014 03:09:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 06:09:10 -0400
Message-ID: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openldap: update version to 2.4.39
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Sep 2014 10:09:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changed:
 * Move slapd from ${libexecdir} to ${sbin}:
   Installing slapd under ${sbin} is more FHS and LSB compliance
 * Manage init script by inheriting update-rc.d, than postinst
 * Add status for initscript
 * Rename the patch named with commit id to
   gnutls-Avoid-use-of-deprecated-function.patch
 * Add a patch for CVE-2013-4449
 * Add a patch to use /dev/urandom for entropy
 * Allow tls obtains random bits from /dev/urandom:
   The URANDOM_DEVICE is undefined for cross-compiling, define it as
   /dev/urandom to allow tls obtains random bits from /dev/urandom.
 * Add PACKAGECONFIG for mdb, ndb, relay and sock
 * Remove unsupported config for ldbm
 * Add license file

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/licenses/OpenLDAP                          | 47 +++++++++++++
 .../ITS-7723-fix-reference-counting.patch          | 38 ++++++++++
 .../gnutls-Avoid-use-of-deprecated-function.patch} |  0
 .../initscript                                     | 10 ++-
 .../install-strip.patch                            |  0
 .../kill-icu.patch                                 |  0
 .../openldap-2.4.28-gnutls-gcrypt.patch            |  0
 .../openldap-m4-pthread.patch                      |  0
 .../openldap/openldap-2.4.39/use-urandom.patch     | 38 ++++++++++
 .../{openldap_2.4.23.bb => openldap_2.4.39.bb}     | 81 +++++++++++-----------
 10 files changed, 172 insertions(+), 42 deletions(-)
 create mode 100644 meta-oe/licenses/OpenLDAP
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch
 rename meta-oe/recipes-support/openldap/{openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch => openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch} (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.23 => openldap-2.4.39}/initscript (71%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.23 => openldap-2.4.39}/install-strip.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.23 => openldap-2.4.39}/kill-icu.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.23 => openldap-2.4.39}/openldap-2.4.28-gnutls-gcrypt.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.23 => openldap-2.4.39}/openldap-m4-pthread.patch (100%)
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/use-urandom.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.23.bb => openldap_2.4.39.bb} (75%)

diff --git a/meta-oe/licenses/OpenLDAP b/meta-oe/licenses/OpenLDAP
new file mode 100644
index 0000000..05ad757
--- /dev/null
+++ b/meta-oe/licenses/OpenLDAP
@@ -0,0 +1,47 @@
+The OpenLDAP Public License
+  Version 2.8, 17 August 2003
+
+Redistribution and use of this software and associated documentation
+("Software"), with or without modification, are permitted provided
+that the following conditions are met:
+
+1. Redistributions in source form must retain copyright statements
+   and notices,
+
+2. Redistributions in binary form must reproduce applicable copyright
+   statements and notices, this list of conditions, and the following
+   disclaimer in the documentation and/or other materials provided
+   with the distribution, and
+
+3. Redistributions must contain a verbatim copy of this document.
+
+The OpenLDAP Foundation may revise this license from time to time.
+Each revision is distinguished by a version number.  You may use
+this Software under terms of this license revision or under the
+terms of any subsequent revision of the license.
+
+THIS SOFTWARE IS PROVIDED BY THE OPENLDAP FOUNDATION AND ITS
+CONTRIBUTORS ``AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
+AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT
+SHALL THE OPENLDAP FOUNDATION, ITS CONTRIBUTORS, OR THE AUTHOR(S)
+OR OWNER(S) OF THE SOFTWARE BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
+ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
+
+The names of the authors and copyright holders must not be used in
+advertising or otherwise to promote the sale, use or other dealing
+in this Software without specific, written prior permission.  Title
+to copyright in this Software shall at all times remain with copyright
+holders.
+
+OpenLDAP is a registered trademark of the OpenLDAP Foundation.
+
+Copyright 1999-2003 The OpenLDAP Foundation, Redwood City,
+California, USA.  All Rights Reserved.  Permission to copy and
+distribute verbatim copies of this document is granted.
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch
new file mode 100644
index 0000000..9a0f4cb
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch
@@ -0,0 +1,38 @@
+From 59688044386dfeee0c837a15133f4e878f1bb661 Mon Sep 17 00:00:00 2001
+From: Jan Synacek <jsynacek@redhat.com>
+Date: Wed, 13 Nov 2013 09:06:54 +0100
+Subject: [PATCH] ITS#7723 fix reference counting
+
+Upstream-Status: Backport
+
+Commit 59688044386dfeee0c837a15133f4e878f1bb661 upstream
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ libraries/librewrite/session.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/libraries/librewrite/session.c b/libraries/librewrite/session.c
+index fcc7698..02fc054 100644
+--- a/libraries/librewrite/session.c
++++ b/libraries/librewrite/session.c
+@@ -161,6 +161,7 @@ rewrite_session_find(
+ #ifdef USE_REWRITE_LDAP_PVT_THREADS
+ 	if ( session ) {
+ 		ldap_pvt_thread_mutex_lock( &session->ls_mutex );
++		session->ls_count++;
+ 	}
+ 	ldap_pvt_thread_rdwr_runlock( &info->li_cookies_mutex );
+ #endif /* USE_REWRITE_LDAP_PVT_THREADS */
+@@ -178,6 +179,7 @@ rewrite_session_return(
+ )
+ {
+ 	assert( session != NULL );
++	session->ls_count--;
+ 	ldap_pvt_thread_mutex_unlock( &session->ls_mutex );
+ }
+ 
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript b/meta-oe/recipes-support/openldap/openldap-2.4.39/initscript
similarity index 71%
rename from meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
rename to meta-oe/recipes-support/openldap/openldap-2.4.39/initscript
index 1395f72..08d1067 100644
--- a/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/initscript
@@ -5,8 +5,10 @@
 # > update-rc.d openldap defaults 60
 #
 
+# Source function library.
+. /etc/init.d/functions
 
-slapd=/usr/libexec/slapd
+slapd=/usr/sbin/slapd
 test -x "$slapd" || exit 0
 
 
@@ -21,8 +23,12 @@ case "$1" in
     start-stop-daemon --stop --quiet --pidfile /var/run/slapd.pid
     echo "."
     ;;
+  status)
+    status $slapd;
+    exit $?
+    ;;
   *)
-    echo "Usage: /etc/init.d/openldap {start|stop}"
+    echo "Usage: /etc/init.d/openldap {start|stop|status}"
     exit 1
 esac
 
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/install-strip.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.39/install-strip.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/kill-icu.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/kill-icu.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.23/kill-icu.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.39/kill-icu.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-2.4.28-gnutls-gcrypt.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-2.4.28-gnutls-gcrypt.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-2.4.28-gnutls-gcrypt.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-m4-pthread.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-m4-pthread.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-m4-pthread.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/use-urandom.patch
new file mode 100644
index 0000000..e7b988f
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/use-urandom.patch
@@ -0,0 +1,38 @@
+openldap: assume /dev/urandom exists
+
+When we are cross-compiling, we want to assume
+that /dev/urandom exists.  We could change the source
+code to look for it, but this is the easy way out.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+
+--- a/configure.in
++++ b/configure.in
+@@ -2142,8 +2142,8 @@ fi
+ 
+ dnl ----------------------------------------------------------------
+ dnl Check for entropy sources
++dev=no
+ if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
+-	dev=no
+ 	if test -r /dev/urandom ; then
+ 		dev="/dev/urandom";
+ 	elif test -r /idev/urandom ; then
+@@ -2156,9 +2156,11 @@ if test $cross_compiling != yes && test 
+ 		dev="/idev/random";
+ 	fi
+ 
+-	if test $dev != no ; then
+-		AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
+-	fi
++elif test $cross_compiling == yes ; then
++	dev="/dev/urandom";
++fi
++if test $dev != no ; then
++	AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
+ fi
+ 
+ dnl ----------------------------------------------------------------
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
similarity index 75%
rename from meta-oe/recipes-support/openldap/openldap_2.4.23.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.39.bb
index b2693b5..243e38f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
@@ -1,5 +1,6 @@
 # OpenLDAP, a license free (see http://www.OpenLDAP.org/license.html)
 #
+SUMMARY = "OpenLDAP Directory Service"
 DESCRIPTION = "OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol."
 HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # The OpenLDAP Public License - see the HOMEPAGE - defines
@@ -8,7 +9,9 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3d82d3085f228af211a6502c7ea7c3c7"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f2bdbaa4f50199a00b6de2ca7ec1db05 \
+                    file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
+"
 SECTION = "libs"
 
 LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
@@ -16,22 +19,23 @@ LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-m4-pthread.patch \
     file://kill-icu.patch \
-    file://0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch \
+    file://gnutls-Avoid-use-of-deprecated-function.patch \
     file://openldap-2.4.28-gnutls-gcrypt.patch \
+    file://ITS-7723-fix-reference-counting.patch \
+    file://use-urandom.patch \
     file://initscript \
 "
-SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
-SRC_URI[sha256sum] = "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8eef2d2c789fc055e3"
+SRC_URI[md5sum] = "b0d5ee4b252c841dec6b332d679cf943"
+SRC_URI[sha256sum] = "8267c87347103fef56b783b24877c0feda1063d3cb85d070e503d076584bf8a7"
 
 DEPENDS = "util-linux groff-native"
 
-PR = "r1"
 # The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
 # installing .so and executables, this fails in cross compilation
 # environments
 SRC_URI += "file://install-strip.patch"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-rc.d
 
 # CV SETTINGS
 # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
@@ -47,7 +51,7 @@ EXTRA_OECONF += "--with-yielding-select=yes"
 EXTRA_OECONF += "--enable-dynamic"
 
 PACKAGECONFIG ??= "gnutls modules \
-                   ldap meta monitor null passwd shell proxycache dnssrv \
+                   bdb hdb ldap meta monitor null passwd shell proxycache dnssrv \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
 PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
@@ -64,14 +68,9 @@ EXTRA_OECONF += "--enable-crypt"
 # SLAPD BACKEND
 #
 # The backend must be set by the configuration.  This controls the
-# required database, the default database, bdb, is turned off but
-# can be turned back on again and it *is* below!  The monitor backend
-# is also disabled.  If you try to change the backends but fail to
-# enable a single one the build will fail in an obvious way.
-#
-EXTRA_OECONF += "--disable-bdb --disable-hdb --disable-monitor"
+# required database. 
 #
-# Backends="bdb dnssrv hdb ldap ldbm meta monitor null passwd perl shell sql"
+# Backends="bdb dnssrv hdb ldap mdb meta monitor ndb null passwd perl relay shell sock sql"
 #
 # Note that multiple backends can be built.  The ldbm backend requires a
 # build-time choice of database API.  The bdb backend forces this to be
@@ -82,27 +81,19 @@ md = "${libexecdir}/openldap"
 #--enable-bdb          enable Berkeley DB backend no|yes|mod yes
 # The Berkely DB is the standard choice.  This version of OpenLDAP requires
 # the version 4 implementation or better.
-PACKAGECONFIG[bdb] = "--enable-bdb=mod,--enable-bdb=no,db"
+PACKAGECONFIG[bdb] = "--enable-bdb=yes,--enable-bdb=no,db"
 
 #--enable-dnssrv       enable dnssrv backend no|yes|mod no
 PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
 
 #--enable-hdb          enable Hierarchical DB backend no|yes|mod no
-# This forces ldbm to use Berkeley too, remove to use gdbm
-PACKAGECONFIG[hdb] = "--enable-hdb=mod,--enable-hdb=no,db"
+PACKAGECONFIG[hdb] = "--enable-hdb=yes,--enable-hdb=no,db"
 
 #--enable-ldap         enable ldap backend no|yes|mod no
 PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
 
-#--enable-ldbm         enable ldbm backend no|yes|mod no
-# ldbm requires further specification of the underlying database API, because
-# bdb is enabled above this must be set to berkeley, however the config
-# defaults this correctly so --with-ldbm-api is *not* set.  The build will
-# fail if bdb is removed, but no database is built to provide the
-# support for ldbm
-# guide.html:<P>back-ldbm was both slow and unreliable. Its byzantine indexing code was prone to spontaneous corruption, as were the underlying database libraries that were commonly used (e.g. GDBM or NDBM). back-bdb and back-hdb are superior in every aspect, with simplified indexing to avoid index corruption, fine-grained locking for greater concurrency, hierarchical caching for greater performance, streamlined on-disk format for greater efficiency and portability, and full transaction support for greater reliability.</P>
-# configure: WARNING: unrecognized options: --disable-silent-rules, --enable-ldbm, --with-ldbm-api
-#PACKAGECONFIG[ldbm] = "--enable-ldbm=mod --with-ldbm-api=gdbm,--enable-ldbm-no,gdbm"
+#--enable-mdb          enable mdb database backend no|yes|mod [yes]
+PACKAGECONFIG[mdb] = "--enable-mdb=mod,--enable-mdb=no,"
 
 #--enable-meta         enable metadirectory backend no|yes|mod no
 PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
@@ -110,6 +101,9 @@ PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
 #--enable-monitor      enable monitor backend no|yes|mod yes
 PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
 
+#--enable-ndb          enable MySQL NDB Cluster backend no|yes|mod [no]
+PACKAGECONFIG[ndb] = "--enable-ndb=mod,--enable-ndb=no,"
+
 #--enable-null         enable null backend no|yes|mod no
 PACKAGECONFIG[null] = "--enable-null=mod,--enable-null=no,"
 
@@ -122,10 +116,16 @@ PACKAGECONFIG[passwd] = "--enable-passwd=mod,--enable-passwd=no,"
 #  up the build machine perl - not good (inherit perlnative?)
 PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
 
+#--enable-relay        enable relay backend no|yes|mod [yes]
+PACKAGECONFIG[relay] = "--enable-relay=mod,--enable-relay=no,"
+
 #--enable-shell        enable shell backend no|yes|mod no
 # configure: WARNING: Use of --without-threads is recommended with back-shell
 PACKAGECONFIG[shell] = "--enable-shell=mod --without-threads,--enable-shell=no,"
 
+#--enable-sock         enable sock backend no|yes|mod [no]
+PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"
+
 #--enable-sql          enable sql backend no|yes|mod no
 # sql requires some sql backend which provides sql.h, sqlite* provides
 # sqlite.h (which may be compatible but hasn't been tried.)
@@ -141,7 +141,10 @@ PACKAGECONFIG[proxycache] = "--enable-proxycache=mod,--enable-proxycache=no,"
 FILES_${PN}-overlay-proxycache = "${md}/pcache-*.so.*"
 PACKAGES += "${PN}-overlay-proxycache"
 
-CPPFLAGS_append = " -D_GNU_SOURCE"
+# Append URANDOM_DEVICE='/dev/urandom' to CPPFLAGS:
+# This allows tls to obtain random bits from /dev/urandom, by default
+# it was disabled for cross-compiling.
+CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
 
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
@@ -176,23 +179,21 @@ do_install_append() {
     chmod 755 ${D}${sysconfdir}/init.d/openldap
     # This is duplicated in /etc/openldap and is for slapd
     rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
+
+    # Installing slapd under ${sbin} is more FHS and LSB compliance
+    mv ${D}${libexecdir}/slapd ${D}/${sbindir}/slapd
+    SLAPTOOLS="slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema"
+    cd ${D}/${sbindir}/
+    rm -f ${SLAPTOOLS}
+    for i in ${SLAPTOOLS}; do ln -sf slapd $i; done
+
     rmdir "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
-pkg_postinst_${PN}-slapd () {
-    if test -n "${D}"; then
-        D="-r $D"
-    fi
-    update-rc.d $D openldap defaults
-}
-
-pkg_prerm_${PN}-slapd () {
-    if test -n "${D}"; then
-        D="-r $D"
-    fi
-    update-rc.d $D openldap remove
-}
+INITSCRIPT_PACKAGES = "${PN}-slapd"
+INITSCRIPT_NAME_${PN}-slapd = "openldap"
+INITSCRIPT_PARAMS_${PN}-slapd = "defaults"
 
 PACKAGES_DYNAMIC += "^openldap-backends.* ^openldap-backend-.*"
 
-- 
2.0.0


