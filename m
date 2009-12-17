Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NLHPL-00047F-26
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 15:32:50 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 0B5A9B94010;
	Thu, 17 Dec 2009 15:30:58 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NLHNZ-0003wJ-Q7; Thu, 17 Dec 2009 15:30:57 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2009 15:30:46 +0100
Message-Id: <1261060246-15099-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.6.5.6
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] wxwidgets: add 2.9.0 and clean up recipes
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
X-List-Received-Date: Thu, 17 Dec 2009 14:32:50 -0000

 - Add wxwidget-2.9.0 include with derived rather than hardcoded lib and
   config script names (depends on debug and charset configure flags)
 - Use regular expression for LEAD_SONAME rather than hardcoded name.
 - Fix autoconf issue where configure could not find staging root.
 - Use INC_PR.

 - Add wxwidgets-2.9.0 (unicode)
 - Add wxwidgets-ansi-2.9.0 (non-unicode)
 - Add wxwidgets-opengl-2.9.0 (unicode, opengl)

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---
Hi, 

The autoconf patch is a bit of a hack and should really be fixed properly
upstream. Works fine for now though.

Cheers,
Johan



 conf/checksums.ini                                 |    4 ++
 .../wxwidgets-2.9.0/configure-cross_root.patch     |   30 +++++++++++++
 recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb          |    5 ++
 recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb        |    7 +++
 recipes/wxwidgets/wxwidgets_2.9.0.bb               |    3 +
 recipes/wxwidgets/wxwidgets_2.9.0.inc              |   44 ++++++++++++++++++++
 6 files changed, 93 insertions(+), 0 deletions(-)
 create mode 100644 recipes/wxwidgets/wxwidgets-2.9.0/configure-cross_root.patch
 create mode 100644 recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb
 create mode 100644 recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb
 create mode 100644 recipes/wxwidgets/wxwidgets_2.9.0.bb
 create mode 100644 recipes/wxwidgets/wxwidgets_2.9.0.inc

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 10ce619..f810d08 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27390,6 +27390,10 @@ sha256=9b4096bb1e273914adf101182c27d457f46fcc44d1b3ea027bae3d34ace8c6f7
 md5=3ad40ea2b1728eefa94f60beb9951ff7
 sha256=9b4096bb1e273914adf101182c27d457f46fcc44d1b3ea027bae3d34ace8c6f7
 
+[http://downloads.sourceforge.net/wxwindows/wxWidgets-2.9.0.tar.bz2]
+md5=09058928eeb72853142c062bdec056ce
+sha256=8cf5c1dcf6357b2d27efd0c737b95baf1d2d1e88b5bf24560824b5eb6f2dc782
+
 [http://xorg.freedesktop.org/releases/individual/app/x11perf-1.4.1.tar.bz2]
 md5=fd06c8b8e3572a0e14af65a49e0dd7d1
 sha256=c81819618ec596fda55b950ef80f2ee02e5ce149ea99f1f741cedb459b4d3064
diff --git a/recipes/wxwidgets/wxwidgets-2.9.0/configure-cross_root.patch b/recipes/wxwidgets/wxwidgets-2.9.0/configure-cross_root.patch
new file mode 100644
index 0000000..e91a95c
--- /dev/null
+++ b/recipes/wxwidgets/wxwidgets-2.9.0/configure-cross_root.patch
@@ -0,0 +1,30 @@
+diff -pu a/configure.in b/configure.in
+--- a/configure.in	2009-12-04 11:02:26.000000000 +0100
++++ b/configure.in	2009-12-03 22:08:05.000000000 +0100
+@@ -2117,14 +2117,21 @@ if test "$build" != "$host" -a "$GCC" = 
+     dnl the linker. Stripping off the trailing '/bin/ld' gives us a candiate
+     dnl for a 'root' below which libraries and headers for the target system
+     dnl might be installed.
+-    if cross_root=`$CC -print-prog-name=ld 2>/dev/null`; then
++    m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
++    if test ! -z "$PKG_CONFIG_SYSROOT_DIR"; then
++	    cross_root="$PKG_CONFIG_SYSROOT_DIR"
++    elif cross_root=`$CC -print-prog-name=ld 2>/dev/null`; then
+         cross_root=`dirname $cross_root`
+         cross_root=`dirname $cross_root`
++    else
++	cross_root=""
++    fi
+ 
+-        dnl substitute this candiate root for '^/usr' in the search lists,
+-        dnl strip out any that don't start '^/usr'.
+-        SEARCH_LIB=`for x in $SEARCH_LIB; do echo $x; done | sed -ne "s|^/usr|$cross_root|p"`
+-        SEARCH_INCLUDE=`for x in $SEARCH_INCLUDE; do echo $x; done | sed -ne "s|^/usr|$cross_root|p"`
++    if test ! -z "$cross_root"; then
++        dnl substitute this candiate root for '^/' in the search lists,
++        dnl strip out any that don't start '^/'.
++        SEARCH_LIB=`for x in $SEARCH_LIB; do echo $x; done | sed -ne "s|^/|$cross_root/|p"`
++        SEARCH_INCLUDE=`for x in $SEARCH_INCLUDE; do echo $x; done | sed -ne "s|^/|$cross_root/|p"`
+         SEARCH_INCLUDE="$SEARCH_INCLUDE $cross_root/include"
+ 
+         dnl also have pkg-config search for *.pc files under this 'root'
diff --git a/recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb b/recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb
new file mode 100644
index 0000000..2f9fdfe
--- /dev/null
+++ b/recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb
@@ -0,0 +1,5 @@
+require wxwidgets_${PV}.inc
+
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF += "--disable-unicode"
diff --git a/recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb b/recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb
new file mode 100644
index 0000000..165bc35
--- /dev/null
+++ b/recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb
@@ -0,0 +1,7 @@
+require wxwidgets_${PV}.inc
+
+DEPENDS += "virtual/libgl"
+
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF += "--with-opengl"
diff --git a/recipes/wxwidgets/wxwidgets_2.9.0.bb b/recipes/wxwidgets/wxwidgets_2.9.0.bb
new file mode 100644
index 0000000..c70fd76
--- /dev/null
+++ b/recipes/wxwidgets/wxwidgets_2.9.0.bb
@@ -0,0 +1,3 @@
+require wxwidgets_${PV}.inc
+
+PR = "${INC_PR}.0"
diff --git a/recipes/wxwidgets/wxwidgets_2.9.0.inc b/recipes/wxwidgets/wxwidgets_2.9.0.inc
new file mode 100644
index 0000000..cb6a971
--- /dev/null
+++ b/recipes/wxwidgets/wxwidgets_2.9.0.inc
@@ -0,0 +1,44 @@
+require wxwidgets.inc
+
+INC_PR = "r0"
+
+PROVIDES += "wxwidgets"
+
+TOOLKIT ?= "gtk2"
+UNICODE ?= "${@base_contains('EXTRA_OECONF', '--disable-unicode', 'ansi', 'unicode', d)}"
+DEBUG ?= "${@base_contains('EXTRA_OECONF', '--enable-debug', 'debug', 'release', d)}"
+RELEASE ?= "${@bb.data.getVar('PV',d,1).rsplit('.', 1)[0]}"
+
+WXCONFIG ?= "${TOOLKIT}-${UNICODE}-${DEBUG}-${RELEASE}"
+
+LEAD_SONAME = "libwx_.*_core-.*\.so"
+
+# Patch and regenerate configure script so that it finds staging root.
+FILESDIR = "${FILE_DIRNAME}/wxwidgets-${PV}"
+SRC_URI += "file://configure-cross_root.patch;patch=1"
+
+do_configure_prepend() {
+	./autogen.sh
+}
+
+do_stage() {
+	install -d ${STAGING_INCDIR}/wx-${RELEASE}/wx
+	cp -pR include/wx ${STAGING_INCDIR}/wx-${RELEASE}
+	cp -pR lib/libwx* ${STAGING_LIBDIR}
+	cp -pR lib/wx     ${STAGING_LIBDIR}
+	cp -pR build/bakefiles/wxpresets/presets ${STAGING_DATADIR}/bakefile
+	cp -p wxwin.m4                          ${STAGING_DATADIR}/aclocal
+	ln -sf ${STAGING_LIBDIR}/wx/config/${TARGET_PREFIX}${WXCONFIG} \
+		${STAGING_BINDIR_CROSS}/wx-config
+	sed -e s,'wxconfdir=".*"','wxconfigdir="${STAGING_LIBDIR}/wx/config"', \
+		-e s,'bindir=".*"','bindir="${STAGING_BINDIR}"', \
+		-e s,'libdir=".*"','libdir="${STAGING_LIBDIR}"', \
+		-e s,'includedir=".*"','includedir="${STAGING_INCDIR}"', \
+		-i ${STAGING_LIBDIR}/wx/config/${TARGET_PREFIX}${WXCONFIG}
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	ln -sf  ${libdir}/wx/config/${TARGET_PREFIX}${WXCONFIG} \
+		${D}${bindir}/wx-config
+}
-- 
1.6.5.6



