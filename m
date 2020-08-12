Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11924.1597228056298887794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 03:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53212 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5nyl-0001gR-Lh; Wed, 12 Aug 2020 13:27:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-graphviz: Upgrade 0.14 -> 0.14.1
Date: Wed, 12 Aug 2020 13:27:22 +0300
Message-Id: <20200812102726.4376-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
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

Add homepage and upgrade to release 0.14.1:

Document the colon-separated node[:port[:compass]] format used
for tail and head points in the edge()- and edges()-methods

License-Update: Use file LICENSE.txt to check the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-graphviz_0.14.1.bb           | 17 +++++++++++++++++
 .../python/python3-graphviz_0.14.bb             | 16 ----------------
 2 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.bb

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
new file mode 100644
index 000000000..f26a1efce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Graphviz protocol implementation"
+HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
+
+SRC_URI[md5sum] = "436cb0f41f6a949f916357ca037e205a"
+SRC_URI[sha256sum] = "f5aad52a652c06825dcc5ee018d920fca26aef339386866094597fb3f2f222ce"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
deleted file mode 100644
index 98bbddd21..000000000
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Graphviz protocol implementation"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI[sha256sum] = "e104ba036c8aef84320ec80560e544cd3cad68c9f90394b4e2b87bc44ab09791"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = "zip"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-logging \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

