Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8316.1598947923770961691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 01:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kD1Ob-0002Vq-3H; Tue, 01 Sep 2020 11:12:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-flask-nav: Consolidate in a single file
Date: Tue,  1 Sep 2020 11:11:45 +0300
Message-Id: <20200901081147.13556-3-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-flask-nav.inc  | 13 -------------
 .../python/python3-flask-nav_0.6.bb               | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-nav.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
deleted file mode 100644
index 932ccdf4a..000000000
--- a/meta-python/recipes-devtools/python/python-flask-nav.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Easily create navigation for Flask applications."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
-
-SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
-SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
-
-PYPI_PACKAGE = "flask-nav"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-blinker \
-    ${PYTHON_PN}-flask \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
index d25115251..77735e325 100644
--- a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -1,2 +1,15 @@
+DESCRIPTION = "Easily create navigation for Flask applications."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
+
+SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
+SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
+
+PYPI_PACKAGE = "flask-nav"
+
 inherit pypi setuptools3
-require python-flask-nav.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-blinker \
+    ${PYTHON_PN}-flask \
+    "
-- 
2.17.1

