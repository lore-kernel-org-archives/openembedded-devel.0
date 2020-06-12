Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.21638.1591972935910807430
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52426 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjkso-0006Jj-9R; Fri, 12 Jun 2020 17:42:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-jsonpointer: Consolidate in a single file
Date: Fri, 12 Jun 2020 17:41:58 +0300
Message-Id: <20200612144201.4536-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612144201.4536-1-leon.anavi@konsulko.com>
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
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
 .../python/python-jsonpointer.inc             | 27 -----------------
 .../python/python3-jsonpointer_2.0.bb         | 29 +++++++++++++++++--
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpointer.inc

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
deleted file mode 100644
index 3e41b70b8..000000000
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Resolve JSON Pointers in Python"
-HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
-
-inherit pypi ptest
-
-SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
-SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-json \
-"
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
-	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
index 8d0a09b43..68bfe9716 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpointer_2.0.bb
@@ -1,2 +1,27 @@
-inherit setuptools3
-require python-jsonpointer.inc
+SUMMARY = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi ptest setuptools3
+
+SRC_URI[md5sum] = "741b98d0e693b08b5e44e0a9da5a7bb7"
+SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+"
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
+	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
+}
-- 
2.17.1

