Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCEoA-0005S4-VE
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 18:29:20 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 829DC4B0049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 18:25:24 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 18:25:22 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 May 2010 18:23:31 +0200
Message-Id: <1273681411-17526-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] evtest: add libxml2 in DEPENDS
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
X-List-Received-Date: Wed, 12 May 2010 16:29:20 -0000

else I get the following log as libxml2 is not yet built :
| evtest-capture.c:33:29: error: libxml/encoding.h: No such file or directory
| evtest-capture.c:34:30: error: libxml/xmlwriter.h: No such file or directory

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/evtest/evtest_1.25.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/evtest/evtest_1.25.bb b/recipes/evtest/evtest_1.25.bb
index 55de6cb..c48381e 100644
--- a/recipes/evtest/evtest_1.25.bb
+++ b/recipes/evtest/evtest_1.25.bb
@@ -4,7 +4,9 @@ AUTHOR = "Vojtech Pavlik <vojtech@suse.cz>"
 SECTION = "console/utils"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
+
+DEPENDS = "libxml2"
 
 SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2;name=archive"
 SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
-- 
1.6.3.3



