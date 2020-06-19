Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2094.1592554276470448208
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCLo-0007GG-62; Fri, 19 Jun 2020 11:26:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-prompt-toolkit: Consolidate in a single file
Date: Fri, 19 Jun 2020 11:10:09 +0300
Message-Id: <20200619081011.25051-5-leon.anavi@konsulko.com>
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
 .../python/python-prompt-toolkit.inc           | 18 ------------------
 .../python/python3-prompt-toolkit_2.0.10.bb    | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-prompt-toolkit.inc

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
deleted file mode 100644
index 91aa7bb19..000000000
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Library for building powerful interactive command lines in Python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
-
-SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
-SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
-
-PYPI_PACKAGE = "prompt_toolkit"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-wcwidth \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
index 0e99917c2..d9ece8dab 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
@@ -1,7 +1,22 @@
+SUMMARY = "Library for building powerful interactive command lines in Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
+
+SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
+SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
+
 inherit pypi setuptools3
-require python-prompt-toolkit.inc
+
+PYPI_PACKAGE = "prompt_toolkit"
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-wcwidth \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

