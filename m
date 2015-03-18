Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA4660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 02:54:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2015 19:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,419,1422950400"; d="scan'208";a="700217084"
Received: from liuxin1-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.180.202])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2015 19:54:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2015 20:54:12 -0600
Message-Id: <1426647253-12404-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] python-pyopenssl: Upgrade to 0.14
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
X-List-Received-Date: Wed, 18 Mar 2015 02:54:42 -0000

This upgrade will match with the openssl 1.0.2 changes
The newer verion of pyopenssl now uses setuptools instead of distutils

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/{python-pyopenssl_0.13.bb => python-pyopenssl_0.14.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pyopenssl_0.13.bb => python-pyopenssl_0.14.bb} (75%)

diff --git a/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb b/meta-oe/recipes-devtools/python/python-pyopenssl_0.14.bb
similarity index 75%
rename from meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
rename to meta-oe/recipes-devtools/python/python-pyopenssl_0.14.bb
index 01f43da..1f609e3 100644
--- a/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
+++ b/meta-oe/recipes-devtools/python/python-pyopenssl_0.14.bb
@@ -7,15 +7,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCNAME = "pyOpenSSL"
 
 DEPENDS = "openssl"
-PR = "r1"
 
 SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
-SRC_URI[md5sum] = "767bca18a71178ca353dff9e10941929"
-SRC_URI[sha256sum] = "21e12b03abaa0e04ecc8cd9c251598f71bae11c9f385304234e4ea5618c6163b"
+
+SRC_URI[md5sum] = "8579ff3a1d858858acfba5f046a4ddf7"
+SRC_URI[sha256sum] = "a99db8e59c120138ad8a72eecedcc24b4510d2eed3ce48213b7e32f22cc4ee6e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
 
 PACKAGES =+ "${PN}-tests"
 FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-- 
2.1.0


