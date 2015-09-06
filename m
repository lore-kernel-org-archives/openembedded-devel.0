Return-Path: <milo-software@users.sourceforge.net>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 06 Sep 2015 14:48:21 UTC
Received: from smtp05.mail.online.nl (smtp05.mail.online.nl [194.134.25.75])
	by mail.openembedded.org (Postfix) with ESMTP id 332B276EBF
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2015 14:48:21 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp05.mail.online.nl (Postfix) with ESMTP id 0621A20005D;
	Sun,  6 Sep 2015 16:42:11 +0200 (CEST)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Sep 2015 16:42:09 +0200
Message-Id: <1441550529-8357-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <55EAAF4A.10109@topic.nl>
Subject: [PATCH][meta-python] python-pyopenssl: Inherit setuptools to fix failing install
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
X-List-Received-Date: Sun, 06 Sep 2015 14:48:22 -0000

From: Mike Looijmans <mike.looijmans@topic.nl>

Fixes the following error during install phase:

 ImportError: No module named setuptools_ext
 ERROR: python setup.py install execution failed.

Reported-by: athoik@openpli.org
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
index 694da27..7f93012 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984b
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
 
 PACKAGES =+ "${PN}-tests"
 FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-- 
2.1.0


