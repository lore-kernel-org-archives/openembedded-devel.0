Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 257A973C22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 22:21:05 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2015 23:21:02 +0100
Message-Id: <1427494862-25016-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427494862-25016-1-git-send-email-obi@opendreambox.org>
References: <1427494862-25016-1-git-send-email-obi@opendreambox.org>
Subject: [meta-oe][PATCH 3/3] python-pyopenssl: Downgrade to 0.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Mar 2015 22:21:08 -0000

Version 0.14 depends python-cryptography, which is
currently unavailable in meta-openembedded.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../python-pyopenssl-0.13/x509_revoked_dup.patch      | 19 +++++++++++++++++++
 ...hon-pyopenssl_0.14.bb => python-pyopenssl_0.13.bb} | 11 ++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
 rename meta-python/recipes-devtools/python/{python-pyopenssl_0.14.bb => python-pyopenssl_0.13.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch b/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
new file mode 100644
index 0000000..c386e9c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
@@ -0,0 +1,19 @@
+diff -Naur pyOpenSSL-0.13.orig/OpenSSL/crypto/crl.c pyOpenSSL-0.13/OpenSSL/crypto/crl.c
+--- pyOpenSSL-0.13.orig/OpenSSL/crypto/crl.c	2011-09-02 17:46:13.000000000 +0200
++++ pyOpenSSL-0.13/OpenSSL/crypto/crl.c	2015-03-26 20:53:08.984999223 +0100
+@@ -3,6 +3,7 @@
+ #include "crypto.h"
+ 
+ 
++#if 0
+ static X509_REVOKED * X509_REVOKED_dup(X509_REVOKED *orig) {
+     X509_REVOKED *dupe = NULL;
+ 
+@@ -32,6 +33,7 @@
+     dupe->sequence = orig->sequence;
+     return dupe;
+ }
++#endif
+ 
+ static char crypto_CRL_get_revoked_doc[] = "\n\
+ Return revoked portion of the CRL structure (by value\n\
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb b/meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
index 1f609e3..cf9d73e 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
@@ -7,15 +7,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCNAME = "pyOpenSSL"
 
 DEPENDS = "openssl"
+PE = "1"
 
-SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8579ff3a1d858858acfba5f046a4ddf7"
-SRC_URI[sha256sum] = "a99db8e59c120138ad8a72eecedcc24b4510d2eed3ce48213b7e32f22cc4ee6e"
+SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz \
+           file://x509_revoked_dup.patch"
+SRC_URI[md5sum] = "767bca18a71178ca353dff9e10941929"
+SRC_URI[sha256sum] = "21e12b03abaa0e04ecc8cd9c251598f71bae11c9f385304234e4ea5618c6163b"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit distutils
 
 PACKAGES =+ "${PN}-tests"
 FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-- 
1.9.1


