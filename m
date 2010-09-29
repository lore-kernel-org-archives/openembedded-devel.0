Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13VC-0001lG-Jc
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A53513148E39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id HGRE+hS6hp2t; Wed, 29 Sep 2010 22:37:06 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 587163148E22;
	Wed, 29 Sep 2010 22:37:04 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:04 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:24 +0000
Message-Id: <1285792594-10032-9-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/18] python-pyopenssl-0.8: reduce package size
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Sep 2010 20:43:52 -0000

* Move tests to FILES_${PN}-test.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/python/python-pyopenssl_0.8.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-pyopenssl_0.8.bb b/recipes/python/python-pyopenssl_0.8.bb
index 74e2ae9..bdbb6b2 100644
--- a/recipes/python/python-pyopenssl_0.8.bb
+++ b/recipes/python/python-pyopenssl_0.8.bb
@@ -4,14 +4,18 @@ PRIORITY = "optional"
 LICENSE = "LGPL"
 SRCNAME = "pyOpenSSL"
 DEPENDS = "openssl"
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pyopenssl/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
+
 RDEPENDS_${PN} = "python-threading"
+RDEPENDS_${PN}-tests = "${PN}"
 
 
 SRC_URI[md5sum] = "00377690f224d9e59c833fb0459603f4"
-- 
1.7.1



