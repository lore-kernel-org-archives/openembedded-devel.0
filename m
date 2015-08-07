Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D6DF376703
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 05:51:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99375193"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 13:55:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t775nrai020951
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Aug 2015 13:49:53 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 13:51:47 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Aug 2015 13:51:42 +0800
Message-ID: <1438926703-1720-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-python][PATCH] python-pyopenssl: upgrade 0.13 -> 0.15.1
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
X-List-Received-Date: Fri, 07 Aug 2015 05:51:50 -0000
Content-Type: text/plain

* Dropped x509_revoked_dup.patch,since the original file crl.c does not exist anymore.
* Add DEPENDS python-cryptography to aviod build errors:
  | error: Could not find suitable distribution for Requirement.parse('six>=1.5.2')
  | ERROR: python setup.py install execution failed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python-pyopenssl-0.13/x509_revoked_dup.patch      | 19 -------------------
 ...n-pyopenssl_0.13.bb => python-pyopenssl_0.15.1.bb} | 10 +++++-----
 2 files changed, 5 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
 rename meta-python/recipes-devtools/python/{python-pyopenssl_0.13.bb => python-pyopenssl_0.15.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch b/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
deleted file mode 100644
index c386e9c..0000000
--- a/meta-python/recipes-devtools/python/python-pyopenssl-0.13/x509_revoked_dup.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -Naur pyOpenSSL-0.13.orig/OpenSSL/crypto/crl.c pyOpenSSL-0.13/OpenSSL/crypto/crl.c
---- pyOpenSSL-0.13.orig/OpenSSL/crypto/crl.c	2011-09-02 17:46:13.000000000 +0200
-+++ pyOpenSSL-0.13/OpenSSL/crypto/crl.c	2015-03-26 20:53:08.984999223 +0100
-@@ -3,6 +3,7 @@
- #include "crypto.h"
- 
- 
-+#if 0
- static X509_REVOKED * X509_REVOKED_dup(X509_REVOKED *orig) {
-     X509_REVOKED *dupe = NULL;
- 
-@@ -32,6 +33,7 @@
-     dupe->sequence = orig->sequence;
-     return dupe;
- }
-+#endif
- 
- static char crypto_CRL_get_revoked_doc[] = "\n\
- Return revoked portion of the CRL structure (by value\n\
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
index cf9d73e..694da27 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_0.13.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCNAME = "pyOpenSSL"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl python-cryptography"
 PE = "1"
 
-SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz \
-           file://x509_revoked_dup.patch"
-SRC_URI[md5sum] = "767bca18a71178ca353dff9e10941929"
-SRC_URI[sha256sum] = "21e12b03abaa0e04ecc8cd9c251598f71bae11c9f385304234e4ea5618c6163b"
+SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f447644afcbd5f0a1f47350fec63a4c6"
+SRC_URI[sha256sum] = "f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


