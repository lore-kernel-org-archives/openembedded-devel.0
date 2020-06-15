Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14591.1592217029622989530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNl-0002ty-Cl; Mon, 15 Jun 2020 13:30:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-iso8601: Consolidate in a single file
Date: Mon, 15 Jun 2020 13:30:11 +0300
Message-Id: <20200615103017.2714-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 .../recipes-devtools/python/python-iso8601.inc   | 14 --------------
 .../python/python3-iso8601_0.1.12.bb             | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-iso8601.inc

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
deleted file mode 100644
index a70843ead..000000000
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Simple module to parse ISO 8601 dates"
-HOMEPAGE = "http://pyiso8601.readthedocs.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
-
-SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
-SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
index 4a332b53b..74b5bdcb8 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
@@ -1,2 +1,16 @@
+SUMMARY = "Simple module to parse ISO 8601 dates"
+HOMEPAGE = "http://pyiso8601.readthedocs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
+
+SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
+SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
+
 inherit pypi setuptools3
-require python-iso8601.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

