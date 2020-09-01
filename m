Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8493.1598947924654984082
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 01:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kD1Oc-0002Vq-MV; Tue, 01 Sep 2020 11:12:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-flask-mail: Consolidate in a single file
Date: Tue,  1 Sep 2020 11:11:46 +0300
Message-Id: <20200901081147.13556-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901081147.13556-1-leon.anavi@konsulko.com>
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-flask-mail.inc  | 12 ------------
 .../python/python3-flask-mail_0.9.1.bb             | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-mail.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-mail.inc b/meta-python/recipes-devtools/python/python-flask-mail.inc
deleted file mode 100644
index 0df276d15..000000000
--- a/meta-python/recipes-devtools/python/python-flask-mail.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Flask extension for sending email"
-DESCRIPTION = "A Flask extension for sending email"
-HOMEPAGE = " https://github.com/rduplain/flask-email"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
-
-SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
-SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
-
-PYPI_PACKAGE = "Flask-Mail"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index 0b963be56..7a89cac9d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -1,2 +1,14 @@
+SUMMARY = "Flask extension for sending email"
+DESCRIPTION = "A Flask extension for sending email"
+HOMEPAGE = " https://github.com/rduplain/flask-email"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
+
+SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
+SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
+
+PYPI_PACKAGE = "Flask-Mail"
+
 inherit pypi setuptools3
-require python-flask-mail.inc
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask"
-- 
2.17.1

