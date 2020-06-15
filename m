Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14595.1592217033391294084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNs-0002ty-14; Mon, 15 Jun 2020 13:30:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-itsdangerous: Consolidate in a single file
Date: Mon, 15 Jun 2020 13:30:14 +0300
Message-Id: <20200615103017.2714-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615103017.2714-1-leon.anavi@konsulko.com>
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
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
 .../python/python-itsdangerous.inc                 | 14 --------------
 .../python/python3-itsdangerous_1.1.0.bb           | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-itsdangerous.inc

diff --git a/meta-python/recipes-devtools/python/python-itsdangerous.inc b/meta-python/recipes-devtools/python/python-itsdangerous.inc
deleted file mode 100644
index 241786a7c..000000000
--- a/meta-python/recipes-devtools/python/python-itsdangerous.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
-HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6"
-
-SRC_URI[md5sum] = "9b7f5afa7f1e3acfb7786eeca3d99307"
-SRC_URI[sha256sum] = "321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19"
-
-CLEANBROKEN = "1"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-simplejson \
-    ${PYTHON_PN}-netclient \
-"
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
index a71c20f0e..7f50641c8 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
@@ -1,6 +1,17 @@
+SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
+HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6"
+
+SRC_URI[md5sum] = "9b7f5afa7f1e3acfb7786eeca3d99307"
+SRC_URI[sha256sum] = "321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19"
+
 inherit pypi setuptools3
-require python-itsdangerous.inc
+
+CLEANBROKEN = "1"
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-simplejson \
+    ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-compression \
 "
-- 
2.17.1

