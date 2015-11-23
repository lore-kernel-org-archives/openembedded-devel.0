Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59C656010D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 17:13:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tANHDmKf007985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 09:13:48 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 Nov 2015 09:13:47 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Nov 2015 12:13:47 -0500
Message-ID: <1448298827-9195-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-cryptography, python-cryptography-vectors: uprev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Nov 2015 17:13:49 -0000
Content-Type: text/plain

Pick up many fixes and enhancements made since 0.8.1 was released.
See: https://github.com/pyca/cryptography/blob/master/CHANGELOG.rst

The uprev requires an uprev of pyasn1 and also pulls in two new
packages idna and ipaddress. The idna software has 3 licenses, one of
which is the 'Unicode' license: http://www.unicode.org/copyright.html

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-python/conf/layer.conf                        |  2 ++
 meta-python/licenses/Unicode                       | 37 ++++++++++++++++++++++
 ...0.8.1.bb => python-cryptography-vectors_1.1.bb} |  4 +--
 ...ography_0.8.1.bb => python-cryptography_1.1.bb} | 11 +++++--
 .../recipes-devtools/python/python-idna_git.bb     | 22 +++++++++++++
 .../python/python-ipaddress_git.bb                 | 22 +++++++++++++
 ...thon-pyasn1_0.1.7.bb => python-pyasn1_0.1.9.bb} |  8 ++---
 7 files changed, 98 insertions(+), 8 deletions(-)
 create mode 100644 meta-python/licenses/Unicode
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_0.8.1.bb => python-cryptography-vectors_1.1.bb} (74%)
 rename meta-python/recipes-devtools/python/{python-cryptography_0.8.1.bb => python-cryptography_1.1.bb} (79%)
 create mode 100644 meta-python/recipes-devtools/python/python-idna_git.bb
 create mode 100644 meta-python/recipes-devtools/python/python-ipaddress_git.bb
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.1.7.bb => python-pyasn1_0.1.9.bb} (57%)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 55169e4..d53677f 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -13,3 +13,5 @@ BBFILE_PRIORITY_meta-python = "7"
 LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
+
+LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-python/licenses/Unicode b/meta-python/licenses/Unicode
new file mode 100644
index 0000000..5d2cc4a
--- /dev/null
+++ b/meta-python/licenses/Unicode
@@ -0,0 +1,37 @@
+COPYRIGHT AND PERMISSION NOTICE
+
+Copyright 1991-2015 Unicode, Inc. All rights reserved.
+Distributed under the Terms of Use in
+http://www.unicode.org/copyright.html.
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of the Unicode data files and any associated documentation
+(the "Data Files") or Unicode software and any associated documentation
+(the "Software") to deal in the Data Files or Software
+without restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, and/or sell copies of
+the Data Files or Software, and to permit persons to whom the Data Files
+or Software are furnished to do so, provided that
+(a) this copyright and permission notice appear with all copies
+of the Data Files or Software,
+(b) this copyright and permission notice appear in associated
+documentation, and
+(c) there is clear notice in each modified Data File or in the Software
+as well as in the documentation associated with the Data File(s) or
+Software that the data or software has been modified.
+
+THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF
+ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
+WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT OF THIRD PARTY RIGHTS.
+IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS
+NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL
+DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THE DATA FILES OR SOFTWARE.
+
+Except as contained in this notice, the name of a copyright holder
+shall not be used in advertising or otherwise to promote the sale,
+use or other dealings in these Data Files or Software without prior
+written authorization of the copyright holder.
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb
index a9b64ed..2150e50 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb
@@ -8,7 +8,7 @@ SRCNAME = "cryptography_vectors"
 SRC_URI = "https://pypi.python.org/packages/source/c/cryptography-vectors/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "04fcfcc61aee62e3b4beb1740cd120ac"
-SRC_URI[sha256sum] = "4a69e66026bfce4b97f75e72fe262f5e8f71daddc081f6608e5b0db89e552504"
+SRC_URI[md5sum] = "0ad422501074929c06b7edd40df41844"
+SRC_URI[sha256sum] = "a929fbb0eac391c93c5745451a4d4157a8bc18eb2e69faf3af1d825ceacbf32c"
 
 inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.1.bb
index 41e4acd..b3eee03 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}
 "
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "70dde78a5515abdbfd7a3d58f15689ab"
-SRC_URI[sha256sum] = "f4e041bc83c1be94d87116a7aa201c378b7c6581be4d83994b2da0a84499f73b"
+SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
+SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
 
 inherit pypi
 
@@ -26,6 +26,9 @@ RDEPENDS_${PN} = "\
                   python-threading\
                   python-numbers\
                   python-contextlib\
+                  python-ipaddress\
+                  python-pyasn1\
+                  python-idna\
 "
 
 RDEPENDS_${PN}-ptest = "\
@@ -44,3 +47,7 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests/hazmat
     cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
 }
+
+FILES_${PN}-dbg += " \
+    ${libdir}/python2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
+    "
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-idna_git.bb b/meta-python/recipes-devtools/python/python-idna_git.bb
new file mode 100644
index 0000000..f5ce658
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-idna_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Internationalised Domain Names in Applications"
+HOMEPAGE = "https://github.com/kjd/idna"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c61e6ec7ab3da6b340d8d3a89c964ef2"
+
+PV = "2.0"
+SRCREV = "bb6e94c5b5525684d8ca010bf8ab42480c319e0a"
+
+SRCNAME = "idna"
+SRC_URI = "git://github.com/kjd/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-python/recipes-devtools/python/python-ipaddress_git.bb b/meta-python/recipes-devtools/python/python-ipaddress_git.bb
new file mode 100644
index 0000000..3d13833
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ipaddress_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
+HOMEPAGE = "https://github.com/phihag/ipaddress"
+SECTION = "devel/python"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
+
+PV = "1.0.15"
+SRCREV = "95adb9f374a1cca5efda08d20d9fc58d955d4a42"
+
+SRCNAME = "ipaddress"
+SRC_URI = "git://github.com/phihag/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
index 0fe6909..202e4dc 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb
+++ b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
 DEPENDS = "python"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pyasn1/pyasn1-${PV}.tar.gz"
-SRC_URI[md5sum] = "2cbd80fcd4c7b1c82180d3d76fee18c8"
-SRC_URI[sha256sum] = "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7ad8f98b25c101eab"
+SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
+SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
 
 S = "${WORKDIR}/pyasn1-${PV}"
 
-- 
2.1.4


