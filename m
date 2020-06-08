Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.28578.1591618464397787821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfU-0005b8-Gw; Mon, 08 Jun 2020 15:14:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-lxml: Consolidate in a single file
Date: Mon,  8 Jun 2020 15:14:04 +0300
Message-Id: <20200608121410.5814-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-lxml.inc   | 50 -----------------
 .../python/python3-lxml_4.5.0.bb              | 53 ++++++++++++++++++-
 2 files changed, 51 insertions(+), 52 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lxml.inc

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
deleted file mode 100644
index 05b5eae46..000000000
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
-DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
-libxslt libraries. It provides safe and convenient access to these \
-libraries using the ElementTree API. It extends the ElementTree API \
-significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
-C14N and much more."
-HOMEPAGE = "http://codespeak.net/lxml"
-SECTION = "devel/python"
-LICENSE = "BSD & GPLv2 & MIT & PSF"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
-                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
-                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
-                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
-                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
-                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
-                    "
-
-DEPENDS += "libxml2 libxslt"
-
-SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
-SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
-
-DISTUTILS_BUILD_ARGS += " \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-"
-
-DISTUTILS_INSTALL_ARGS += " \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-"
-
-inherit pypi
-
-# {standard input}: Assembler messages:
-# {standard input}:1488805: Error: branch out of range
-DEBUG_OPTIMIZATION_remove_mips = " -Og"
-DEBUG_OPTIMIZATION_append_mips = " -O"
-BUILD_OPTIMIZATION_remove_mips = " -Og"
-BUILD_OPTIMIZATION_append_mips = " -O"
-
-DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
-DEBUG_OPTIMIZATION_append_mipsel = " -O"
-BUILD_OPTIMIZATION_remove_mipsel = " -Og"
-BUILD_OPTIMIZATION_append_mipsel = " -O"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
index b95d7bae7..e3cfa46d1 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
@@ -1,3 +1,52 @@
-inherit setuptools3
-require python-lxml.inc
+SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
+DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
+libxslt libraries. It provides safe and convenient access to these \
+libraries using the ElementTree API. It extends the ElementTree API \
+significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
+C14N and much more."
+HOMEPAGE = "http://codespeak.net/lxml"
+SECTION = "devel/python"
+LICENSE = "BSD & GPLv2 & MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
+                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
+                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
+                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
+                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
+                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
+                    "
+
+DEPENDS += "libxml2 libxslt"
+
+SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
+SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
+
+DISTUTILS_BUILD_ARGS += " \
+                     --with-xslt-config='pkg-config libxslt' \
+                     --with-xml2-config='pkg-config libxml-2.0' \
+"
+
+DISTUTILS_INSTALL_ARGS += " \
+                     --with-xslt-config='pkg-config libxslt' \
+                     --with-xml2-config='pkg-config libxml-2.0' \
+"
+
+inherit pypi setuptools3
+
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+DEBUG_OPTIMIZATION_remove_mips = " -Og"
+DEBUG_OPTIMIZATION_append_mips = " -O"
+BUILD_OPTIMIZATION_remove_mips = " -Og"
+BUILD_OPTIMIZATION_append_mips = " -O"
+
+DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
+DEBUG_OPTIMIZATION_append_mipsel = " -O"
+BUILD_OPTIMIZATION_remove_mipsel = " -Og"
+BUILD_OPTIMIZATION_append_mipsel = " -O"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
+
 CLEANBROKEN = "1"
-- 
2.17.1

