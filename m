Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4086661EB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 10:45:58 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bi5so7919343pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+A1aZemcr9ujoCyp6IfLEVcwUsHT3B0L7u4SJ5c+fI0=;
	b=be8bXicV612I5csxttQbTcZdZNOcW33JLEg8RIIBJCXf8Qt05dAUqd3UIVbV1+VTt1
	MLIQETXSPS6qMPk2E5nEvS500BhKB96moDKodTlG44WRuwkNGhZ+If01RxJsQMM014fy
	H9GLQDsCluX7hmdZ59bcnDGaWCdT8qAdpzbiGqxlfhd+3hY3aZYWqyshkWfPnVKx/4lT
	UspyjVk5vfSmKYP22t6Og4eQmd9Kw8zz5iZ5nwf7bPB//CYG4wY+Xs9g+nWWT9woiqjA
	Wp3a9OEwO4vzSmagIT/HBmVATbhjE1Xdadt+p4wZplmR8yOJmGlBeHYtPj4kFey6jZFD
	O5GA==
X-Received: by 10.68.20.193 with SMTP id p1mr148997pbe.218.1371120359341;
	Thu, 13 Jun 2013 03:45:59 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	vz8sm28818825pac.20.2013.06.13.03.45.57 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 03:45:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 03:43:43 -0700
Message-Id: <1371120223-25372-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] tk: Upgrade to 8.6.0
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
X-List-Received-Date: Thu, 13 Jun 2013 10:45:58 -0000

This also fixes the build since tcl is moved to 8.6.0 in OE-Core
The licence has been updated a little

--- ../../../8.5.8-r0/tk8.5.8/unix/license.terms        2009-11-13
10:38:48.000000000 -0800
+++ license.terms       2012-12-19 07:39:12.000000000 -0800
@@ -1,7 +1,8 @@
 This software is copyrighted by the Regents of the University of
-California, Sun Microsystems, Inc., and other parties.  The following
-terms apply to all files associated with the software unless explicitly
-disclaimed in individual files.
+California, Sun Microsystems, Inc., Scriptics Corporation, ActiveState
+Corporation, Apple Inc. and other parties.  The following terms apply
to
+all files associated with the software unless explicitly disclaimed in
+individual files.

 The authors hereby grant permission to use, copy, modify, distribute,
 and license this software and its documentation for any purpose,
provided
@@ -28,12 +29,12 @@

 GOVERNMENT USE: If you are acquiring this software on behalf of the
 U.S. government, the Government shall have only "Restricted Rights"
-in the software and related documentation as defined in the Federal
+in the software and related documentation as defined in the Federal
 Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
 are acquiring the software on behalf of the Department of Defense, the
 software shall be classified as "Commercial Computer Software" and the
 Government shall have only "Restricted Rights" as defined in Clause
-252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
+252.227-7013 (b) (3) of DFARs.  Notwithstanding the foregoing, the
 authors grant the U.S. Government and others acting in its behalf
 permission to use and distribute the software in accordance with the
 terms specified in this license.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/tcltk/tk-8.5.8/manpages.diff  |   23 -----------
 meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff |   40 --------------------
 .../tcltk/{tk-8.5.8 => tk-8.6.0}/confsearch.diff   |    0
 .../tcltk/{tk-8.5.8 => tk-8.6.0}/fix-xft.diff      |    0
 .../tcltk/{tk-8.5.8 => tk-8.6.0}/non-linux.diff    |    0
 .../tcltk/{tk-8.5.8 => tk-8.6.0}/tklibrary.diff    |    0
 .../tcltk/{tk-8.5.8 => tk-8.6.0}/tkprivate.diff    |    0
 .../tcltk/{tk_8.5.8.bb => tk_8.6.0.bb}             |   21 +++++-----
 8 files changed, 9 insertions(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/manpages.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff
 rename meta-oe/recipes-devtools/tcltk/{tk-8.5.8 => tk-8.6.0}/confsearch.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.5.8 => tk-8.6.0}/fix-xft.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.5.8 => tk-8.6.0}/non-linux.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.5.8 => tk-8.6.0}/tklibrary.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.5.8 => tk-8.6.0}/tkprivate.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.5.8.bb => tk_8.6.0.bb} (56%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/manpages.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/manpages.diff
deleted file mode 100644
index a0620bd..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/manpages.diff
+++ /dev/null
@@ -1,23 +0,0 @@
-Patch by Chris Waters fixes installing of several manual pages which
-aren't installed by upstream script but are referenced inside other
-manual pages.
-
---- tk8.5-8.5.8.orig/unix/installManPage
-+++ tk8.5-8.5.8/unix/installManPage
-@@ -51,7 +51,16 @@
-     }' $MANPAGE`
- 
- SECTION=`echo $MANPAGE | sed 's/.*\(.\)$/\1/'`
-+NAME=`basename $MANPAGE .$SECTION`
- SRCDIR=`dirname $MANPAGE`
-+
-+SPECIALS="FindPhoto"
-+for n in $SPECIALS; do
-+    if [ "$NAME" = "$n" ] ; then
-+	NAMES="$n $NAMES"
-+    fi
-+done
-+
- FIRST=""
- for f in $NAMES; do
-     f=$f.$SECTION$SUFFIX
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff
deleted file mode 100644
index 81169aa..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff
+++ /dev/null
@@ -1,40 +0,0 @@
-Patch by Chris Waters removes -rpath from search flags and adds -soname
-to library build options.
-
-Also, it fixes Makefile.in to put correct Tk library filename to pkgIndex.tcl
-
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -5557,6 +5557,9 @@
- 	    # get rid of the warnings.
- 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
- 
-+	    # following line added by CW for Debian GNU/Linux
-+	    TK_SHLIB_LD_EXTRAS="-Wl,-soname,\${TK_LIB_FILE}.0"
-+
- 	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
- 	    DL_OBJS="tclLoadDl.o"
- 	    DL_LIBS="-ldl"
---- tk8.5-8.5.8.orig/unix/Makefile.in
-+++ tk8.5-8.5.8/unix/Makefile.in
-@@ -713,7 +713,7 @@
- 	    echo "if {[catch {package present Tcl 8.5.0}]} { return }";\
- 	    relative=`echo | awk '{ORS=" "; split("$(TK_PKG_DIR)",a,"/"); for (f in a) {print ".."}}'`;\
- 	    echo "package ifneeded Tk $(MAJOR_VERSION).$(MINOR_VERSION)$(PATCH_LEVEL)\
--		[list load [file join \$$dir $${relative}$(TK_LIB_FILE)] Tk]";\
-+		[list load [file join $(LIB_RUNTIME_DIR) $(TK_LIB_FILE).0] Tk]";\
- 	    ) > "$(PKG_INDEX)"; \
- 	    fi
- 	@echo "Installing $(LIB_FILE) to $(LIB_INSTALL_DIR)/"
---- tk8.5-8.5.8.orig/unix/tcl.m4
-+++ tk8.5-8.5.8/unix/tcl.m4
-@@ -1433,6 +1433,9 @@
- 	    # get rid of the warnings.
- 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
- 
-+	    # following line added by CW for Debian GNU/Linux
-+	    TK_SHLIB_LD_EXTRAS="-Wl,-soname,\${TK_LIB_FILE}.0"
-+
- 	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
- 	    DL_OBJS="tclLoadDl.o"
- 	    DL_LIBS="-ldl"
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.5.8/confsearch.diff
rename to meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff
rename to meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/non-linux.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.5.8/non-linux.diff
rename to meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff
rename to meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff
rename to meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
similarity index 56%
rename from meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index d44b407..b76f58f 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -2,42 +2,39 @@ DESCRIPTION = "Tool Command Language ToolKit Extension"
 HOMEPAGE = "http://tcl.sourceforge.net"
 SECTION = "devel/tcltk"
 LICENSE = "tcl"
-LIC_FILES_CHKSUM = "file://license.terms;md5=24954e7e6b54c1b4e16de861b9d392fc"
+LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe"
 DEPENDS = "tcl virtual/libx11 libxt"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
     file://confsearch.diff;striplevel=2 \
-    file://manpages.diff;striplevel=2 \
     file://non-linux.diff;striplevel=2 \
-    file://rpath.diff;striplevel=2 \
     file://tklibrary.diff;striplevel=2 \
     file://tkprivate.diff;striplevel=2 \
     file://fix-xft.diff \
 "
-SRC_URI[md5sum] = "13bf90602e16fc530e05196431021dc6"
-SRC_URI[sha256sum] = "9737da5c30e631281062b6acbb4753840f9e95657c78e37657d9c520589ab2d4"
+SRC_URI[md5sum] = "b883a1a3c489c17413fb602a94bf54e8"
+SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f058de6"
 
 S = "${WORKDIR}/tk${PV}/unix"
-
+LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/8.6.0/lib"
 inherit autotools
 
 EXTRA_OECONF = "\
     --enable-threads \
+    --with-x \
     --with-tcl=${STAGING_BINDIR_CROSS} \
-    --x-includes=${STAGING_INCDIR} \
-    --x-libraries=${STAGING_LIBDIR} \
 "
 
 do_install_append() {
-    mv libtk8.5.so libtk8.5.so.0
-    oe_libinstall -so libtk8.5 ${D}${libdir}
-    ln -sf wish8.5 ${D}${bindir}/wish
+    mv libtk8.6.so libtk8.6.so.0
+    oe_libinstall -so libtk8.6 ${D}${libdir}
+    ln -sf wish8.6 ${D}${bindir}/wish
 }
 
 PACKAGES =+ "${PN}-lib"
 
-FILES_${PN}-lib = "${libdir}/libtk8.5.so.*"
+FILES_${PN}-lib = "${libdir}/libtk8.6.so.*"
 FILES_${PN} += "${libdir}/tk*"
 
 BINCONFIG_GLOB = "*Config.sh"
-- 
1.7.9.5


