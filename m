Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Oll8e-0001SW-OV
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 18:05:18 +0200
Received: from p5b035be8.dip.t-dialin.net ([91.3.91.232] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Oll8I-0007bn-Ev by authid <stefan@sostec.de> with cram_md5;
	Wed, 18 Aug 2010 18:04:58 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Oll8G-0005EW-18; Wed, 18 Aug 2010 18:04:52 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 18:04:46 +0200
Message-Id: <1282147486-20078-4-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282147486-20078-1-git-send-email-stefan@datenfreihafen.org>
References: <1282147486-20078-1-git-send-email-stefan@datenfreihafen.org>
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL, BAYES_00, FU_UKGEOCITIES,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE 4/4] eject-2.1.5: Switch to a working SCR_URI, update checksum and bump PR
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
X-List-Received-Date: Wed, 18 Aug 2010 16:05:18 -0000

From: Stefan Schmidt <stefan@buglabs.net>


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 conf/checksums.ini           |    4 ++++
 recipes/eject/eject_2.1.5.bb |    6 ++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e2ba722..03bf67a 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5670,6 +5670,10 @@ sha256=9ec176847b1e01cd2083cd578e804fda2c619d0f465cd752ec11b38099f75f7f
 md5=d0f3b1adca33a68867bf50f000060cd6
 sha256=a0d03208e335610defc3049d8dd03f4ec7fcf477f44c4897b3f68adc478237ee
 
+[http://launchpad.net/eject/main/2.1.5/+download/eject-2.1.5.tar.gz]
+md5=74299e7293f0a007a139fe61d23aea90
+sha256=a716e4bc8ef326d7e3520129de22dc069126047efb947a0d47451bfc8b135a62
+
 [http://rogers.com/eject-2.1.5.tar.gz]
 md5=b96a6d4263122f1711db12701d79f738
 sha256=ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55
diff --git a/recipes/eject/eject_2.1.5.bb b/recipes/eject/eject_2.1.5.bb
index 7cf7188..1ffda42 100644
--- a/recipes/eject/eject_2.1.5.bb
+++ b/recipes/eject/eject_2.1.5.bb
@@ -1,9 +1,7 @@
 DESCRIPTION = "Eject allows removable media (typically a CD-ROM, floppy disk, tape, or JAZ or ZIP disk) to be ejected under software control."
 LICENSE = "GPLv2"
 
+PR = "r1"
 inherit autotools
 
-SRC_URI = "http://ca.geocities.com/jefftranter@rogers.com/eject-${PV}.tar.gz"
-
-S = "${WORKDIR}/${PN}"
-
+SRC_URI = "http://launchpad.net/eject/main/${PV}/+download/eject-${PV}.tar.gz"
-- 
1.7.1



