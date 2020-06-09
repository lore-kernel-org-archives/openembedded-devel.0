Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3242.1591693892661940708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiaI6-0004oW-Px; Tue, 09 Jun 2020 12:11:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-oauthlib: Consolidate in a single file
Date: Tue,  9 Jun 2020 12:11:20 +0300
Message-Id: <20200609091121.23832-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609091121.23832-1-leon.anavi@konsulko.com>
References: <20200609091121.23832-1-leon.anavi@konsulko.com>
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

Consolidate inc and bb files into a single bb file. Inherit pypi.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-oauthlib.inc                | 25 -------------------
 .../python/python3-oauthlib_2.0.6.bb          | 25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-oauthlib.inc

diff --git a/meta-python/recipes-devtools/python/python-oauthlib.inc b/meta-python/recipes-devtools/python/python-oauthlib.inc
deleted file mode 100644
index fea071449..000000000
--- a/meta-python/recipes-devtools/python/python-oauthlib.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
-HOMEPAGE = "https://github.com/idan/oauthlib"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
-
-SRC_URI = "https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
-SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
-SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
-
-S = "${WORKDIR}/oauthlib-${PV}"
-
-# The following configs & dependencies are from setuptools extras_require.
-# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
-# The upstream names may not correspond exactly to bitbake package names.
-#
-# Uncomment this line to enable all the optional features.
-#PACKAGECONFIG ?= "test signedtoken signals rsa"
-PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt"
-PACKAGECONFIG[signedtoken] = ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt"
-PACKAGECONFIG[signals] = ",,,${PYTHON_PN}-blinker"
-PACKAGECONFIG[rsa] = ",,,${PYTHON_PN}-cryptography"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest"
-
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
index da13b55d8..73fd30cb3 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
@@ -1,2 +1,23 @@
-inherit setuptools3
-require python-oauthlib.inc
+SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
+HOMEPAGE = "https://github.com/idan/oauthlib"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
+
+SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
+SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
+
+inherit pypi setuptools3
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "test signedtoken signals rsa"
+PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt"
+PACKAGECONFIG[signedtoken] = ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt"
+PACKAGECONFIG[signals] = ",,,${PYTHON_PN}-blinker"
+PACKAGECONFIG[rsa] = ",,,${PYTHON_PN}-cryptography"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest"
-- 
2.17.1

