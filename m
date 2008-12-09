Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L9wx6-0001V7-Il
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Dec 2008 08:24:16 +0100
Received: by fk-out-0910.google.com with SMTP id 19so1638616fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=CsvqNL3WYeuGnJ2DeKOpxp9P9PRyv5xsyqOS0ck/G38=;
	b=uiiTr/KBAhRn8ySPHbOsYT8g+izA0sl6BLVoegu6+Ajm3pxl7yH82gvlAPj7upaUUh
	LpLaTVlYQHRE88LXc5WAUPej+zzuLTejDUKqxt66iz0t51sKFwEXOijarmGQ34YSjAKy
	3M/kE0qYB/cOU9FYBZleyA/js8eGoMRHu9UHY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FxxHE9pgZCgRLMZfwGAvdc/X27585nCIr75eiaZpsl1dus0KpHTvaXWP4HUQvvDADH
	UBfukL84NilBjPq0xNzfjUgIb+3jtOyg5cLXdUDzuiu3Gz9yV4/zXKwCad6ltyH2B9xs
	oZanqxdVwdo1lbF5VGDz5ogxeT8GN9BGX3nto=
Received: by 10.181.201.13 with SMTP id d13mr1536503bkq.105.1228807221481;
	Mon, 08 Dec 2008 23:20:21 -0800 (PST)
Received: from localhost.localdomain (iap-pxy-mow1.siemens.ru [212.248.25.26])
	by mx.google.com with ESMTPS id
	35sm24282567fkt.34.2008.12.08.23.20.19
	(version=SSLv3 cipher=RC4-MD5); Mon, 08 Dec 2008 23:20:20 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Dec 2008 10:19:05 +0300
Message-Id: <1228807146-4208-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, fb@kernelconcepts.de
Subject: [RFC][PATCH] fbreader: split common packaging funcionality
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
X-List-Received-Date: Tue, 09 Dec 2008 07:24:16 -0000

To ease creating fbreader-opie split away common fbreader packaging
functionality.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../fbreader/{fbreader_0.8.2a.bb => fbreader.inc}  |   42 ++++++++------
 packages/fbreader/fbreader_0.8.2a.bb               |   58 ++------------------
 .../480x640-buildfix.patch                         |    0 
 3 files changed, 29 insertions(+), 71 deletions(-)
 copy packages/fbreader/{fbreader_0.8.2a.bb => fbreader.inc} (65%)
 rename packages/fbreader/{fbreader-0.8.2a => files}/480x640-buildfix.patch (100%)

diff --git a/packages/fbreader/fbreader_0.8.2a.bb b/packages/fbreader/fbreader.inc
similarity index 65%
copy from packages/fbreader/fbreader_0.8.2a.bb
copy to packages/fbreader/fbreader.inc
index 7d6a2b0..d392560 100644
--- a/packages/fbreader/fbreader_0.8.2a.bb
+++ b/packages/fbreader/fbreader.inc
@@ -3,23 +3,28 @@ HOMEPAGE = "http://www.fbreader.org"
 SECTION = "x11/utils"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv"
-PR = "r5"
+DEPENDS = "enca expat bzip2 virtual/libiconv"
+
+FILES_${PN} += "${libdir}/zlibrary"
 
 # The RESOLUTION is defined at compile time which makes
 # this package MACHINE specific.
 PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+PACKAGE_ARCH_${PN}-dbg = "${MACHINE_ARCH}"
+PACKAGE_ARCH_${PN}-dev = "${MACHINE_ARCH}"
 
 SRC_URI = "http://www.fbreader.org/obsolete/fbreader-sources-${PV}.tgz \
-	   file://fbreader-0.8.2a_buildsys_oe.patch;patch=1 \
 	   file://480x640-buildfix.patch;patch=1"
-	   
+
 SRC_URI_append_spitz = "\
 		  file://zaurus-VGA.patch;patch=1"
 
 SRC_URI_append_akita = "\
 		  file://zaurus-VGA.patch;patch=1"
 
+SRC_URI_append_tosa= "\
+		  file://zaurus-VGA.patch;patch=1"
+
 SRC_URI_append_htcuniversal = "\
 		  file://zaurus-VGA.patch;patch=1"
 
@@ -33,30 +38,31 @@ READER_STATUS	  = "release"
 READER_RESOLUTION_om-gta01 = "480x640"
 READER_RESOLUTION_spitz = "640x480"
 READER_RESOLUTION_akita = "640x480"
+READER_RESOLUTION_tosa = "480x640"
 READER_RESOLUTION_htcuniversal = "640x480"
 
 FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary"
 
-CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=/usr"
+CFLAGS_append = " RESOLUTION=${READER_RESOLUTION}"
 EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' OE_CFLAGS='${CXXFLAGS}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
 
 inherit pkgconfig
 
 do_configure() {
-	cd ${WORKDIR}/${PN}-${PV}
-	mv makefiles/target.mk makefiles/target.mk.orig
-	
-	echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk	
+	cd ${S}
+	mv makefiles/target.mk makefiles/target.mk.orig || true
+
+	echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk
 	echo "UI_TYPE = ${READER_GUI}" >> makefiles/target.mk
 	echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
-	
-	cd fbreader/data/help
-	
-	# FIXME: Add native _480x640 file with propper linebreaks
-	ln -s MiniHelp.240x320.fb2 MiniHelp.openzaurus_480x640.fb2
-}
 
-do_install () {
-        cd fbreader/${READER_ARCH}; oe_runmake .builddir RESOLUTION=${READER_RESOLUTION}
-	cp -r data/* ${D}
+	find fbreader zlibrary -name "*640x480*" | while read name
+	do
+		newname="`echo $name | sed -e 's/640x480/480x640/'`"
+		if ! [ -e "$newname" ]
+		then
+			ln -s `basename $name` $newname
+		fi
+	done
 }
+
diff --git a/packages/fbreader/fbreader_0.8.2a.bb b/packages/fbreader/fbreader_0.8.2a.bb
index 7d6a2b0..baf0118 100644
--- a/packages/fbreader/fbreader_0.8.2a.bb
+++ b/packages/fbreader/fbreader_0.8.2a.bb
@@ -1,61 +1,13 @@
-DESCRIPTION = "FBreader is an ebook reader"
-HOMEPAGE = "http://www.fbreader.org"
-SECTION = "x11/utils"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv"
-PR = "r5"
+require fbreader.inc
 
-# The RESOLUTION is defined at compile time which makes
-# this package MACHINE specific.
-PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+SECTION = "x11/utils"
+DEPENDS += "gtk+ libgpewidget"
+PR = "r0"
 
-SRC_URI = "http://www.fbreader.org/obsolete/fbreader-sources-${PV}.tgz \
-	   file://fbreader-0.8.2a_buildsys_oe.patch;patch=1 \
-	   file://480x640-buildfix.patch;patch=1"
+SRC_URI += "file://fbreader-0.8.2a_buildsys_oe.patch;patch=1"
 	   
-SRC_URI_append_spitz = "\
-		  file://zaurus-VGA.patch;patch=1"
-
-SRC_URI_append_akita = "\
-		  file://zaurus-VGA.patch;patch=1"
-
-SRC_URI_append_htcuniversal = "\
-		  file://zaurus-VGA.patch;patch=1"
-
-# Set the defaults
-READER_RESOLUTION = "240x320"
-READER_ARCH	  = "openzaurus"
-READER_GUI	  = "gpe"
-READER_STATUS	  = "release"
-
-# Set device specific overrides
-READER_RESOLUTION_om-gta01 = "480x640"
-READER_RESOLUTION_spitz = "640x480"
-READER_RESOLUTION_akita = "640x480"
-READER_RESOLUTION_htcuniversal = "640x480"
-
-FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary"
-
-CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=/usr"
-EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' OE_CFLAGS='${CXXFLAGS}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
-
 inherit pkgconfig
 
-do_configure() {
-	cd ${WORKDIR}/${PN}-${PV}
-	mv makefiles/target.mk makefiles/target.mk.orig
-	
-	echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk	
-	echo "UI_TYPE = ${READER_GUI}" >> makefiles/target.mk
-	echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
-	
-	cd fbreader/data/help
-	
-	# FIXME: Add native _480x640 file with propper linebreaks
-	ln -s MiniHelp.240x320.fb2 MiniHelp.openzaurus_480x640.fb2
-}
-
 do_install () {
         cd fbreader/${READER_ARCH}; oe_runmake .builddir RESOLUTION=${READER_RESOLUTION}
 	cp -r data/* ${D}
diff --git a/packages/fbreader/fbreader-0.8.2a/480x640-buildfix.patch b/packages/fbreader/files/480x640-buildfix.patch
similarity index 100%
rename from packages/fbreader/fbreader-0.8.2a/480x640-buildfix.patch
rename to packages/fbreader/files/480x640-buildfix.patch
-- 
1.5.6.5



