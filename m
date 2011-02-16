Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfQq-0002cr-7k
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:29 +0100
Received: by gyd8 with SMTP id 8so533721gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=AqGv2v/bFlQn2UM95IpCoaPLC7PVmsN79yAlGGtUaOk=;
	b=DkvrXcLAyv0ecvywLeEAgF75fef+MGEnNp3VVdWcNNOCszS5KMqEUnYn+t9pk1g+mP
	FP45cQcOK9DYwjPPmUHLitwGv+tb/N0iJ9Am7Rc8tXkhptVwJhv9LTGTUiUdv4AfCmUo
	ei1KYxh0bKtfoGE0Pf0ALpd+h0h9PZSetDEl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Bh6tU6vWzUQZ+OH1GZ3ElbBnjCqlG56LO5SeDJNQgTGjSDp2OhNnIHi/WI7BmQ5SBY
	DeehPXaKS2LGXiyLbX9enJ91LqL24gjIcuvR8B9HMODliqPq5KnM5SrTmNw/XHZR/Kow
	sTTUxVKpG991xapf4SphYH3HKc17GJs9Qu3RQ=
Received: by 10.236.102.179 with SMTP id d39mr869811yhg.48.1297855156210;
	Wed, 16 Feb 2011 03:19:16 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:45 +0000
Message-Id: <1297855134-19216-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 04/13] cups: merge cups.inc into cups 1.2.12 recipe
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:29 -0000

---
 recipes/cups/cups.inc       |   89 -----------------------------------------
 recipes/cups/cups_1.2.12.bb |   92 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 92 deletions(-)
 delete mode 100644 recipes/cups/cups.inc

diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
deleted file mode 100644
index 0c7b103..0000000
--- a/recipes/cups/cups.inc
+++ /dev/null
@@ -1,89 +0,0 @@
-DESCRIPTION = "An Internet printing system for Unix."
-SECTION = "console/utils"
-LICENSE = "GPL LGPL"
-DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
-
-INC_PR = "r7"
-
-SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
-	  "
-
-inherit autotools binconfig
-
-EXTRA_OECONF = " \
-                --enable-gnutls \
-		--enable-dbus \
-		--enable-browsing \
-                --disable-openssl \
-		--disable-tiff \
-		--disable-ssl \
-		--without-php \
-		--without-perl \
-		--without-python \
-		--without-java \
-               "
-
-
-do_configure() {
-    	export DSOFLAGS="${LDFLAGS}"
-	gnu-configize
-	libtoolize --force
-	oe_runconf
-}
-
-do_compile () {
-	sed -i s:STRIP:NOSTRIP: Makedefs
-	sed -i s:serial:: backend/Makefile
-
-	echo "all:"    >  man/Makefile
-	echo "install:" >> man/Makefile
-
-	oe_runmake "SSLLIBS=-lgnutls -L${STAGING_LIBDIR}" \
-		   "LIBPNG=-lpng -lm -L${STAGING_LIBDIR}" \
-		   "LIBJPEG=-ljpeg -L${STAGING_LIBDIR}" \
-		   "LIBZ=-lz -L${STAGING_LIBDIR}" \
-		   "-I."
-}
-
-fakeroot do_install () {
-	oe_runmake "DSTROOT=${D}" install
-
-   # This directory gets installed with perms 511, which makes packaging fail
-   chmod 0711 "${D}/${localstatedir}/run/cups/certs"
-}
-
-python do_package_append() {
-	# Change permissions back the way they were, they probably had a reason...
-	pkgdest = bb.data.getVar('PKGDEST', d, 1)
-	os.system('chmod 0511 %s/cups/var/run/cups/certs' % pkgdest)
-}
-
-SYSROOT_PREPROCESS_FUNCS += "cups_config_mangle"
-
-cups_config_mangle() {
-	# Undo mangle of cups_datadir and cups_serverbin
-	sed -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:g' \
-	    -e 's:cups_serverbin=.*:cups_serverbin=${libdir}/cups:g' \
-	    -i  ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/cups-config
-}
-
-PACKAGES =+ "${PN}-lib ${PN}-libimage"
-
-FILES_${PN}-lib = "${libdir}/libcups.so.*"
-
-FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
-
-FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
-                    ${libdir}/cups/cgi-bin/.debug \
-		    ${libdir}/cups/filter/.debug \
-		    ${libdir}/cups/monitor/.debug \
-		    ${libdir}/cups/notifier/.debug \
-		    ${libdir}/cups/daemon/.debug \
-		    "
-#package the html for the webgui inside the main packages (~1MB uncompressed)
-
-FILES_${PN} += "${datadir}/doc/cups/images \
-		${datadir}/doc/cups/*html \
-		${datadir}/doc/cups/*.css \
-                ${datadir}/icons/ \
-	       "
diff --git a/recipes/cups/cups_1.2.12.bb b/recipes/cups/cups_1.2.12.bb
index 167d353..1b06a53 100644
--- a/recipes/cups/cups_1.2.12.bb
+++ b/recipes/cups/cups_1.2.12.bb
@@ -1,7 +1,93 @@
-require cups.inc
-PR = "${INC_PR}.3"
+DESCRIPTION = "An Internet printing system for Unix."
+SECTION = "console/utils"
+LICENSE = "GPL LGPL"
+DEPENDS = "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
 
-SRC_URI += "file://0001-cups-desktop-fix-cups-desktop-file.patch"
+PR = "r8"
+
+SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
+           file://0001-cups-desktop-fix-cups-desktop-file.patch \
+  		   "
+
+inherit autotools binconfig
+
+EXTRA_OECONF = " \
+                --enable-gnutls \
+		--enable-dbus \
+		--enable-browsing \
+                --disable-openssl \
+		--disable-tiff \
+		--disable-ssl \
+		--without-php \
+		--without-perl \
+		--without-python \
+		--without-java \
+               "
+
+
+do_configure() {
+    	export DSOFLAGS="${LDFLAGS}"
+	gnu-configize
+	libtoolize --force
+	oe_runconf
+}
+
+do_compile () {
+	sed -i s:STRIP:NOSTRIP: Makedefs
+	sed -i s:serial:: backend/Makefile
+
+	echo "all:"    >  man/Makefile
+	echo "install:" >> man/Makefile
+
+	oe_runmake "SSLLIBS=-lgnutls -L${STAGING_LIBDIR}" \
+		   "LIBPNG=-lpng -lm -L${STAGING_LIBDIR}" \
+		   "LIBJPEG=-ljpeg -L${STAGING_LIBDIR}" \
+		   "LIBZ=-lz -L${STAGING_LIBDIR}" \
+		   "-I."
+}
+
+fakeroot do_install () {
+	oe_runmake "DSTROOT=${D}" install
+
+   # This directory gets installed with perms 511, which makes packaging fail
+   chmod 0711 "${D}/${localstatedir}/run/cups/certs"
+}
+
+python do_package_append() {
+	# Change permissions back the way they were, they probably had a reason...
+	pkgdest = bb.data.getVar('PKGDEST', d, 1)
+	os.system('chmod 0511 %s/cups/var/run/cups/certs' % pkgdest)
+}
+
+SYSROOT_PREPROCESS_FUNCS += "cups_config_mangle"
+
+cups_config_mangle() {
+	# Undo mangle of cups_datadir and cups_serverbin
+	sed -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:g' \
+	    -e 's:cups_serverbin=.*:cups_serverbin=${libdir}/cups:g' \
+	    -i  ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/cups-config
+}
+
+PACKAGES =+ "${PN}-lib ${PN}-libimage"
+
+FILES_${PN}-lib = "${libdir}/libcups.so.*"
+
+FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
+
+FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
+                    ${libdir}/cups/cgi-bin/.debug \
+		    ${libdir}/cups/filter/.debug \
+		    ${libdir}/cups/monitor/.debug \
+		    ${libdir}/cups/notifier/.debug \
+		    ${libdir}/cups/daemon/.debug \
+		    "
+#package the html for the webgui inside the main packages (~1MB uncompressed)
+
+FILES_${PN} += "${datadir}/doc/cups/images \
+		${datadir}/doc/cups/*html \
+		${datadir}/doc/cups/*.css \
+                ${datadir}/icons/ \
+	       "
 
 SRC_URI[md5sum] = "d410658468384b5ba5d04a808f6157fe"
 SRC_URI[sha256sum] = "b4ff8e934da7db32d5654360ea9068faa0ed5a00fde02161ae53c2052510d00f"
-- 
1.7.2.3



