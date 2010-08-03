Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQMp-0006VZ-Mw
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:53:54 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id A8C18D4807B;
	Wed,  4 Aug 2010 00:53:46 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OgQSZ-0006UB-6i; Wed, 04 Aug 2010 00:59:47 +0200
From: Yann Dirson <ydirson@altern.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 00:59:43 +0200
Message-Id: <1280876383-24907-1-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Yann Dirson <ydirson@altern.org>
Subject: [PATCH] literki: initial packaging.
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
X-List-Received-Date: Tue, 03 Aug 2010 22:53:54 -0000

No formal release yet, although upstreams ships an ipk with a version and
a packaging revision, so we pull from git.

Patches:
- Makefile was completely broken and had no install target,
  rewrites most of it.
- author has put a "switcher" feature in it, which is non-functional,
  disable it in conffile
- in the area in which the "slide" to bringup the keyboard starts, drags
  are not propagated to window below; make the area smaller so we can
  unlock the screen

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/literki/literki/makefile.patch     |   61 ++++++++++++++++++++++++++++
 recipes/literki/literki/noswitcher.patch   |   21 ++++++++++
 recipes/literki/literki/sliderheight.patch |   21 ++++++++++
 recipes/literki/literki_git.bb             |   35 ++++++++++++++++
 4 files changed, 138 insertions(+), 0 deletions(-)
 create mode 100644 recipes/literki/literki/makefile.patch
 create mode 100644 recipes/literki/literki/noswitcher.patch
 create mode 100644 recipes/literki/literki/sliderheight.patch
 create mode 100644 recipes/literki/literki_git.bb

diff --git a/recipes/literki/literki/makefile.patch b/recipes/literki/literki/makefile.patch
new file mode 100644
index 0000000..c6f78f0
--- /dev/null
+++ b/recipes/literki/literki/makefile.patch
@@ -0,0 +1,61 @@
+commit d2ad0f4591619aa176edfb618971d0c8ff608a69
+Author: Yann Dirson <ydirson@altern.org>
+Date:   Tue Aug 3 22:35:25 2010 +0200
+
+    Make the Makefile suitable for packaging and cross-compiling.
+    
+    This includes normalisation of variable names to minimize packaging
+    work, as well as an install target.
+    
+    Signed-off-by: Yann Dirson <ydirson@altern.org>
+
+diff --git a/Makefile b/Makefile
+index f300953..834e6f6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,18 +1,39 @@
++DESTDIR=
++prefix=/usr
++bindir=$(prefix)/bin
++datadir=$(prefix)/share
++sysconfdir=/etc
++
+ PLIKI=display.o keymap.o keys.o keyboard.o applet.o launcher.o logger.o slider.o image_cache.o touchpad.o switcher.o vibrator.o
+ 
+ LIBS=-lX11 -lXext -lXtst -lpthread -lXrandr -lpng -lfakekey
+ 
+-CXXCOMPILE=g++
++CXX=g++
++
++MYCFLAGS = -g $(shell freetype-config --cflags)
++MYLDFLAGS = -g $(shell freetype-config --libs)
+ 
+-CFLAGS=-g `freetype-config --cflags`
+-LDFLAGS=-g `freetype-config --libs`
++all: literki
+ 
+ %.o: %.cpp
+-	$(CXXCOMPILE) $(CFLAGS) -c $<
++	$(CXX) $(CXXFLAGS) $(MYCFLAGS) -c $<
+ 
+-all:	$(PLIKI)
+-	g++ $(LIBS) $(LDFLAGS) -o literki $(PLIKI)
++literki: $(PLIKI)
++	$(CXX) $(LDFLAGS) $(LIBS) $(MYLDFLAGS) -o $@ $^
+ 
+ clean:	
+ 	rm *.o
+ 	rm literki
++
++install:
++	install -d -m755 \
++		$(DESTDIR)$(bindir) \
++		$(DESTDIR)$(sysconfdir)/literki \
++		$(DESTDIR)$(datadir)/applications \
++		$(DESTDIR)$(datadir)/pixmaps \
++		$(DESTDIR)$(datadir)/literki/png
++	install -m755 literki $(DESTDIR)$(bindir)/
++	install -m755 literki.conf *layout.conf $(DESTDIR)$(sysconfdir)/literki/
++	install -m644 png/* $(DESTDIR)$(datadir)/literki/png/
++	install -m644 literki.desktop $(DESTDIR)$(datadir)/applications/
++	install -m644 literki.png $(DESTDIR)$(datadir)/pixmaps/
diff --git a/recipes/literki/literki/noswitcher.patch b/recipes/literki/literki/noswitcher.patch
new file mode 100644
index 0000000..2485d3f
--- /dev/null
+++ b/recipes/literki/literki/noswitcher.patch
@@ -0,0 +1,21 @@
+commit 4134b39a3297f1a4316fc4ea9b21226450db0307
+Author: Yann Dirson <ydirson@altern.org>
+Date:   Tue Aug 3 23:30:55 2010 +0200
+
+    Disable author's switcher in config file.
+    
+    Signed-off-by: Yann Dirson <ydirson@altern.org>
+
+diff --git a/literki.conf b/literki.conf
+index 3322509..3c47bda 100644
+--- a/literki.conf
++++ b/literki.conf
+@@ -22,7 +22,7 @@ landscape_touchpad_width 440
+ landscape_touchpad_height 180
+ 
+ 
+-switcher_on yes
++switcher_on no
+ switcher_width 400
+ switcher_height 230
+ 
diff --git a/recipes/literki/literki/sliderheight.patch b/recipes/literki/literki/sliderheight.patch
new file mode 100644
index 0000000..f41b863
--- /dev/null
+++ b/recipes/literki/literki/sliderheight.patch
@@ -0,0 +1,21 @@
+commit 752db9abcce80fc2713e9892444894a86c7f59a0
+Author: Yann Dirson <ydirson@altern.org>
+Date:   Tue Aug 3 23:30:11 2010 +0200
+
+    Make slider less high to allow unlocking screen in shr.
+    
+    Signed-off-by: Yann Dirson <ydirson@altern.org>
+
+diff --git a/literki.conf b/literki.conf
+index 3c47bda..ae4219f 100644
+--- a/literki.conf
++++ b/literki.conf
+@@ -27,7 +27,7 @@ switcher_width 400
+ switcher_height 230
+ 
+ slider_width 240
+-slider_height 80
++slider_height 50
+ landscape_slider_width 240
+ landscape_slider_height 80
+ slider_dist 50
diff --git a/recipes/literki/literki_git.bb b/recipes/literki/literki_git.bb
new file mode 100644
index 0000000..ff497bb
--- /dev/null
+++ b/recipes/literki/literki_git.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Literki overlay keyboard"
+SECTION = "x11"
+LICENSE = "GPL"
+HOMEPAGE = "http://www.opkg.org/package_232.html"
+
+SRCREV = "master"
+PR = "r0.1"
+
+# TODO:
+# steal from http://users.tkk.fi/~tajyrink/moko/literki_mods/
+
+SRC_URI = "git://git.senfdax.de/git/literki;protocol=http"
+SRC_URI += "file://makefile.patch"
+SRC_URI += "file://noswitcher.patch"
+SRC_URI += "file://sliderheight.patch"
+
+PV = "${SRCPV}"
+
+DEPENDS += " \
+	freetype \
+	libxtst \
+	libxext \
+	libxrandr \
+	libpng \
+	libfakekey \
+"
+
+S = "${WORKDIR}/git"
+PACKAGES = "${PN}"
+
+inherit base
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.7.1



