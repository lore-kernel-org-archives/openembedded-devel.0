Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.20671.1598540127525414063
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJG-0001it-KS; Thu, 27 Aug 2020 17:55:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-flask-sqlalchemy: Consolidate in a single file
Date: Thu, 27 Aug 2020 17:55:03 +0300
Message-Id: <20200827145504.29147-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827145504.29147-1-leon.anavi@konsulko.com>
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
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
 .../python/python-flask-sqlalchemy.inc               | 10 ----------
 .../python/python3-flask-sqlalchemy_2.4.1.bb         | 12 +++++++++++-
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
deleted file mode 100644
index 86ba9dda5..000000000
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
-
-SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
-SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
-
-PYPI_PACKAGE = "Flask-SQLAlchemy"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
index 07f45bcff..2c6110d0b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
@@ -1,2 +1,12 @@
+DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
+
+SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
+SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
+
+PYPI_PACKAGE = "Flask-SQLAlchemy"
+
 inherit pypi setuptools3
-require python-flask-sqlalchemy.inc
+
+RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
-- 
2.17.1

