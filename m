Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LxFnh-00068W-4j
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 09:26:21 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 7ADB91880DC; Fri, 24 Apr 2009 09:25:34 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2009 09:25:34 +0200
Message-Id: <1240557934-13305-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] man: GNU_HASH QA fix.
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
X-List-Received-Date: Fri, 24 Apr 2009 07:26:22 -0000

From: Stanislav Brabec <utx@penguin.cz>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/man/man_1.5p.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/man/man_1.5p.bb b/recipes/man/man_1.5p.bb
index 2a1ed7f..c3412a5 100644
--- a/recipes/man/man_1.5p.bb
+++ b/recipes/man/man_1.5p.bb
@@ -14,13 +14,14 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/man/man-${PV}.tar.bz2 \
 # Disable parallel make or it tries to link objects before they are built
 PARALLEL_MAKE = ""
 
-EXTRA_OEMAKE = ""
+EXTRA_OEMAKE = 'LFDLAGS="${LDFLAGS}"'
 GS = "-DGREPSILENT=\"q\""
 DEFS = "-DUSG -DDO_COMPRESS ${GS}"
 
 do_configure() {
 	# this doesn't support cross compilation, so it generates a
 	# bogus configuration
+	sed -i /^LDFLAGS/d src/Makefile.in
 	./configure -d -confdir ${sysconfdir}
 }
 
-- 
1.5.6.5



