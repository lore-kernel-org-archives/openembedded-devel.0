Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3432.1592471049630467564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 02:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59970 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jlqSq-0004oK-VG; Thu, 18 Jun 2020 12:04:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pexpect: Consolidate in a single file
Date: Thu, 18 Jun 2020 12:03:56 +0300
Message-Id: <20200618090358.31927-1-leon.anavi@konsulko.com>
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
 .../python/python-pexpect.inc                 | 23 -----------------
 .../python/python3-pexpect_4.8.0.bb           | 25 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pexpect.inc

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
deleted file mode 100644
index c6230b2b5..000000000
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "A Pure Python Expect like Module for Python"
-HOMEPAGE = "http://pexpect.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
-
-SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
-
-SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
-SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-resource \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-ptyprocess \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
index cf39233a3..99e1f199f 100644
--- a/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pexpect_4.8.0.bb
@@ -1,2 +1,25 @@
-require python-pexpect.inc
+SUMMARY = "A Pure Python Expect like Module for Python"
+HOMEPAGE = "http://pexpect.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
+
+SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
+
+SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
+SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
+
 inherit pypi setuptools3
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-ptyprocess \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

