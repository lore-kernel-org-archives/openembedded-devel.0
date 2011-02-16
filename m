Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfQs-0002cz-2K
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:30 +0100
Received: by gwaa12 with SMTP id a12so532303gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=tOvoHdAqlpUEcL2b5yt0U3aX0HtyNLVedPkvVeK34QM=;
	b=mQBu7h8RVs9CeOsMQNpUjpyv5mu69/EN1vcsLtv+GMNw0N7hXqJPet9AEzUr57YtdJ
	0U8mDe6d4qrnSYRHXbKiv5shs48F3Oa8gNOb9WAYypba9jjwSQJ7m0gMYkZGdmsuCKdr
	F5e9oJpg+t1RQobCeGD3JWFDHFvFoKmbxe9aE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=lB8wIqkmJIqbjdHMZeUs1nwOAXfo5n/eSZ+1QwKrzCr39gEpFjiaeWFQP0ef0t2lB8
	uZBYesO3JZwyq4Lv0q1pafafZKHXJ2Vt+kfcJqFYP/J+1/6FUKzK2OK4EBw7jY0oqf3L
	eqVBk1jQVihnA6QcDK2CQ0X/9wYRjgOXTeU1o=
Received: by 10.146.73.35 with SMTP id v35mr558221yaa.30.1297855158487;
	Wed, 16 Feb 2011 03:19:18 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:17 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:46 +0000
Message-Id: <1297855134-19216-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/13] cups: merge cups14.inc into cups 1.4.4 recipe
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:30 -0000

---
 recipes/cups/cups14.inc    |   83 --------------------------------------
 recipes/cups/cups_1.4.4.bb |   96 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 85 insertions(+), 94 deletions(-)
 delete mode 100644 recipes/cups/cups14.inc

diff --git a/recipes/cups/cups14.inc b/recipes/cups/cups14.inc
deleted file mode 100644
index 0828187..0000000
--- a/recipes/cups/cups14.inc
+++ /dev/null
@@ -1,83 +0,0 @@
-DESCRIPTION = "An Internet printing system for Unix."
-SECTION = "console/utils"
-LICENSE = "GPL LGPL"
-DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib fakeroot-native"
-PROVIDES = "cups14"
-
-SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2"
-
-LEAD_SONAME = "libcupsdriver.so"
-
-inherit autotools binconfig
-
-EXTRA_OECONF = " \
-                --enable-gnutls \
-		--enable-dbus \
-		--enable-browsing \
-                --disable-openssl \
-		--disable-tiff \
-		--without-php \
-		--without-perl \
-		--without-python \
-		--without-java \
-               "
-
-
-do_configure() {
-	gnu-configize
-	libtoolize --force
-	DSOFLAGS="${LDFLAGS}" oe_runconf
-}
-
-do_compile () {
-	sed -i s:STRIP:NOSTRIP: Makedefs
-	sed -i s:serial:: backend/Makefile
-
-	echo "all:"    >  man/Makefile
-	echo "libs:" >> man/Makefile
-	echo "install:" >> man/Makefile
-	echo "install-data:" >> man/Makefile
-	echo "install-exec:" >> man/Makefile
-	echo "install-headers:" >> man/Makefile
-	echo "install-libs:" >> man/Makefile
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
-	workdir = bb.data.getVar('WORKDIR', d, 1)
-	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
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
diff --git a/recipes/cups/cups_1.4.4.bb b/recipes/cups/cups_1.4.4.bb
index bf23cc5..709edf1 100644
--- a/recipes/cups/cups_1.4.4.bb
+++ b/recipes/cups/cups_1.4.4.bb
@@ -1,17 +1,91 @@
-require cups14.inc
-
-SRC_URI += " \
-	file://use_echo_only_in_init.patch \
-	file://skip_tools.patch \
-	file://configure.patch \
-	"
+#package the html for the webgui inside the main packages (~1MB uncompressed)
+DESCRIPTION = "An Internet printing system for Unix."
+SECTION = "console/utils"
+LICENSE = "GPL LGPL"
+DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib fakeroot-native"
+DEPENDS += "virtual/libusb0"
+PROVIDES = "cups14"
+PR = "r3"
 
+SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2 \
+           file://use_echo_only_in_init.patch \
+           file://skip_tools.patch \
+           file://configure.patch \
+           "
 SRC_URI[md5sum] = "8776403ad60fea9e85eab9c04d88560d"
 SRC_URI[sha256sum] = "d25ffa35add3abeeec0eba60be2cffc89425b649c64ef3a73dfc724683a59aa3"
 
-PR = "r2"
-
 DEFAULT_PREFERENCE = "-1"
-DEPENDS += "virtual/libusb0"
-EXTRA_OECONF += " --disable-gssapi --disable-largefile --enable-debug --disable-relro --enable-libusb"
+
+inherit autotools binconfig
+
+EXTRA_OECONF = "--enable-gnutls \
+                --enable-dbus \
+                --enable-browsing \
+                --disable-openssl \
+                --disable-tiff \
+                --without-php \
+                --without-perl \
+                --without-python \
+                --without-java \
+                --disable-gssapi \
+                --disable-largefile \
+                --enable-debug \
+                --disable-relro \
+                --enable-libusb \
+                "
+
+do_configure() {
+    gnu-configize
+    libtoolize --force
+    DSOFLAGS="${LDFLAGS}" oe_runconf
+}
+do_compile () {
+    sed -i s:STRIP:NOSTRIP: Makedefs
+    sed -i s:serial:: backend/Makefile
+    echo "all:"    >  man/Makefile
+    echo "libs:" >> man/Makefile
+    echo "install:" >> man/Makefile
+    echo "install-data:" >> man/Makefile
+    echo "install-exec:" >> man/Makefile
+    echo "install-headers:" >> man/Makefile
+    echo "install-libs:" >> man/Makefile
+    oe_runmake "SSLLIBS=-lgnutls -L${STAGING_LIBDIR}" \
+               "LIBPNG=-lpng -lm -L${STAGING_LIBDIR}" \
+               "LIBJPEG=-ljpeg -L${STAGING_LIBDIR}" \
+               "LIBZ=-lz -L${STAGING_LIBDIR}" \
+               "-I."
+}
+
+PACKAGES =+ "${PN}-lib ${PN}-libimage"
+
+FILES_${PN}-lib = "${libdir}/libcups.so.*"
+FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
+FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
+                    ${libdir}/cups/cgi-bin/.debug \
+                    ${libdir}/cups/filter/.debug \
+                    ${libdir}/cups/monitor/.debug \
+                    ${libdir}/cups/notifier/.debug \
+                    ${libdir}/cups/daemon/.debug \
+                    "
+FILES_${PN} += "${datadir}/doc/cups/images \
+                ${datadir}/doc/cups/*html \
+                ${datadir}/doc/cups/*.css \
+                ${datadir}/icons/ \
+                "
+
 CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
+
+LEAD_SONAME = "libcupsdriver.so"
+
+fakeroot do_install () {
+    oe_runmake "DSTROOT=${D}" install
+    # This directory gets installed with perms 511, which makes packaging fail
+    chmod 0711 "${D}/${localstatedir}/run/cups/certs"
+}
+
+python do_package_append() {
+	# Change permissions back the way they were, they probably had a reason...
+	workdir = bb.data.getVar('WORKDIR', d, 1)
+	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
+}
-- 
1.7.2.3



