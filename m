Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4806.1591701065409108524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 04:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jic9m-00081E-OU; Tue, 09 Jun 2020 14:11:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-tornado: Consolidate in a single file
Date: Tue,  9 Jun 2020 14:10:45 +0300
Message-Id: <20200609111050.32307-1-leon.anavi@konsulko.com>
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
 .../python/python-tornado.inc                 | 25 ----------------
 .../python/python3-tornado_6.0.3.bb           | 29 ++++++++++++++++---
 2 files changed, 25 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado.inc

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
deleted file mode 100644
index 7cb61931a..000000000
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
-DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
-By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
-polling, WebSockets, and other applications that require a long-lived connection to each user."
-HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
-SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
-                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
-                   ${PYTHON_PN}-ctypes"
-
-RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
-
-PACKAGES =+ "\
-    ${PN}-test \
-"
-
-FILES_${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
-"
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
index 77c9fb516..04f6314d0 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
@@ -1,7 +1,28 @@
+SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
+DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
+By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
+polling, WebSockets, and other applications that require a long-lived connection to each user."
+HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
+SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
+
 inherit pypi setuptools3
-require python-tornado.inc
 
 # Requires _compression which is currently located in misc
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-misc \
-    "
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
+                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
+                   ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc"
+
+RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
+
+PACKAGES =+ "\
+    ${PN}-test \
+"
+
+FILES_${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
+"
-- 
2.17.1

