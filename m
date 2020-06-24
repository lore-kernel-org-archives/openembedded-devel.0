Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15981.1593011802878911806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo78g-00035d-Tt; Wed, 24 Jun 2020 18:16:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-networkx: Consolidate in a single file
Date: Wed, 24 Jun 2020 18:16:19 +0300
Message-Id: <20200624151628.547-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
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

Consolidate inc and bb files into a single bb file. Add
a HOMEPAGE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-networkx.inc       |  8 --------
 .../recipes-devtools/python/python3-networkx_2.4.bb   | 11 ++++++++---
 2 files changed, 8 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-networkx.inc

diff --git a/meta-python/recipes-devtools/python/python-networkx.inc b/meta-python/recipes-devtools/python/python-networkx.inc
deleted file mode 100644
index 4bca636dc..000000000
--- a/meta-python/recipes-devtools/python/python-networkx.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "Python package for creating and manipulating graphs and networks"
-LICENSE = "BSD-3-Clause"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-                   ${PYTHON_PN}-decorator \
-                   "
diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
index efa82e21c..5708e35b5 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
@@ -1,8 +1,13 @@
-require python-networkx.inc
-
+DESCRIPTION = "Python package for creating and manipulating graphs and networks"
+HOMEPAGE = "http://networkx.github.io/"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
 
 SRC_URI[md5sum] = "63e3fdc9d3a46bcabc776acc5ea5fe48"
 SRC_URI[sha256sum] = "f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64"
 
-inherit setuptools3
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+                   ${PYTHON_PN}-decorator \
+                   "
-- 
2.17.1

