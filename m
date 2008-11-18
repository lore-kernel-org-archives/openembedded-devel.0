Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L2MWt-0004Ag-T8
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 10:05:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L2MUX-0004F4-IS
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 09:03:25 +0000
Received: from p5483b738.dip0.t-ipconnect.de ([84.131.183.56])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 09:03:25 +0000
Received: from vjensen by p5483b738.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 09:03:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Tue, 18 Nov 2008 09:03:13 +0000 (UTC)
Message-ID: <gfu0cg$2tl$1@ger.gmane.org>
References: <200811060040.45197.vjensen@gmx.de>
	<b6ebd0a50811051833l4fb50bb3v973618c9f722ac65@mail.gmail.com>
	<gf14m5$sdl$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483b738.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: htmldoc 1.8.27
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
X-List-Received-Date: Tue, 18 Nov 2008 09:05:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Fri, 07 Nov 2008 10:18:45 +0000 schrieb Vitus Jensen:

> Am Wed, 05 Nov 2008 19:33:01 -0700 schrieb Chris Larson:
> 
>> On Wed, Nov 5, 2008 at 4:40 PM, Vitus Jensen <vjensen@gmx.de> wrote:
>>> I need htmldoc for ARM and as this isn't available in OpenEmbedded I
>>> cooked up my own receipt.  But htmldoc has some specialities:
...
>>> I guess the complete solution would be several receipts (-native,
>>> -doc, -console, -gui), right?  But as I want it for a NAS would the
>>> attached console-type receipt be enough?
>> 
>> Two recipes, one with gui and one without, is probably best, to avoid
>> building any gui deps for distros that don't need it.
> 
> And the documentation in HTML, PS and PDF would go to a -doc.ipk by
> means of some FILES_xxx variable?
> 
> I will do this for 1.9.x-r1571.
...

See below for receipes to build htmldoc 1.9.x-r1571 as gui
and non-gui versions.  Documentation as PDF is included in -doc packages.

Enjoy!
   Vitus

---
diff --git a/packages/htmldoc/files/paths.patch b/packages/htmldoc/files/paths.patch
new file mode 100644
index 0000000..f05e405
--- /dev/null
+++ b/packages/htmldoc/files/paths.patch
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
diff --git a/packages/htmldoc/htmldoc-native_1.9.x-r1571.bb b/packages/htmldoc/htmldoc-native_1.9.x-r1571.bb
new file mode 100644
index 0000000..842af79
--- /dev/null
+++ b/packages/htmldoc/htmldoc-native_1.9.x-r1571.bb
@@ -0,0 +1,29 @@
+require htmldoc.inc
+PR = "r1"
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
diff --git a/packages/htmldoc/htmldoc.inc b/packages/htmldoc/htmldoc.inc
new file mode 100644
index 0000000..b0da406
--- /dev/null
+++ b/packages/htmldoc/htmldoc.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "HTMLDOC converts HTML input files into indexed HTML, postscript or PDF files"
+HOMEPAGE = "http://www.htmldoc.org/"
+SECTION = "console/utils"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "openssl libpng jpeg zlib"
+
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
+file://paths.patch;patch=1"
diff --git a/packages/htmldoc/htmldoc_1.9.x-r1571.bb b/packages/htmldoc/htmldoc_1.9.x-r1571.bb
new file mode 100644
index 0000000..ce781d3
--- /dev/null
+++ b/packages/htmldoc/htmldoc_1.9.x-r1571.bb
@@ -0,0 +1,18 @@
+require htmldoc.inc
+DEPENDS += "htmldoc-native"
+PR = "r1"
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
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



