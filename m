Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.15900.1593011807511202308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo78q-00035d-8g; Wed, 24 Jun 2020 18:16:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-netaddr: Consolidate in a single file
Date: Wed, 24 Jun 2020 18:16:21 +0300
Message-Id: <20200624151628.547-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-netaddr.inc    | 13 -------------
 .../python/python3-netaddr_0.7.19.bb              | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-netaddr.inc

diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-python/recipes-devtools/python/python-netaddr.inc
deleted file mode 100644
index bea9be674..000000000
--- a/meta-python/recipes-devtools/python/python-netaddr.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A network address manipulation library for Python."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
-
-SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
-SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-xml \
-"
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
index 30416a4ff..75460caa7 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
@@ -1,2 +1,13 @@
-require python-netaddr.inc
-inherit setuptools3
+SUMMARY = "A network address manipulation library for Python."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
+
+SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
+SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-xml \
+"
-- 
2.17.1

