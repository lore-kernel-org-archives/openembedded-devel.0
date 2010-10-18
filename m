Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uog-0004W4-KA
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:16 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 7DC9F275CE9E; Mon, 18 Oct 2010 20:51:43 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 30BA3275CEAD;
	Mon, 18 Oct 2010 20:51:41 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:17 +0200
Message-Id: <1287427884-1517-9-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/15] tellbootie: add initial git version
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:17 -0000

tellbootie is a little utility for the palmpre machine which tells the bootloader over
some spare space in the memory about what to do on next restart (e.g. fall in recovery
mode).

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/palmpre/tellbootie_git.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/palmpre/tellbootie_git.bb

diff --git a/recipes/palmpre/tellbootie_git.bb b/recipes/palmpre/tellbootie_git.bb
new file mode 100644
index 0000000..65c0cd6
--- /dev/null
+++ b/recipes/palmpre/tellbootie_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Little utility to tell the bootloader of the palmpre to reboot/reset in bootloader mode; palmpre machine specific"
+HOMEPAGE = "http://www.freesmartphone.org"
+AUTHOR = "Simon Busch <morphis@gravedo.de>
+SECTION = "console/utils"
+LICENSE = "GPL"
+PR = "r0"
+
+SRCREV = "93a640dafa8ebebdb1a03f051cb1b566629b227c"
+SRC_URI = "${FREESMARTPHONE_GIT}/utilities.git;protocol=git;branch=master"
+S = "${WORKDIR}/git/palmpre/tellbootie"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools
-- 
1.7.1



