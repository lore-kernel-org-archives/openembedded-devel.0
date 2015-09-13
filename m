Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id C62BC60053
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Sep 2015 19:02:07 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id B6E0A1A001B;
	Sun, 13 Sep 2015 21:02:04 +0200 (CEST)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Sep 2015 21:01:53 +0200
Message-Id: <1442170913-2404-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH][meta-oe] python-pyopenssl: Add missing RDEPENDS on "six" and "cryptography"
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
X-List-Received-Date: Sun, 13 Sep 2015 19:02:11 -0000

Fixes the following errors when doing "import OpenSSL":

    File "/usr/lib/python2.7/site-packages/OpenSSL/_util.py", line 6, in <module>
      from cryptography.hazmat.bindings.openssl.binding import Binding
  ImportError: No module named cryptography.hazmat.bindings.openssl.binding
    File "/usr/lib/python2.7/site-packages/OpenSSL/rand.py", line 9, in <module>
      from six import integer_types as _integer_types
  ImportError: No module named six

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
index 7f93012..d80e666 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
@@ -21,5 +21,5 @@ inherit setuptools
 PACKAGES =+ "${PN}-tests"
 FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 
-RDEPENDS_${PN} = "python-threading"
+RDEPENDS_${PN} = "python-threading python-six python-cryptography"
 RDEPENDS_${PN}-tests = "${PN}"
-- 
2.1.0


