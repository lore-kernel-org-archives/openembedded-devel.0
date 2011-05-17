Received: from smtp-out04.msg.oleane.net ([62.161.7.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QMRaz-0005AS-QD for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:14:25 +0200
Received: from smtp01.msg.oleane.net (smtp01.mail.priv [172.17.20.110]) 
	by smtp-out04.msg.oleane.net with ESMTP id p4HLBYIp028710
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 23:11:34 +0200
Received: from localhost.localdomain
	(AMarseille-551-1-81-135.w92-137.abo.wanadoo.fr [92.137.64.135]) 
	by smtp01.msg.oleane.net (MTA) with ESMTP id p4HKpFeT018730;
	Tue, 17 May 2011 22:51:15 +0200
X-Oleane-Rep: REPA
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2011 22:51:14 +0200
Message-Id: <1305665474-22375-1-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Mailer: git-send-email 1.7.4.1
X-Spam-Flag: NO
X-PMX-Spam: Probability=10%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.17.204216 (no antivirus check)
Subject: [PATCH] tuxpaint: new recipe for version 0.9.21 (with related recipes)
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
X-List-Received-Date: Tue, 17 May 2011 21:14:26 -0000

This creates recipes for tuxpaint (painting software for children).
There is a recipe for libpaper (library needed by tuxpain), and one
for tuxpaint-config that allows to configure options graphically.

Tuxpain needs libsdl-pango to be built (sent in previous path).

Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
---
 recipes/tuxpaint/libpaper_1.1.24.bb             |   12 +++++
 recipes/tuxpaint/tuxpaint-config/makefile.patch |   53 +++++++++++++++++++++++
 recipes/tuxpaint/tuxpaint-config_0.0.12.bb      |   29 ++++++++++++
 recipes/tuxpaint/tuxpaint/makefile.patch        |   43 ++++++++++++++++++
 recipes/tuxpaint/tuxpaint_0.9.21.bb             |   24 ++++++++++
 5 files changed, 161 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tuxpaint/libpaper_1.1.24.bb
 create mode 100644 recipes/tuxpaint/tuxpaint-config/makefile.patch
 create mode 100644 recipes/tuxpaint/tuxpaint-config_0.0.12.bb
 create mode 100644 recipes/tuxpaint/tuxpaint/makefile.patch
 create mode 100644 recipes/tuxpaint/tuxpaint_0.9.21.bb

diff --git a/recipes/tuxpaint/libpaper_1.1.24.bb b/recipes/tuxpaint/libpaper_1.1.24.bb
new file mode 100644
index 0000000..c16663d
--- /dev/null
+++ b/recipes/tuxpaint/libpaper_1.1.24.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Paper Library"
+LICENSE = "GPLv2"
+SECTION = "libs"
+PRIORITY = "optional"
+
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/libp/${PN}/${PN}_${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5bc87d494ba470aba54f6d2d51471834"
+SRC_URI[sha256sum] = "38ac28114673d4b175a939d981e0477a0ed9bcaab27033522ecb2ca78ee90c7e"
+
+inherit autotools
+
diff --git a/recipes/tuxpaint/tuxpaint-config/makefile.patch b/recipes/tuxpaint/tuxpaint-config/makefile.patch
new file mode 100644
index 0000000..e953ee4
--- /dev/null
+++ b/recipes/tuxpaint/tuxpaint-config/makefile.patch
@@ -0,0 +1,53 @@
+Author: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
+
+Correct Makefile to allow definition of PREFIX from environment
+Index: tuxpaint-config-0.0.12/Makefile
+===================================================================
+--- tuxpaint-config-0.0.12.orig/Makefile	2009-05-29 00:08:08.000000000 +0200
++++ tuxpaint-config-0.0.12/Makefile	2011-05-03 16:01:22.000000000 +0200
+@@ -20,7 +20,7 @@
+ 
+ # Where to install things:
+ 
+-PREFIX=/usr/local
++PREFIX?=/usr/local
+ 
+ 
+ # Program:
+@@ -53,9 +53,9 @@
+ 
+ ICON_PREFIX=$(PREFIX)/share/pixmaps/
+ X11_ICON_PREFIX=$(PREFIX)/X11R6/include/X11/pixmaps/
+-GNOME_PREFIX=$(shell gnome-config --prefix 2> /dev/null)
+-KDE_PREFIX=$(shell kde-config --install apps --expandvars 2> /dev/null)
+-KDE_ICON_PREFIX=$(shell kde-config --install icon --expandvars 2> /dev/null)
++GNOME_PREFIX?=$(shell gnome-config --prefix 2> /dev/null)
++KDE_PREFIX?=$(shell kde-config --install apps --expandvars 2> /dev/null)
++KDE_ICON_PREFIX?=$(shell kde-config --install icon --expandvars 2> /dev/null)
+ 
+ 
+ # Locale files
+@@ -227,11 +227,11 @@
+ install-kde-icons:
+ 	@echo "...Installing launcher icon graphics into KDE..."
+ 	@if [ "x$(KDE_ICON_PREFIX)" != "x" ]; then \
+-	  cp data/images/icon48x48.png \
++	  install -m 0644 data/images/icon48x48.png \
+ 		$(KDE_ICON_PREFIX)/hicolor/48x48/apps/tuxpaint-config.png; \
+-	  cp data/images/icon32x32.png \
++	  install -m 0644 data/images/icon32x32.png \
+ 		$(KDE_ICON_PREFIX)/hicolor/32x32/apps/tuxpaint-config.png; \
+-	  cp data/images/icon16x16.png \
++	  install -m 0644 data/images/icon16x16.png \
+ 		$(KDE_ICON_PREFIX)/hicolor/16x16/apps/tuxpaint-config.png; \
+ 	fi
+ 
+@@ -306,7 +306,7 @@
+ 	@echo Linking
+ 	$(CXX) $(ALL_CFLAGS) -o tuxpaint-config obj/tuxpaint-config.o 	\
+ 			obj/tuxpaint-config2.o obj/defaults.o $(ARCH_LIBS) \
+-			$(FLTK_LIBS) $(ARCH_LINKS) $(PAPER_LIB)
++			$(FLTK_LIBS) $(ARCH_LINKS) $(PAPER_LIB) $(LDFLAGS)
+ 
+ 
+ # Build the object for the program!
diff --git a/recipes/tuxpaint/tuxpaint-config_0.0.12.bb b/recipes/tuxpaint/tuxpaint-config_0.0.12.bb
new file mode 100644
index 0000000..0fe2a0f
--- /dev/null
+++ b/recipes/tuxpaint/tuxpaint-config_0.0.12.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Open Source Drawing Software for Children - Configuration"
+HOMEPAGE = "http://www.tuxpaint.org"
+LICENSE = "GPLv2"
+SECTION = "x11/apps"
+PRIORITY = "optional"
+
+DEPENDS = "fltk tuxpaint"
+
+SRC_URI = "http://freefr.dl.sourceforge.net/project/tuxpaint/${PN}/${PV}/${PN}-${PV}.tar.gz \
+	file://makefile.patch \
+"
+
+SRC_URI[md5sum] = "11ac7654d9670f45c76668317ab6f717"
+SRC_URI[sha256sum] = "9395a1c92e52c3420cabaa0c781b607e6832b5d9b6180902615f102216e1c8fd"
+
+do_compile() {
+	base_do_compile
+}
+
+do_install() {
+	install -d ${D}/usr/bin
+	install -d ${D}/usr/share/icons/hicolor/48x48/apps
+	install -d ${D}/usr/share/icons/hicolor/32x32/apps
+	install -d ${D}/usr/share/icons/hicolor/16x16/apps
+	PREFIX="${D}/usr" KDE_ICON_PREFIX="${D}/usr/share/icons" KDE_PREFIX="${D}/usr/share" make install
+}
+
+FILES_${PN} += "${datadir}/icons ${datadir}/pixmaps ${datadir}/tuxpaint"
+FILES_${PN}-dbg += "${libdir}/tuxpaint/plugins/.debug"
diff --git a/recipes/tuxpaint/tuxpaint/makefile.patch b/recipes/tuxpaint/tuxpaint/makefile.patch
new file mode 100644
index 0000000..17a02e9
--- /dev/null
+++ b/recipes/tuxpaint/tuxpaint/makefile.patch
@@ -0,0 +1,43 @@
+Author: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
+
+Correct Makefile to allow definition of PREFIX from environment
+Index: tuxpaint-0.9.21/Makefile
+===================================================================
+--- tuxpaint-0.9.21.orig/Makefile	2009-04-29 07:18:57.000000000 +0200
++++ tuxpaint-0.9.21/Makefile	2011-05-03 15:06:46.000000000 +0200
+@@ -94,7 +94,7 @@
+ osx_PREFIX:=/usr/local
+ beos_PREFIX:=/boot/apps/Games/TuxPaint
+ linux_PREFIX:=/usr/local
+-PREFIX:=$($(OS)_PREFIX)
++PREFIX?=$($(OS)_PREFIX)
+ 
+ 
+ # Root directory to place files when creating packages.
+@@ -103,7 +103,7 @@
+ ifeq ($(PREFIX),./)
+ DESTDIR:=TuxPaint-1
+ else
+-DESTDIR:=$(PKG_ROOT)
++DESTDIR?=$(PKG_ROOT)
+ endif
+ 
+ # Program:
+@@ -834,7 +834,7 @@
+ 	@echo "...Linking Tux Paint..."
+ 	$(CC) $(CFLAGS) $(DEBUG_FLAGS) $(SDL_CFLAGS) $(FRIBIDI_CFLAGS) $(DEFS) \
+ 		-o tuxpaint $^ \
+-		$(SDL_LIBS) $(SVG_LIB) $(ARCH_LINKS)
++		$(SDL_LIBS) $(SVG_LIB) $(ARCH_LINKS) $(LDFLAGS)
+ 	@$(RSRC_CMD)
+ 	@$(MIMESET_CMD)
+ 
+@@ -998,7 +998,7 @@
+ 
+ #MAGIC_CFLAGS:=-g3 -O2 -fvisibility=hidden -fno-common -W -Wstrict-prototypes -Wmissing-prototypes -Wall $(MAGIC_SDL_CPPFLAGS) -Isrc/
+ MAGIC_CFLAGS:=-g3 -O2 -fno-common -W -Wstrict-prototypes -Wmissing-prototypes -Wall $(MAGIC_SDL_CPPFLAGS) -Isrc/
+-SHARED_FLAGS:=-shared -fpic
++SHARED_FLAGS:=-shared -fpic $(LDFLAGS)
+ 
+ MAGIC_C:=$(wildcard magic/src/*.c)
+ MAGIC_SO:=$(patsubst magic/src/%.c,magic/%.$(SO_TYPE),$(MAGIC_C))
diff --git a/recipes/tuxpaint/tuxpaint_0.9.21.bb b/recipes/tuxpaint/tuxpaint_0.9.21.bb
new file mode 100644
index 0000000..82234b6
--- /dev/null
+++ b/recipes/tuxpaint/tuxpaint_0.9.21.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Open Source Drawing Software for Children"
+HOMEPAGE = "http://www.tuxpaint.org"
+LICENSE = "GPLv2"
+SECTION = "x11/apps"
+PRIORITY = "optional"
+
+DEPENDS = "cairo fribidi libpaper librsvg libsdl-image libsdl-mixer libsdl-pango libsdl-ttf"
+
+SRC_URI = "http://freefr.dl.sourceforge.net/project/tuxpaint/${PN}/${PV}/${PN}-${PV}.tar.gz \
+	file://makefile.patch"
+
+SRC_URI[md5sum] = "a88401d1860648098eeed819cff038fa"
+SRC_URI[sha256sum] = "6d4f2b981643b5c937708e5e6cdaf318ae7b5562375327b4b1cb84611e65ede9"
+
+do_compile() {
+	PREFIX="/usr" base_do_compile
+}
+
+do_install() {
+	PREFIX="/usr" PKG_ROOT=${D} make install
+}
+
+FILES_${PN} += "${datadir}/icons ${datadir}/pixmaps ${datadir}/tuxpaint"
+FILES_${PN}-dbg += "${libdir}/tuxpaint/plugins/.debug"
-- 
1.7.4.1



