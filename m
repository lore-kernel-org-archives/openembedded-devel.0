Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PkG8i-0005Vz-Br
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 14:19:24 +0100
Received: by fxm17 with SMTP id 17so6859590fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 05:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=WnTpUihhT3GO/eHglEUcykdg1APCltyro8w1Jr0keVs=;
	b=OAmX+WaSI+2V1hSiOMSHHAl7VgghAEJgx8NuhJ/DQRnJmkpWtXdDcSJBNan8nQVtjL
	ToYrdL4mWSHuUIcrZo0e0FvqIcFAKbbdZ87r3R00WROJdFu1wvdMAKd8TmwppMaJhQ0h
	sWaGBNW5p1EAo7QrMYSmAJwx0kQHedxT/F38k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=A4TWSt7BuOUihOx+Zn1CtQSoCSLm3Biag+5S3k0hlvMxEJnGnYbPeIO+bFy9AF+z+9
	Y2mBS/1zp2MCxtf08asT8E3GTPY9jtekODd3jpR8I6bvv6Y+M1X3xLTsFTh8TuRadD5Q
	Rbm5IXsjtFPe2l0rArrSAl3xOpsEcMBpaDnSI=
Received: by 10.223.86.199 with SMTP id t7mr337179fal.29.1296566308508;
	Tue, 01 Feb 2011 05:18:28 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm7842098faa.18.2011.02.01.05.18.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Feb 2011 05:18:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Tue,  1 Feb 2011 14:18:33 +0100
Message-Id: <1296566313-26494-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4
Subject: [PATCH] recipes: don't use Icon= with extension in .desktop files
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
X-List-Received-Date: Tue, 01 Feb 2011 13:19:24 -0000

* new efreet with icon cache cannot find right icon in theme when it's defined with extension like ./neon.desktop:Icon=neon.png
* fixed for .desktop files found installed on my device

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/dillo/dillo2_2.1.1.bb                      |    2 +-
 recipes/dillo/files/dillo.desktop                  |    2 +-
 recipes/gpe-scap/gpe-scap_1.4.bb                   |    6 +++++-
 recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb     |    6 +++++-
 .../numptyphysics/numptyphysics.desktop            |    2 +-
 recipes/numptyphysics/numptyphysics_svn.bb         |    2 +-
 recipes/openmoko-3rdparty/calc_0.0.4.bb            |    6 +++++-
 recipes/openmoko-3rdparty/calc_git.bb              |    4 ++++
 recipes/openmoko-3rdparty/om-neon_svn.bb           |    3 ++-
 recipes/openmoko-3rdparty/podboy_svn.bb            |    3 ++-
 recipes/pyphonelog/pyphonelog_git.bb               |    6 +++++-
 11 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/recipes/dillo/dillo2_2.1.1.bb b/recipes/dillo/dillo2_2.1.1.bb
index 69b9c65..e77f164 100644
--- a/recipes/dillo/dillo2_2.1.1.bb
+++ b/recipes/dillo/dillo2_2.1.1.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "fltk2-images"
 SRC_URI="http://www.dillo.org/download/dillo-${PV}.tar.bz2 \
          file://dillo.desktop \
          file://dillo.png"
-PR = "r6"
+PR = "r7"
 
 S = "${WORKDIR}/dillo-${PV}/"
 
diff --git a/recipes/dillo/files/dillo.desktop b/recipes/dillo/files/dillo.desktop
index 6c5f994..9144553 100644
--- a/recipes/dillo/files/dillo.desktop
+++ b/recipes/dillo/files/dillo.desktop
@@ -4,6 +4,6 @@ Comment=Dillo
 Exec=dillo
 Terminal=0
 Type=Application
-Icon=dillo.png
+Icon=dillo
 Categories=Application;PIM;GPE
 StartupNotify=True
diff --git a/recipes/gpe-scap/gpe-scap_1.4.bb b/recipes/gpe-scap/gpe-scap_1.4.bb
index 9e560e6..eec2fce 100644
--- a/recipes/gpe-scap/gpe-scap_1.4.bb
+++ b/recipes/gpe-scap/gpe-scap_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A GPE application that allows you to take screenshots."
 LICENSE = "GPL"
 PRIORITY = "optional"
 SECTION = "gpe"
-PR = "r1"
+PR = "r2"
 
 RREPLACES_${PN} = "gpe-screenshot"
 
@@ -14,3 +14,7 @@ inherit gpe autotools
 
 SRC_URI[md5sum] = "eaf545561b0ad981c9d01833f30fcf95"
 SRC_URI[sha256sum] = "762778421fae7c62d5ec6a9d27986166c0dbbe2ff51fc10bb9b8baff5c367534"
+
+do_configure_prepend() {
+        sed -i 's#gpe-scap.png#gpe-scap#g' ${S}/gpe-scap.desktop.in
+}
diff --git a/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb b/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
index 3b33f0d..466fe11 100644
--- a/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
+++ b/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 DESCRIPTION = "A GPE notebook to sketch your notes"
 export CVSBUILD = "no"
 
-PR = "r2"
+PR = "r3"
 
 inherit gpe pkgconfig
 
@@ -15,6 +15,10 @@ SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 FILES_${PN} = "${bindir} ${datadir}/pixmaps ${datadir}/applications"
 FILES_${PN} += " ${datadir}/gpe/pixmaps"
 
+do_configure_prepend() {
+        sed -i 's#gpe-sketchbook.png#gpe-sketchbook#g' ${S}/gpe-sketchbook.desktop.in
+}
+
 do_compile () {
         oe_runmake PREFIX=${prefix}
         oe_runmake all-desktop PREFIX=${prefix}
diff --git a/recipes/numptyphysics/numptyphysics/numptyphysics.desktop b/recipes/numptyphysics/numptyphysics/numptyphysics.desktop
index 5ebefb6..b317ceb 100644
--- a/recipes/numptyphysics/numptyphysics/numptyphysics.desktop
+++ b/recipes/numptyphysics/numptyphysics/numptyphysics.desktop
@@ -3,7 +3,7 @@ Name=numptyphysics
 Comment=Physics Game
 Note=Simulate Objects
 Exec=numptyphysics
-Icon=star.png
+Icon=star
 Type=Application
 Categories=Games
 
diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/numptyphysics/numptyphysics_svn.bb
index f997dbe..9ea15dd 100644
--- a/recipes/numptyphysics/numptyphysics_svn.bb
+++ b/recipes/numptyphysics/numptyphysics_svn.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://numptyphysics.garage.maemo.org/"
 SECTION = "x11/games"
 SRCREV = "109"
 PV = "0.2+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 inherit autotools
 
diff --git a/recipes/openmoko-3rdparty/calc_0.0.4.bb b/recipes/openmoko-3rdparty/calc_0.0.4.bb
index a7bb158..6ed2057 100644
--- a/recipes/openmoko-3rdparty/calc_0.0.4.bb
+++ b/recipes/openmoko-3rdparty/calc_0.0.4.bb
@@ -4,12 +4,16 @@ AUTHOR = "Sebastian Spaeth <Sebastian@SSpaeth.de>"
 LICENSE  = "MIT"
 RDEPENDS_${PN} = "python-elementary python python-edbus"
 SECTION = "x11/application"
-PR = "r1"
+PR = "r2"
 
 
 SRC_URI = "git://github.com/spaetz/calc.git;protocol=http;branch=master;tag=${PV}"
 S = "${WORKDIR}/git"
 
+do_configure_prepend() {
+        sed -i 's#calculator.png#calculator#g' ${S}/data/elementary-calculator.desktop
+}
+
 do_install(){
         install -d ${D}${datadir}/applications
         install -m 0644 ${S}/data/elementary-calculator.desktop ${D}${datadir}/applications/
diff --git a/recipes/openmoko-3rdparty/calc_git.bb b/recipes/openmoko-3rdparty/calc_git.bb
index 53356b2..559a61b 100644
--- a/recipes/openmoko-3rdparty/calc_git.bb
+++ b/recipes/openmoko-3rdparty/calc_git.bb
@@ -14,6 +14,10 @@ DEFAULT_PREFERENCE = "-1"
 SRC_URI = "git://github.com/spaetz/calc.git;protocol=http;branch=master"
 S = "${WORKDIR}/git"
 
+do_configure_prepend() {
+        sed -i 's#calculator.png#calculator#g' ${S}/data/elementary-calculator.desktop
+}
+
 do_install(){
         install -d ${D}${datadir}/applications
         install -m 0644 ${S}/data/elementary-calculator.desktop ${D}${datadir}/applications/
diff --git a/recipes/openmoko-3rdparty/om-neon_svn.bb b/recipes/openmoko-3rdparty/om-neon_svn.bb
index a17c373..20b2251 100644
--- a/recipes/openmoko-3rdparty/om-neon_svn.bb
+++ b/recipes/openmoko-3rdparty/om-neon_svn.bb
@@ -8,7 +8,7 @@ DEPENDS = "edje-native python-native"
 
 SRCREV = "68"
 PV = "1.0.0+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}/trunk"
 
@@ -27,4 +27,5 @@ do_compile_prepend() {
 	sed -i "s/\/opt\/bin\/edje_cc -v/${@"${STAGING_BINDIR_NATIVE}".replace('/', '\/')}\/edje_cc/g" ${S}/build_edje.py
 	sed -i "s/#THEMES_DIR = '\/usr\/share\/neon\/themes'/THEMES_DIR = '\/usr\/share\/neon\/themes'/g" ${S}/neon/neon.py
 	sed -i "s/THEMES_DIR = '..\/data\/themes'/#THEMES_DIR = '..\/data\/themes'/g" ${S}/neon/neon.py
+	sed -i 's#neon.png#neon#g' ${S}/data/neon.desktop
 }
diff --git a/recipes/openmoko-3rdparty/podboy_svn.bb b/recipes/openmoko-3rdparty/podboy_svn.bb
index 1cbeb69..813b812 100644
--- a/recipes/openmoko-3rdparty/podboy_svn.bb
+++ b/recipes/openmoko-3rdparty/podboy_svn.bb
@@ -7,7 +7,7 @@ PRIORITY = "optional"
 
 SRCREV = "210"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 PACKAGE_ARCH = "all"
 
@@ -23,4 +23,5 @@ RDEPENDS_${PN} += "python-compression python-elementary python-gst python-html p
 
 do_compile_prepend() {
 	${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/data ${S}/data/podboy.edc
+	sed -i 's#podboy.png#podboy#g' ${S}/data/podboy.desktop
 }
diff --git a/recipes/pyphonelog/pyphonelog_git.bb b/recipes/pyphonelog/pyphonelog_git.bb
index e22e824..639194c 100644
--- a/recipes/pyphonelog/pyphonelog_git.bb
+++ b/recipes/pyphonelog/pyphonelog_git.bb
@@ -11,8 +11,12 @@ S = "${WORKDIR}/git"
 SRCREV = "d22159060470d2f429d4e8b9ba1dc3096aa5d099"
 PE = "1"
 PV = "0.17.0+gitr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRC_URI = "git://git.shr-project.org/repo/pyphonelog.git;protocol=http"
 FILES_${PN} += "${datadir}/applications/phonelog.desktop \
 		${datadir}/phonelog/ \
 		${datadir}/pixmaps/phonelog.png"
+
+do_configure_prepend() {
+        sed -i 's#phonelog.png#phonelog#g' ${S}/data/applications/phonelog.desktop
+}
-- 
1.7.4



