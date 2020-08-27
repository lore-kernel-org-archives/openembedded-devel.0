Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.20668.1598540124244152090
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJD-0001it-8G; Thu, 27 Aug 2020 17:55:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-flask-restful: Consolidate in a single file
Date: Thu, 27 Aug 2020 17:55:01 +0300
Message-Id: <20200827145504.29147-4-leon.anavi@konsulko.com>
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
 .../python/python-flask-restful.inc            | 16 ----------------
 .../python/python3-flask-restful_0.3.7.bb      | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-restful.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-restful.inc b/meta-python/recipes-devtools/python/python-flask-restful.inc
deleted file mode 100644
index dcbcd0d76..000000000
--- a/meta-python/recipes-devtools/python/python-flask-restful.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Simple framework for creating REST APIs"
-DESCRIPTION = "\
-Flask-RESTful is an extension for Flask that adds support for quickly building \
-REST APIs"
-HOMEPAGE = "https://github.com/flask-restful/flask-restful"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
-
-SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
-SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
-
-inherit pypi
-
-PYPI_PACKAGE = "Flask-RESTful"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
index 6bff59a56..ad2757838 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-flask-restful.inc
+SUMMARY = "Simple framework for creating REST APIs"
+DESCRIPTION = "\
+Flask-RESTful is an extension for Flask that adds support for quickly building \
+REST APIs"
+HOMEPAGE = "https://github.com/flask-restful/flask-restful"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
+
+SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
+SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Flask-RESTful"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask"
-- 
2.17.1

