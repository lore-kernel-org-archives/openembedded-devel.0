Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14593.1592217031802251692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNq-0002ty-AV; Mon, 15 Jun 2020 13:30:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-incremental: Consolidate in a single file
Date: Mon, 15 Jun 2020 13:30:13 +0300
Message-Id: <20200615103017.2714-3-leon.anavi@konsulko.com>
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
 .../python/python-incremental.inc             | 20 -----------------
 .../python/python3-incremental_17.5.0.bb      | 22 +++++++++++++++++--
 2 files changed, 20 insertions(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-incremental.inc

diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
deleted file mode 100644
index ef5e903fb..000000000
--- a/meta-python/recipes-devtools/python/python-incremental.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Incremental is a small library that versions your Python projects"
-HOMEPAGE = "https://github.com/twisted/incremental"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
-
-SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
-SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-twisted \
-    ${PYTHON_PN}-click \
-"
-
-# -native is needed to build python[3]-twisted, however, we need to take steps to
-# prevent a circular dependency. The build apparently does not use the part of
-# python-incremental which uses python-twisted, so this hack is OK.
-RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
index 0f04df4a6..568ba1989 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
@@ -1,2 +1,20 @@
-inherit setuptools3
-require python-incremental.inc
+DESCRIPTION = "Incremental is a small library that versions your Python projects"
+HOMEPAGE = "https://github.com/twisted/incremental"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
+
+SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
+SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+    ${PYTHON_PN}-click \
+"
+
+# -native is needed to build python[3]-twisted, however, we need to take steps to
+# prevent a circular dependency. The build apparently does not use the part of
+# python-incremental which uses python-twisted, so this hack is OK.
+RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
+BBCLASSEXTEND = "native"
-- 
2.17.1

