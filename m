Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6463.1591707373598848331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 05:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37164 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jidnW-0002LY-IS; Tue, 09 Jun 2020 15:56:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-twine: Upgrade 1.13.0 -> 3.1.1
Date: Tue,  9 Jun 2020 15:56:00 +0300
Message-Id: <20200609125600.17773-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609125600.17773-1-leon.anavi@konsulko.com>
References: <20200609125600.17773-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.1. Fix homepage, summary and license which
is Apache-2.0. It seems that previously there was a mismatch and
this information was referencing python six package, not twine.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-twine_1.13.0.bb                | 11 -----------
 .../python/python3-twine_3.1.1.bb                 | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twine_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
deleted file mode 100644
index f5cc70f98..000000000
--- a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
-HOMEPAGE = "https://github.com/benjaminp/six"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2"
-
-SRC_URI[md5sum] = "6fb4da0c7d81ddfd48f619b8caa1493c"
-SRC_URI[sha256sum] = "d6c29c933ecfc74e9b1d9fa13aa1f87c5d5770e119f5a4ce032092f0ff5b14dc"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
new file mode 100644
index 000000000..31b55302a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Utilities for interacting with PyPI"
+HOMEPAGE = "https://twine.readthedocs.io/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
+
+SRC_URI[md5sum] = "faf033a3458de37df6cdecceb6da2c2b"
+SRC_URI[sha256sum] = "d561a5e511f70275e5a485a6275ff61851c16ffcb3a95a602189161112d9f160"
+
+inherit pypi setuptools3
+
+DEPENDS += "\
+    ${PYTHON_PN}-setuptools-scm-native \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

