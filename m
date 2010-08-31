Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OqKOs-0000Mq-Kz
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 08:32:54 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 07297275D105; Tue, 31 Aug 2010 08:32:23 +0200 (CEST)
Received: from localhost (unknown [89.204.137.96])
	by gravedo.de (Postfix) with ESMTPSA id 47EA9275CCC2;
	Tue, 31 Aug 2010 08:32:22 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 08:31:59 +0200
Message-Id: <1283236322-5116-3-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
References: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] palmpre-system-deps-native: add initial recipe
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
X-List-Received-Date: Tue, 31 Aug 2010 06:32:55 -0000

The palmpre-system-deps provides some essential header + vapi files for programs written
for the palm pre machine. For example it includes a vapi file for the hsuart.h kernel
header file which provides different ioctl's parameters for managing the hsuart of the
palm pre device.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/palmpre/palmpre-system-deps-native_git.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/palmpre/palmpre-system-deps-native_git.bb

diff --git a/recipes/palmpre/palmpre-system-deps-native_git.bb b/recipes/palmpre/palmpre-system-deps-native_git.bb
new file mode 100644
index 0000000..1f907c9
--- /dev/null
+++ b/recipes/palmpre/palmpre-system-deps-native_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Important header and vapi files for some programs running on the palmpre machine"
+HOMEPAGE = "http://www.freesmartphone.org"
+AUTHOR = "Simon Busch <morphis@gravedo.de>
+SECTION = "console/utils"
+LICENSE = "GPL"
+PR = "r0"
+
+SRCREV = "93a640dafa8ebebdb1a03f051cb1b566629b227c"
+SRC_URI = "${FREESMARTPHONE_GIT}/utilities.git;protocol=git;branch=master"
+S = "${WORKDIR}/git/palmpre/palmpre-system-deps"
+
+inherit autotools native pkgconfig
-- 
1.7.0.4



