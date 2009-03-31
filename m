Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkd-0001Gy-NS
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:03 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id D311F189477; Tue, 31 Mar 2009 22:40:12 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:12 +0200
Message-Id: <1238532012-3020-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] webkit-gtk: update to 1.1.4 release to get some more bugfixes
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:04 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/distro/include/sane-srcrevs.inc   |    2 +-
 recipes/webkit/webkit-gtk/autogen.sh   |    9 +++++++++
 recipes/webkit/webkit-gtk/configure.ac |    7 +++++--
 recipes/webkit/webkit-gtk_svn.bb       |   11 ++++++++---
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 9a9ce1a..996fe84 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -234,7 +234,7 @@ SRCREV_pn-usbpath ?= "3172"
 SRCREV_pn-usbpath-native ?= "3172"
 SRCREV_pn-vala-terminal ?= "94117f453ce884e9c30b611fae6fc19f85f98f2b"
 SRCREV_pn-vala-native ?= "54a924505856a839ad02dc95baa482e994e94a57"
-SRCREV_pn-webkit-gtk ?= "42069"
+SRCREV_pn-webkit-gtk ?= "42127"
 SRCREV_pn-wlan-ng-modules ?= "1859"
 SRCREV_pn-wlan-ng-utils ?= "1859"
 SRCREV_pn-wmiconfig ?= "4522"
diff --git a/recipes/webkit/webkit-gtk/autogen.sh b/recipes/webkit/webkit-gtk/autogen.sh
index f87238c..8f736c4 100644
--- a/recipes/webkit/webkit-gtk/autogen.sh
+++ b/recipes/webkit/webkit-gtk/autogen.sh
@@ -14,6 +14,14 @@ AUTOMAKE_FLAGS="--foreign --add-missing"
 
 DIE=0
 
+(gtkdocize --version) < /dev/null > /dev/null 2>&1 || {
+    echo
+    echo "You must have gtkdocize installed to compile $PROJECT."
+    echo "Install the appropriate package for your distribution,"
+    echo "or get the source tarball at http://ftp.gnome.org/pub/GNOME/sources/gtk-doc/"
+    DIE=1
+}
+
 (autoconf --version) < /dev/null > /dev/null 2>&1 || {
     echo
     echo "You must have autoconf installed to compile $PROJECT."
@@ -50,6 +58,7 @@ rm -rf $top_srcdir/autom4te.cache
 
 touch README INSTALL
 
+gtkdocize || exit $?
 aclocal $ACLOCAL_FLAGS || exit $?
 $LIBTOOLIZE $LIBTOOLIZE_FLAGS || exit $?
 autoheader || exit $?
diff --git a/recipes/webkit/webkit-gtk/configure.ac b/recipes/webkit/webkit-gtk/configure.ac
index ad13dea..4940af8 100644
--- a/recipes/webkit/webkit-gtk/configure.ac
+++ b/recipes/webkit/webkit-gtk/configure.ac
@@ -2,7 +2,7 @@ AC_PREREQ(2.59)
 
 m4_define([webkit_major_version], [1])
 m4_define([webkit_minor_version], [1])
-m4_define([webkit_micro_version], [3])
+m4_define([webkit_micro_version], [4])
 
 AC_INIT([WebKit],[webkit_major_version.webkit_minor_version.webkit_micro_version],[http://bugs.webkit.org/])
 
@@ -24,7 +24,7 @@ AC_CONFIG_SRCDIR([WebCore/config.h])
 
 dnl # Libtool library version, not to confuse with API version
 dnl # see http://www.gnu.org/software/libtool/manual/html_node/Libtool-versioning.html#Libtool-versioning
-LIBWEBKITGTK_VERSION=3:0:1
+LIBWEBKITGTK_VERSION=4:0:2
 AC_SUBST([LIBWEBKITGTK_VERSION])
 
 AM_INIT_AUTOMAKE([foreign subdir-objects tar-ustar])
@@ -598,6 +598,8 @@ if test "$enable_video" = "yes"; then
     html_flags=yes
 fi
 
+GTK_DOC_CHECK([1.10])
+
 # OS conditionals
 AM_CONDITIONAL([OS_WIN32],[test "$os_win32" = "yes"])
 AM_CONDITIONAL([OS_UNIX],[test "$os_win32" = "no"])
@@ -649,6 +651,7 @@ AC_CONFIG_FILES([
 GNUmakefile
 WebKit/gtk/webkit-1.0.pc:WebKit/gtk/webkit.pc.in
 WebKit/gtk/webkit/webkitversion.h
+WebKit/gtk/docs/version.xml
 ]
 )
 
diff --git a/recipes/webkit/webkit-gtk_svn.bb b/recipes/webkit/webkit-gtk_svn.bb
index 2e5c014..8473131 100644
--- a/recipes/webkit/webkit-gtk_svn.bb
+++ b/recipes/webkit/webkit-gtk_svn.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "WebKit browser engine, GTK+ edition"
-DEPENDS = "gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base gnome-vfs bison-native flex-native gperf-native perl-native sqlite3"
+DEPENDS = "gtk-doc-native gtk-doc gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base gnome-vfs bison-native flex-native gperf-native perl-native sqlite3"
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
-PV = "1.1.3+svnr${SRCREV}"
+PV = "1.1.4+svnr${SRCREV}"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
@@ -31,10 +31,15 @@ EXTRA_OECONF = "\
                 --enable-debug=no \
                 --enable-svg \
                 --enable-icon-database=yes \
-		--with-http-backend=soup \
+                --with-http-backend=soup \
                "
+
 EXTRA_AUTORECONF = " -I autotools "
 
+do_configure_prepend() {
+	touch gtk-doc.make
+}
+
 # Dolt gets used on x86 and ppc and hardcodes 'libtool'
 do_configure_append() {
 	cp ${TARGET_PREFIX}libtool libtool || true
-- 
1.5.6.5



