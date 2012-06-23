Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SiXr9-0004Is-3U
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 23:26:59 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2569993wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2012 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OI9zTPBXnBkarXArnznPuKkSdQa3XSkcCZqSF05wZ9s=;
	b=j+xndFFfeGhx3JvQ4BxhzqxESuFR1K7PzjUCCQPHhjXCXpf4WTLUeIcrMkU4MAWzAy
	7RJHo+/K3gZHOVYRYMC6LED7kQymwuLTW5ylTsebwRheP2z45pN2eoxbXHxLEyIc1yQf
	opB04DrUfo/5PgZNiojIfGFlERczjWJ5du4f21FmGeiW3bV+Bk4v610MNUHChz7KAB3u
	zQ/mV2FmagXrTK1IOkRhAW+v1lgsoPYU3yjH3bY7y1Eh3+imoEbKgIfpXzEqysQJ9IQw
	Gfr04Oda7inQtCqjydDOz+D6HXBH50/JCFKqGuhwVUF3Jvdm5kW0h4R+eDSuh2At8xZH
	XRag==
Received: by 10.180.19.138 with SMTP id f10mr13611144wie.19.1340486172601;
	Sat, 23 Jun 2012 14:16:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm14108992wib.0.2012.06.23.14.16.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jun 2012 14:16:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 23:15:35 +0200
Message-Id: <2fc0c683a108a4b097d8126908d794cd84b64d36.1340486086.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] abiword: merge abiword-2.5.inc to abiword_2.8.6.bb
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
X-List-Received-Date: Sat, 23 Jun 2012 21:26:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc  |   67 --------------------
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb |   69 ++++++++++++++++++++-
 2 files changed, 68 insertions(+), 68 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc

diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
deleted file mode 100644
index 9b5adcc..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
+++ /dev/null
@@ -1,67 +0,0 @@
-DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
-HOMEPAGE = "http://www.abiword.org"
-SECTION = "x11/office"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
-DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
-RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
-               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
-
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
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index ba0b979..927c33a 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -1,4 +1,71 @@
-require abiword-2.5.inc
+DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
+HOMEPAGE = "http://www.abiword.org"
+SECTION = "x11/office"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
+DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
+RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
+               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
+
+SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz \
+           file://fix.double.install.patch \
+"
+SRC_URI[md5sum] = "bbc9c124f8072875129bd67092f0fa0b"
+SRC_URI[sha256sum] = "db34eeb5457fb7572fc76ec2a73cdb4f7a67307e7468b6c4bde820b58c598b3f"
+
+#want 2.x from 2.x.y for the installation directory
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+
+FILES_${PN} += " \
+		${datadir}/icons/* \
+		${datadir}/abiword-${SHRT_VER}/glade \
+		${datadir}/abiword-${SHRT_VER}/scripts \
+		${datadir}/abiword-${SHRT_VER}/system.profile-en \
+		${datadir}/abiword-${SHRT_VER}/system.profile-en_GB \
+		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
+		${datadir}/abiword-${SHRT_VER}/templates/Employee-Directory.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Business-Report.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Fax-Coversheet.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Resume.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Two-Columns.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Memo.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Press-Release.awt "
+
+inherit autotools pkgconfig
+
+PARALLEL_MAKE = ""
+
+EXTRA_OECONF = " --disable-pspell \
+                 --disable-spellcheck \
+		 --disable-printing \
+		 --disable-exports \
+		 --with-sys-wv"
+
+# AbiWord configure.ac does not play nicely with autoreconf
+# so use the autogen.sh script that comes with AbiWord
+#
+do_configure() {
+        cd ${S}
+        export NOCONFIGURE="no"; ./autogen.sh
+        oe_runconf
+}
+
+
+do_install_append() {
+        install -d ${D}${datadir}/pixmaps/
+        mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
+        rmdir ${D}${datadir}/icons
+}
+
+PACKAGES += " abiword-clipart abiword-icons abiword-strings abiword-systemprofiles abiword-templates "
+
+FILES_abiword-clipart 		+= "${datadir}/abiword-${SHRT_VER}/clipart"
+FILES_abiword-icons 		+= "${datadir}/abiword-${SHRT_VER}/icons"
+FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/AbiWord/strings"
+FILES_abiword-systemprofiles 	+= "${datadir}/abiword-${SHRT_VER}/AbiWord/system.profile*"
+FILES_abiword-templates 	+= "${datadir}/abiword-${SHRT_VER}/templates"
+
 DEPENDS += " librsvg loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
-- 
1.7.8.6



