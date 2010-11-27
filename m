Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMMQu-0001X2-3u
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 16:11:25 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 2D6951B421;
	Sat, 27 Nov 2010 16:11:26 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 16:10:05 +0100
Message-Id: <1290870605-19492-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] disko_1.6.0: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 15:11:26 -0000

diskohq provides tar.bz2
---
 recipes/disko/disko_1.6.0.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/disko/disko_1.6.0.bb b/recipes/disko/disko_1.6.0.bb
index 4e43ec0..baf7fb3 100644
--- a/recipes/disko/disko_1.6.0.bb
+++ b/recipes/disko/disko_1.6.0.bb
@@ -6,7 +6,7 @@ require disko.inc
 
 DEPENDS += "taglib directfb virtual/libx11 hal libxv libxxf86vm"
 
-SRC_URI = "http://www.diskohq.org/downloads/${PN}-${PV}.tar.gz \
+SRC_URI = "http://www.diskohq.com/repository/ubuntu/pool/${PN}_${PV}.tar.bz2  \
 	   file://pkgconfig.patch \
 	  "
 
@@ -14,6 +14,8 @@ do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} graphics=all prefix=${prefix}/ || \
         oefatal "scons build execution failed."
 }
+SRC_URI[md5sum] = "9725e3d692492188b4c74e38884501b9"
+SRC_URI[sha256sum] = "6553d69dc4968f38840f408b6e75ece5f575a816ff8c2df76cccb6d966a836b7"
 
-SRC_URI[md5sum] = "c63bad58524501e367af9842f510b458"
-SRC_URI[sha256sum] = "fe578299be4031d0c2454ff4fd3b3034e332260b9695687adf27a776a61eb2e4"
+#SRC_URI[md5sum] = "c63bad58524501e367af9842f510b458"
+#SRC_URI[sha256sum] = "fe578299be4031d0c2454ff4fd3b3034e332260b9695687adf27a776a61eb2e4"
-- 
1.7.0.4



