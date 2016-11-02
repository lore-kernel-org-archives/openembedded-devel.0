Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8F6719A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 07:33:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA27XN3Q021398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Nov 2016 00:33:23 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 2 Nov 2016 00:33:22 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Nov 2016 15:26:58 +0800
Message-ID: <20161102072658.13720-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-m2crypto: inherit siteinfo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Nov 2016 07:33:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

In recipe of python-m2crypto, it uses var SITEINFO_BITS which is from
siteinfo.bbclass. Inherit siteinfo.bbclass to avoid compile error:

| .../tmp/sysroots/qemumips64/usr/include/openssl/opensslconf.h:47:
| Error: CPP #error ""Unknown __WORDSIZE detected"".
| Use the -cpperraswarn option to continue swig processing.
| error: command 'swig' failed with exit status 1

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
index 73d8bb1..ab665d4 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "1ac3b6eafa5ff7e2a0796675316d7569b28aada45a7ab74042ad089d15
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
 
 PYPI_PACKAGE = "M2Crypto"
-inherit pypi setuptools
+inherit pypi setuptools siteinfo
 
 DEPENDS += "openssl swig-native"
 
-- 
2.10.1


