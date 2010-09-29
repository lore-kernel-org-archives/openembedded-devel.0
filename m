Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13Uz-0001jj-H1
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id F14A73148E38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qtJRVBkBXP4G; Wed, 29 Sep 2010 22:37:05 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 157E13148E1F;
	Wed, 29 Sep 2010 22:37:03 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:02 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:23 +0000
Message-Id: <1285792594-10032-8-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/18] python-twisted-8.2.0: reduce package size
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:45 -0000

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



