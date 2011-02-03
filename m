Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pkzou-0002A7-9d
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:06:00 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pkzmz-0008Ic-GO by authid <stefan@sostec.de> with cram_md5;
	Thu, 03 Feb 2011 15:05:05 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Pkzmu-000278-Ke; Thu, 03 Feb 2011 15:03:56 +0100
From: Stefan Schmidt <stefan@buglabs.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Feb 2011 15:03:50 +0100
Message-Id: <1296741831-8096-1-git-send-email-stefan@buglabs.net>
X-Mailer: git-send-email 1.7.2.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH 01/11] connman: Don't prefer connman git version over the latest release in angstrom
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
X-List-Received-Date: Thu, 03 Feb 2011 14:06:00 -0000

---
 recipes/connman/connman_git.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/connman/connman_git.bb b/recipes/connman/connman_git.bb
index c0cb890..39ffac6 100644
--- a/recipes/connman/connman_git.bb
+++ b/recipes/connman/connman_git.bb
@@ -31,7 +31,6 @@ PR = "r2"
 PR_append = ".gitr${SRCREV}"
 
 DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_angstrom = "1"
 
 SRC_URI = "\
   git://git.kernel.org/pub/scm/network/connman/connman.git;protocol=git \
-- 
1.7.2.3



