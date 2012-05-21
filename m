Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWa27-00005s-Id
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 23:20:59 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2012 23:10:40 +0200
Message-Id: <1337634640-21706-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] python: bump PR of packages after update of distutils.bbclass
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
X-List-Received-Date: Mon, 21 May 2012 21:21:02 -0000

* Bump every recipe inheriting distutils or setuptools and
  not overriding do_install without calling distutils_do_install.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* NOTE: Depends on a patch just submitted to OE-Core mailing list.

 .../recipes-connectivity/gateone/gateone_git.bb    |    2 +-
 .../python/python-cheetah_2.4.4.bb                 |    2 +-
 .../python/python-cython_0.15.1.bb                 |    2 +-
 .../python/python-dateutil_1.4.1.bb                |    2 +-
 .../recipes-devtools/python/python-docutils_0.5.bb |    2 +-
 .../recipes-devtools/python/python-lxml_2.2.8.bb   |    2 +-
 .../recipes-devtools/python/python-numeric_24.2.bb |    2 +-
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    2 +-
 .../recipes-devtools/python/python-pexpect_2.3.bb  |    2 +-
 .../python/python-phoneutils_git.bb                |    2 +-
 .../python/python-pyalsaaudio_0.4.bb               |    2 +-
 .../python/python-pyopenssl_0.13.bb                |    1 +
 .../recipes-devtools/python/python-pyserial_2.4.bb |    2 +-
 .../recipes-devtools/python/python-pyudev_0.11.bb  |    2 +-
 .../python/python-pyusb_1.0.0a2.bb                 |    1 +
 .../recipes-devtools/python/python-pyyaml_svn.bb   |    2 +-
 .../python/python-simplejson_2.2.1.bb              |    1 +
 .../python/python-sqlalchemy_0.7.1.bb              |    2 +-
 .../recipes-devtools/python/python-tornado_git.bb  |    1 +
 .../python/python-twisted_10.2.0.bb                |    1 +
 .../python/python-vobject_0.8.1c.bb                |    2 +-
 .../python/python-zopeinterface_3.5.1.bb           |    1 +
 22 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 983dc24..592c277 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r1"
+PR = "r2"
 
 PV = "1.0"
 SRCREV = "0dfa4196ca514e075199c0dbf849353c6aa2976b"
diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index c07e969..b6f0d2c 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aff1107514aa6aae948f9fe71fdc393b"
 
 SRCNAME = "Cheetah"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://pypi.python.org/packages/source/C/Cheetah/Cheetah-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index 72d98cb..0bf057a 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
diff --git a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
index d1ebfc0..a449f03 100644
--- a/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-dateutil_1.4.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d82268718c68bda0b091006ec6e583c6"
 SRCNAME = "${PN}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://labix.org/download/python-dateutil/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
index adecd8f..cdc488a 100644
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ac6ee29ac0310c091afab5ac4bea2fa3"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "python"
 
diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
index dcb161a..a175609 100644
--- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
+++ b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://codespeak.net/lxml"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=7de92baeb3b7bfaebe72404155fdb346"
 SRCNAME = "lxml"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libxml2 libxslt"
 RDEPENDS_${PN} += "libxml2 libxslt python-compression"
diff --git a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
index c45a6a6..35ace89 100644
--- a/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
+++ b/meta-oe/recipes-devtools/python/python-numeric_24.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF & LLNL"
 LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
 
-PR = "ml2"
+PR = "ml3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz"
 S = "${WORKDIR}/Numeric-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 36ab622..88f1eec 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
 	   file://config.h \
diff --git a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
index 9a76ff6..d1b8530 100644
--- a/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pexpect_2.3.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04a2bf11b85ce49d4a8c0c413fd34404"
 SRCNAME = "pexpect"
-PR = "ml2"
+PR = "ml3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb b/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
index a3c3c93..36f5241 100644
--- a/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
+++ b/meta-oe/recipes-devtools/python/python-phoneutils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://phoneutils/c_phoneutils.pyx;endline=18;md5=ca321e4ec3
 
 SRCREV = "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
 PV = "0.0.2+gitr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://git.shr-project.org/repo/libphone-utils.git;protocol=http;branch=master"
 S = "${WORKDIR}/git/src/python"
diff --git a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
index 5faf39c..49fbc8f 100644
--- a/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyalsaaudio_0.4.bb
@@ -4,7 +4,7 @@ DEPENDS = "alsa-lib"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 SRCNAME = "pyalsaaudio"
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pyalsaaudio/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb b/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
index f2d6d9e..181879f 100644
--- a/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
+++ b/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCNAME = "pyOpenSSL"
 
 DEPENDS = "openssl"
+PR = "r1"
 
 SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
 SRC_URI[md5sum] = "767bca18a71178ca353dff9e10941929"
diff --git a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
index 9dc54de..02ba6b7 100644
--- a/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
+++ b/meta-oe/recipes-devtools/python/python-pyserial_2.4.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7424386ffe323e815ee62ee9ad591dd8"
 SRCNAME = "pyserial"
-PR = "ml3"
+PR = "ml4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
index 3aaefb4..0e8d80a 100644
--- a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
+++ b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pypi.python.org/pypi/pyudev"
 SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r1"
+PR = "r2"
 
 SRCNAME = "pyudev"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
index 4048f4b..4024282 100644
--- a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
+++ b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a53a9c39efcfb812e2464af14afab013"
 DEPENDS = "libusb1"
+PR = "r1"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/pyusb/${SRCNAME}-${PV}.tar.gz \
diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb b/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
index b40b7a6..c224507 100644
--- a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
+++ b/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 DEPENDS = "libyaml python-cython-native"
 SRCREV = "344"
 PV = "3.08+svnr${SRCPV}"
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "\
   svn://svn.pyyaml.org/pyyaml;module=trunk;proto=http \
diff --git a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb b/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
index 8e42dc7..6be59c9 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
+++ b/meta-oe/recipes-devtools/python/python-simplejson_2.2.1.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8a9f8dcfcd28c34daa443e5b1d29813b"
+PR = "r1"
 
 SRCNAME = "simplejson"
 
diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
index 06d0f70..9c7bd37 100644
--- a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
+++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"         
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88f48967a8bd1fe88f5425f7e659dbf"
 RDEPENDS_${PN} += "python-numbers"
-PR = "r1"
+PR = "r2"
 
 SRCNAME = "SQLAlchemy"
 SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 693b454..00d0bbb 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
 
 PV = "2.2"
 SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
+PR = "r1"
 SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
            file://0001-disable-AI_ADDRCONFIG-flag.patch \
           "
diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
index 14e8f18..1455982 100644
--- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
@@ -7,6 +7,7 @@ SECTION = "console/network"
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c3159ad36d96a939fcd8f2c2c9b9d08a"
+PR = "r1"
 
 SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${PV}.tar.bz2 "
 SRC_URI[md5sum] = "73da62c793269eade8121da336b01ba5"
diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
index 050c999..4a03ea2 100644
--- a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
+++ b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
 SRCNAME = "vobject" 
 RDEPENDS_${PN} = "python python-dateutil"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://vobject.skyhouseconsulting.com/${SRCNAME}-${PV}.tar.gz" 
 S = "${WORKDIR}/${SRCNAME}-${PV}" 
diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb b/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
index 106e836..f2dbee2 100644
--- a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
+++ b/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
@@ -3,6 +3,7 @@ SECTION = "console/network"
 
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
+PR = "r1"
 
 SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
 SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
-- 
1.7.9.5



