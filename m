Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1Onoj4-0006Mj-Dn
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 10:19:24 +0200
Received: from frbg-5f732626.pool.mediaways.net ([95.115.38.38])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1Onoif-0005lB-T3
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 10:18:57 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Aug 2010 10:18:45 +0200
Message-Id: <1282637926-4394-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] db{4,5}.inc: fix QA: non -dev contains .so
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
X-List-Received-Date: Tue, 24 Aug 2010 08:19:24 -0000


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/db/db4.inc |    3 +--
 recipes/db/db5.inc |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes/db/db4.inc b/recipes/db/db4.inc
index 7e5c327..2595d81 100644
--- a/recipes/db/db4.inc
+++ b/recipes/db/db4.inc
@@ -43,12 +43,11 @@ B = "${WORKDIR}/db-${PV}/build_unix"
 PACKAGES += " ${PN}-bin"
 
 # Package contents
-FILES_${PN} = "${libdir}/libdb-4*so*"
+FILES_${PN} = "${libdir}/libdb-${PVM}${SOLIBSDEV}"
 FILES_${PN}-bin = "${bindir}/*"
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
-FILES_${PN}-dev = "${includedir} ${libdir}/*"
 
 EXTRA_OECONF = "${DB4_CONFIG}"
 
diff --git a/recipes/db/db5.inc b/recipes/db/db5.inc
index 557cb4c..1aeee49 100644
--- a/recipes/db/db5.inc
+++ b/recipes/db/db5.inc
@@ -43,12 +43,11 @@ B = "${WORKDIR}/db-${PV}/build_unix"
 PACKAGES += " ${PN}-bin"
 
 # Package contents
-FILES_${PN} = "${libdir}/libdb-5*so*"
+FILES_${PN} = "${libdir}/libdb-${PVM}${SOLIBSDEV}"
 FILES_${PN}-bin = "${bindir}/*"
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
-FILES_${PN}-dev = "${includedir} ${libdir}/*"
 
 EXTRA_OECONF = "${DB5_CONFIG}"
 
-- 
1.7.1



