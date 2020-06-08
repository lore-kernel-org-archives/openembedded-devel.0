Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.28589.1591618485902636618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfo-0005b8-Rn; Mon, 08 Jun 2020 15:14:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-prettytable: Consolidate in a single file
Date: Mon,  8 Jun 2020 15:14:10 +0300
Message-Id: <20200608121410.5814-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608121410.5814-1-leon.anavi@konsulko.com>
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
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

Consolidate inc and bb files into a single bb file. Inherit pypi.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-prettytable.inc             | 43 -------------------
 .../python/python3-prettytable_0.7.2.bb       | 38 +++++++++++++++-
 2 files changed, 36 insertions(+), 45 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-prettytable.inc

diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
deleted file mode 100644
index c77a49191..000000000
--- a/meta-python/recipes-devtools/python/python-prettytable.inc
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Python library for displaying tabular data in a ASCII table format"
-HOMEPAGE = "http://code.google.com/p/prettytable"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
-
-SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
-SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
-
-SRCNAME = "prettytable"
-
-SRC_URI = "https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-do_install_append() {
-    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-    for f in $perm_files; do
-        chmod 644 "${f}"
-    done
-}
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
-UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
-
-BBCLASSEXTEND = "native nativesdk"
-inherit ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN} += " \
-	${PYTHON_PN}-math \
-	${PYTHON_PN}-html \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
index 5445f1019..18f339061 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
@@ -1,3 +1,37 @@
-inherit setuptools3
-require python-prettytable.inc
+SUMMARY = "Python library for displaying tabular data in a ASCII table format"
+HOMEPAGE = "http://code.google.com/p/prettytable"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
 
+SRC_URI[md5sum] = "a6b80afeef286ce66733d54a0296b13b"
+SRC_URI[sha256sum] = "2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9"
+
+do_install_append() {
+    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
+    for f in $perm_files; do
+        chmod 644 "${f}"
+    done
+}
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
+UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
+inherit pypi ptest setuptools3
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-math \
+	${PYTHON_PN}-html \
+"
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
+}
-- 
2.17.1

