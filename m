Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7bWK-0008Hm-SV
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 00:16:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 38E8F3149E29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:15:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hJxEzi8h83N2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:15:17 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 9B7593149CF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:15:16 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 22:15:16 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 22:15:16 +0000
Message-Id: <1287353716-27717-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libfribidi-0.10.4: update recipe, fix packaging
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
X-List-Received-Date: Sun, 17 Oct 2010 22:16:02 -0000

* added LICENSE
* removed configure patch
* use lib_package and binconfig to package all installed files
* convert to new style staging
* oe-stylize

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libfribidi/files/libtool-update.patch |   11 --------
 recipes/libfribidi/libfribidi_0.10.4.bb       |   32 +++++++-----------------
 2 files changed, 10 insertions(+), 33 deletions(-)
 delete mode 100644 recipes/libfribidi/files/libtool-update.patch

diff --git a/recipes/libfribidi/files/libtool-update.patch b/recipes/libfribidi/files/libtool-update.patch
deleted file mode 100644
index c703100..0000000
--- a/recipes/libfribidi/files/libtool-update.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- fribidi-0.10.4/configure.in~	2002-05-19 11:06:48.000000000 +0100
-+++ fribidi-0.10.4/configure.in	2004-08-03 17:42:28.000000000 +0100
-@@ -50,7 +50,7 @@
- AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_MAKE_SET
--AC_PROG_RANLIB
-+#AC_PROG_RANLIB
- AC_PATH_PROG(SED, sed, $PATH)
- 
- 
diff --git a/recipes/libfribidi/libfribidi_0.10.4.bb b/recipes/libfribidi/libfribidi_0.10.4.bb
index c46909b..b83c484 100644
--- a/recipes/libfribidi/libfribidi_0.10.4.bb
+++ b/recipes/libfribidi/libfribidi_0.10.4.bb
@@ -1,32 +1,20 @@
 DESCRIPTION = "Fribidi library for bidirectional text"
 SECTION = "libs"
 PRIORITY = "optional"
+LICENSE = "LGPLv2.1"
+PR = "r1"
 
-inherit autotools pkgconfig
-
-PR = "r0"
+SRC_URI = "${SOURCEFORGE_MIRROR}/fribidi/fribidi-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0f6e7ecca08e6e108dc06337f5b5cabf"
+SRC_URI[sha256sum] = "f3ecdb9d108bd61ec9394df75f5fd68ba886a8da0863ba6258338893aec6c04f"
 
 S = "${WORKDIR}/fribidi-${PV}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/fribidi/fribidi-${PV}.tar.bz2 \
-           file://libtool-update.patch"
-
-#PACKAGES += " ${PN}-bin"
-FILES_${PN} = "${libdir}/lib*.so.*"
-#FILES_${PN}-bin = "${libdir}/uu*"
+inherit autotools lib_package binconfig pkgconfig
 
 do_configure_prepend () {
-# this version of libtool is old - we have to nobble this file to get it to litoolize
-	rm ltconfig
-	rm aclocal.m4
-	rm acinclude.m4
-}
-
-do_stage () {
-	oe_libinstall -a -so -C .libs libfribidi ${STAGING_LIBDIR}
-	autotools_stage_includes
+        # this version of libtool is old - we have to nobble this file to get it to litoolize
+        rm ltconfig
+        rm aclocal.m4
+        rm acinclude.m4
 }
-
-
-SRC_URI[md5sum] = "0f6e7ecca08e6e108dc06337f5b5cabf"
-SRC_URI[sha256sum] = "f3ecdb9d108bd61ec9394df75f5fd68ba886a8da0863ba6258338893aec6c04f"
-- 
1.7.1



