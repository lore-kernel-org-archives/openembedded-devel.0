Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.407.1585242634929394306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02QHADwg008222
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 10:10:23 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Mar 2020
 10:10:02 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-importlib-metadata: upgrade 0.23 -> 1.5.2
Date: Thu, 26 Mar 2020 13:10:02 -0400
Message-ID: <20200326171002.33138-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python-importlib-metadata.inc   | 6 +++---
 ...metadata_0.23.bb => python3-importlib-metadata_1.5.2.bb} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_0.23.bb => python3-importlib-metadata_1.5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata.inc b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
index a53537aa7..b6165dc5b 100644
--- a/meta-python/recipes-devtools/python/python-importlib-metadata.inc
+++ b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
@@ -3,10 +3,10 @@ HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
-SRC_URI = "https://files.pythonhosted.org/packages/5d/44/636bcd15697791943e2dedda0dbe098d8530a38d113b202817133e0b06c0/importlib_metadata-0.23.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
 S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "80d677d744995336c9c22d21a85ddeb8"
-SRC_URI[sha256sum] = "aa18d7378b00b40847790e7c27e11673d7fed219354109d0e7b9e5b25dc3ad26"
+SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
+SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
-- 
2.24.1

