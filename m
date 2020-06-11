Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3451.1591866557568383449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJCz-0007qt-9M; Thu, 11 Jun 2020 12:09:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-pika: Consolidate in a single file
Date: Thu, 11 Jun 2020 12:08:58 +0300
Message-Id: <20200611090904.29772-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-pika.inc   | 22 -----------------
 .../python/python3-pika_1.1.0.bb              | 24 +++++++++++++++++--
 2 files changed, 22 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pika.inc

diff --git a/meta-python/recipes-devtools/python/python-pika.inc b/meta-python/recipes-devtools/python/python-pika.inc
deleted file mode 100644
index bde154fe7..000000000
--- a/meta-python/recipes-devtools/python/python-pika.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Pika is a RabbitMQ (AMQP 0-9-1) client library for Python."
-DESCRIPTION = " \
-Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
-including RabbitMQ’s extensions. \
-"
-SECTION = "devel/python"
-HOMEPAGE = "https://pika.readthedocs.io"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
-
-SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
-SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
-
-inherit pypi
-
-PYPI_PACKAGE = "pika"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-tornado \
-    ${PYTHON_PN}-twisted \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
index a1515881f..c61d47c47 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
@@ -1,2 +1,22 @@
-inherit setuptools3
-require python-pika.inc
+SUMMARY = "Pika is a RabbitMQ (AMQP 0-9-1) client library for Python."
+DESCRIPTION = " \
+Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
+including RabbitMQ’s extensions. \
+"
+SECTION = "devel/python"
+HOMEPAGE = "https://pika.readthedocs.io"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
+
+SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
+SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "pika"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-tornado \
+    ${PYTHON_PN}-twisted \
+"
-- 
2.17.1

