Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SiXrI-0004Pk-PM
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 23:27:08 +0200
Received: by werg55 with SMTP id g55so1860629wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2012 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NXTOQ+oflV0uRmhv1cp/PSMLyy7iTFPvAMbW6u9vDsM=;
	b=i+Bt0jktYnRE60H9yBDbLnRJXoucanEsCW7rna5bz5rBqqiOI6vaMZ0Uh9Lz0A1olF
	dxFYWtNOgK3PgZY/xbVCGFfohcxmKri5hw+VIDzTeOdhsz7qjXiiAZfL/Sdbz0zneQ6m
	ElJ2y59aoks3c3EkLlX7dgB4nubTzTaWjn/kQzjxlnJF9m/gV185TrxamnzFXfhS7uL9
	hf4XEcY5RzXdDbUR317J/fNFOK3e4H5JIv1qfiSXeufLlZQDDytljcKIfMR1iQ8e8jsU
	vBUE8WOvEWPC5uosPpm0kaDsUUZ49eLFWvnOam7/rLZSVJUyvXX+LGZCuVTU+ElQ9O6b
	iilg==
Received: by 10.180.105.234 with SMTP id gp10mr13644300wib.11.1340486180042;
	Sat, 23 Jun 2012 14:16:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gc6sm6096527wib.0.2012.06.23.14.16.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jun 2012 14:16:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 23:15:36 +0200
Message-Id: <cf0ace97b6c7aec156613713964ef04890d5dc8c.1340486086.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] abiword: reorder and simplify
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
X-List-Received-Date: Sat, 23 Jun 2012 21:27:09 -0000

* there was overlap from .inc and bb (e.g. do_configure/EXTRA_OECONF twice)
* simplify SRC_URI

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb |  152 ++++++++++-----------
 1 files changed, 71 insertions(+), 81 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 927c33a..6e1dc4e 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -3,75 +3,13 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
-DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
+DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2 \
+               librsvg loudmouth libwmf-native gtkmathview asio"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
+RCONFLICTS_${PN} = "${PN}-embedded"
 
-SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz \
-           file://fix.double.install.patch \
-"
-SRC_URI[md5sum] = "bbc9c124f8072875129bd67092f0fa0b"
-SRC_URI[sha256sum] = "db34eeb5457fb7572fc76ec2a73cdb4f7a67307e7468b6c4bde820b58c598b3f"
-
-#want 2.x from 2.x.y for the installation directory
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-
-FILES_${PN} += " \
-		${datadir}/icons/* \
-		${datadir}/abiword-${SHRT_VER}/glade \
-		${datadir}/abiword-${SHRT_VER}/scripts \
-		${datadir}/abiword-${SHRT_VER}/system.profile-en \
-		${datadir}/abiword-${SHRT_VER}/system.profile-en_GB \
-		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
-		${datadir}/abiword-${SHRT_VER}/templates/Employee-Directory.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Business-Report.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Fax-Coversheet.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Resume.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Two-Columns.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Memo.awt \
-		${datadir}/abiword-${SHRT_VER}/templates/Press-Release.awt "
-
-inherit autotools pkgconfig
-
-PARALLEL_MAKE = ""
-
-EXTRA_OECONF = " --disable-pspell \
-                 --disable-spellcheck \
-		 --disable-printing \
-		 --disable-exports \
-		 --with-sys-wv"
-
-# AbiWord configure.ac does not play nicely with autoreconf
-# so use the autogen.sh script that comes with AbiWord
-#
-do_configure() {
-        cd ${S}
-        export NOCONFIGURE="no"; ./autogen.sh
-        oe_runconf
-}
-
-
-do_install_append() {
-        install -d ${D}${datadir}/pixmaps/
-        mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
-        rmdir ${D}${datadir}/icons
-}
-
-PACKAGES += " abiword-clipart abiword-icons abiword-strings abiword-systemprofiles abiword-templates "
-
-FILES_abiword-clipart 		+= "${datadir}/abiword-${SHRT_VER}/clipart"
-FILES_abiword-icons 		+= "${datadir}/abiword-${SHRT_VER}/icons"
-FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/AbiWord/strings"
-FILES_abiword-systemprofiles 	+= "${datadir}/abiword-${SHRT_VER}/AbiWord/system.profile*"
-FILES_abiword-templates 	+= "${datadir}/abiword-${SHRT_VER}/templates"
-
-DEPENDS += " librsvg loudmouth libwmf-native gtkmathview asio"
-RCONFLICTS_${PN} = "abiword-embedded"
-
-PR = "r4"
-
-SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=abiword \
+SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
            file://autogen-common.sh \
            file://nodolt.patch \
            file://fix.no.undefined.param.patch \
@@ -79,9 +17,17 @@ SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 
-SRC_URI[abiword.md5sum] = "f883b0a7f26229a9c66fd6a1a94381aa"
-SRC_URI[abiword.sha256sum] = "d99089a63a6cfc1a6a4a026be9278028d47d224088d24b1853acb67e95683a15"
+SRC_URI[md5sum] = "f883b0a7f26229a9c66fd6a1a94381aa"
+SRC_URI[sha256sum] = "d99089a63a6cfc1a6a4a026be9278028d47d224088d24b1853acb67e95683a15"
+
+#want 2.x from 2.x.y for the installation directory
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+
+PR = "r6"
+
+inherit autotools pkgconfig
 
+PARALLEL_MAKE = ""
 
 EXTRA_OECONF = " --disable-static  \
                  --enable-plugins \
@@ -92,6 +38,8 @@ EXTRA_OECONF = " --disable-static  \
                  --with-libwmf-config=${STAGING_DIR} \
 "
 
+# AbiWord configure.ac does not play nicely with autoreconf
+# so use the autogen.sh script that comes with AbiWord
 do_configure() {
     install -m 0755 ${WORKDIR}/autogen-common.sh ${S}/autogen-common.sh
     cd ${S}
@@ -99,11 +47,59 @@ do_configure() {
     autotools_do_configure
 }
 
-FILES_${PN} 			+= "${libdir}/libabiword-*.so ${datadir}/mime-info ${datadir}/abiword-${SHRT_VER}/certs ${datadir}/abiword-${SHRT_VER}/ui ${datadir}/abiword-${SHRT_VER}/xsl* ${datadir}/abiword-${SHRT_VER}/mime-info ${datadir}/abiword-${SHRT_VER}/Pr*.xml"
-FILES_abiword-strings           += "${datadir}/abiword-${SHRT_VER}/strings"
-FILES_abiword-systemprofiles    += "${datadir}/abiword-${SHRT_VER}/system.profile*"
+do_install_append() {
+        install -d ${D}${datadir}/pixmaps/
+        mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
+        rmdir ${D}${datadir}/icons
+}
+
+PACKAGES += " ${PN}-clipart ${PN}-icons ${PN}-strings ${PN}-systemprofiles ${PN}-templates "
 
-PACKAGES_DYNAMIC = "abiword-meta abiword-plugin-*"
+FILES_${PN} += " \
+                ${libdir}/lib${PN}-*.so \
+                ${datadir}/mime-info \
+                ${datadir}/icons/* \
+                ${datadir}/${PN}-${SHRT_VER}/glade \
+                ${datadir}/${PN}-${SHRT_VER}/scripts \
+                ${datadir}/${PN}-${SHRT_VER}/system.profile-en \
+                ${datadir}/${PN}-${SHRT_VER}/system.profile-en_GB \
+                ${datadir}/${PN}-${SHRT_VER}/templates/normal.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/normal.awt-en_GB \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Employee-Directory.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Business-Report.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Fax-Coversheet.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Resume.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Two-Columns.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Memo.awt \
+                ${datadir}/${PN}-${SHRT_VER}/templates/Press-Release.awt \
+                ${datadir}/${PN}-${SHRT_VER}/certs \
+                ${datadir}/${PN}-${SHRT_VER}/ui \
+                ${datadir}/${PN}-${SHRT_VER}/xsl* \ 
+                ${datadir}/${PN}-${SHRT_VER}/mime-info \
+                ${datadir}/${PN}-${SHRT_VER}/Pr*.xml \
+"
+
+# don't steal /usr/lib/libabiword-2.8.so from ${PN}
+# in this case it's needed in ${PN}
+FILES_${PN}-dev = " \
+                  ${includedir} \
+                  ${libdir}/pkgconfig \
+                  ${libdir}/${PN}*.la \
+                  ${libdir}/lib${PN}*.la \
+                  ${libdir}/${PN}-${SHRT_VER}/plugins/*.la \
+"
+FILES_${PN}-dbg += "${libdir}/${PN}-${SHRT_VER}/plugins/.debug"
+FILES_${PN}-doc += "${datadir}/${PN}-*/readme*"
+
+FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/strings"
+FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/system.profile*"
+FILES_${PN}-clipart        += "${datadir}/${PN}-${SHRT_VER}/clipart"
+FILES_${PN}-icons          += "${datadir}/${PN}-${SHRT_VER}/icons"
+FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/AbiWord/strings"
+FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/AbiWord/system.profile*"
+FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
+
+PACKAGES_DYNAMIC = "${PN}-meta ${PN}-plugin-*"
 
 python populate_packages_prepend () {
 	abiword_libdir    = bb.data.expand('${libdir}/abiword-2.8/plugins', d)
@@ -116,17 +112,11 @@ python populate_packages_prepend () {
 	metapkg_rdepends = []
 	packages = bb.data.getVar('PACKAGES', d, 1).split()
 	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
-			print "Modifying ", pkg
-			metapkg_rdepends.append(pkg)
+                if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
+                	print "Modifying ", pkg
+                	metapkg_rdepends.append(pkg)
 	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 	bb.data.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package', d)
 	packages.append(metapkg)
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
 }
-
-# don't steal /usr/lib/libabiword-2.8.so from ${PN}
-# in this case it's needed in ${PN}
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/abiword*.la ${libdir}/abiword-${SHRT_VER}/plugins/*.la ${libdir}/libabiword*.la"
-FILES_${PN}-dbg += "${libdir}/abiword-${SHRT_VER}/plugins/.debug"
-FILES_${PN}-doc += "${datadir}/abiword-*/readme*"
-- 
1.7.8.6



