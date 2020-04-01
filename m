Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.198.1585773349439183797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 13:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C560A40B30;
	Wed,  1 Apr 2020 20:35:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7INU9BwXhnjD; Wed,  1 Apr 2020 20:35:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9F6E409AA;
	Wed,  1 Apr 2020 20:35:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0CDF817126C;
	Wed,  1 Apr 2020 16:35:47 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-python][PATCH] pycryptodomex: cleanup recipe to use common include
Date: Wed,  1 Apr 2020 16:35:46 -0400
Message-Id: <1585773346-24301-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

PyCryptodome is "an almost drop-in replacement for the old PyCrypto library"
and installs under "Crypto" package. In cases when both PyCryptodome and old
PyCrypto are needed, there's PyCryptodomeX that installs under own name as
"Cryptodome" package.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../python/python-pycryptodome.inc                 |  2 +-
 .../python/python3-pycryptodomex_3.9.4.bb          | 26 +++-------------------
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
index 31d1368..63b4a4a 100644
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -21,7 +21,7 @@ RDEPENDS_${PN}-tests += " \
 
 PACKAGES =+ "${PN}-tests"
 
-FILES_${PN}-tests += " \
+FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/__pycache__/ \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
index be6b10f..e41c14b 100644
--- a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
@@ -1,30 +1,10 @@
-SUMMARY = "Cryptographic library for Python"
-DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
- cryptographic primitives."
-HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
+require python-pycryptodome.inc
+inherit setuptools3
 
 SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
 SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
 
-inherit pypi
-inherit setuptools3
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
-FILES_${PN}-tests += " \
+FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
 "
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

