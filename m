Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLh-0007Oz-JG
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:25 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3F9724A027;
	Fri, 23 Nov 2012 16:25:22 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:40 +0100
Message-Id: <1353684287-19180-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 2/9] openmotif: remove due to lack of libxp in repository
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
X-List-Received-Date: Fri, 23 Nov 2012 15:39:25 -0000

ERROR: Nothing PROVIDES 'libxp' (but /home/hrw/HDD/devel/canonical/aarch64/meta-openembedded/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb DEPENDS on or otherwise requires it)
ERROR: Required build target 'openmotif' has no buildable providers.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../openmotif/openmotif/configure.patch            | 15 ---------
 .../recipes-support/openmotif/openmotif_2.3.3.bb   | 38 ----------------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openmotif/openmotif/configure.patch
 delete mode 100644 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb

diff --git a/meta-oe/recipes-support/openmotif/openmotif/configure.patch b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
deleted file mode 100644
index 8868e80..0000000
--- a/meta-oe/recipes-support/openmotif/openmotif/configure.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/configure.ac~	2009-10-27 14:10:23.000000000 -0200
-+++ b/configure.ac	2011-05-31 10:51:00.207232036 -0300
-@@ -3,12 +3,6 @@
- AC_CONFIG_SRCDIR([lib/Xm/Form.c])
- AC_PREREQ(2.52)
- AC_CONFIG_AUX_DIR(.)
--AC_CHECK_FILE(/usr/X/include/X11/X.h,
--  AC_PREFIX_DEFAULT(/usr/X),
--  AC_PREFIX_DEFAULT(/usr))
--AC_CHECK_FILE(/usr/X11R6/include/X11/X.h,
--  AC_PREFIX_DEFAULT(/usr/X11R6),
--  AC_PREFIX_DEFAULT(/usr))
- 
- dnl AM_MAINTAINER_MODE
- AC_CANONICAL_TARGET
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
deleted file mode 100644
index 2e9c2de..0000000
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SECTION = "libs"
-DESCRIPTION = "OSM/Motif implementation."
-LICENSE = "OGPL"
-DEPENDS = "xbitmaps virtual/libx11 libxt libxp"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
-
-SRC_URI = "http://openmotif.com/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz \
-           file://configure.patch;patch=1"
-
-SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
-SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc10cd103"
-
-inherit autotools
-
-PACKAGES += "${PN}-bin"
-
-FILES_${PN}-bin = "${bindir}"
-
-do_compile() {
-	(
-		# HACK: build a native binaries need during the build
-		unset CC LD CXX CCLD CFLAGS
-		oe_runmake -C config/util CC="${BUILD_CC}" LD="${BUILD_LD}" CXX="${BUILD_CXX}" LIBS="" makestrs
-    )
-    if [ "$?" != "0" ]; then
-        exit 1
-    fi
-    oe_runmake -C lib
-    oe_runmake -C include
-}
-
-do_install() {
-    oe_runmake DESTDIR=${D} -C lib install
-    oe_runmake DESTDIR=${D} -C include install
-}
-
-LEAD_SONAME = "libXm.so.4"
-- 
1.8.0



