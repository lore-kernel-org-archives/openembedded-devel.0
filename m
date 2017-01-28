Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 324 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 28 Jan 2017 20:25:27 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A48A271AFA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 20:25:27 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 66FD0AD00571; Sat, 28 Jan 2017 21:18:46 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jan 2017 21:18:26 +0100
Message-Id: <1485634706-24848-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: Don't overwrite inherited dependencies
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
X-List-Received-Date: Sat, 28 Jan 2017 20:25:29 -0000

Otherwise setuptools won't be found.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/recipes-devtools/python/python-cffi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 12da19f..21e41c1 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Foreign Function Interface for Python calling C code"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
-DEPENDS = "libffi ${PYTHON_PN}-pycparser"
+DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
 SRC_URI[md5sum] = "b8fa7ccb87790531db3316ab17aa8244"
 SRC_URI[sha256sum] = "563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8"
-- 
2.7.4


