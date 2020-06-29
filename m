Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.17260.1593432768563910548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseU-0001kP-7O; Mon, 29 Jun 2020 15:12:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-pywbem: Consolidate in a single file
Date: Mon, 29 Jun 2020 15:12:26 +0300
Message-Id: <20200629121233.27026-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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
 .../recipes-extended/pywbem/python-pywbem.inc | 51 ------------------
 .../pywbem/python3-pywbem_0.15.0.bb           | 53 ++++++++++++++++++-
 2 files changed, 51 insertions(+), 53 deletions(-)
 delete mode 100644 meta-python/recipes-extended/pywbem/python-pywbem.inc

diff --git a/meta-python/recipes-extended/pywbem/python-pywbem.inc b/meta-python/recipes-extended/pywbem/python-pywbem.inc
deleted file mode 100644
index 98508b0c3..000000000
--- a/meta-python/recipes-extended/pywbem/python-pywbem.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Python WBEM Client and Provider Interface"
-DESCRIPTION = "\
-A Python library for making CIM (Common Information Model) operations over \
-HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
-WBEM client should be easy to use and not necessarily require a large amount \
-of programming knowledge. It is suitable for a large range of tasks from \
-simply poking around to writing web and GUI applications. \
-\
-WBEM, or Web Based Enterprise Management is a manageability protocol, like \
-SNMP, standardised by the Distributed Management Task Force (DMTF) available \
-at http://www.dmtf.org/standards/wbem. \
-\
-It also provides a Python provider interface, and is the fastest and easiest \
-way to write providers on the planet."
-HOMEPAGE = "http://pywbem.github.io"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
-
-inherit pypi 
-
-SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
-PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += " \
-    ${PYTHON_PN}-ply-native \
-    ${PYTHON_PN}-pyyaml-native \
-    ${PYTHON_PN}-six-native \
-"
-
-do_install_append() {
-    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-
-    rm -f ${D}${bindir}/*.bat
-}
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pyyaml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-xml \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
index abfb8d920..cbb55b8f7 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
@@ -1,5 +1,52 @@
-require python-pywbem.inc
-inherit setuptools3 update-alternatives
+SUMMARY = "Python WBEM Client and Provider Interface"
+DESCRIPTION = "\
+A Python library for making CIM (Common Information Model) operations over \
+HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
+WBEM client should be easy to use and not necessarily require a large amount \
+of programming knowledge. It is suitable for a large range of tasks from \
+simply poking around to writing web and GUI applications. \
+\
+WBEM, or Web Based Enterprise Management is a manageability protocol, like \
+SNMP, standardised by the Distributed Management Task Force (DMTF) available \
+at http://www.dmtf.org/standards/wbem. \
+\
+It also provides a Python provider interface, and is the fastest and easiest \
+way to write providers on the planet."
+HOMEPAGE = "http://pywbem.github.io"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
+
+inherit pypi setuptools3 update-alternatives
+
+SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
+PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += " \
+    ${PYTHON_PN}-ply-native \
+    ${PYTHON_PN}-pyyaml-native \
+    ${PYTHON_PN}-six-native \
+"
+
+do_install_append() {
+    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
+
+    rm -f ${D}${bindir}/*.bat
+}
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-xml \
+"
 
 ALTERNATIVE_${PN} = "mof_compiler pywbemcli wbemcli"
 ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
@@ -7,3 +54,5 @@ ALTERNATIVE_TARGET[pywbemcli] = "${bindir}/pywbemcli"
 ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
 
 ALTERNATIVE_PRIORITY = "60"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

