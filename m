Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Llu1a-0007Ly-14
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 00:57:46 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id EBABA2FAB4F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 19:56:20 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 23 Mar 2009 19:56:20 -0400
X-Sasl-enc: T3jerzY+dGFhlVptEKTE81Ylyz9IXPURNx1us6lXPLgY 1237852579
Received: from [192.168.178.120] (p54838CA4.dip0.t-ipconnect.de
	[84.131.140.164])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 8DC1E7760
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 19:56:19 -0400 (EDT)
Date: Tue, 24 Mar 2009 00:56:16 +0100 (CET)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gfu0cg$2tl$1@ger.gmane.org>
Message-ID: <alpine.LNX.2.00.0903240053420.16464@asterix.crazy-teaparty.dyndns.org>
References: <200811060040.45197.vjensen@gmx.de>
	<b6ebd0a50811051833l4fb50bb3v973618c9f722ac65@mail.gmail.com>
	<gf14m5$sdl$1@ger.gmane.org> <gfu0cg$2tl$1@ger.gmane.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
Subject: [PATCH] htmldoc: new recipes
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
X-List-Received-Date: Mon, 23 Mar 2009 23:57:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

HTMLDOC converts HTML input files into indexed HTML, postscript
or PDF files.  These recipes build version 1.8.27 and 1.9.x-r1571
of htmldoc.

Updated version creating -doc and -gui packages for 1.8.27, too.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/checksums.ini                            |    8 ++
 recipes/htmldoc/files/paths_1.8.27.patch      |  109 +++++++++++++++++++++++++
 recipes/htmldoc/files/paths_1.9.x.patch       |  109 +++++++++++++++++++++++++
 recipes/htmldoc/htmldoc-gui_1.8.27.bb         |   24 ++++++
 recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb    |   24 ++++++
 recipes/htmldoc/htmldoc-native_1.8.27.bb      |   34 ++++++++
 recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb |   34 ++++++++
 recipes/htmldoc/htmldoc.inc                   |    6 ++
 recipes/htmldoc/htmldoc_1.8.27.bb             |   22 +++++
 recipes/htmldoc/htmldoc_1.9.x-r1571.bb        |   22 +++++
 10 files changed, 392 insertions(+), 0 deletions(-)
 create mode 100644 recipes/htmldoc/files/paths_1.8.27.patch
 create mode 100644 recipes/htmldoc/files/paths_1.9.x.patch
 create mode 100644 recipes/htmldoc/htmldoc-gui_1.8.27.bb
 create mode 100644 recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb
 create mode 100644 recipes/htmldoc/htmldoc-native_1.8.27.bb
 create mode 100644 recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb
 create mode 100644 recipes/htmldoc/htmldoc.inc
 create mode 100644 recipes/htmldoc/htmldoc_1.8.27.bb
 create mode 100644 recipes/htmldoc/htmldoc_1.9.x-r1571.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9142329..81651b4 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -10126,6 +10126,14 @@ sha256=acfda369dff72b9073a8b70f2b05b1397a61a1cdb23970e5ed216d632ff33586
 md5=1713d9a4941120235cb0721ceba6493b
 sha256=acfda369dff72b9073a8b70f2b05b1397a61a1cdb23970e5ed216d632ff33586

+[http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/1.8.27/htmldoc-1.8.27-source.tar.bz2]
+md5=35589e7b8fe9c54e11be87cd5aec4dcc
+sha256=89ffd223734268375dc959c200622dc5f167576c5cad9d7ce4bd7567faeb9613
+
+[http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-1.9.x-r1571.tar.bz2]
+md5=eda75ba1abe14ed8e71c6f40438def85
+sha256=b4c78ff6b47521e980533e52cbe46fe86874c75b3d6bc18bcc2500a2ba854c3e
+
 [http://downloads.sourceforge.net/htop/htop-0.7.tar.gz]
 md5=4afc961fa709167e1b434682897991f9
 sha256=1361f4f0b92d7e6bdac25a4b7ee138a7ee83b5a9368820f5aa518051ca82862b
diff --git a/recipes/htmldoc/files/paths_1.8.27.patch b/recipes/htmldoc/files/paths_1.8.27.patch
new file mode 100644
index 0000000..96cfde6
--- /dev/null
+++ b/recipes/htmldoc/files/paths_1.8.27.patch
@@ -0,0 +1,109 @@
+diff -Naur a/Makedefs.in b/Makedefs.in
+--- a/Makedefs.in	2005-10-28 22:32:59.000000000 +0200
++++ b/Makedefs.in	2009-03-23 23:40:35.928865178 +0100
+@@ -46,6 +46,7 @@
+ #
+ # Directories...
+ #
++DESTDIR = @DESTDIR@
+ 
+ bindir		=	@bindir@
+ datadir		=	@datadir@
+diff -Naur a/data/Makefile b/data/Makefile
+--- a/data/Makefile	2004-05-10 03:14:53.000000000 +0200
++++ b/data/Makefile	2009-03-23 23:35:27.850856359 +0100
+@@ -53,11 +53,11 @@
+ #
+ 
+ install:
+-	if [ ! -d $(datadir)/htmldoc/data ]; then\
+-		$(MKDIR) $(datadir)/htmldoc/data;\
++	if [ ! -d $(DESTDIR)$(datadir)/htmldoc/data ]; then\
++		$(MKDIR) $(DESTDIR)$(datadir)/htmldoc/data;\
+ 	fi
+-	$(CP) $(FILES) $(datadir)/htmldoc/data
+-	$(CHMOD) ugo+r $(datadir)/htmldoc/data/*
++	$(CP) $(FILES) $(DESTDIR)$(datadir)/htmldoc/data
++	$(CHMOD) ugo+r $(DESTDIR)$(datadir)/htmldoc/data/*
+ 
+ 
+ #
+diff -Naur a/doc/Makefile b/doc/Makefile
+--- a/doc/Makefile	2005-10-28 22:32:59.000000000 +0200
++++ b/doc/Makefile	2009-03-23 23:38:19.478865122 +0100
+@@ -42,7 +42,7 @@
+ DOCUMENTS =	htmldoc.html htmldoc.pdf htmldoc.ps
+ DOCFILES =	help.html htmldoc.pdf
+ 
+-HTMLDOC	=	../htmldoc/htmldoc$(EXEEXT) --datadir .. --strict --verbose
++HTMLDOC	=	htmldoc$(EXEEXT) --datadir .. --strict --verbose
+ 
+ 
+ #
+@@ -57,16 +57,16 @@
+ #
+ 
+ install: $(DOCUMENTS)
+-	if [ ! -d $(datadir)/doc/htmldoc ]; then\
+-		$(MKDIR) $(datadir)/doc/htmldoc;\
++	if [ ! -d $(DESTDIR)$(datadir)/doc/htmldoc ]; then\
++		$(MKDIR) $(DESTDIR)$(datadir)/doc/htmldoc;\
+ 	fi
+-	$(CP) $(DOCFILES) $(datadir)/doc/htmldoc
+-	$(CHMOD) ugo+r $(datadir)/doc/htmldoc/*
+-	if [ ! -d $(mandir)/man1 ]; then\
+-		$(MKDIR) $(mandir)/man1;\
++	$(CP) $(DOCFILES) $(DESTDIR)$(datadir)/doc/htmldoc
++	$(CHMOD) ugo+r $(DESTDIR)$(datadir)/doc/htmldoc/*
++	if [ ! -d $(DESTDIR)$(mandir)/man1 ]; then\
++		$(MKDIR) $(DESTDIR)$(mandir)/man1;\
+ 	fi
+-	$(CP) htmldoc.man $(mandir)/man1/htmldoc.1
+-	$(CHMOD) ugo+r $(mandir)/man1/htmldoc.1
++	$(CP) htmldoc.man $(DESTDIR)$(mandir)/man1/htmldoc.1
++	$(CHMOD) ugo+r $(DESTDIR)$(mandir)/man1/htmldoc.1
+ 
+ 
+ #
+diff -Naur a/fonts/Makefile b/fonts/Makefile
+--- a/fonts/Makefile	2005-10-28 22:32:59.000000000 +0200
++++ b/fonts/Makefile	2009-03-23 23:39:07.608863524 +0100
+@@ -75,14 +75,14 @@
+ 
+ install:
+ 	echo "Installing font files in $(datadir)/htmldoc/fonts..."
+-	if [ ! -d $(datadir)/htmldoc/fonts ]; then\
+-		$(MKDIR) $(datadir)/htmldoc/fonts;\
++	if [ ! -d $(DESTDIR)$(datadir)/htmldoc/fonts ]; then\
++		$(MKDIR) $(DESTDIR)$(datadir)/htmldoc/fonts;\
+ 	fi
+ 	for font in $(FONTS); do \
+-		$(CP) $$font.afm $(datadir)/htmldoc/fonts; \
+-		$(CP) $$font.pfa $(datadir)/htmldoc/fonts; \
++		$(CP) $$font.afm $(DESTDIR)$(datadir)/htmldoc/fonts; \
++		$(CP) $$font.pfa $(DESTDIR)$(datadir)/htmldoc/fonts; \
+ 	done
+-	$(CHMOD) ugo+r $(datadir)/htmldoc/fonts/*
++	$(CHMOD) ugo+r $(DESTDIR)$(datadir)/htmldoc/fonts/*
+ 
+ 
+ #
+diff -Naur a/htmldoc/Makefile b/htmldoc/Makefile
+--- a/htmldoc/Makefile	2005-10-28 22:32:59.000000000 +0200
++++ b/htmldoc/Makefile	2009-03-23 23:40:02.078914179 +0100
+@@ -50,11 +50,11 @@
+ #
+ 
+ install:	all
+-	if [ ! -d $(bindir) ]; then\
+-		$(MKDIR) $(bindir);\
++	if [ ! -d $(DESTDIR)$(bindir) ]; then\
++		$(MKDIR) $(DESTDIR)$(bindir);\
+ 	fi
+-	cp htmldoc$(EXEEXT) $(bindir)
+-	chmod ugo+rx $(bindir)/htmldoc$(EXEEXT)
++	cp htmldoc$(EXEEXT) $(DESTDIR)$(bindir)
++	chmod ugo+rx $(DESTDIR)$(bindir)/htmldoc$(EXEEXT)
+ 
+ 
+ #
diff --git a/recipes/htmldoc/files/paths_1.9.x.patch b/recipes/htmldoc/files/paths_1.9.x.patch
new file mode 100644
index 0000000..f05e405
--- /dev/null
+++ b/recipes/htmldoc/files/paths_1.9.x.patch
@@ -0,0 +1,109 @@
+diff -Naur a/data/Makefile b/data/Makefile
+--- a/data/Makefile	2008-01-06 02:55:59.000000000 +0100
++++ b/data/Makefile	2008-11-16 20:02:56.000000000 +0100
+@@ -51,11 +51,11 @@
+ #
+ 
+ install:
+-	if [ ! -d $(datadir)/htmldoc/data ]; then\
+-		$(MKDIR) $(datadir)/htmldoc/data;\
++	if [ ! -d $(DESTDIR)$(datadir)/htmldoc/data ]; then\
++		$(MKDIR) $(DESTDIR)$(datadir)/htmldoc/data;\
+ 	fi
+-	$(CP) $(FILES) $(datadir)/htmldoc/data
+-	$(CHMOD) ugo+r $(datadir)/htmldoc/data/*
++	$(CP) $(FILES) $(DESTDIR)$(datadir)/htmldoc/data
++	$(CHMOD) ugo+r $(DESTDIR)$(datadir)/htmldoc/data/*
+ 
+ 
+ #
+diff -Naur a/doc/Makefile b/doc/Makefile
+--- a/doc/Makefile	2008-01-06 02:55:59.000000000 +0100
++++ b/doc/Makefile	2008-11-16 20:04:06.000000000 +0100
+@@ -57,7 +57,7 @@
+ DOCUMENTS =	htmldoc.html htmldoc.pdf htmldoc.ps
+ DOCFILES =	htmldoc.pdf
+ 
+-HTMLDOC	=	HTMLDOC_DATA=".." ../htmldoc/htmldoc$(EXEEXT) --strict --verbose
++HTMLDOC	=	HTMLDOC_DATA=".." htmldoc$(EXEEXT) --strict --verbose
+ 
+ 
+ #
+@@ -72,16 +72,16 @@
+ #
+ 
+ install: $(DOCUMENTS)
+-	if [ ! -d $(datadir)/doc/htmldoc ]; then\
+-		$(MKDIR) $(datadir)/doc/htmldoc;\
++	if [ ! -d $(DESTDIR)$(datadir)/doc/htmldoc ]; then\
++		$(MKDIR) $(DESTDIR)$(datadir)/doc/htmldoc;\
+ 	fi
+-	$(CP) $(DOCFILES) $(datadir)/doc/htmldoc
+-	$(CHMOD) ugo+r $(datadir)/doc/htmldoc/*
+-	if [ ! -d $(mandir)/man1 ]; then\
+-		$(MKDIR) $(mandir)/man1;\
++	$(CP) $(DOCFILES) $(DESTDIR)$(datadir)/doc/htmldoc
++	$(CHMOD) ugo+r $(DESTDIR)$(datadir)/doc/htmldoc/*
++	if [ ! -d $(DESTDIR)$(mandir)/man1 ]; then\
++		$(MKDIR) $(DESTDIR)$(mandir)/man1;\
+ 	fi
+-	$(CP) htmldoc.man $(mandir)/man1/htmldoc.1
+-	$(CHMOD) ugo+r $(mandir)/man1/htmldoc.1
++	$(CP) htmldoc.man $(DESTDIR)$(mandir)/man1/htmldoc.1
++	$(CHMOD) ugo+r $(DESTDIR)$(mandir)/man1/htmldoc.1
+ 
+ 
+ #
+diff -Naur a/fonts/Makefile b/fonts/Makefile
+--- a/fonts/Makefile	2008-01-06 02:55:59.000000000 +0100
++++ b/fonts/Makefile	2008-11-16 20:04:08.000000000 +0100
+@@ -73,14 +73,14 @@
+ 
+ install:
+ 	echo "Installing font files in $(datadir)/htmldoc/fonts..."
+-	if test ! -d $(datadir)/htmldoc/fonts; then\
+-		$(MKDIR) $(datadir)/htmldoc/fonts;\
++	if test ! -d $(DESTDIR)$(datadir)/htmldoc/fonts; then\
++		$(MKDIR) $(DESTDIR)$(datadir)/htmldoc/fonts;\
+ 	fi
+ 	for font in $(FONTS); do \
+-		$(CP) $$font.afm $(datadir)/htmldoc/fonts; \
+-		$(CP) $$font.pfa $(datadir)/htmldoc/fonts; \
++		$(CP) $$font.afm $(DESTDIR)$(datadir)/htmldoc/fonts; \
++		$(CP) $$font.pfa $(DESTDIR)$(datadir)/htmldoc/fonts; \
+ 	done
+-	$(CHMOD) ugo+r $(datadir)/htmldoc/fonts/*
++	$(CHMOD) ugo+r $(DESTDIR)$(datadir)/htmldoc/fonts/*
+ 
+ 
+ #
+diff -Naur a/htmldoc/Makefile b/htmldoc/Makefile
+--- a/htmldoc/Makefile	2008-03-01 19:18:52.000000000 +0100
++++ b/htmldoc/Makefile	2008-11-16 20:05:12.000000000 +0100
+@@ -104,11 +104,11 @@
+ #
+ 
+ install:	all
+-	if [ ! -d $(bindir) ]; then\
+-		$(MKDIR) $(bindir);\
++	if [ ! -d $(DESTDIR)$(bindir) ]; then\
++		$(MKDIR) $(DESTDIR)$(bindir);\
+ 	fi
+-	cp htmldoc$(EXEEXT) $(bindir)
+-	chmod ugo+rx $(bindir)/htmldoc$(EXEEXT)
++	cp htmldoc$(EXEEXT) $(DESTDIR)$(bindir)
++	chmod ugo+rx $(DESTDIR)$(bindir)/htmldoc$(EXEEXT)
+ 
+ 
+ #
+diff -Naur a/Makedefs.in b/Makedefs.in
+--- a/Makedefs.in	2008-03-01 19:18:52.000000000 +0100
++++ b/Makedefs.in	2008-11-16 20:00:34.000000000 +0100
+@@ -45,6 +45,7 @@
+ #
+ # Directories...
+ #
++DESTDIR = @DESTDIR@
+ 
+ bindir		=	@bindir@
+ datadir		=	@datadir@
diff --git a/recipes/htmldoc/htmldoc-gui_1.8.27.bb b/recipes/htmldoc/htmldoc-gui_1.8.27.bb
new file mode 100644
index 0000000..339c484
--- /dev/null
+++ b/recipes/htmldoc/htmldoc-gui_1.8.27.bb
@@ -0,0 +1,24 @@
+require htmldoc.inc
+DEPENDS += "htmldoc-native fltk"
+PR = "r2"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/${PV}/htmldoc-${PV}-source.tar.bz2 \
+file://paths_1.8.27.patch;patch=1"
+
+
+S = "${WORKDIR}/htmldoc-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=yes"
+
+FILES_${PN} += "${datadir}/htmldoc/fonts"
+FILES_${PN} += "${datadir}/htmldoc/data"
+
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
diff --git a/recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb b/recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb
new file mode 100644
index 0000000..f2315c5
--- /dev/null
+++ b/recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb
@@ -0,0 +1,24 @@
+require htmldoc.inc
+DEPENDS += "htmldoc-native fltk"
+PR = "r2"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
+file://paths_1.9.x.patch;patch=1"
+
+
+S = "${WORKDIR}/htmldoc-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=yes"
+
+FILES_${PN} += "${datadir}/htmldoc/fonts"
+FILES_${PN} += "${datadir}/htmldoc/data"
+
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
diff --git a/recipes/htmldoc/htmldoc-native_1.8.27.bb b/recipes/htmldoc/htmldoc-native_1.8.27.bb
new file mode 100644
index 0000000..b1cd62f
--- /dev/null
+++ b/recipes/htmldoc/htmldoc-native_1.8.27.bb
@@ -0,0 +1,34 @@
+require htmldoc.inc
+PR = "r2"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/${PV}/htmldoc-${PV}-source.tar.bz2 \
+file://paths_1.8.27.patch;patch=1"
+
+
+inherit autotools native
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=no"
+
+
+do_compile() {
+	cd htmldoc && oe_runmake all ; cd ${S}
+}
+
+
+do_stage () {
+	install -d ${STAGING_DATADIR}/htmldoc/fonts
+	install -m 0644 ${S}/fonts/*.afm ${STAGING_DATADIR}/htmldoc/fonts/
+	install -m 0644 ${S}/fonts/*.pfa ${STAGING_DATADIR}/htmldoc/fonts/
+
+	install -d ${STAGING_DATADIR}/htmldoc/data
+	install -m 0644 ${S}/data/* ${STAGING_DATADIR}/htmldoc/data/
+
+	install -d ${STAGING_DIR_HOST}${layout_mandir}/man1
+	install -m 0644 ${S}/doc/htmldoc.man ${STAGING_DIR_HOST}${layout_mandir}/man1/
+
+	install -d ${STAGING_BINDIR}
+	install -m 0755 ${S}/htmldoc/htmldoc ${STAGING_BINDIR}/
+}
diff --git a/recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb b/recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb
new file mode 100644
index 0000000..ee2ffd9
--- /dev/null
+++ b/recipes/htmldoc/htmldoc-native_1.9.x-r1571.bb
@@ -0,0 +1,34 @@
+require htmldoc.inc
+PR = "r2"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
+file://paths_1.9.x.patch;patch=1"
+
+
+inherit autotools native
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=no"
+
+
+do_compile() {
+	cd htmldoc && oe_runmake all ; cd ${S}
+}
+
+
+do_stage () {
+	install -d ${STAGING_DATADIR}/htmldoc/fonts
+	install -m 0644 ${S}/fonts/*.afm ${STAGING_DATADIR}/htmldoc/fonts/
+	install -m 0644 ${S}/fonts/*.pfa ${STAGING_DATADIR}/htmldoc/fonts/
+
+	install -d ${STAGING_DATADIR}/htmldoc/data
+	install -m 0644 ${S}/data/* ${STAGING_DATADIR}/htmldoc/data/
+
+	install -d ${STAGING_DIR_HOST}${layout_mandir}/man1
+	install -m 0644 ${S}/doc/htmldoc.man ${STAGING_DIR_HOST}${layout_mandir}/man1/
+
+	install -d ${STAGING_BINDIR}
+	install -m 0755 ${S}/htmldoc/htmldoc ${STAGING_BINDIR}/
+}
diff --git a/recipes/htmldoc/htmldoc.inc b/recipes/htmldoc/htmldoc.inc
new file mode 100644
index 0000000..0a9a540
--- /dev/null
+++ b/recipes/htmldoc/htmldoc.inc
@@ -0,0 +1,6 @@
+DESCRIPTION = "HTMLDOC converts HTML input files into indexed HTML, postscript or PDF files"
+HOMEPAGE = "http://www.htmldoc.org/"
+SECTION = "console/utils"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "openssl libpng jpeg zlib"
diff --git a/recipes/htmldoc/htmldoc_1.8.27.bb b/recipes/htmldoc/htmldoc_1.8.27.bb
new file mode 100644
index 0000000..d211c76
--- /dev/null
+++ b/recipes/htmldoc/htmldoc_1.8.27.bb
@@ -0,0 +1,22 @@
+require htmldoc.inc
+DEPENDS += "htmldoc-native"
+PR = "r2"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/${PV}/htmldoc-${PV}-source.tar.bz2 \
+file://paths_1.8.27.patch;patch=1"
+
+
+inherit autotools pkgconfig
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=no"
+
+FILES_${PN} += "${datadir}/htmldoc/fonts"
+FILES_${PN} += "${datadir}/htmldoc/data"
+
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
diff --git a/recipes/htmldoc/htmldoc_1.9.x-r1571.bb b/recipes/htmldoc/htmldoc_1.9.x-r1571.bb
new file mode 100644
index 0000000..fe78fb4
--- /dev/null
+++ b/recipes/htmldoc/htmldoc_1.9.x-r1571.bb
@@ -0,0 +1,22 @@
+require htmldoc.inc
+DEPENDS += "htmldoc-native"
+PR = "r2"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
+file://paths_1.9.x.patch;patch=1"
+
+
+inherit autotools pkgconfig
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=no"
+
+FILES_${PN} += "${datadir}/htmldoc/fonts"
+FILES_${PN} += "${datadir}/htmldoc/data"
+
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
-- 
1.6.0.6


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


