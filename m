Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 79E33772CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:03:22 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v0U83MUr031746
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 30 Jan 2017 09:03:22 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.32])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v0U83MfZ013559;
	Mon, 30 Jan 2017 09:03:22 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2017 09:03:12 +0100
Message-Id: <1485763392-26523-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-pyyaml: add dependency on python
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
X-List-Received-Date: Mon, 30 Jan 2017 08:03:24 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Python is required in order to build the cython parts.

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-pyyaml.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
index 41321ca..a3cf677 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.pyyaml.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
-DEPENDS = "libyaml ${PYTHON_PN}-cython-native"
+DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
 
 PYPI_PACKAGE = "PyYAML"
 inherit pypi
-- 
2.1.4


