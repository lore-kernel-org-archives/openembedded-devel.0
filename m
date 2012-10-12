Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>) id 1TMfOK-0004AW-Gs
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 15:35:04 +0200
Received: from coredoba.hi.pengutronix.de ([2001:6f8:1178:2:219:99ff:fe56:8d7])
	by metis.ext.pengutronix.de with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>)
	id 1TMevE-0007ya-H4; Fri, 12 Oct 2012 15:05:00 +0200
Received: from jlu by coredoba.hi.pengutronix.de with local (Exim 4.80)
	(envelope-from <jlu@pengutronix.de>)
	id 1TMevD-00056t-Nj; Fri, 12 Oct 2012 15:04:59 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2012 15:04:54 +0200
Message-Id: <1350047094-19611-1-git-send-email-jlu@pengutronix.de>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 2001:6f8:1178:2:219:99ff:fe56:8d7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-java][PATCH] classpath: avoid picking up gmp.h from the host
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
X-List-Received-Date: Fri, 12 Oct 2012 13:35:04 -0000

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 recipes-core/classpath/classpath.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 4c3174b..1a8093e 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -21,7 +21,7 @@ RPROVIDES_${PN} = "${PBN}"
 RPROVIDES_${PN}-common = "${PBN}-common"
 RPROVIDES_${PN}-gtk = "${PBN}-awt"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
 
@@ -37,6 +37,7 @@ EXTRA_OECONF = "\
   --with-vm=java \
   --disable-Werror \
   --with-antlr-jar=${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar \
+  --with-gmp=${STAGING_LIBDIR}/.. \
   --disable-alsa \
   --disable-dssi \
   --disable-qt4-peer \
-- 
1.7.10.4



