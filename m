Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C144FC4332F
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:47:40 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.44.1635176859861750034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R7ETrQp2;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so327187pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e7NVAqjVRuvy0+9qxSpbHXRUQzjN5/5sKGkIcC0G2+c=;
        b=R7ETrQp2BoG5YA1Z3sKrPpE1NXkjug9RDy4ekwB7wxDzB9mhwd4BdkvaleRahJQEWf
         kZ4/OnZEfAJ5AuOIef1v7Lhpb/h4nwRzQIBFquetVg6AIpdkjqm6+PnMqYtx5N4DkuTp
         T6BfvQeXLYrNabJM0JSJHLZAmOGLW1t5g5iwBUd1t5TI0nrgPT1MoUrQFtlM4MqKPnw2
         No9HqTxawxtwbS2pnBCTS6ruVxNnH+GzNWqMrMyaXfok5xlGfBl9HPla9QtJOcEd9rIT
         HfQ+KcI9ZSBXPSdi67dCVvhuqshTrsDp1r8w7za0BhRRhCUxKlah3GwvOxgeE3FXqyFB
         a3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e7NVAqjVRuvy0+9qxSpbHXRUQzjN5/5sKGkIcC0G2+c=;
        b=onw0P2D/FXql3rRSqhW1Y2Auo+5tXrlI44pVeE9fFa1ZQmEDkkcwtInOpfDDu/XgB+
         W/bDHg40Mp5xp7aEAAGplUNjJnIxKe4lObyRmd1AmeTyJykc9etGc1rANWyLnGvEEhRC
         balAipcKIYLMIGn/qExh1dRiwXPutWV6/KnFzKz2YhE6CKEZNuuFRxluGPkBe7Ft29Vv
         meTqW5WTq8SOW9TntXSposJKYfZ1yWhirUSb5XqwrhH9av3TMJr/C4HsDlnzW3/lATLL
         gkjYcCGmffPwnFEwJIkoMPCGfDTSrMvhhU63hqyjT6Z1z9ZYP63o69elmfFdu8Ds6cg5
         49QA==
X-Gm-Message-State: AOAM531uaSrfWEq9yWVIZ6V8+dnQmolNoh7cbHPV1gnEeu6ClIwhpLBF
	+QqR1Web0c00jDXrGAi1M16s6uBdpq8=
X-Google-Smtp-Source: 
 ABdhPJzD4K0/jTG3R3QB3vYGly09vddktZ7mvuwWNdrCohbk0xS6cctK9q42HwEiHRfhnmJHffhhdQ==
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id
 w4-20020a1709027b8400b0013b90a7e270mr16930271pll.21.1635176858887;
        Mon, 25 Oct 2021 08:47:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 lp9sm20870874pjb.35.2021.10.25.08.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:47:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Salman Ahmed <salman.ahmed@weidmueller.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] openldap: upgrade 2.4.58 -> 2.5.8
Date: Mon, 25 Oct 2021 08:47:35 -0700
Message-Id: <20211025154736.858903-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 15:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93568

From: Salman Ahmed <salman.ahmed@weidmueller.com>

- dropped retired backends (bdb, hdb, shell)
- back-monitor is now built as part of slapd
- added asyncmeta and wt backends
- dropped patches for functionalities which don't
  exist anymore

Signed-off-by: Salman Ahmed <salman.ahmed@weidmueller.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openldap/openldap/install-strip.patch     |  2 +-
 .../openldap-2.4.28-gnutls-gcrypt.patch       | 10 ++-
 .../openldap/openldap-CVE-2015-3276.patch     | 58 ----------------
 .../openldap/openldap-m4-pthread.patch        | 22 ------
 .../openldap/openldap/thread_stub.patch       | 20 ------
 .../openldap/openldap/use-urandom.patch       | 15 ++--
 .../{openldap_2.4.58.bb => openldap_2.5.8.bb} | 68 +++++++------------
 7 files changed, 37 insertions(+), 158 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/thread_stub.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.58.bb => openldap_2.5.8.bb} (82%)

diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
index b59db3939e..b757aabb00 100644
--- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
+++ b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
@@ -6,7 +6,7 @@ Upstream-Status: Pending
 
 --- a/build/top.mk
 +++ b/build/top.mk
-@@ -121,7 +121,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD)
+@@ -125,7 +125,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
  LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
  	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
  
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
index 91bcc0435e..f551861a3e 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
@@ -2,13 +2,11 @@ From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/fi
 
 Upstream-status: Pending
 
---
-
---- a/configure.in
-+++ b/configure.in
-@@ -1227,7 +1227,7 @@ if test $ol_link_tls = no ; then
- 				ol_with_tls=gnutls
+--- a/configure.ac
++++ b/configure.ac
+@@ -1263,7 +1263,7 @@ if test $ol_link_tls = no ; then
  				ol_link_tls=yes
+ 				WITH_TLS_TYPE=gnutls
  
 -				TLS_LIBS="-lgnutls"
 +				TLS_LIBS="-lgnutls -lgcrypt"
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
deleted file mode 100644
index ab5c4de66a..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
+++ /dev/null
@@ -1,58 +0,0 @@
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
---- a/libraries/libldap/tls_m.c
-+++ b/libraries/libldap/tls_m.c
-@@ -620,18 +620,23 @@ nss_parse_ciphers(const char *cipherstr,
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
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
deleted file mode 100644
index 4d1fda96e4..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
---- a/build/openldap.m4
-+++ b/build/openldap.m4
-@@ -651,7 +651,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
- ]])
- 
- AC_DEFUN([OL_PTHREAD_TEST_PROGRAM],
--AC_LANG_SOURCE([OL_PTHREAD_TEST_INCLUDES
-+[AC_LANG_SOURCE([[OL_PTHREAD_TEST_INCLUDES
- 
- int main(argc, argv)
- 	int argc;
-@@ -659,7 +659,7 @@ int main(argc, argv)
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
index 540ba4a635..0000000000
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
index 96a03369a7..6783b5175b 100644
--- a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
+++ b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
@@ -8,20 +8,17 @@ Upstream-Status: pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
-
---- a/configure.in
-+++ b/configure.in
-@@ -2153,8 +2153,8 @@ fi
+--- a/configure.ac
++++ b/configure.ac
+@@ -2117,6 +2117,7 @@ AC_SUBST(systemdsystemunitdir)
  
  dnl ----------------------------------------------------------------
  dnl Check for entropy sources
 +dev=no
  if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
--	dev=no
+ 	dev=no
  	if test -r /dev/urandom ; then
- 		dev="/dev/urandom";
- 	elif test -r /idev/urandom ; then
-@@ -2167,9 +2167,11 @@ if test $cross_compiling != yes && test
+@@ -2131,9 +2132,11 @@ if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
  		dev="/idev/random";
  	fi
  
@@ -29,7 +26,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
 -		AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
 -	fi
 +elif test $cross_compiling == yes ; then
-+	dev="/dev/urandom";
++       dev="/dev/urandom";
 +fi
 +if test $dev != no ; then
 +	AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.58.bb b/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
similarity index 82%
rename from meta-oe/recipes-support/openldap/openldap_2.4.58.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.8.bb
index f9dc58a4c0..ca005de703 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.58.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.8.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b6dea6c170362fc46381fe3690c722cb \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5cc6ef74da4ad25d707c4f5903d64975 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -15,18 +15,15 @@ SECTION = "libs"
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
-    file://openldap-m4-pthread.patch \
     file://openldap-2.4.28-gnutls-gcrypt.patch \
     file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
-    file://thread_stub.patch \
-    file://openldap-CVE-2015-3276.patch \
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "c203d735ba69976e5b28dc39006f29b5"
-SRC_URI[sha256sum] = "57b59254be15d0bf6a9ab3d514c1c05777b02123291533134a87c94468f8f47b"
+SRC_URI[md5sum] = "86e3ffce4adfc57cbb76ac0ff48b2614"
+SRC_URI[sha256sum] = "366ea1c3b24202de4481978b632128c0cfe4148d4ae13cabf93a1f38c56472dc"
 
 DEPENDS = "util-linux groff-native"
 
@@ -35,7 +32,7 @@ DEPENDS = "util-linux groff-native"
 # environments
 SRC_URI += "file://install-strip.patch"
 
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd pkgconfig
 
 # CV SETTINGS
 # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
@@ -50,8 +47,8 @@ EXTRA_OECONF += "--with-yielding-select=yes"
 # Shared libraries are nice...
 EXTRA_OECONF += "--enable-dynamic"
 
-PACKAGECONFIG ??= "gnutls modules \
-                   mdb ldap meta monitor null passwd shell proxycache dnssrv \
+PACKAGECONFIG ??= "asyncmeta gnutls modules \
+                   mdb ldap meta null passwd proxycache dnssrv \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
@@ -72,25 +69,20 @@ EXTRA_OECONF += "--enable-crypt"
 # The backend must be set by the configuration.  This controls the
 # required database.
 #
-# Backends="bdb dnssrv hdb ldap mdb meta monitor ndb null passwd perl relay shell sock sql"
+# Backends="asyncmeta dnssrv ldap mdb meta ndb null passwd perl relay sock sql wt"
 #
 # Note that multiple backends can be built.  The ldbm backend requires a
-# build-time choice of database API.  The bdb backend forces this to be
-# DB4.  To use the gdbm (or other) API the Berkely database module must
-# be removed from the build.
+# build-time choice of database API. To use the gdbm (or other) API the 
+# Berkely database module must be removed from the build.
 md = "${libexecdir}/openldap"
 #
-#--enable-bdb          enable Berkeley DB backend no|yes|mod yes
-# The Berkely DB is the standard choice.  This version of OpenLDAP requires
-# the version 4 implementation or better.
-PACKAGECONFIG[bdb] = "--enable-bdb=yes,--enable-bdb=no,db"
+
+#--enable-asyncmeta    enable asyncmeta backend no|yes|mod no
+PACKAGECONFIG[asyncmeta] = "--enable-asyncmeta=mod,--enable-asyncmeta=no"
 
 #--enable-dnssrv       enable dnssrv backend no|yes|mod no
 PACKAGECONFIG[dnssrv] = "--enable-dnssrv=mod,--enable-dnssrv=no"
 
-#--enable-hdb          enable Hierarchical DB backend no|yes|mod no
-PACKAGECONFIG[hdb] = "--enable-hdb=yes,--enable-hdb=no,db"
-
 #--enable-ldap         enable ldap backend no|yes|mod no
 PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
 
@@ -100,9 +92,6 @@ PACKAGECONFIG[mdb] = "--enable-mdb=yes,--enable-mdb=no,"
 #--enable-meta         enable metadirectory backend no|yes|mod no
 PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
 
-#--enable-monitor      enable monitor backend no|yes|mod yes
-PACKAGECONFIG[monitor] = "--enable-monitor=mod,--enable-monitor=no,"
-
 #--enable-ndb          enable MySQL NDB Cluster backend no|yes|mod [no]
 PACKAGECONFIG[ndb] = "--enable-ndb=mod,--enable-ndb=no,"
 
@@ -121,10 +110,6 @@ PACKAGECONFIG[perl] = "--enable-perl=mod,--enable-perl=no,perl"
 #--enable-relay        enable relay backend no|yes|mod [yes]
 PACKAGECONFIG[relay] = "--enable-relay=mod,--enable-relay=no,"
 
-#--enable-shell        enable shell backend no|yes|mod no
-# configure: WARNING: Use of --without-threads is recommended with back-shell
-PACKAGECONFIG[shell] = "--enable-shell=mod --without-threads,--enable-shell=no,"
-
 #--enable-sock         enable sock backend no|yes|mod [no]
 PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"
 
@@ -133,6 +118,10 @@ PACKAGECONFIG[sock] = "--enable-sock=mod,--enable-sock=no,"
 # sqlite.h (which may be compatible but hasn't been tried.)
 PACKAGECONFIG[sql] = "--enable-sql=mod,--enable-sql=no,sqlite3"
 
+#--enable-wt           enable wt backend no|yes|mod no
+# back-wt is marked currently as experimental
+PACKAGECONFIG[wt] = "--enable-wt=mod,--enable-wt=no"
+
 #--enable-dyngroup     Dynamic Group overlay no|yes|mod no
 #  This is a demo, Proxy Cache defines init_module which conflicts with the
 #  same symbol in dyngroup
@@ -176,7 +165,7 @@ FILES:${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${local
     ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
 FILES:${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp"
 FILES:${PN}-bin = "${bindir}"
-FILES:${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
+FILES:${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so ${libdir}/pkgconfig/*.pc"
 FILES:${PN}-dbg += "${libexecdir}/openldap/.debug"
 
 do_install:append() {
@@ -210,8 +199,6 @@ do_install:append() {
         -i ${D}${sysconfdir}/openldap/slapd.conf
 
     mkdir -p ${D}${localstatedir}/${BPN}/data
-
-
 }
 
 INITSCRIPT_PACKAGES = "${PN}-slapd"
@@ -220,21 +207,18 @@ INITSCRIPT_PARAMS:${PN}-slapd = "defaults"
 SYSTEMD_SERVICE:${PN}-slapd = "hostapd.service"
 SYSTEMD_AUTO_ENABLE:${PN}-slapd ?= "disable"
 
-
 PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
 
 # The modules require their .so to be dynamicaly loaded
-INSANE_SKIP:${PN}-backend-dnssrv  += "dev-so"
-INSANE_SKIP:${PN}-backend-ldap    += "dev-so"
-INSANE_SKIP:${PN}-backend-meta    += "dev-so"
-INSANE_SKIP:${PN}-backend-mdb     += "dev-so"
-INSANE_SKIP:${PN}-backend-monitor += "dev-so"
-INSANE_SKIP:${PN}-backend-null    += "dev-so"
-INSANE_SKIP:${PN}-backend-passwd  += "dev-so"
-INSANE_SKIP:${PN}-backend-shell   += "dev-so"
-
-
-python populate_packages:prepend () {
+INSANE_SKIP:${PN}-backend-asyncmeta  += "dev-so"
+INSANE_SKIP:${PN}-backend-dnssrv     += "dev-so"
+INSANE_SKIP:${PN}-backend-ldap       += "dev-so"
+INSANE_SKIP:${PN}-backend-meta       += "dev-so"
+INSANE_SKIP:${PN}-backend-mdb        += "dev-so"
+INSANE_SKIP:${PN}-backend-null       += "dev-so"
+INSANE_SKIP:${PN}-backend-passwd     += "dev-so"
+
+python populate_packages_prepend () {
     backend_dir    = d.expand('${libexecdir}/openldap')
     do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
     do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
-- 
2.33.1


