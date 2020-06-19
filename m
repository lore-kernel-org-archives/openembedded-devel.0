Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2113.1592554239378309455
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCLD-0007GG-GQ; Fri, 19 Jun 2020 11:25:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-passlib: Consolidate in a single file
Date: Fri, 19 Jun 2020 11:10:06 +0300
Message-Id: <20200619081011.25051-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619081011.25051-1-leon.anavi@konsulko.com>
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
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

Consolidate inc and bb files into a single bb file. Update
HOMEPAGE. Due to BitBucket deprecating Mercurial support,
Passlib's public repository and issue tracker has moved to
https://foss.heptapod.net/python-libs/passlib/wikis/home

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-passlib.inc                 | 19 -----------------
 .../python/python3-passlib_1.7.2.bb           | 21 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-passlib.inc

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
deleted file mode 100644
index 9cf02807a..000000000
--- a/meta-python/recipes-devtools/python/python-passlib.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "comprehensive password hashing framework supporting over 30 schemes"
-DESCRIPTION = "\
-Passlib is a password hashing library for Python 2 & 3, which provides cross-platform \
-implementations of over 30 password hashing algorithms, as well as a framework for \
-managing existing password hashes. It’s designed to be useful for a wide range of \
-tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
-hashing for multi-user applications."
-HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
-
-SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
-SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-"
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
index 18180a07a..b347163aa 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
@@ -1,2 +1,21 @@
+SUMMARY = "comprehensive password hashing framework supporting over 30 schemes"
+DESCRIPTION = "\
+Passlib is a password hashing library for Python 2 & 3, which provides cross-platform \
+implementations of over 30 password hashing algorithms, as well as a framework for \
+managing existing password hashes. It’s designed to be useful for a wide range of \
+tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
+hashing for multi-user applications."
+HOMEPAGE = "https://foss.heptapod.net/python-libs/passlib/wikis/home"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
+
+SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
+SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
+
 inherit pypi setuptools3
-require python-passlib.inc
\ No newline at end of file
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+"
-- 
2.17.1

