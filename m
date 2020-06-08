Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.28515.1591618480431489123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfm-0005b8-RU; Mon, 08 Jun 2020 15:14:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-progress: Consolidate in a single file
Date: Mon,  8 Jun 2020 15:14:09 +0300
Message-Id: <20200608121410.5814-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608121410.5814-1-leon.anavi@konsulko.com>
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-progress.inc  | 14 --------------
 .../python/python3-progress_1.5.bb               | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-progress.inc

diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
deleted file mode 100644
index d59ba2cc5..000000000
--- a/meta-python/recipes-devtools/python/python-progress.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Easy progress reporting for Python"
-HOMEPAGE = "http://github.com/verigak/progress/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
-
-SRC_URI[md5sum] = "408df0e3db0ad4b74f19f6beec814ae4"
-SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372"
-
-RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-math \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.5.bb b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
index 45e264213..1f299dbed 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
@@ -1,2 +1,16 @@
+SUMMARY = "Easy progress reporting for Python"
+HOMEPAGE = "http://github.com/verigak/progress/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
+
+SRC_URI[md5sum] = "408df0e3db0ad4b74f19f6beec814ae4"
+SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372"
+
 inherit pypi setuptools3
-require python-progress.inc
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-math \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

