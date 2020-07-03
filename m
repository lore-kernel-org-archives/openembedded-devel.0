Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6911.1593768645324814757
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1q-0007av-SP; Fri, 03 Jul 2020 12:30:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-pyasn1-modules: Consolidate in a single file
Date: Fri,  3 Jul 2020 12:30:18 +0300
Message-Id: <20200703093020.3514-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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
 .../python/python-pyasn1-modules.inc          | 29 -----------------
 .../python/python3-pyasn1-modules_0.2.7.bb    | 31 +++++++++++++++++--
 2 files changed, 29 insertions(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1-modules.inc

diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
deleted file mode 100644
index ce9791993c..0000000000
--- a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "A collection of ASN.1-based protocols modules."
-DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
- classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
- data structures (X.509, PKCS etc.)."
-HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
-
-SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
-SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
-
-inherit pypi ptest
-
-RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
index 3b1186f06c..f2a836b04a 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
@@ -1,2 +1,29 @@
-require python-pyasn1-modules.inc
-inherit setuptools3
+SUMMARY = "A collection of ASN.1-based protocols modules."
+DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
+ classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
+ data structures (X.509, PKCS etc.)."
+HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
+
+SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
+SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
+
+inherit pypi ptest setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.17.1

