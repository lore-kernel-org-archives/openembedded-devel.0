Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvs5-0001ns-Cr
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 18:42:06 +0100
Received: by faas16 with SMTP id s16so6397406faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3zTHQml30ccAcPxrU1rgdhaP4leWdTbNobGe949nf9Q=;
	b=goyTNq/WRiUu0ufOVQcjx+0oDx2Aj6E0D2QvRHnFZR7wPU7k01x2vdrRfLeq0TdL+1
	YF1Y35AHvbWkSCCq2JLpVawFqY9zdB2wgbfoMmDsHWL1kkgShJ1DhQhJTOcA/3hc1vkR
	EfgHPAVBNvJ04+mQXAzxTIR9j9BZ6pZrNMk/A=
Received: by 10.223.14.3 with SMTP id e3mr31375930faa.25.1320082555693;
	Mon, 31 Oct 2011 10:35:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm39127701faf.14.2011.10.31.10.35.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:35:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:35:45 +0100
Message-Id: <1320082546-31376-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [PATCH 1/2] recipes: bump PR after python upgrade
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
X-List-Received-Date: Mon, 31 Oct 2011 17:42:06 -0000

* should be applied only after python is upgraded in oe-core from 2.6.6
  to 2.7.2, pull request is sent to oe-core ML

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-ecore_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edbus_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 .../python/python-elementary_svn.bb                |    2 +-
 .../recipes-devtools/python/python-emotion_svn.bb  |    2 +-
 .../recipes-devtools/python/python-evas_svn.bb     |    2 +-
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb      |    2 ++
 .../python/python-cheetah_2.4.4.bb                 |    2 +-
 .../python/python-cython_0.15.1.bb                 |    2 +-
 .../python/python-dateutil_1.4.1.bb                |    2 +-
 .../recipes-devtools/python/python-docutils_0.5.bb |    1 +
 .../recipes-devtools/python/python-lxml_2.2.8.bb   |    1 +
 .../recipes-devtools/python/python-numeric_24.2.bb |    2 +-
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    1 +
 .../recipes-devtools/python/python-pexpect_2.3.bb  |    2 +-
 .../python/python-phoneutils_git.bb                |    2 +-
 .../python/python-pyalsaaudio_0.4.bb               |    2 +-
 .../recipes-devtools/python/python-pyserial_2.4.bb |    2 +-
 .../recipes-devtools/python/python-pyudev_0.11.bb  |    2 +-
 .../recipes-devtools/python/python-pyyaml_svn.bb   |    2 +-
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 .../python/python-sqlalchemy_0.7.1.bb              |    2 +-
 .../recipes-devtools/python/python-tornado_git.bb  |    1 +
 .../python/python-vobject_0.8.1c.bb                |    2 +-
 meta-oe/recipes-graphics/pango/pango.inc           |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb       |    2 ++
 meta-oe/recipes-support/pidgin/pidgin.inc          |    2 +-
 27 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
index a6ec5e6..1300e24 100644
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "python-evas ecore"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
index 518f7c2..256a52a 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edbus python-dbus"
 RDEPENDS_${PN} += "python-dbus"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index 8afcbfd..ee974d4 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edje python-evas"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index ffb6d5e..fd4ea6d 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
index 89002c3..a39c0c8 100644
--- a/meta-efl/recipes-devtools/python/python-emotion_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "emotion python-evas"
 RDEPENDS_${PN} += "python-ecore"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
index 79844be..aa4d52f 100644
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -1,6 +1,6 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "evas"
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb
index 712ca87..0278a2f 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.0.11.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
+PR = "r1"
+
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
            libxdamage libxrender libxcomposite cairo gdk-pixbuf"
diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index e1a4053..c07e969 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aff1107514aa6aae948f9fe71fdc393b"
 
 SRCNAME = "Cheetah"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://pypi.python.org/packages/source/C/Cheetah/Cheetah-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index 3b85601..72d98cb 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
index e69b946..d1ebfc0 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
 SRCNAME = "${PN}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
index 1e6893d..adecd8f 100644
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ac6ee29ac0310c091afab5ac4bea2fa3"
+PR = "r1"
 
 DEPENDS = "python"
 
diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
index e19c776..dcb161a 100644
--- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
+++ b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://codespeak.net/lxml"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=7de92baeb3b7bfaebe72404155fdb346"
 SRCNAME = "lxml"
+PR = "r1"
 
 DEPENDS = "libxml2 libxslt"
 RDEPENDS_${PN} += "libxml2 libxslt python-compression"
diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
index 1bee01d..c45a6a6 100644
--- a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
+++ b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF & LLNL"
 LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
 
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz"
 S = "${WORKDIR}/Numeric-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 44d60b1..36ab622 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
 	   file://config.h \
diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
index c4d7486..9a76ff6 100644
--- a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04a2bf11b85ce49d4a8c0c413fd34404"
 SRCNAME = "pexpect"
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb b/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
index b46a772..a3c3c93 100644
--- a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
+++ b/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://phoneutils/c_phoneutils.pyx;endline=18;md5=ca321e4ec3
 
 SRCREV = "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
 PV = "0.0.2+gitr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://git.shr-project.org/repo/libphone-utils.git;protocol=http;branch=master"
 S = "${WORKDIR}/git/src/python"
diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
index 2c3a622..5faf39c 100644
--- a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
@@ -4,7 +4,7 @@ DEPENDS = "alsa-lib"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 SRCNAME = "pyalsaaudio"
-PR = "ml0"
+PR = "ml1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pyalsaaudio/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
index 4684744..9dc54de 100644
--- a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7424386ffe323e815ee62ee9ad591dd8"
 SRCNAME = "pyserial"
-PR = "ml2"
+PR = "ml3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
index 03a948a..3aaefb4 100644
--- a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
+++ b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pypi.python.org/pypi/pyudev"
 SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r0"
+PR = "r1"
 
 SRCNAME = "pyudev"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb b/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
index 965b1cc..b40b7a6 100644
--- a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
+++ b/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 DEPENDS = "libyaml python-cython-native"
 SRCREV = "344"
 PV = "3.08+svnr${SRCPV}"
-PR = "ml0"
+PR = "ml1"
 
 SRC_URI = "\
   svn://svn.pyyaml.org/pyyaml;module=trunk;proto=http \
diff --git a/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
index ca7335e..32e2e57 100644
--- a/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta-oe/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -5,7 +5,7 @@ LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
 
 SRCNAME = "setuptools"
-PR = "ml2"
+PR = "ml3"
 DEPENDS += "python"
 DEPENDS_virtclass-native += "python-native"
 
diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
index a50ce2e..06d0f70 100644
--- a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
+++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"         
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88f48967a8bd1fe88f5425f7e659dbf"
 RDEPENDS_${PN} += "python-numbers"
-PR = "r0"
+PR = "r1"
 
 SRCNAME = "SQLAlchemy"
 SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 6dbb8ad..ebbc7d1 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -3,6 +3,7 @@ LICENSE = "Apache"
 LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
 
 PV = "2.1.1"
+PR = "r1"
 SRCREV = "970b43bddf276d7ce0022252709fcac1ff1f8c64"
 SRC_URI = "git://github.com/facebook/tornado.git"
 
diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
index 85affe8..050c999 100644
--- a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
+++ b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
 SRCNAME = "vobject" 
 RDEPENDS_${PN} = "python python-dateutil"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://vobject.skyhouseconsulting.com/${SRCNAME}-${PV}.tar.gz" 
 S = "${WORKDIR}/${SRCNAME}-${PV}" 
diff --git a/meta-oe/recipes-graphics/pango/pango.inc b/meta-oe/recipes-graphics/pango/pango.inc
index b098691..341d0e3 100644
--- a/meta-oe/recipes-graphics/pango/pango.inc
+++ b/meta-oe/recipes-graphics/pango/pango.inc
@@ -18,7 +18,7 @@ PACKAGES_DYNAMIC_virtclass-native = ""
 
 RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 # seems to go wrong with default cflags
 FULL_OPTIMIZATION_arm = "-O2"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
index c65f538..a6bf308 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
+PR = "r1"
+
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
                 --enable-dbus \
diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 91ed9a2..1a35457 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -3,7 +3,7 @@ SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
-- 
1.7.7.1



