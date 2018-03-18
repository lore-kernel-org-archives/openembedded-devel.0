Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E3907788FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:51 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id w128so11576654wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O4caHSjdRhK4M8MJCSFuLffoTfXUtsToKt9nxzgWZJo=;
	b=IWxxK6QRFxbTV+/5T2jmx4D+dnoJckp2/Oqsdv0LebUrEHakjCV12tvA4I7LLomh+O
	nbUls9M32ejds8ORDKXvHgGUXh2CO+71uFSzPazWy+P5X3VuFGRCCPNO9QOhX/wVoB4f
	QjLLar3P3+iY6J3zmePbwymjcrC4Ji+KcRk+fNOXg3bjiY3dkqNCzGqIuOmzNPX3V5Bo
	U2OYFIjikmn83tnN5B9PvqvZte4AUQgf77a5g8T7wbRWNrSgbB2uuovLMAkV4kxXmeAg
	w5mt5BJA/xv3GG3rdmdHUGs47YiWGLpmjW8qZa95DI40W/ZLiUl1IMp99ljf/7Ho/1/1
	1r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O4caHSjdRhK4M8MJCSFuLffoTfXUtsToKt9nxzgWZJo=;
	b=KfHaH76iPe1P7IN+nclkjoUCwqYPyifZVlRiUFwpmmbJdPhksD3TpOy+hDKoy6QWf4
	vKZxc8tL7eyYeWbNMK4QlKYic55IjKk3/OBHYYAu/As2bDsLajnWyuMbQoAHj7+QkP+S
	QiX+2GI9FtWxv98+NPq/ENRYBm3v3qN0Oc1rFVU/HDxTBhbsi2Pr33+WzB95yyrmv+Ne
	0z90m6gZvlSkeHIU1YFmQrDnno9x1WiDGx1NCa2I5E+yQsua6M+R9pwzVjZfYDZFjATF
	N81on7CfQ6momZ7VNKY8J+BBZf+/1sh8dVZ6R609ZuHjO9BPkcHahrUWdLtEYFlch1GM
	QhHw==
X-Gm-Message-State: AElRT7EdN14s5WKWDppcad3i42MXwwMkeWtJczrUDbZM3ONaS8vmY3hq
	bjuqbUu1xIOGfBxgGDfU27WOfA==
X-Google-Smtp-Source: AG47ELuQ48lW8B79UuUQfTTXjSX/FdmatT3AByUJjDW/ZBqSOk22QjVFkv/8PPXZUps1EC69xE6Ipw==
X-Received: by 10.28.215.200 with SMTP id o191mr6571983wmg.84.1521400131747;
	Sun, 18 Mar 2018 12:08:51 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:32 +0100
Message-Id: <20180318190833.1393-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] gnuplot: update 5.0.5 -> 5.2.2 and rework
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* merge gnuplot.inc to recipe - nothing else requres gnuplot.inc
* add native build required to build all kind of docs
* patches were far from applying so they were reworked:
  * subdirs.patch -> 0001...-0002...
  * lua-loadlibs-configure-in-fix.patch: Test with lua in PACKAGECONFIG without
    issues
* qt4 packageconfig was replaced by qt5 (build tested)
* make desktop file work

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot.inc       |  42 --
 ...uild-to-conversion-tools-for-native-build.patch |  31 ++
 .../gnuplot/gnuplot/0002-do-not-build-demos.patch  |  31 ++
 .../0003-Use-native-tools-to-build-docs.patch      | 111 +++++
 ...configure-option-to-find-qt5-native-tools.patch |  42 ++
 .../gnuplot/gnuplot/gnuplot.desktop                |   4 +-
 .../gnuplot/lua-loadlibs-configure-in-fix.patch    |  16 -
 .../recipes-extended/gnuplot/gnuplot/qtopia.trm    | 483 ---------------------
 .../recipes-extended/gnuplot/gnuplot/subdirs.patch |  11 -
 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb  |  14 -
 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb  |  69 +++
 11 files changed, 286 insertions(+), 568 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot.inc
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
deleted file mode 100644
index 19ee874e2..000000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Gnuplot is a portable command-line driven interactive datafile \
-(text or binary) and function plotting utility."
-HOMEPAGE = "http://www.gnuplot.info/"
-SECTION = "console/scientific"
-LICENSE = "gnuplot"
-LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
-DEPENDS = "virtual/libx11 gd readline"
-
-inherit autotools distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-acpaths = ""
-
-PACKAGECONFIG ??= "cairo"
-PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
-# there's compilation failure if qt4 is enabled
-PACKAGECONFIG[qt4] = "--with-qt,--without-qt,qt4-x11-free"
-
-EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
-                --without-tutorial \
-                --disable-wxwidgets"
-
-do_compile_prepend() {
-    install -m 0644 ${WORKDIR}/qtplot-0.2/qtopia.trm ${S}/term/
-}
-
-do_install_append() {
-    install -d ${D}${datadir}/applications/
-    install -m 0644 ${WORKDIR}/gnuplot.desktop ${D}${datadir}/applications/
-    install -d ${D}${datadir}/pixmaps/
-    install -m 0644 ${WORKDIR}/gnuplot.png ${D}${datadir}/pixmaps/
-}
-
-PACKAGES =+ "${PN}-x11-dbg ${PN}-x11"
-DESCRIPTION_${PN}-x11 = "X11 display terminal for Gnuplot."
-SECTION_${PN}-x11 = "x11/scientific"
-FILES_${PN}-x11 = "${libexecdir} ${datadir}/applications ${datadir}/pixmaps ${libdir}/X11 "
-
-FILES_${PN} += "${datadir}/texmf"
-FILES_${PN}-x11-dbg += "${libexecdir}/gnuplot/*/.debug"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
new file mode 100644
index 000000000..f8f1fd00f
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0001-reduce-build-to-conversion-tools-for-native-build.patch
@@ -0,0 +1,31 @@
+From a2ac966813fdc04b788be9c8474a4c5e36c109a0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 6 Mar 2018 21:53:26 +0100
+Subject: [PATCH] reduce build to conversion tools for native build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9241ce5..b24e291 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = config m4 term src docs man demo tutorial share
++SUBDIRS = docs
+ 
+ EXTRA_DIST = BUGS Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS README RELEASE_NOTES \
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
new file mode 100644
index 000000000..8e0b4a271
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0002-do-not-build-demos.patch
@@ -0,0 +1,31 @@
+From a2ac966813fdc04b788be9c8474a4c5e36c109a0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 6 Mar 2018 21:53:26 +0100
+Subject: [PATCH] Do not build demos
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9241ce5..b24e291 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = config m4 term src docs man demo tutorial share
++SUBDIRS = config m4 term src docs man tutorial share
+ 
+ EXTRA_DIST = BUGS Copyright FAQ.pdf GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS README RELEASE_NOTES \
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
new file mode 100644
index 000000000..a4039c317
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
@@ -0,0 +1,111 @@
+From 1128a98fd1676981e536d8773f363cb832cfa6bb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 6 Mar 2018 22:28:56 +0100
+Subject: [PATCH] Use native tools to build docs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ docs/Makefile.am | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index 3baf0c4..e82f87d 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -152,7 +152,7 @@ gnuplot-groff.ps: gnuplot.ms $(srcdir)/titlepag.ms
+ 
+ ### doc2xxx dependencies
+ gnuplot.ms: doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN) ./doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(srcdir)/titlepag.ms"
++	$(AM_V_GEN) doc2ms$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ms "$(srcdir)/titlepag.ms"
+ 
+ doc2ms_SOURCES = doc2ms.c termdoc.c
+ doc2ms_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
+@@ -173,10 +173,10 @@ pdf_figures: $(GNUPLOT_EXE) $(srcdir)/plotstyles.gnu
+ 	$(AM_V_GEN)touch $@
+ 
+ figures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN)./doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
++	$(AM_V_GEN) doc2tex$(EXEEXT) -figures $(srcdir)/gnuplot.doc $@
+ 
+ nofigures.tex: allterm.h doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN)./doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
++	$(AM_V_GEN) doc2tex$(EXEEXT) $(srcdir)/gnuplot.doc $@
+ 
+ pdf: gnuplot.pdf
+ pdf_nofig: nofigures.pdf
+@@ -256,7 +256,7 @@ gnuplot.ps: gnuplot.dvi
+ hlp: gnuplot.hlp
+ 
+ gnuplot.hlp: doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN)./doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.hlp
++	$(AM_V_GEN)doc2hlp$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.hlp
+ 
+ doc2hlp_SOURCES = doc2hlp.c termdoc.c
+ 
+@@ -264,14 +264,14 @@ doc2hlp_SOURCES = doc2hlp.c termdoc.c
+ gih: gnuplot.gih
+ 
+ gnuplot.gih: doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN)./doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
++	$(AM_V_GEN)doc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
+ 
+ doc2gih_SOURCES = doc2gih.c termdoc.c
+ 
+ # To include all terminals in the .gih file
+ allgih: alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc
+ 	@echo "generate gnuplot.gih with all terminals"
+-	$(AM_V_at)./alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
++	$(AM_V_at)alldoc2gih$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.gih
+ 
+ alldoc2gih_SOURCES = doc2gih.c termdoc.c
+ alldoc2gih_CPPFLAGS = -DALL_TERM_DOC $(AM_CPPFLAGS)
+@@ -286,7 +286,7 @@ $(srcdir)/windows/wgnuplot.hhk
+ wxhelp/wgnuplot.hhc wxhelp/wgnuplot.hhk wxhelp/*.html windows/*.png
+ 
+ wxhelp/wgnuplot.html: doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc 
+-	$(AM_V_GEN) ./doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
++	$(AM_V_GEN) doc2wxhtml$(EXEEXT) $(srcdir)/gnuplot.doc wxhelp/
+ 
+ #doc2wxhtml_SOURCES = windows/doc2html.c termdoc.c xref.c allterm.h
+ #doc2wxhtml_CPPFLAGS = -DALL_TERM_DOC -DWXHELP -I../src $(AM_CPPFLAGS)
+@@ -336,7 +336,7 @@ install-info: gnuplot.info
+ ipf: gnuplot.ipf
+ 
+ gnuplot.ipf: doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN) ./doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ipf
++	$(AM_V_GEN) doc2ipf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.ipf
+ 
+ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
+ 
+@@ -344,7 +344,7 @@ doc2ipf_SOURCES = doc2ipf.c termdoc.c xref.c
+ rtf: gnuplot.rtf
+ 
+ gnuplot.rtf: doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN) ./doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rtf
++	$(AM_V_GEN) doc2rtf$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rtf
+ 
+ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
+ 
+@@ -352,13 +352,13 @@ doc2rtf_SOURCES = doc2rtf.c termdoc.c xref.c
+ rnh: gnuplot.rnh
+ 
+ gnuplot.rnh: doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc
+-	$(AM_V_GEN) ./doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
++	$(AM_V_GEN) doc2rnh$(EXEEXT) $(srcdir)/gnuplot.doc gnuplot.rnh
+ 
+ doc2rnh_SOURCES = doc2rnh.c termdoc.c
+ 
+ # this is how to check the gnuplot.doc file
+ check-local: checkdoc$(EXEEXT)
+-	$(AM_V_at)./checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
++	$(AM_V_at)checkdoc$(EXEEXT) < $(srcdir)/gnuplot.doc; \
+ 	if test $$? -eq 0; then \
+ 	  echo "PASS: gnuplot.doc"; \
+ 	else \
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
new file mode 100644
index 000000000..7ed9e761f
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0004-Add-configure-option-to-find-qt5-native-tools.patch
@@ -0,0 +1,42 @@
+From 577e21622475fa29fd471149cf2380c53fdbfcbd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 6 Mar 2018 22:26:48 +0100
+Subject: [PATCH] Add configure option to find qt5 native tools
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Pkg-config checks for target locations. With these qt5 tools as uic/moc..
+cannot be used.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cdd831a..fdd192b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1133,11 +1133,15 @@ if test "${enable_qt}" = yes ; then
+   else
+     try_qt4=yes
+   fi
++  AC_ARG_WITH(qt5nativesysroot,
++    AC_HELP_STRING([--with-qt5nativesysroot=PATH], [prepend path - for native qt5 tools]),
++    [QT5NATIVESYSROOT="$withval"], [QT5NATIVESYSROOT=""])
++
+   if test "x${with_qt}" != "xqt4"; then
+     PKG_CHECK_MODULES_NOFAIL(QT, [Qt5Core Qt5Gui Qt5Network Qt5Svg Qt5PrintSupport])
+     if test $pkg_failed = no; then
+       try_qt4=no
+-      QT5LOC=`$PKG_CONFIG --variable=host_bins Qt5Core`
++      QT5LOC=${QT5NATIVESYSROOT}`$PKG_CONFIG --variable=host_bins Qt5Core`
+       if test "x${QT5LOC}" != "x"; then
+         UIC=${QT5LOC}/uic
+         MOC=${QT5LOC}/moc
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop b/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
index f67df9e19..1012e477f 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
@@ -1,8 +1,8 @@
 [Desktop Entry]
 Name=Gnuplot
 Comment=Plot data and function graphs
-Exec=x-terminal-emulator -e gnuplot
-Terminal=false
+Exec=gnuplot
+Terminal=true
 Type=Application
 Icon=gnuplot
 Categories=Science;
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
deleted file mode 100644
index 23f2cd26a..000000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: gnuplot-4.6.5/configure.in
-===================================================================
---- gnuplot-4.6.5.orig/configure.in
-+++ gnuplot-4.6.5/configure.in
-@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
-   fi
- 
-   if test "$with_lua" != no; then
-+    dnl check for dlopen/dl to fix loadlibs link failure
-+    AC_CHECK_FUNC([dlopen], [],
-+      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
-+    AC_SUBST(DLOPEN_LIBS)
-+    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
-     TERMLIBS="$TERMLIBS $LUA_LIBS"
-     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
-   else
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm b/meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
deleted file mode 100644
index b52f9bb97..000000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
+++ /dev/null
@@ -1,483 +0,0 @@
-/*
- * $Id: dumb.trm,v 1.16 2004/04/13 17:24:16 broeker Exp $
- *
- */
-
-/* GNUPLOT - qtopia.trm */
-
-/*[
- * Copyright 1991 - 1993, 1998, 2004   Thomas Williams, Colin Kelley
- *
- * Permission to use, copy, and distribute this software and its
- * documentation for any purpose with or without fee is hereby granted,
- * provided that the above copyright notice appear in all copies and
- * that both that copyright notice and this permission notice appear
- * in supporting documentation.
- *
- * Permission to modify the software is granted, but not the right to
- * distribute the complete modified source code.  Modifications are to
- * be distributed as patches to the released version.  Permission to
- * distribute binaries produced by compiling modified sources is granted,
- * provided you
- *   1. distribute the corresponding source modifications from the
- *    released version in the form of a patch file along with the binaries,
- *   2. add special version identification to distinguish your version
- *    in addition to the base release version number,
- *   3. provide your name and address as the primary contact for the
- *    support of your modified version, and
- *   4. retain our contact information in regard to use of the base
- *    software.
- * Permission to distribute the released version of the source code along
- * with corresponding source modifications in the form of a patch file is
- * granted with same provisions 2 through 4 for binary distributions.
- *
- * This software is provided "as is" without express or implied warranty
- * to the extent permitted by applicable law.
-]*/
-
-/*
- * This file is included by ../term.c.
- *
- * This terminal driver supports:
- *   qtopia terminals
- *
- * AUTHORS
- *   Michael Neuroth, 2004-05-16
- *           INTERNET: michael.neuroth@freenet.de
- *
- * send your comments or suggestions to (gnuplot-info@lists.sourceforge.net).
- *
- */
-#include "driver.h"
-
-#define NO_QTOPIA_ENHANCED_SUPPORT
-
-#ifdef TERM_REGISTER
-register_term(qtopia_driver)
-#endif
-
-#ifdef TERM_PROTO
-TERM_PUBLIC void QTOPIA_options __PROTO((void));
-TERM_PUBLIC void QTOPIA_init __PROTO((void));
-TERM_PUBLIC void QTOPIA_graphics __PROTO((void));
-TERM_PUBLIC void QTOPIA_text __PROTO((void));
-TERM_PUBLIC void QTOPIA_reset __PROTO((void));
-TERM_PUBLIC void QTOPIA_linetype __PROTO((int linetype));
-TERM_PUBLIC void QTOPIA_move __PROTO((unsigned int x, unsigned int y));
-TERM_PUBLIC void QTOPIA_point __PROTO((unsigned int x, unsigned int y,
-				     int point));
-TERM_PUBLIC void QTOPIA_vector __PROTO((unsigned int x, unsigned int y));
-TERM_PUBLIC void QTOPIA_put_text __PROTO((unsigned int x, unsigned int y,
-					const char *str));
-TERM_PUBLIC void QTOPIA_arrow __PROTO((unsigned int sx, unsigned int sy,
-				     unsigned int ex, unsigned int ey,
-				     int head));
-
-#define ENHqtopia_put_text NULL
-
-
-#define QTOPIA_XMAX 4096
-#define QTOPIA_YMAX 4096
-
-#ifdef ZAURUS
-#define QTOPIA_VCHAR (QTOPIA_YMAX/25)
-#define QTOPIA_HCHAR (QTOPIA_XMAX/40)
-#define QTOPIA_VTIC (QTOPIA_YMAX/50)
-#define QTOPIA_HTIC (QTOPIA_XMAX/40)
-#else
-#define QTOPIA_VCHAR (QTOPIA_YMAX/25)
-#define QTOPIA_HCHAR (QTOPIA_XMAX/50)
-#define QTOPIA_VTIC (QTOPIA_YMAX/100)
-#define QTOPIA_HTIC (QTOPIA_XMAX/150)
-#endif
-
-#endif /* TERM_PROTO */
-
-#ifdef TERM_BODY
-
-/*#include <winsock2.h>*/
-/* needs: ws2_32.lib */
-#ifndef _MSC_VER
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <netinet/in.h>
-#include <arpa/inet.h>
-#endif
-
-#define QTOPIA_MAX_BUFFER		512
-#define QTOPIA_MAX_DELAY_COUNT	20	/* * 100 ms = 2 s */
-
-#ifdef _MSC_VER
-#define QTOPIA_BAD_SOCKET		INVALID_SOCKET		/* -1 */
-#define QTOPIA_BAD_CONNECT		SOCKET_ERROR
-#else
-#define QTOPIA_BAD_SOCKET		-1
-#define QTOPIA_BAD_CONNECT		-1
-#endif
-#define QTOPIA_PORT_NO			5050
-
-static int qtopia_client_socket = QTOPIA_BAD_SOCKET;
-static unsigned short qtopia_port_no = QTOPIA_PORT_NO;
-static char qtopia_host_name[QTOPIA_MAX_BUFFER+1] = { "localhost" };
-
-static int OpenClient __PROTO(( int test));
-static void CloseClient();
-
-static void MySleep( delay )
-int delay;
-{
-#ifdef _MSC_VER
-	Sleep( delay );
-#else
-	usleep( delay );
-#endif
-}
-
-static void InitSockets()
-{
-#ifdef _MSC_VER
-	WORD wVersionRequested;
-	WSADATA wsaData;
-	int err;
-
-	wVersionRequested = MAKEWORD( 2, 2 );
-
-	err = WSAStartup( wVersionRequested, &wsaData );
-#endif
-}
-
-static void ExitSockets()
-{
-#ifdef _MSC_VER
-	WSACleanup();
-#endif
-}
-
-static int CheckForQtplot( count )
-int count;
-{
-	/* test (via sockets) if qtplot is allready running */
-	if( !OpenClient( 1 ) )
-	{
-		/* give qtplot a litle bit time to start... */
-		if( count < QTOPIA_MAX_DELAY_COUNT )
-		{
-			if( count == 0 )
-			{
-#ifdef _MSC_VER
-				system( "start qtplot" );
-#else
-				system( "qtplot&" );
-#endif
-			}
-		
-			MySleep(100);
-
-			return CheckForQtplot( count+1 );
-		}
-		else
-		{
-			return 0;
-		}
-	}
-	else
-	{
-		CloseClient();
-
-		return 1;
-	}
-}
-
-static int OpenClient( test )
-int test;
-{
-    int len;
-    struct sockaddr_in address;
-    int result;
-
-	/*  Create a socket for the client.  */
-
-    qtopia_client_socket = socket(AF_INET, SOCK_STREAM, 0);
-
-	if( qtopia_client_socket != QTOPIA_BAD_SOCKET )
-	{
-		/*  Name the socket, as agreed with the server.  */
-
-		address.sin_family = AF_INET;
-		address.sin_addr.s_addr = inet_addr(/*qtopia_host_name*/"127.0.0.1");	/* localhost */
-		address.sin_port = htons(qtopia_port_no);
-		len = sizeof(address);
-
-		/*  Now connect our socket to the server's socket.  */
-
-		result = connect(qtopia_client_socket, (struct sockaddr *)&address, len);
-		
-		if( result == QTOPIA_BAD_SOCKET )
-		{
-			/* mark this socket as bad */
-
-			close( qtopia_client_socket );
-
-			qtopia_client_socket = QTOPIA_BAD_SOCKET;
-
-			if( !test )
-			{
-				fprintf( gpoutfile, "error connecting to server !\n" );
-			}
-			return 0;	/* something went wrong */
-		}
-	}
-	else
-	{
-		if( !test )
-		{
-			fprintf( gpoutfile, "error creating socket !\n" );
-		}
-		return 0;	/* something went wrong */
-	}
-
-	return 1;	/* everything ist ok ! */
-}
-
-static void CloseClient()
-{
-    close( qtopia_client_socket );
-}
-
-static int IsClientOk()
-{
-	return qtopia_client_socket != QTOPIA_BAD_SOCKET;
-}
-
-static void SendDataToSocket( sLine )
-const char * sLine;
-{
-	if( IsClientOk() )
-	{
-		int send_count;
-
-		send_count = send( qtopia_client_socket, sLine, strlen( sLine ), 0 );
-
-		if( send_count <= 0 )
-		{
-			fprintf( gpoutfile, "error writing to socket str=%s!\n", sLine );
-		}
-		/*
-		else
-		{
-			fprintf( gpoutfile, "wrote %d bytes\n", send_count );
-		}
-		*/
-	}
-	else
-	{
-		/* for testing... */
-		/*fprintf( gpoutfile, sLine );*/
-	}
-}
-
-/* ************************************************** */
-
-enum QTOPIA_id { QTOPIA_PORT, QTOPIA_HOST, QTOPIA_OTHER };
-
-static struct gen_table QTOPIA_opts[] =
-{
-    { "po$rt", QTOPIA_PORT },
-    { "ho$st", QTOPIA_HOST },
-    { NULL, QTOPIA_OTHER }
-};
-
-TERM_PUBLIC void
-QTOPIA_options()
-{
-    /* this is not for the qtopia terminal ! */
-	/*SendDataToSocket( "qtd options\n" );*/
-
-    int x, y;
-    struct value a;
-
-    while (!END_OF_COMMAND) 
-	{
-		switch(lookup_table(&QTOPIA_opts[0],c_token)) 
-		{
-			case QTOPIA_PORT:
-				c_token++;
-				if (END_OF_COMMAND)
-					int_error(c_token, "expecting port number");
-				qtopia_port_no = (int) real(const_express(&a));
-				break;
-			case QTOPIA_HOST:
-				c_token++;
-				if (END_OF_COMMAND)
-					int_error(c_token, "expecting host name");
-				if (isstring(c_token))
-					quote_str( qtopia_host_name, c_token, sizeof(qtopia_host_name) );
-				else
- 					copy_str( qtopia_host_name, c_token, sizeof(qtopia_host_name) );
-				c_token++;
-				break;
-			case QTOPIA_OTHER:
-			default:
-				break;
-		}
-    }
-
-    sprintf(term_options, "host=%s port=%d",qtopia_host_name,qtopia_port_no);
-}
-
-
-TERM_PUBLIC void
-QTOPIA_init()
-{
-	/* initialize lib (if necassary) */
-	InitSockets();
-	CheckForQtplot( 0 );
-	OpenClient( 0 ); 
-
-	SendDataToSocket( "qtd init\n" );
-}
-
-
-TERM_PUBLIC void
-QTOPIA_graphics()
-{
-	SendDataToSocket( "qtd graphics\n" );
-}
-
-TERM_PUBLIC void
-QTOPIA_text()
-{
-	SendDataToSocket( "qtd text\n" );
-}
-
-
-TERM_PUBLIC void
-QTOPIA_reset()
-{
-	SendDataToSocket( "qtd reset\n" );
-
-	/* give the qtplot a litle bit time to shutdown */
-	MySleep(100);
-
-	CloseClient();
-	ExitSockets();
-}
-
-
-TERM_PUBLIC void
-QTOPIA_linetype(linetype)
-int linetype;
-{
-	char sBuffer[QTOPIA_MAX_BUFFER];
-
-	sprintf( sBuffer, "qtd linetype type=%d\n",linetype );
-
-	SendDataToSocket( sBuffer );
-}
-
-
-TERM_PUBLIC void
-QTOPIA_move(x, y)
-unsigned int x, y;
-{
-	char sBuffer[QTOPIA_MAX_BUFFER];
-
-	sprintf( sBuffer, "qtd move x=%d y=%d\n",x,y );
-
-	SendDataToSocket( sBuffer );
-}
-
-
-TERM_PUBLIC void
-QTOPIA_point(x, y, point)
-unsigned int x, y;
-int point;
-{
-	char sBuffer[QTOPIA_MAX_BUFFER];
-
-	sprintf( sBuffer, "qtd point x=%d y=%d point=%d\n",x,y,point );
-
-	SendDataToSocket( sBuffer );
-}
-
-
-TERM_PUBLIC void
-QTOPIA_vector(_x, _y)
-unsigned int _x, _y;
-{
-	char sBuffer[QTOPIA_MAX_BUFFER];
-
-	sprintf( sBuffer, "qtd vector x=%d y=%d\n",_x,_y );
-
-	SendDataToSocket( sBuffer );
-}
-
-
-TERM_PUBLIC void
-QTOPIA_put_text(x, y, str)
-unsigned int x, y;
-const char *str;
-{
-	char sBuffer[QTOPIA_MAX_BUFFER];
-
-	sprintf( sBuffer, "qtd put_text x=%d y=%d str=%s\n",x,y,str );
-
-	SendDataToSocket( sBuffer );
-}
-
-/* not suported yet ! */
-TERM_PUBLIC void
-QTOPIA_arrow(sx, sy, ex, ey, head)
-    unsigned int sx, sy, ex, ey;
-    int head;		/* ignored */
-{
-	char sBuffer[QTOPIA_MAX_BUFFER];
-
-	sprintf( sBuffer, "qtd arrow sx=%d sy=%d ex=%d ey=%d head=%d\n",sx,sy,ex,ey,head );
-
-	SendDataToSocket( sBuffer );
-}
-
-
-#endif /* TERM_BODY */
-
-#ifdef TERM_TABLE
-TERM_TABLE_START(qtopia_driver)
-    "qtopia", "qtopia or Qt",
-    QTOPIA_XMAX, QTOPIA_YMAX, QTOPIA_VCHAR, QTOPIA_HCHAR,
-    QTOPIA_VTIC, QTOPIA_HTIC, QTOPIA_options, QTOPIA_init, QTOPIA_reset,
-    QTOPIA_text, null_scale, QTOPIA_graphics, QTOPIA_move, QTOPIA_vector,
-    QTOPIA_linetype, QTOPIA_put_text, null_text_angle,
-    null_justify_text, QTOPIA_point, /*QTOPIA_arrow*/0, set_font_null,
-    0,				/* pointsize */
-    TERM_CAN_MULTIPLOT,
-    NULL, NULL, NULL, NULL
-#ifdef USE_MOUSE
-    , NULL, NULL, NULL, NULL, NULL
-#endif
-#ifdef PM3D
-    , NULL, NULL, NULL, NULL
-#endif
-TERM_TABLE_END(qtopia_driver)
-
-#undef LAST_TERM
-#define LAST_TERM qtopia_driver
-
-#endif /* TERM_TABLE */
-
-#ifdef TERM_HELP
-START_HELP(qtopia)
-"1 qtopia",
-"?commands set terminal qtopia",
-"?set terminal qtopia",
-"?set term qtopia",
-"?terminal qtopia",
-"?term qtopia",
-"?qtopia",
-" The `qtopia` terminal driver has no additional options.",
-"",
-" Syntax:",
-"       set terminal qtopia",
-""
-END_HELP(qtopia)
-#endif /* TERM_HELP */
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
deleted file mode 100644
index 8c7d1f0d3..000000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/Makefile.am	2007-08-23 13:10:15.560659023 +0200
-+++ gnuplot-4.2.0/Makefile.am	2007-08-23 13:10:34.961764629 +0200
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in -*-Makefile-*-
- AUTOMAKE_OPTIONS = foreign 1.2h
- 
--SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
-+SUBDIRS = config m4 term src  $(LISPDIR) man share
- 
- EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
deleted file mode 100644
index 42308ba0b..000000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gnuplot.inc
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
-    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
-    file://subdirs.patch \
-    file://lua-loadlibs-configure-in-fix.patch \
-    file://gnuplot.desktop \
-    file://gnuplot.png \
-"
-
-SRC_URI[archive.md5sum] = "c5e96fca73afbee4f57cbc1bfce6b3b8"
-SRC_URI[archive.sha256sum] = "25f3e0bf192e01115c580f278c3725d7a569eb848786e12b455a3fda70312053"
-SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
-SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
new file mode 100644
index 000000000..4cc289d3a
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
@@ -0,0 +1,69 @@
+SUMMARY = "Gnuplot is a portable command-line driven graphing utility"
+DESCRIPTION = "Gnuplot is a portable command-line driven interactive datafile \
+(text or binary) and function plotting utility."
+HOMEPAGE = "http://www.gnuplot.info/"
+SECTION = "console/scientific"
+LICENSE = "gnuplot"
+LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
+DEPENDS = "${BPN}-native virtual/libx11 gd readline"
+
+inherit autotools distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
+    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
+    file://gnuplot.desktop \
+    file://gnuplot.png \
+"
+SRC_URI_append_class-target = " \
+    file://0002-do-not-build-demos.patch \
+    file://0003-Use-native-tools-to-build-docs.patch \
+    file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
+"
+
+SRC_URI[archive.md5sum] = "60aedd08998160593199459dea8467fe"
+SRC_URI[archive.sha256sum] = "a416d22f02bdf3873ef82c5eb7f8e94146795811ef808e12b035ada88ef7b1a1"
+SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
+SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
+
+# for building docs (they deserve it) we need *doc2* tools native
+BBCLASSEXTEND = "native"
+DEPENDS_class-native = "readline-native"
+PACKAGECONFIG_class-native = ""
+
+SRC_URI_append_class-native = "file://0001-reduce-build-to-conversion-tools-for-native-build.patch"
+
+do_install_class-native() {
+    install -d ${D}${bindir}
+	install ${B}/docs/*doc* ${D}${bindir}
+    rm ${D}${bindir}/*.o
+}
+
+PACKAGECONFIG ??= "cairo"
+PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
+PACKAGECONFIG[qt5] = "--with-qt --with-qt5nativesysroot=${STAGING_DIR_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
+
+EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
+                --without-tutorial \
+                --disable-wxwidgets"
+
+do_compile_prepend() {
+    install -m 0644 ${WORKDIR}/qtplot-0.2/qtopia.trm ${S}/term/
+}
+
+do_install_append_class-target() {
+    install -d ${D}${datadir}/applications/
+    install -m 0644 ${WORKDIR}/gnuplot.desktop ${D}${datadir}/applications/
+    install -d ${D}${datadir}/pixmaps/
+    install -m 0644 ${WORKDIR}/gnuplot.png ${D}${datadir}/pixmaps/
+}
+
+PACKAGES =+ "${PN}-x11-dbg ${PN}-x11"
+DESCRIPTION_${PN}-x11 = "X11 display terminal for Gnuplot."
+SECTION_${PN}-x11 = "x11/scientific"
+FILES_${PN}-x11 = "${libexecdir} ${datadir}/applications ${datadir}/pixmaps ${libdir}/X11 "
+
+FILES_${PN} += "${datadir}/texmf"
+FILES_${PN}-x11-dbg += "${libexecdir}/gnuplot/*/.debug"
-- 
2.14.3


