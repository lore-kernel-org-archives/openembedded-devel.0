Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3A12661AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:50:26 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so873361pac.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vpAr71Db27C3NwdDcxp1mWq3eMjCD0mjBX0qpewX2is=;
	b=U66NSdVLaZtO4zOxGr3SY3fnu/oPpgI8PS2trFk/esBe/FsgE+vl5p7ozzZrj09JVi
	YJAYLQJZydeiganDTNymP72hP/GZa+PQQyV6zh0FOV0JoHFjwqr8UMkVy5KfnTV1XsR4
	3APPo8mETj7X7XWxfYM1U5sehYRdS9Fv791fqeHDkizFo1RTuEYirlwIUJ2ZGyRwK5eh
	jL4EMzGDHlNGwSxilfHy220vvb/tlmgFDgD5Zp4gFyqj+YncVRn6hHEMia4YTcLUKzPK
	5K1ChJba96B2bZYegXStrmaBA01Jy7IfjUxdx0a80h+Wo2QYYwrZoVhzjB9VNBYNsCg+
	P1DA==
X-Received: by 10.66.179.78 with SMTP id de14mr1832641pac.18.1371232227293;
	Fri, 14 Jun 2013 10:50:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm3242194pac.16.2013.06.14.10.50.26 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 10:50:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2013 10:48:08 -0700
Message-Id: <1371232088-31232-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH V2] tk: Upgrade to 8.6.0
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
X-List-Received-Date: Fri, 14 Jun 2013 17:50:26 -0000

This also fixes the build since tcl is moved to 8.6.0 in OE-Core
The licence has been updated a little

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
 .../tcltk/tk-8.5.8/confsearch.diff                 |   32 --------------
 .../recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff   |   16 -------
 .../recipes-devtools/tcltk/tk-8.5.8/manpages.diff  |   23 ----------
 .../recipes-devtools/tcltk/tk-8.5.8/non-linux.diff |   45 --------------------
 meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff |   40 -----------------
 .../recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff |   22 ----------
 .../recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff |   41 ------------------
 .../tcltk/tk-8.6.0/confsearch.diff                 |   32 ++++++++++++++
 .../recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff   |   16 +++++++
 .../recipes-devtools/tcltk/tk-8.6.0/non-linux.diff |   45 ++++++++++++++++++++
 .../recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff |   22 ++++++++++
 .../recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff |   41 ++++++++++++++++++
 meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb         |   44 -------------------
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb         |   41 ++++++++++++++++++
 14 files changed, 197 insertions(+), 263 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/confsearch.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/manpages.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/non-linux.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/rpath.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb
 create mode 100644 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb

diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/confsearch.diff
deleted file mode 100644
index c51e475..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/confsearch.diff
+++ /dev/null
@@ -1,32 +0,0 @@
-Patch by Sergei Golovan allows to find tclConfig.sh in /usr/share/tcltk/tcl8.5
-and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
-installation.
-
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -1431,6 +1431,7 @@
- 			`ls -d ${prefix}/lib 2>/dev/null` \
- 			`ls -d /usr/local/lib 2>/dev/null` \
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
- 			`ls -d /usr/lib 2>/dev/null` \
- 			; do
- 		    if test -f "$i/tclConfig.sh" ; then
---- tk8.5-8.5.8.orig/unix/tcl.m4
-+++ tk8.5-8.5.8/unix/tcl.m4
-@@ -93,6 +93,7 @@
- 			`ls -d ${prefix}/lib 2>/dev/null` \
- 			`ls -d /usr/local/lib 2>/dev/null` \
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
- 			`ls -d /usr/lib 2>/dev/null` \
- 			; do
- 		    if test -f "$i/tclConfig.sh" ; then
-@@ -223,6 +224,7 @@
- 			`ls -d ${prefix}/lib 2>/dev/null` \
- 			`ls -d /usr/local/lib 2>/dev/null` \
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tk8.5 2>/dev/null` \
- 			`ls -d /usr/lib 2>/dev/null` \
- 			; do
- 		    if test -f "$i/tkConfig.sh" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff
deleted file mode 100644
index d1bb710..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/fix-xft.diff
+++ /dev/null
@@ -1,16 +0,0 @@
---- /tmp/configure.in	2010-05-19 13:29:03.000000000 +0200
-+++ unix/configure.in	2010-05-19 13:42:05.000000000 +0200
-@@ -526,13 +526,9 @@
- 	found_xft="yes"
- 	dnl make sure package configurator (xft-config or pkg-config
- 	dnl says that xft is present.
--	XFT_CFLAGS=`xft-config --cflags 2>/dev/null` || found_xft="no"
--	XFT_LIBS=`xft-config --libs 2>/dev/null` || found_xft="no"
--	if test "$found_xft" = "no" ; then
- 	    found_xft=yes
- 	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
- 	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
--	fi
- 	AC_MSG_RESULT([$found_xft])
- 	dnl make sure that compiling against Xft header file doesn't bomb
- 	if test "$found_xft" = "yes" ; then
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
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/non-linux.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/non-linux.diff
deleted file mode 100644
index 9309fc4..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/non-linux.diff
+++ /dev/null
@@ -1,45 +0,0 @@
-Patch by Sergei Golovan (originally by Mike Markley and Chris Waters) fixes
-building on non-linux Debian architectures.
-
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -4742,6 +4742,9 @@
- 		if test "`uname -s`" = "AIX" ; then
- 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
- 		fi
-+		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
-+		    tcl_cv_sys_version=NetBSD-Debian
-+		fi
- 	    fi
- 	fi
- 
-@@ -5546,7 +5549,7 @@
- fi
- 
- 	    ;;
--	Linux*)
-+	Linux*|GNU*|NetBSD-Debian)
- 	    SHLIB_CFLAGS="-fPIC"
- 	    SHLIB_LD_LIBS='${LIBS}'
- 	    SHLIB_SUFFIX=".so"
---- tk8.5-8.5.8.orig/unix/tcl.m4
-+++ tk8.5-8.5.8/unix/tcl.m4
-@@ -962,6 +962,9 @@
- 		if test "`uname -s`" = "AIX" ; then
- 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
- 		fi
-+		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
-+		    tcl_cv_sys_version=NetBSD-Debian
-+		fi
- 	    fi
- 	fi
-     ])
-@@ -1422,7 +1425,7 @@
- 	        ])
- 	    ])
- 	    ;;
--	Linux*)
-+	Linux*|GNU*|NetBSD-Debian)
- 	    SHLIB_CFLAGS="-fPIC"
- 	    SHLIB_LD_LIBS='${LIBS}'
- 	    SHLIB_SUFFIX=".so"
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
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff
deleted file mode 100644
index ee38c2a..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tklibrary.diff
+++ /dev/null
@@ -1,22 +0,0 @@
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -11070,7 +11070,7 @@
-     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
- fi
- 
--TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
-+test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
- PRIVATE_INCLUDE_DIR='$(includedir)'
- HTML_DIR='$(DISTDIR)/html'
- TK_PKG_DIR='tk$(VERSION)'
---- tk8.5-8.5.8.orig/unix/configure.in
-+++ tk8.5-8.5.8/unix/configure.in
-@@ -607,7 +607,7 @@
-     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
- fi
- 
--TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
-+test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
- PRIVATE_INCLUDE_DIR='$(includedir)'
- HTML_DIR='$(DISTDIR)/html'
- TK_PKG_DIR='tk$(VERSION)'
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff
deleted file mode 100644
index 4e15469..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk-8.5.8/tkprivate.diff
+++ /dev/null
@@ -1,41 +0,0 @@
-Patch by Chris Waters sets path which are normally point to a directory
-with Tk sources to a subdirectory of /usr/include/tcl8.4 (debian/rules
-puts private Tk headers there).
-
---- tk8.5-8.5.8.orig/unix/tkConfig.sh.in
-+++ tk8.5-8.5.8/unix/tkConfig.sh.in
-@@ -55,7 +55,7 @@
- 
- # String to pass to linker to pick up the Tk library from its
- # build directory.
--TK_BUILD_LIB_SPEC='@TK_BUILD_LIB_SPEC@'
-+TK_BUILD_LIB_SPEC='@TK_LIB_SPEC@'
- 
- # String to pass to linker to pick up the Tk library from its
- # installed directory.
-@@ -71,7 +71,7 @@
- # different place than the directory containing the source files, this
- # points to the location of the sources, not the location where Tk was
- # compiled.
--TK_SRC_DIR='@TK_SRC_DIR@'
-+TK_SRC_DIR='@includedir@/tk-private'
- 
- # Needed if you want to make a 'fat' shared library library
- # containing tk objects or link a different wish.
-@@ -86,14 +86,14 @@
- 
- # String to pass to linker to pick up the Tk stub library from its
- # build directory.
--TK_BUILD_STUB_LIB_SPEC='@TK_BUILD_STUB_LIB_SPEC@'
-+TK_BUILD_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
- 
- # String to pass to linker to pick up the Tk stub library from its
- # installed directory.
- TK_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
- 
- # Path to the Tk stub library in the build directory.
--TK_BUILD_STUB_LIB_PATH='@TK_BUILD_STUB_LIB_PATH@'
-+TK_BUILD_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
- 
- # Path to the Tk stub library in the install directory.
- TK_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff
new file mode 100644
index 0000000..c51e475
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff
@@ -0,0 +1,32 @@
+Patch by Sergei Golovan allows to find tclConfig.sh in /usr/share/tcltk/tcl8.5
+and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
+installation.
+
+--- tk8.5-8.5.8.orig/unix/configure
++++ tk8.5-8.5.8/unix/configure
+@@ -1431,6 +1431,7 @@
+ 			`ls -d ${prefix}/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
+ 			`ls -d /usr/lib 2>/dev/null` \
+ 			; do
+ 		    if test -f "$i/tclConfig.sh" ; then
+--- tk8.5-8.5.8.orig/unix/tcl.m4
++++ tk8.5-8.5.8/unix/tcl.m4
+@@ -93,6 +93,7 @@
+ 			`ls -d ${prefix}/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
+ 			`ls -d /usr/lib 2>/dev/null` \
+ 			; do
+ 		    if test -f "$i/tclConfig.sh" ; then
+@@ -223,6 +224,7 @@
+ 			`ls -d ${prefix}/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tk8.5 2>/dev/null` \
+ 			`ls -d /usr/lib 2>/dev/null` \
+ 			; do
+ 		    if test -f "$i/tkConfig.sh" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff
new file mode 100644
index 0000000..d1bb710
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff
@@ -0,0 +1,16 @@
+--- /tmp/configure.in	2010-05-19 13:29:03.000000000 +0200
++++ unix/configure.in	2010-05-19 13:42:05.000000000 +0200
+@@ -526,13 +526,9 @@
+ 	found_xft="yes"
+ 	dnl make sure package configurator (xft-config or pkg-config
+ 	dnl says that xft is present.
+-	XFT_CFLAGS=`xft-config --cflags 2>/dev/null` || found_xft="no"
+-	XFT_LIBS=`xft-config --libs 2>/dev/null` || found_xft="no"
+-	if test "$found_xft" = "no" ; then
+ 	    found_xft=yes
+ 	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
+ 	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
+-	fi
+ 	AC_MSG_RESULT([$found_xft])
+ 	dnl make sure that compiling against Xft header file doesn't bomb
+ 	if test "$found_xft" = "yes" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
new file mode 100644
index 0000000..9309fc4
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
@@ -0,0 +1,45 @@
+Patch by Sergei Golovan (originally by Mike Markley and Chris Waters) fixes
+building on non-linux Debian architectures.
+
+--- tk8.5-8.5.8.orig/unix/configure
++++ tk8.5-8.5.8/unix/configure
+@@ -4742,6 +4742,9 @@
+ 		if test "`uname -s`" = "AIX" ; then
+ 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
+ 		fi
++		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
++		    tcl_cv_sys_version=NetBSD-Debian
++		fi
+ 	    fi
+ 	fi
+ 
+@@ -5546,7 +5549,7 @@
+ fi
+ 
+ 	    ;;
+-	Linux*)
++	Linux*|GNU*|NetBSD-Debian)
+ 	    SHLIB_CFLAGS="-fPIC"
+ 	    SHLIB_LD_LIBS='${LIBS}'
+ 	    SHLIB_SUFFIX=".so"
+--- tk8.5-8.5.8.orig/unix/tcl.m4
++++ tk8.5-8.5.8/unix/tcl.m4
+@@ -962,6 +962,9 @@
+ 		if test "`uname -s`" = "AIX" ; then
+ 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
+ 		fi
++		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
++		    tcl_cv_sys_version=NetBSD-Debian
++		fi
+ 	    fi
+ 	fi
+     ])
+@@ -1422,7 +1425,7 @@
+ 	        ])
+ 	    ])
+ 	    ;;
+-	Linux*)
++	Linux*|GNU*|NetBSD-Debian)
+ 	    SHLIB_CFLAGS="-fPIC"
+ 	    SHLIB_LD_LIBS='${LIBS}'
+ 	    SHLIB_SUFFIX=".so"
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff
new file mode 100644
index 0000000..ee38c2a
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff
@@ -0,0 +1,22 @@
+--- tk8.5-8.5.8.orig/unix/configure
++++ tk8.5-8.5.8/unix/configure
+@@ -11070,7 +11070,7 @@
+     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
+ fi
+ 
+-TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
++test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
+ PRIVATE_INCLUDE_DIR='$(includedir)'
+ HTML_DIR='$(DISTDIR)/html'
+ TK_PKG_DIR='tk$(VERSION)'
+--- tk8.5-8.5.8.orig/unix/configure.in
++++ tk8.5-8.5.8/unix/configure.in
+@@ -607,7 +607,7 @@
+     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
+ fi
+ 
+-TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
++test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
+ PRIVATE_INCLUDE_DIR='$(includedir)'
+ HTML_DIR='$(DISTDIR)/html'
+ TK_PKG_DIR='tk$(VERSION)'
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff
new file mode 100644
index 0000000..4e15469
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff
@@ -0,0 +1,41 @@
+Patch by Chris Waters sets path which are normally point to a directory
+with Tk sources to a subdirectory of /usr/include/tcl8.4 (debian/rules
+puts private Tk headers there).
+
+--- tk8.5-8.5.8.orig/unix/tkConfig.sh.in
++++ tk8.5-8.5.8/unix/tkConfig.sh.in
+@@ -55,7 +55,7 @@
+ 
+ # String to pass to linker to pick up the Tk library from its
+ # build directory.
+-TK_BUILD_LIB_SPEC='@TK_BUILD_LIB_SPEC@'
++TK_BUILD_LIB_SPEC='@TK_LIB_SPEC@'
+ 
+ # String to pass to linker to pick up the Tk library from its
+ # installed directory.
+@@ -71,7 +71,7 @@
+ # different place than the directory containing the source files, this
+ # points to the location of the sources, not the location where Tk was
+ # compiled.
+-TK_SRC_DIR='@TK_SRC_DIR@'
++TK_SRC_DIR='@includedir@/tk-private'
+ 
+ # Needed if you want to make a 'fat' shared library library
+ # containing tk objects or link a different wish.
+@@ -86,14 +86,14 @@
+ 
+ # String to pass to linker to pick up the Tk stub library from its
+ # build directory.
+-TK_BUILD_STUB_LIB_SPEC='@TK_BUILD_STUB_LIB_SPEC@'
++TK_BUILD_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
+ 
+ # String to pass to linker to pick up the Tk stub library from its
+ # installed directory.
+ TK_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
+ 
+ # Path to the Tk stub library in the build directory.
+-TK_BUILD_STUB_LIB_PATH='@TK_BUILD_STUB_LIB_PATH@'
++TK_BUILD_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
+ 
+ # Path to the Tk stub library in the install directory.
+ TK_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb b/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb
deleted file mode 100644
index d44b407..0000000
--- a/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "Tool Command Language ToolKit Extension"
-HOMEPAGE = "http://tcl.sourceforge.net"
-SECTION = "devel/tcltk"
-LICENSE = "tcl"
-LIC_FILES_CHKSUM = "file://license.terms;md5=24954e7e6b54c1b4e16de861b9d392fc"
-DEPENDS = "tcl virtual/libx11 libxt"
-
-SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
-    file://confsearch.diff;striplevel=2 \
-    file://manpages.diff;striplevel=2 \
-    file://non-linux.diff;striplevel=2 \
-    file://rpath.diff;striplevel=2 \
-    file://tklibrary.diff;striplevel=2 \
-    file://tkprivate.diff;striplevel=2 \
-    file://fix-xft.diff \
-"
-SRC_URI[md5sum] = "13bf90602e16fc530e05196431021dc6"
-SRC_URI[sha256sum] = "9737da5c30e631281062b6acbb4753840f9e95657c78e37657d9c520589ab2d4"
-
-S = "${WORKDIR}/tk${PV}/unix"
-
-inherit autotools
-
-EXTRA_OECONF = "\
-    --enable-threads \
-    --with-tcl=${STAGING_BINDIR_CROSS} \
-    --x-includes=${STAGING_INCDIR} \
-    --x-libraries=${STAGING_LIBDIR} \
-"
-
-do_install_append() {
-    mv libtk8.5.so libtk8.5.so.0
-    oe_libinstall -so libtk8.5 ${D}${libdir}
-    ln -sf wish8.5 ${D}${bindir}/wish
-}
-
-PACKAGES =+ "${PN}-lib"
-
-FILES_${PN}-lib = "${libdir}/libtk8.5.so.*"
-FILES_${PN} += "${libdir}/tk*"
-
-BINCONFIG_GLOB = "*Config.sh"
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
new file mode 100644
index 0000000..b76f58f
--- /dev/null
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Tool Command Language ToolKit Extension"
+HOMEPAGE = "http://tcl.sourceforge.net"
+SECTION = "devel/tcltk"
+LICENSE = "tcl"
+LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe"
+DEPENDS = "tcl virtual/libx11 libxt"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
+    file://confsearch.diff;striplevel=2 \
+    file://non-linux.diff;striplevel=2 \
+    file://tklibrary.diff;striplevel=2 \
+    file://tkprivate.diff;striplevel=2 \
+    file://fix-xft.diff \
+"
+SRC_URI[md5sum] = "b883a1a3c489c17413fb602a94bf54e8"
+SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f058de6"
+
+S = "${WORKDIR}/tk${PV}/unix"
+LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/8.6.0/lib"
+inherit autotools
+
+EXTRA_OECONF = "\
+    --enable-threads \
+    --with-x \
+    --with-tcl=${STAGING_BINDIR_CROSS} \
+"
+
+do_install_append() {
+    mv libtk8.6.so libtk8.6.so.0
+    oe_libinstall -so libtk8.6 ${D}${libdir}
+    ln -sf wish8.6 ${D}${bindir}/wish
+}
+
+PACKAGES =+ "${PN}-lib"
+
+FILES_${PN}-lib = "${libdir}/libtk8.6.so.*"
+FILES_${PN} += "${libdir}/tk*"
+
+BINCONFIG_GLOB = "*Config.sh"
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


