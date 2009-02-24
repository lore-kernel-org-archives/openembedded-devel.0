Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1Lc2st-0005Ef-8w
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 20:24:03 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1Lc2pj-0002es-0C
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 03:20:58 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2009 12:20:37 -0700
Message-Id: <1235503237.8911.53.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: [PATCH] Add the git branch to the name for endusers
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
X-List-Received-Date: Tue, 24 Feb 2009 19:24:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


---
 packages/linux/linux-openmoko-devel_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/packages/linux/linux-openmoko-devel_git.bb b/packages/linux/linux-openmoko-devel_git.bb
index 4860cca..81bbd53 100644
--- a/packages/linux/linux-openmoko-devel_git.bb
+++ b/packages/linux/linux-openmoko-devel_git.bb
@@ -8,9 +8,9 @@ DEFAULT_PREFERENCE = "-1"
 KERNEL_RELEASE = "2.6.28"
 KERNEL_VERSION = "${KERNEL_RELEASE}"

-OEV = "oe1"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCREV}"
-PR = "r2"
+OMV = "andy-tracking"
+PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCREV}"
+PR = "r3"

 SRC_URI = "\
   git://git.openmoko.org/git/kernel.git;protocol=git;branch=andy-tracking \
--
1.5.6.5




