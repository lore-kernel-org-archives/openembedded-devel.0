Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NVrSV-0003Q5-Uw
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 20:03:51 +0100
Received: (qmail 23945 invoked by uid 813007); 15 Jan 2010 19:01:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Jan 2010 19:01:37 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 20:01:29 +0100
Message-Id: <1263582089-6122-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] qt3e.bbclass: fix paths for staging
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
X-List-Received-Date: Fri, 15 Jan 2010 19:03:51 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Without that patch uicmoc3-native fails to build.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/qt3e.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/qt3e.bbclass b/classes/qt3e.bbclass
index 35958b3..d3d4a14 100644
--- a/classes/qt3e.bbclass
+++ b/classes/qt3e.bbclass
@@ -6,6 +6,6 @@ export QTEDIR="${STAGING_DIR_HOST}/qte3"
 export OE_QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic3"
 export OE_QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc3"
 export OE_QMAKE_CXXFLAGS="${CXXFLAGS} "
-export OE_QMAKE_INCDIR_QT="${QTEDIR}/include"
-export OE_QMAKE_LIBDIR_QT="${QTEDIR}/lib"
+export OE_QMAKE_INCDIR_QT="${STAGING_INCDIR}/qte3/include"
+export OE_QMAKE_LIBDIR_QT="${STAGING_LIBDIR}/qte3/lib"
 export OE_QMAKE_LIBS_QT="qte"
-- 
1.6.6





