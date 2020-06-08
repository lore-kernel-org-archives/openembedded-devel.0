Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.28487.1591618477887262788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfg-0005b8-Ox; Mon, 08 Jun 2020 15:14:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-html5lib: Consolidate in a single file
Date: Mon,  8 Jun 2020 15:14:08 +0300
Message-Id: <20200608121410.5814-5-leon.anavi@konsulko.com>
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-html5lib.inc                | 17 -----------------
 .../python/python3-html5lib_1.0.1.bb          | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-html5lib.inc

diff --git a/meta-python/recipes-devtools/python/python-html5lib.inc b/meta-python/recipes-devtools/python/python-html5lib.inc
deleted file mode 100644
index a8e0fb408..000000000
--- a/meta-python/recipes-devtools/python/python-html5lib.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
-
-SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
-SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-webencodings \
-    ${PYTHON_PN}-xml \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
index 6bd8b49f5..98ee56b2e 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.0.1.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-html5lib.inc
+SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
+
+SRC_URI[md5sum] = "942a0688d6bdf20d087c9805c40182ad"
+SRC_URI[sha256sum] = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-lxml \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-webencodings \
+    ${PYTHON_PN}-xml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

