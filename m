Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMV4-00042Y-Uu
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:50:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C15003149FCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:49:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id bqgjyGIsoA5r
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:49:20 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8C7013148C0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:49:19 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 12:49:19 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 12:49:19 +0000
Message-Id: <1288010959-15995-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-9-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-9-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH resend] python-pyopenssl-0.8: reduce package size
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
X-List-Received-Date: Mon, 25 Oct 2010 12:50:08 -0000

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



