Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.14508.1592217030197844956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNp-0002ty-3Y; Mon, 15 Jun 2020 13:30:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-isodate: Consolidate in a single file
Date: Mon, 15 Jun 2020 13:30:12 +0300
Message-Id: <20200615103017.2714-2-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-isodate.inc   | 14 --------------
 .../python/python3-isodate_0.6.0.bb              | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-isodate.inc

diff --git a/meta-python/recipes-devtools/python/python-isodate.inc b/meta-python/recipes-devtools/python/python-isodate.inc
deleted file mode 100644
index 8c128919e..000000000
--- a/meta-python/recipes-devtools/python/python-isodate.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "ISO 8601 date/time parser"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[md5sum] = "0e1203fce27ce65e2d01c5f21c4d428f"
-SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
index 0e79ae995..2aa64d08d 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-isodate.inc
+SUMMARY = "ISO 8601 date/time parser"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[md5sum] = "0e1203fce27ce65e2d01c5f21c4d428f"
+SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

