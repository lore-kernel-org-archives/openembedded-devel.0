Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1KxsQo-0007f7-6l
	for Openembedded-devel@lists.openembedded.org;
	Thu, 06 Nov 2008 01:09:02 +0100
Received: (qmail invoked by alias); 05 Nov 2008 23:40:50 -0000
Received: from p5483B707.dip0.t-ipconnect.de (EHLO [192.168.178.130])
	[84.131.183.7]
	by mail.gmx.net (mp015) with SMTP; 06 Nov 2008 00:40:50 +0100
X-Authenticated: #705530
X-Provags-ID: V01U2FsdGVkX19ec89JSdxenxRRg+XLIG0HxWYS/UdRHa0oJ7QHnq
	/5ksJbtNfWmJ52
To: Openembedded-devel@lists.openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Thu, 6 Nov 2008 00:40:44 +0100
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
MIME-Version: 1.0
Message-Id: <200811060040.45197.vjensen@gmx.de>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.7
Subject: htmldoc 1.8.27
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
X-List-Received-Date: Thu, 06 Nov 2008 00:09:02 -0000
X-Groupsio-MsgNum: 6489
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_97iEJ31FJQeWovO"

--Boundary-00=_97iEJ31FJQeWovO
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hej!

I need htmldoc for ARM and as this isn't available in OpenEmbedded I cooked 
up my own receipt.  But htmldoc has some specialities:

- it does build it's own documentation by using the generated excutable
- it contains an optional GUI component
- there are defines in config.h.in not duplicated in configure.in

I guess the complete solution would be several receipts 
(-native, -doc, -console, -gui), right?  But as I want it for a NAS would 
the attached console-type receipt be enough?  Also, is moving defines from 
config.h.in to configure.in by a patch correct?  It looks wrong (if one 
thinks of using the same receipt for a newer version).

Please comment.
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milkyway, Universe (current)

--Boundary-00=_97iEJ31FJQeWovO
Content-Type: text/x-diff;
  charset="us-ascii";
  name="htmldoc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="htmldoc.patch"

commit c1faac87839a6bf1885ce0bdaf67d7a28223d608
Author: Vitus Jensen <vjensen@gmx.de>
Date:   Tue Nov 4 00:50:51 2008 +0100

    htmldoc 1.8.27: new recipe
    
    HTMLDOC converts HTML input files into indexed HTML, postscript or PDF
    files.  This receipe builds the non-gui components of htmldoc.

diff --git a/packages/htmldoc/files/limits.patch b/packages/htmldoc/files/limits.patch
new file mode 100644
index 0000000..3a205ce
--- /dev/null
+++ b/packages/htmldoc/files/limits.patch
@@ -0,0 +1,46 @@
+diff -Naur htmldoc-1.8.27.org/configure.in htmldoc-1.8.27.mod/configure.in
+--- htmldoc-1.8.27.org/configure.in	2006-08-02 21:36:53.000000000 +0200
++++ htmldoc-1.8.27.mod/configure.in	2008-11-03 10:47:24.000000000 +0100
+@@ -31,7 +31,18 @@
+ NVERSION=10802600
+ AC_SUBST(SVERSION)
+ AC_SUBST(NVERSION)
+-AC_DEFINE_UNQUOTED(SVERSION, "$SVERSION")
++AC_DEFINE_UNQUOTED(SVERSION, "$SVERSION", "program version")
++
++dnl Define progra limits...
++AC_DEFINE(MAX_CHAPTERS, 1000, "Maximum number of chapters or files")
++AC_DEFINE(MAX_COLUMNS, 200, "Maximum number of columns in a table")
++AC_DEFINE(MAX_HF_IMAGES, 10, "Maximum number of header/footer images")
++AC_DEFINE(ALLOC_FILES, 10, "Temporary/image files")
++AC_DEFINE(ALLOC_HEADINGS, 50, "Headings")
++AC_DEFINE(ALLOC_LINKS, 100, "Web links")
++AC_DEFINE(ALLOC_OBJECTS, 100, "PDF objects")
++AC_DEFINE(ALLOC_PAGES, 10, "PS/PDF pages")
++AC_DEFINE(ALLOC_ROWS, 20, "Table rows")
+ 
+ dnl Get the operating system and version number...
+ 
+@@ -145,6 +156,11 @@
+ 
+ if test $ac_cv_c_long_long = yes; then
+ 	AC_DEFINE(HAVE_LONG_LONG)
++	AC_DEFINE(HTMLDOC_LLFMT, "%lld", "printf_longlong")
++	AC_DEFINE(HTMLDOC_LLCAST, (long long), "cast_longlong")
++else
++	AC_DEFINE(HTMLDOC_LLFMT, "%ld", "printf_longlong")
++	AC_DEFINE(HTMLDOC_LLCAST, (long), "cast_longlong")
+ fi
+ 
+ AC_CHECK_FUNC(strtoll, AC_DEFINE(HAVE_STRTOLL))
+@@ -316,8 +332,8 @@
+     bindir="$exec_prefix/bin"
+ fi
+ 
+-AC_DEFINE_UNQUOTED(DOCUMENTATION, "$prefix/share/doc/htmldoc")
+-AC_DEFINE_UNQUOTED(HTML_DATA, "$prefix/share/htmldoc")
++AC_DEFINE_UNQUOTED(DOCUMENTATION, "$prefix/share/doc/htmldoc", "Locations of files...")
++AC_DEFINE_UNQUOTED(HTML_DATA, "$prefix/share/htmldoc", "Locations of files...")
+ 
+ dnl Update compiler options...
+ if test -n "$GXX"; then
diff --git a/packages/htmldoc/htmldoc_1.8.27.bb b/packages/htmldoc/htmldoc_1.8.27.bb
new file mode 100644
index 0000000..72168fc
--- /dev/null
+++ b/packages/htmldoc/htmldoc_1.8.27.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "HTMLDOC converts HTML input files into indexed HTML, postscript or PDF files"
+HOMEPAGE = "http://www.htmldoc.org/"
+SECTION = "console/utils"
+PRIORITY = "optional"
+LICENSE = "GPL"
+DEPENDS = "openssl libpng jpeg zlib"
+#	GUI: fltk
+PR = "r1"
+
+SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/${PV}/htmldoc-${PV}-source.tar.bz2 \
+	file://limits.patch;patch=1"
+
+
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
+		--with-gui=no"
+
+# if something isn't collected from staging:
+FILES_${PN} += "${datadir}/htmldoc/fonts"
+FILES_${PN} += "${datadir}/htmldoc/data"
+FILES_${PN} += "${datadir}/doc/htmldoc"
+
+do_compile() {
+	cd htmldoc && oe_runmake all ; cd ${S}
+}
+
+do_install() {
+	install -d ${D}${datadir}/htmldoc/fonts
+	install -m 0644 ${S}/fonts/*.afm ${D}${datadir}/htmldoc/fonts/
+	install -m 0644 ${S}/fonts/*.pfa ${D}${datadir}/htmldoc/fonts/
+
+	install -d ${D}${datadir}/htmldoc/data
+	install -m 0644 ${S}/data/* ${D}${datadir}/htmldoc/data/
+
+	install -d ${D}${mandir}/man1
+	install -m 0644 ${S}/doc/htmldoc.man ${D}${mandir}/man1/
+
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/htmldoc/htmldoc ${D}${bindir}/
+}

--Boundary-00=_97iEJ31FJQeWovO--
