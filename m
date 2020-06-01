Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.37640.1591019596773239996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 06:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42502 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfksM-00040p-Jc; Mon, 01 Jun 2020 16:53:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-humanize: Upgrade 0.5.1 -> 2.4.0
Date: Mon,  1 Jun 2020 16:53:08 +0300
Message-Id: <20200601135308.18379-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 2.4.0 and consolidate into a single file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-humanize.inc                | 14 -------------
 .../python/python3-humanize_0.5.1.bb          |  2 --
 .../python/python3-humanize_2.4.0.bb          | 20 +++++++++++++++++++
 3 files changed, 20 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-humanize.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-humanize.inc b/meta-python/recipes-devtools/python/python-humanize.inc
deleted file mode 100644
index 17a3449e7..000000000
--- a/meta-python/recipes-devtools/python/python-humanize.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Python humanize utilities"
-HOMEPAGE = "http://github.com/jmoiron/humanize"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"
-
-SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"
-SRC_URI[sha256sum] = "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
deleted file mode 100644
index 04464ac59..000000000
--- a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-humanize.inc
diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
new file mode 100644
index 000000000..6bb6946ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Python humanize utilities"
+HOMEPAGE = "http://github.com/jmoiron/humanize"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
+
+SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"
+SRC_URI[sha256sum] = "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"
+
+inherit pypi setuptools3
+
+DEPENDS += "\
+    ${PYTHON_PN}-setuptools-scm-native \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

