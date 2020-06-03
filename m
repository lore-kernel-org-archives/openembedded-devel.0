Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11551.1591183007124025962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43742 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgRNx-0000yU-0h; Wed, 03 Jun 2020 14:16:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-isort: Consolidate in a single file
Date: Wed,  3 Jun 2020 14:16:29 +0300
Message-Id: <20200603111629.12516-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-isort.inc  | 17 -----------------
 .../python/python3-isort_4.3.21.bb            | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-isort.inc

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
deleted file mode 100644
index 324d4cf10..000000000
--- a/meta-python/recipes-devtools/python/python-isort.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "A Python utility / library to sort Python imports."
-HOMEPAGE = "https://pypi.python.org/pypi/isort"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
-SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
index 755b3e2f2..e0b21ab55 100644
--- a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-isort.inc
+SUMMARY = "A Python utility / library to sort Python imports."
+HOMEPAGE = "https://pypi.python.org/pypi/isort"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
+SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

