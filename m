Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.42494.1600695858794972695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKM77-0004UL-9J; Mon, 21 Sep 2020 16:44:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-flask-uploads: Consolidate in a single file
Date: Mon, 21 Sep 2020 16:44:05 +0300
Message-Id: <20200921134405.676-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921134405.676-1-leon.anavi@konsulko.com>
References: <20200921134405.676-1-leon.anavi@konsulko.com>
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
 .../python/python-flask-uploads.inc                | 12 ------------
 .../python/python3-flask-uploads_0.2.1.bb          | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-uploads.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-uploads.inc b/meta-python/recipes-devtools/python/python-flask-uploads.inc
deleted file mode 100644
index cd7ac1aeb6..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-uploads.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Flexible and efficient upload handling for Flask"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
-
-SRC_URI[md5sum] = "e5eee34aa92b64a4d22847672b3858a1"
-SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
-
-PYPI_PACKAGE = "Flask-Uploads"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-flask \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
index 758c2acf71..e8d5b5f2f2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -1,2 +1,14 @@
+DESCRIPTION = "Flexible and efficient upload handling for Flask"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
+
+SRC_URI[md5sum] = "e5eee34aa92b64a4d22847672b3858a1"
+SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
+
+PYPI_PACKAGE = "Flask-Uploads"
+
 inherit pypi setuptools3
-require python-flask-uploads.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    "
-- 
2.17.1

