Return-Path: <sebastian.reichel@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id B6C4B788EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 16:31:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
	with ESMTPSA id 47BA4277777
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 17:31:08 +0100
Message-Id: <20180228163108.24906-1-sebastian.reichel@collabora.co.uk>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] fvwm: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 16:31:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add recipe for a minimal built of fvwm.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 .../0001-Fix-compilation-for-disabled-gnome.patch  |  69 +++++++++++++
 .../fvwm/fvwm/0002-Avoid-absolute-symlinks.patch   |  27 +++++
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb        | 114 +++++++++++++++++++++
 3 files changed, 210 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
 create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
 create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
new file mode 100644
index 000000000000..5a7647455852
--- /dev/null
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
@@ -0,0 +1,69 @@
+From 60c17eb49121bf2aa485acd30750b2fc6c8eb61f Mon Sep 17 00:00:00 2001
+From: Jarmo Jaakkola <jarmo.jaakkola@vincit.fi>
+Date: Mon, 19 Jun 2017 16:41:36 +0300
+Subject: [PATCH] Fix compilation for Helix.
+
+Gnome support, including GNOME_INIT_HOOK, has been removed, but it was
+still being called.
+
+COMPAT_OLD_KEYSYMDEF is a check for a legacy system, which our system
+most definitely is not.  It is accomplished by trying to execute
+a program, which does not work when cross compiling.
+
+The fvwm(1) man page is created from Docbook XML which is set for
+a Windows code page that is not available when compiling.  Easiest is
+to just not create the man page as those are not needed on the monitor.
+
+Upstream-Status: inappropriate [OE specific]
+Signed-off-by: Jarmo Jaakkola <jarmo.jaakkola@vincit.fi>
+Signed-off-by: Riku Hämäläinen <riku.hamalainen@ge.com>
+Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
+---
+ configure.ac         | 20 ++++----------------
+ doc/fvwm/Makefile.am |  2 +-
+ 3 files changed, 7 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 48ce264..fab7b44 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1413,23 +1413,7 @@ else
+   problem_gdkimlib=": Failed on gdk-imlib, see config.log"
+ fi
+ 
+-GNOME_INIT_HOOK
+-
+-# Unfortunately we have 2 gnome supports: WM hints and gnome libs.
+-# The $with_gnomehints below refers to the first, not GNOME_INIT_HOOK.
+-if test ! x"$enable_gnome_hints" = xno; then
+-  with_gnomehints=yes
+-  problem_gnomehints=""
+-else
+-  with_gnomehints=no
+-  problem_gnomehints=": Explicitly disabled"
+-fi
+-
+ # Define some compatibility macros needed for config.h.
+-mg_DEFINE_IF_NOT([#include <X11/keysym.h>],
+-  [defined XK_Page_Up && defined XK_Page_Down],
+-  [COMPAT_OLD_KEYSYMDEF], [$X_CFLAGS],
+-  [Old AIX systems (3.2.5) don't define some common keysyms.])
+ AH_VERBATIM([_COMPAT_OLD_KEYSYMDEF],
+ [#ifdef COMPAT_OLD_KEYSYMDEF
+ #  define XK_Page_Up   XK_Prior
+diff --git a/doc/fvwm/Makefile.am b/doc/fvwm/Makefile.am
+index cddb102..ff00149 100755
+--- a/doc/fvwm/Makefile.am
++++ b/doc/fvwm/Makefile.am
+@@ -10,7 +10,7 @@ XSL_PROFILE = $(srcdir)/../docbook-xsl/profiling/profile.xsl
+ HTML_FILES = fvwm.man.html
+ XML_FILES = @DOC_SECTIONS_XML_PATH@
+ EXTRA_DIST = @DOC_SECTIONS_XML@ $(man_MANS) sections
+-man_MANS = fvwm.1
++man_MANS =
+ 
+ if FVWM_BUILD_HTMLDOC
+ doc_DATA = $(HTML_FILES)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
new file mode 100644
index 000000000000..756cc86e87a0
--- /dev/null
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
@@ -0,0 +1,27 @@
+From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
+Date: Tue, 29 Auf 2017 16:08:42 +0200
+Subject: [PATCH] Avoid absolute symlinks
+
+Avoid usage of absolute symlinks, which breaks yocto builds
+since pyro.
+
+Upstream-Status: Pending
+Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
+
+diff --git a/default-config/Makefile.am b/default-config/Makefile.am
+index 5e16d095a137..5404145a742c 100644
+--- a/default-config/Makefile.am
++++ b/default-config/Makefile.am
+@@ -17,9 +17,9 @@ EXTRA_DIST  = images \
+ 
+ install-data-hook:
+ 	cp -r $(srcdir)/images $(inst_location)
+-	ln -sf $(inst_location)/FvwmScript-DateTime $(inst_location)/..
+-	ln -sf $(inst_location)/FvwmScript-ConfirmQuit $(inst_location)/..
+-	ln -sf $(inst_location)/FvwmScript-ConfirmCopyConfig $(inst_location)/..
++	ln -sf default-config/FvwmScript-DateTime $(inst_location)/..
++	ln -sf default-config/FvwmScript-ConfirmQuit $(inst_location)/..
++	ln -sf default-config/FvwmScript-ConfirmCopyConfig $(inst_location)/..
+ 
+ uninstall-hook:
+ 	rm -fr $(DESTDIR)/$(configdir)
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb
new file mode 100644
index 000000000000..cb851bfd96a4
--- /dev/null
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb
@@ -0,0 +1,114 @@
+SUMMARY = "F Virtual Window Manager "
+HOMEPAGE = "http://www.fvwm.org/"
+SECTION = "x11/wm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=363fbcfb59124689af72c914560eaf6e"
+
+DEPENDS = " \
+    bison-native \
+    flex-native \
+    freetype-native \
+    gettext-native \
+    libxslt-native \
+    fontconfig \
+    libice \
+    libpng \
+    librsvg \
+    libsm \
+    libxau \
+    libxcb \
+    libxcursor \
+    libxdmcp \
+    libxext \
+    libxfixes \
+    libxft \
+    libxinerama \
+    libxml2 \
+    libxrender \
+    libxt \
+    virtual/libx11 \
+    xrandr \
+    zlib \
+"
+
+PV = "2.6.7+git${SRCPV}"
+
+SRC_URI = " \
+    git://github.com/fvwmorg/fvwm.git;protocol=https \
+    file://0001-Fix-compilation-for-disabled-gnome.patch \
+    file://0002-Avoid-absolute-symlinks.patch \
+"
+
+SRCREV = "597a4e296da4f21e71a17facab297e016a3a80a8"
+
+S = "${WORKDIR}/git"
+
+inherit autotools gettext update-alternatives pkgconfig pythonnative perlnative distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/fvwm"
+ALTERNATIVE_PRIORITY[x-window-manager] = "20"
+
+EXTRA_OECONF = " \
+    --disable-bidi \
+    --disable-fontconfigtest \
+    --disable-freetypetest \
+    --disable-htmldoc \
+    --disable-imlibtest \
+    --disable-mandoc \
+    --disable-nls \
+    --disable-perllib \
+    --disable-rsvg \
+    --disable-shape \
+    --disable-sm \
+    --disable-xfttest \
+    --with-imlib-exec-prefix=/nonexistent \
+    --with-imlib-prefix=/nonexistent \
+    --without-ncurses-library \
+    --without-readline-library \
+    --without-rplay-library \
+    --without-stroke-library \
+    --without-termcap-library \
+    --without-xpm-library \
+    ac_cv_func_mkstemp=no \
+    has_safety_mkstemp=yes \
+"
+
+# show the exact commands in the log file
+EXTRA_OEMAKE = " \
+    V=1 \
+"
+
+do_install_append() {
+    install -d -m 0755 ${D}/${sysconfdir}/xdg/fvwm
+    # You can install the config file here
+
+    install -d -m 0755 ${D}/${datadir}/fvwm
+    touch ${D}/${datadir}/fvwm/ConfigFvwmDefaults
+}
+
+# the only needed packages (note: locale packages are automatically generated
+# as well)
+PACKAGES = " \
+    ${PN} \
+    ${PN}-dbg \
+"
+
+# minimal set of binaries
+FILES_${PN} = " \
+    ${bindir}/fvwm \
+    ${bindir}/fvwm-root \
+    ${datadir}/fvwm/ConfigFvwmDefaults \
+"
+
+RDEPENDS_${PN} = " \
+    xuser-account \
+"
+
+# by default a lot of stuff is installed and it's not easy to control what to
+# install, so install everything, but skip the check
+INSANE_SKIP_${PN} = " \
+    installed-vs-shipped \
+"
-- 
2.16.1


