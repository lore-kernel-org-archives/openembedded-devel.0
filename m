Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20119.1589567984611331478
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 11:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C79E940C1D;
	Fri, 15 May 2020 18:39:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWgYi30wmONw; Fri, 15 May 2020 18:39:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B2AF140A9E;
	Fri, 15 May 2020 18:39:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9A8A917314B;
	Fri, 15 May 2020 14:39:41 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-python][PATCH 1/2] python3-pycryptodome(x): moved to OE-Core, remove from meta-python
Date: Fri, 15 May 2020 14:39:39 -0400
Message-Id: <1589567980-26597-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589567980-26597-1-git-send-email-denis@denix.org>
References: <1589567980-26597-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../python/python-pycryptodome.inc                 | 29 ----------------------
 .../python/python3-pycryptodome_3.9.4.bb           |  2 --
 .../python/python3-pycryptodomex_3.9.4.bb          | 10 --------
 3 files changed, 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
deleted file mode 100644
index 63b4a4a..0000000
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Cryptographic library for Python"
-DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
- cryptographic primitives."
-HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
-
-SRC_URI[md5sum] = "f990716b49add7b14ea8b8a961fb3746"
-SRC_URI[sha256sum] = "a168e73879619b467072509a223282a02c8047d932a48b74fbd498f27224aa04"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
-"
-
-RDEPENDS_${PN}-tests += " \
-    ${PYTHON_PN}-unittest \
-"
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests = " \
-    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/ \
-    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/__pycache__/ \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
deleted file mode 100644
index 0c062dd..0000000
--- a/meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
deleted file mode 100644
index e41c14b..0000000
--- a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
-SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
-
-FILES_${PN}-tests = " \
-    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-"
-- 
2.7.4

