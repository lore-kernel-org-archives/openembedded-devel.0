Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMU0-0003yT-VF
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:49:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3308A314A201
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:48:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 07GAtPDEDIAd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:48:05 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id A1FE8314A1B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:48:03 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 12:48:03 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 12:48:03 +0000
Message-Id: <1288010883-1095-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-8-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-8-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH resend] python-twisted-8.2.0: reduce package size
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
X-List-Received-Date: Mon, 25 Oct 2010 12:49:03 -0000

* Don't install *.{bat,c,h}
* Move more tests to FILES_${PN}-test

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/python/python-twisted_8.2.0.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-twisted_8.2.0.bb b/recipes/python/python-twisted_8.2.0.bb
index 7ecbf6c..3f8b657 100644
--- a/recipes/python/python-twisted_8.2.0.bb
+++ b/recipes/python/python-twisted_8.2.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "LGPL"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/8.2/Twisted-${PV}.tar.bz2 "
 S = "${WORKDIR}/Twisted-${PV}"
@@ -43,11 +43,17 @@ RDEPENDS_${PN} += "\
   ${PN}-words \
 "
 
+do_install_append() {
+	# remove some useless files before packaging
+	find ${D} -name "*.bat" -o -name "*.c" -o -name "*.h" -exec rm {} \;
+}
+
 ALLOW_EMPTY = "1"
 FILES_${PN} = ""
 
 FILES_${PN}-test = " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
 "
 
 FILES_${PN}-protocols = " \
-- 
1.7.1



