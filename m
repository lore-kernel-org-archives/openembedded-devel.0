Received: from tone.orchestra.cse.unsw.edu.au ([129.94.242.59])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@cse.unsw.edu.au>) id 1PNed4-0006vo-19
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 05:49:20 +0100
Received: From localhost.localdomain ([129.94.175.7] ==
	runswift.cse.unsw.EDU.AU) By
	tone With Smtp ; Wed, 1 Dec 2010 15:47:50 +1100 
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 15:47:21 +1100
Message-Id: <1291178841-3975-1-git-send-email-jayen@cse.unsw.edu.au>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 129.94.242.59
X-SA-Exim-Mail-From: jayen@cse.unsw.edu.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS, SPF_NEUTRAL,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: [PATCH] qwt: QT_LIBINFIX not being resolved when running qmake
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
X-List-Received-Date: Wed, 01 Dec 2010 04:49:20 -0000

Fixed a problem where qmake would create a directory called 'obj${QT_LIBINFIX}'
instead of resolving the QT_LIBINFIX variable and creating the appropriately
resolved directory.

Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
---
 recipes/qwt/qwt.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qwt/qwt.inc b/recipes/qwt/qwt.inc
index 62c8656..89035c1 100644
--- a/recipes/qwt/qwt.inc
+++ b/recipes/qwt/qwt.inc
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt"
 S = "${WORKDIR}/qwt-${PV}"
 
 do_configure_prepend() {
-	sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
+	sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = $\${QT_LIBINFIX}:' *.pri
 	sed -i -e s:lqwt:lqwt${QT_LIBINFIX}:g -e s:/usr/local/qwt-$\${QwtVersion}:${prefix}:g *.prf
 	sed -e 's/#CONFIG     += QwtExamples/CONFIG     += QwtExamples/g' -i qwtconfig.pri
 	sed -i -e s:/usr/local/qwt-${PV}:${D}${prefix}:g ${S}/*.pri
-- 
1.7.0.4



