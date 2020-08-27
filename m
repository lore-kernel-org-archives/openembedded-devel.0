Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.20770.1598540119507769139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJ7-0001it-BC; Thu, 27 Aug 2020 17:55:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-flask-migrate: Consolidate in a single file
Date: Thu, 27 Aug 2020 17:54:59 +0300
Message-Id: <20200827145504.29147-2-leon.anavi@konsulko.com>
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
 .../python/python-flask-migrate.inc              | 14 --------------
 .../python/python3-flask-migrate_2.5.2.bb        | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
deleted file mode 100644
index 5202f8be0..000000000
--- a/meta-python/recipes-devtools/python/python-flask-migrate.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
-
-SRC_URI[md5sum] = "bedeb0366740fda6912fea683be11968"
-SRC_URI[sha256sum] = "a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502"
-
-PYPI_PACKAGE = "Flask-Migrate"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-flask-sqlalchemy \
-    ${PYTHON_PN}-alembic \
-    ${PYTHON_PN}-flask \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
index c98cbfddb..78ec665ef 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
@@ -1,2 +1,16 @@
+DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
+
+SRC_URI[md5sum] = "bedeb0366740fda6912fea683be11968"
+SRC_URI[sha256sum] = "a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502"
+
+PYPI_PACKAGE = "Flask-Migrate"
+
 inherit pypi setuptools3
-require python-flask-migrate.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask-sqlalchemy \
+    ${PYTHON_PN}-alembic \
+    ${PYTHON_PN}-flask \
+    "
-- 
2.17.1

