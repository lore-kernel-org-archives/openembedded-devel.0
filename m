Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3938E6B7CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:22 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so181024eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=y0hd5Fplphhs2MBp6mi2bAjKoakoFq4W4EbpL2yn/ys=;
	b=hj2kgaC0QbrAw7Qk8GBgtlarRbTp0KS4AHV9IwZz7RLsjZO+zskRdDNRwfoleCQo0w
	1D5F8FYCh1BPgmT2UBTIL1AmkKuj0stH+7/UJTX3loR3cXPGsSN+3mpAgyW2wD0Oxh1j
	bopPZn7fDo+F5OmQ3nZrvsyP/yVqZU4En1AjrAoDJ7SGnD3ZfNeUioRRmrLYGF8s9yT/
	HEDUUoijMLyHcAwYtSiK9PMivD1PX9s1HzdgyCdB3B98hwCMzsn4gQcgiCLzflGVS2Cn
	0IntqSx9sJ3C26k1b/DjXMGbOIZgEVlNJWkX3LHlAzVfNe1zKZ/ATHZhJ9IRPiXYlJqk
	44bg==
X-Received: by 10.14.251.10 with SMTP id a10mr223869ees.76.1376551162633;
	Thu, 15 Aug 2013 00:19:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm76267104eec.7.2013.08.15.00.19.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:02 +0200
Message-Id: <f77f9e9092a7f59a976963c97eb67129421443a6.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 22/60] openldap: convert to PACKAGECONFIGs, explicitly disable openssl
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:22 -0000

* some options like ldbm weren't supported by current version
* when gnutls and openssl were both available it was picking openssl
  because default --with-tls is auto

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/openldap/openldap_2.4.23.bb    | 136 +++++++--------------
 1 file changed, 43 insertions(+), 93 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 9a7c118..55b0d06 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -28,16 +28,6 @@ SRC_URI += "file://install-strip.patch"
 
 inherit autotools
 
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
 # CV SETTINGS
 # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
 # when cross compiling (should be in site?)
@@ -50,33 +40,21 @@ EXTRA_OECONF += "ac_cv_func_memcmp_working=yes"
 EXTRA_OECONF += "--with-yielding-select=yes"
 # Shared libraries are nice...
 EXTRA_OECONF += "--enable-dynamic"
-#
-# Disable TLS to remove the need for openssl/libcrypto
-OPENLDAP_OPTION_tls  ?= "--with-tls"
-# set the following to "openssl" to build tls support
-OPENLDAP_DEPENDS_tls ?= "gnutls"
-EXTRA_OECONF += "${OPENLDAP_OPTION_tls}"
-DEPENDS += "${OPENLDAP_DEPENDS_tls}"
-#
-# Disable Cyrus SASL, which may or may not be working at present...
-OPENLDAP_OPTION_sasl  ?= "--without-cyrus-sasl"
-# set the following to "cyrus-sasl" to build SASL support
-OPENLDAP_DEPENDS_sasl ?= ""
-EXTRA_OECONF += "${OPENLDAP_OPTION_sasl}"
-DEPENDS += "${OPENLDAP_DEPENDS_sasl}"
+
+PACKAGECONFIG ??= "gnutls modules \
+                   ldap meta monitor null passwd shell proxycache dnssrv \
+"
+#--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
+PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls"
+PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
+
+PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
+PACKAGECONFIG[modules] = "lt_cv_dlopen_self=yes --enable-modules,--disable-modules,libtool"
 
 # SLAPD options
 #
 # UNIX crypt(3) passwd support:
 EXTRA_OECONF += "--enable-crypt"
-#
-# Enable dynamic module loading.  If this is *disabled* the
-# dependency on libtool is removed (to disable set the following
-# to variables to "" in a .conf file).
-OPENLDAP_OPTION_modules += "lt_cv_dlopen_self=yes --enable-modules"
-OPENLDAP_DEPENDS_modules += "libtool"
-EXTRA_OECONF += " ${OPENLDAP_OPTION_modules}"
-DEPENDS += "${OPENLDAP_DEPENDS_modules}"
 
 # SLAPD BACKEND
 #
@@ -99,92 +77,64 @@ md = "${libexecdir}/openldap"
 #--enable-bdb          enable Berkeley DB backend no|yes|mod yes
 # The Berkely DB is the standard choice.  This version of OpenLDAP requires
 # the version 4 implementation or better.
-# To disable this set all three of the following variables to <empty> in
-# a .conf file (this will allow ldbm to be build with gdbm).
-#OPENLDAP_OPTION_bdb   ?= "--enable-bdb=mod"
-OPENLDAP_DEPENDS_bdb  ?= "db"
-EXTRA_OECONF += "${OPENLDAP_OPTION_bdb}"
-DEPENDS += "${OPENLDAP_DEPENDS_bdb}"
-#
+PACKAGECONFIG[bdb] = "--enable-bdb=mod,--enable-bdb=no,db"
+
 #--enable-dnssrv       enable dnssrv backend no|yes|mod no
-# This has no dependencies.
-EXTRA_OECONF += "--enable-dnssrv=mod"
-#
+PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
+
 #--enable-hdb          enable Hierarchical DB backend no|yes|mod no
 # This forces ldbm to use Berkeley too, remove to use gdbm
-#OPENLDAP_OPTION_hdb   ?= "--enable-hdb=mod"
-OPENLDAP_DEPENDS_hdb  ?= "db"
-OPENLDAP_PACKAGE_hdb  ?= "${PN}-backend-hdb"
-EXTRA_OECONF += "${OPENLDAP_OPTION_hdb}"
-DEPENDS += "${OPENLDAP_DEPENDS_hdb}"
-#
+PACKAGECONFIG[hdb] = "--enable-hdb=mod,--enable-hdb=no,db"
+
 #--enable-ldap         enable ldap backend no|yes|mod no
-# This has no dependencies
-EXTRA_OECONF += "--enable-ldap=mod"
-#
+PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
+
 #--enable-ldbm         enable ldbm backend no|yes|mod no
 # ldbm requires further specification of the underlying database API, because
 # bdb is enabled above this must be set to berkeley, however the config
 # defaults this correctly so --with-ldbm-api is *not* set.  The build will
-# fail if bdb is removed (above) but not database is built to provide the
-# support for ldbm (because the 'DEPENDS_ldbm' is empty below.)
-#
-# So to use gdbm set:
-OPENLDAP_OPTION_ldbm = "--enable-ldbm=mod --with-ldbm-api=gdbm"
-OPENLDAP_DEPENDS_ldbm = "gdbm"
-# And clear the bdb and hdb settings.
-OPENLDAP_OPTION_ldbm ?= "--enable-ldbm=mod"
-OPENLDAP_DEPENDS_ldbm ?= ""
-EXTRA_OECONF += "${OPENLDAP_OPTION_ldbm}"
-DEPENDS += "${OPENLDAP_DEPENDS_ldbm}"
-#
+# fail if bdb is removed, but no database is built to provide the
+# support for ldbm
+# guide.html:<P>back-ldbm was both slow and unreliable. Its byzantine indexing code was prone to spontaneous corruption, as were the underlying database libraries that were commonly used (e.g. GDBM or NDBM). back-bdb and back-hdb are superior in every aspect, with simplified indexing to avoid index corruption, fine-grained locking for greater concurrency, hierarchical caching for greater performance, streamlined on-disk format for greater efficiency and portability, and full transaction support for greater reliability.</P>
+# configure: WARNING: unrecognized options: --disable-silent-rules, --enable-ldbm, --with-ldbm-api
+#PACKAGECONFIG[ldbm] = "--enable-ldbm=mod --with-ldbm-api=gdbm,--enable-ldbm-no,gdbm"
+
 #--enable-meta         enable metadirectory backend no|yes|mod no
-# No dependencies
-EXTRA_OECONF += "--enable-meta=mod"
-#
+PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
+
 #--enable-monitor      enable monitor backend no|yes|mod yes
-EXTRA_OECONF += "--enable-monitor=mod"
-#
+PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
+
 #--enable-null         enable null backend no|yes|mod no
-EXTRA_OECONF += "--enable-null=mod"
-#
+PACKAGECONFIG[null] = "--enable-null=mod,--enable-null=no,"
+
 #--enable-passwd       enable passwd backend no|yes|mod no
-EXTRA_OECONF += " --enable-passwd=mod"
-#
+PACKAGECONFIG[passwd] = "--enable-passwd=mod,--enable-passwd=no,"
+
 #--enable-perl         enable perl backend no|yes|mod no
 #  This requires a loadable perl dynamic library, if enabled without
 #  doing something appropriate (building perl?) the build will pick
-#  up the build machine perl - not good.
-OPENLDAP_OPTION_perl ?= "--enable-perl=mod"
-OPENLDAP_DEPENDS_perl ?= "perl"
-#EXTRA_OECONF += "${OPENLDAP_OPTION_perl}"
-#DEPENDS += "${OPENLDAP_DEPENDS_perl}"
-#
+#  up the build machine perl - not good (inherit perlnative?)
+PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
+
 #--enable-shell        enable shell backend no|yes|mod no
-EXTRA_OECONF += "--enable-shell=mod"
-#
+# configure: WARNING: Use of --without-threads is recommended with back-shell
+PACKAGECONFIG[shell] = "--enable-shell=mod --without-threads,--enable-shell=no,"
+
 #--enable-sql          enable sql backend no|yes|mod no
 # sql requires some sql backend which provides sql.h, sqlite* provides
 # sqlite.h (which may be compatible but hasn't been tried.)
-OPENLDAP_OPTION_sql ?= "--enable-sql=mod"
-OPENLDAP_DEPENDS_sql ?= "sql"
-#EXTRA_OECONF += "${OPENLDAP_OPTION_sql}"
-#DEPENDS += "${OPENLDAP_DEPENDS_sql}"
-#
+PACKAGECONFIG[sql] = "--enable-sql=mod,--enable-sql=no,sqlite3"
+
 #--enable-dyngroup     Dynamic Group overlay no|yes|mod no
 #  This is a demo, Proxy Cache defines init_module which conflicts with the
 #  same symbol in dyngroup
-#EXTRA_OECONF += "--enable-dyngroup=mod"
-#
+PACKAGECONFIG[dyngroup] = "--enable-dyngroup=mod,--enable-dyngroup=no,"
+
 #--enable-proxycache   Proxy Cache overlay no|yes|mod no
-EXTRA_OECONF += "--enable-proxycache=mod"
+PACKAGECONFIG[proxycache] = "--enable-proxycache=mod,--enable-proxycache=no,"
 FILES_${PN}-overlay-proxycache = "${md}/pcache-*.so.*"
 PACKAGES += "${PN}-overlay-proxycache"
-#
-# LOCAL OPTION OVERRIDES
-# The distro/lcoal options must be added in *last*
-EXTRA_OECONF += "${OPENLDAP_OPTIONS}"
-DEPENDS      += "${OPENLDAP_DEPENDS}"
 
 CPPFLAGS_append = " -D_GNU_SOURCE"
 
-- 
1.8.3.2


