Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id 652A376BE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:29 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MFtf4-1ZYnl42qlK-00EsJO;
	Mon, 24 Aug 2015 17:28:28 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:53 +0200
Message-Id: <1440430077-551-5-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:y5w5mYxlrkbxoV55rCKXCFxNYi8c6iIdu2wSEjKzTjWK4hGKxmR
	AMQF0ixZGkYhGf67ZXQEYnt1IMJzZm1IsC87xmb2500UK2uOmWJ+oMsQnZr453RGcQxS942
	sMP05QN7sQE4UwHVaMGV4G6ouh4KOZTCOTwoz2wNgLxhza6EUO0VgHqjbKomV8l7EICZ7F/
	ef2W0/dn/p/c0TnEljJoQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:uTMX3eyELV4=:9KHubfFJ1ecYJegnjgoxAo
	Fkn0HrodJ4R6FyVJ3lHw7griZgPACdnwA2WmWT7KjneVuP+7SKmDOMk5HKIcJRc+9Ymx/TN1w
	w0zpNFDjXezESXXQosmEJNVmDBDwukV7IUjT+2VudFTF0n5VnJi9WTzri7Va9VFxDi6uVOOkG
	mUW9jbSCU7E6/EzjufyrI93Gw/fbaUAyGRas4hVvXmZ+rwGWTQrD4Sbreb+yEX8iUKMH5aUjW
	DCQEHFkuxrJJTTLnREMEQVtU++KemMEcStEoDLAWYm+79w5RtrBsptI0TpmldflyR9HxiTg2I
	hstH8rOJ2OGkPDdOR/+jJhxgBEYzHjdiCAbPm9FP9zX9Y5sJ7HcHAboU3Ilvw1o6/PnJk/ezo
	q+0ahskkYLFjFCVTOjv9yUfsuPE0fPuoQIgJRsrDa9BxPZ25qHgdS2WxfxhmOaJ0TueCul4XU
	LYQqaPPwsYo44olxzTBkSBADstl6e+VqplC7Cygjs4McudBEJ2RZ9Y0wS2Ja45ViqpOlZLiR1
	7wjNT1rf+kUg30daCrbY13ImC1t1pyQ4QOz7j0Pt3lA+0AXdqWBw0S5Bej2zny1/gc3Fm6ccf
	b0sjT9IVhkLI+FZYhsaZ7VtqteTZ0Q0PNObRfurDV8cGk+2YO1hejMk98mRRXW+8hySb7ewRS
	302IJUPSlgjl+xx+XJV+NZBFC8GmrL0DgCG7pmKTx0jbQHRnaSDVL6otS2yNYP2rgL8V81wg0
	CWbGqaHLN4L6u3hel5AMvuLAenE3v8Z9rzWE7w==
Subject: [meta-python][PATCH 4/8] python3-lxml: Add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 15:28:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a common .inc file for the python-lxml and python3-lxml recipes.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../recipes-devtools/python/python-lxml.inc        | 31 ++++++++++++++++++++
 .../recipes-devtools/python/python-lxml_3.4.4.bb   | 34 +---------------------
 .../recipes-devtools/python/python3-lxml_3.4.4.bb  |  2 ++
 3 files changed, 34 insertions(+), 33 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-lxml.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
new file mode 100644
index 0000000..9d1bfbc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -0,0 +1,31 @@
+SUMMARY = "Python XML bindings for libxml2 and libxslt"
+DESCRIPTION = "Powerful and Pythonic XML processing library combining \
+libxml2/libxslt with the ElementTree API."
+HOMEPAGE = "http://codespeak.net/lxml"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
+SRCNAME = "lxml"
+
+DEPENDS = "libxml2 libxslt"
+
+SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a9a65972afc173ec7a39c585f4eea69c"
+SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+DISTUTILS_BUILD_ARGS += " \
+                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
+                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
+"
+
+DISTUTILS_INSTALL_ARGS += " \
+                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
+                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
+RDEPENDS_${PN}_class-native = "libxml2-native libxslt-native"
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
index 4fab4f3..81ccb12 100644
--- a/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
+++ b/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
@@ -1,34 +1,2 @@
-SUMMARY = "Python XML bindings for libxml2 and libxslt"
-DESCRIPTION = "Powerful and Pythonic XML processing library combining \
-libxml2/libxslt with the ElementTree API."
-HOMEPAGE = "http://codespeak.net/lxml"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
-SRCNAME = "lxml"
-
-DEPENDS = "libxml2 libxslt"
-
-SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a9a65972afc173ec7a39c585f4eea69c"
-SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
-
-DISTUTILS_BUILD_ARGS += " \
-                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
-                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
-"
-
-DISTUTILS_INSTALL_ARGS += " \
-                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
-                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN} += "libxml2 libxslt python-compression"
-RDEPENDS_${PN}_class-native = "libxml2-native libxslt-native"
-
+require python-lxml.inc
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb
new file mode 100644
index 0000000..ff4bc7f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-lxml.inc
-- 
2.5.0


