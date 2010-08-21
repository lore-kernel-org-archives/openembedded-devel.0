Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1Ompur-0004kV-9F
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 17:23:33 +0200
Received: from frbg-5d84e0e7.pool.mediaways.net ([93.132.224.231])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1OmpuV-0005vl-LL
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 17:23:07 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 17:22:50 +0200
Message-Id: <1282404170-2501-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ode_0.9.bb: clean up the recipe and fix some issues.
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
X-List-Received-Date: Sat, 21 Aug 2010 15:23:33 -0000

* remove do_stage and do_install those do not needed.
' fix the missing headerfiles in the dev package.
* fix QA: non dev contains .so.
* install.patch: adjust the patch a bit so that DESTDIR is used.

Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/ode/files/install.patch |   23 ++++++++++++-----------
 recipes/ode/ode_0.9.bb          |   25 +++++--------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/recipes/ode/files/install.patch b/recipes/ode/files/install.patch
index d63229f..2f6cdb0 100644
--- a/recipes/ode/files/install.patch
+++ b/recipes/ode/files/install.patch
@@ -1,21 +1,22 @@
-Index: ode-0.9/Makefile.am
-===================================================================
---- ode-0.9.orig/Makefile.am
-+++ ode-0.9/Makefile.am
-@@ -25,13 +25,13 @@ dist-zip: ${PACKAGE}-${VERSION}.tar.gz
+--- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
++++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
+@@ -25,13 +25,13 @@
  
  if USE_SONAME
  install-exec-hook:
 -	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	ln -sf ./@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
- 	$(libdir)/libode.so
+-	$(libdir)/libode.so
 -	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	ln -sf ./@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
- 	$(libdir)/@ODE_SONAME@
+-	$(libdir)/@ODE_SONAME@
 -	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	ln -sf ./@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
- 	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
+-	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
 -	/sbin/ldconfig
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/libode.so
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/@ODE_SONAME@
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
 +	echo /sbin/ldconfig
  else
  install-exec-hook:
diff --git a/recipes/ode/ode_0.9.bb b/recipes/ode/ode_0.9.bb
index 1383329..a7a8257 100644
--- a/recipes/ode/ode_0.9.bb
+++ b/recipes/ode/ode_0.9.bb
@@ -2,11 +2,14 @@ DESCRIPTION = "ODE is an Open Source Physics Engine."
 SECTION = "libs"
 HOMEPAGE = "http://www.ode.org"
 LICENSE = "LGPL"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
            file://install.patch"
 
+SRC_URI[md5sum] = "4c03759b76a0649a6d5108c8e172e1e4"
+SRC_URI[sha256sum] = "460d0851b743b1f144ef2a8259004d6774504c95d08e9357a96a296111496feb"
+
 inherit autotools binconfig
 
 EXTRA_OECONF = "--disable-demos --enable-soname"
@@ -15,23 +18,5 @@ do_configure_append() {
 	echo "#define dInfinity DBL_MAX" >>include/ode/config.h
 }
 
-do_stage() {
-	oe_runmake install \
-		bindir=${STAGING_BINDIR_CROSS} \
-		libdir=${STAGING_LIBDIR} \
-		includedir=${STAGING_INCDIR} \
-		datadir=${STAGING_DATADIR}
-}
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 
-do_install() {
-	oe_runmake install \
-		bindir=${D}${bindir} \
-		libdir=${D}${libdir} \
-		includedir=${D}${incdir} \
-		datadir=${D}${datadir}
-}
-
-FILES_${PN} = "${libdir}/lib*.so*"
-
-SRC_URI[md5sum] = "4c03759b76a0649a6d5108c8e172e1e4"
-SRC_URI[sha256sum] = "460d0851b743b1f144ef2a8259004d6774504c95d08e9357a96a296111496feb"
-- 
1.7.1



