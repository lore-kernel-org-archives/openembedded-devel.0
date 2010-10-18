Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoX-0004Vm-Sl
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:07 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 79793275CE9E; Mon, 18 Oct 2010 20:51:31 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 84E66275CD26;
	Mon, 18 Oct 2010 20:51:30 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:11 +0200
Message-Id: <1287427884-1517-3-git-send-email-morphis@gravedo.de>
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
Subject: [PATCH 02/15] read-tokens: add initial git version
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:07 -0000

read-tokens is a little utility especially for the palmpre. It reads so alled 'tokens'
from the internal flash and stores them in a key-value file so other system components can
read them from there.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/palmpre/read-tokens_git.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/palmpre/read-tokens_git.bb

diff --git a/recipes/palmpre/read-tokens_git.bb b/recipes/palmpre/read-tokens_git.bb
new file mode 100644
index 0000000..d958438
--- /dev/null
+++ b/recipes/palmpre/read-tokens_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Little utility to read 'tokens' from internal flash and store them in a smartkeyfile; specific for palmpre machine"
+HOMEPAGE = "http://www.freesmartphone.org"
+AUTHOR = "Simon Busch <morphis@gravedo.de>
+SECTION = "console/utils"
+LICENSE = "GPL"
+PR = "r0"
+PV = "1.0.0+gitr${SRCPV}"
+
+SRCREV = "93a640dafa8ebebdb1a03f051cb1b566629b227c"
+SRC_URI = "${FREESMARTPHONE_GIT}/utilities.git;protocol=git;branch=master"
+S = "${WORKDIR}/git/palmpre/read_tokens"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools
-- 
1.7.1



