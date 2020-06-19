Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2115.1592554253177323792
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCLQ-0007GG-SV; Fri, 19 Jun 2020 11:26:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-pathlib2: Consolidate in a single file
Date: Fri, 19 Jun 2020 11:10:07 +0300
Message-Id: <20200619081011.25051-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619081011.25051-1-leon.anavi@konsulko.com>
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-pathlib2.inc     | 11 -----------
 .../python/python3-pathlib2_2.3.5.bb                | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pathlib2.inc

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
deleted file mode 100644
index d69d5273a..000000000
--- a/meta-python/recipes-devtools/python/python-pathlib2.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Object-oriented filesystem paths"
-HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
-
-SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
-SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
index 66f71e57a..a022701ad 100644
--- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
@@ -1,2 +1,13 @@
+DESCRIPTION = "Object-oriented filesystem paths"
+HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
+
+SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
+SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
+
 inherit pypi setuptools3
-require python-pathlib2.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

