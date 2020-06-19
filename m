Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2110.1592554232622550776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCL4-0007GG-57; Fri, 19 Jun 2020 11:25:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-parse: Consolidate in a single file
Date: Fri, 19 Jun 2020 11:10:05 +0300
Message-Id: <20200619081011.25051-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-parse.inc  | 26 -----------------
 .../python/python3-parse_1.15.0.bb            | 28 +++++++++++++++++--
 2 files changed, 26 insertions(+), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse.inc

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
deleted file mode 100644
index ecfd67172..000000000
--- a/meta-python/recipes-devtools/python/python-parse.inc
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Parse strings using a specification based on the Python format() syntax"
-HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9"
-
-SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
-SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
-
-inherit pypi ptest
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    "
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
-	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
index b1242545c..bff41449c 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
@@ -1,2 +1,26 @@
-inherit setuptools3
-require python-parse.inc
+SUMMARY = "Parse strings using a specification based on the Python format() syntax"
+HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9"
+
+SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
+SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
+
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    "
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
+	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
+}
-- 
2.17.1

