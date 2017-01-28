Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id CAEE460746
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 20:30:27 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 25030AD00576; Sat, 28 Jan 2017 21:23:11 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jan 2017 21:23:03 +0100
Message-Id: <1485634983-23004-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyopenssl: Don't overwrite inherited dependencies
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
X-List-Received-Date: Sat, 28 Jan 2017 20:30:28 -0000

Otherwise setuptools won't be found.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 5a2e8b8..579ca60 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -2,7 +2,7 @@ SUMMARY = "Simple Python wrapper around the OpenSSL library"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl ${PYTHON_PN}-cryptography"
+DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
 SRC_URI[md5sum] = "6635503758c65ea6f70d18d1b18e46d5"
 SRC_URI[sha256sum] = "7779a3bbb74e79db234af6a08775568c6769b5821faecf6e2f4143edb227516e"
-- 
2.7.4


