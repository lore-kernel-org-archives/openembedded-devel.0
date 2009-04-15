Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Ltyh6-0003nk-0E
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 08:34:02 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 1A6B3189350; Wed, 15 Apr 2009 08:33:38 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 08:33:38 +0200
Message-Id: <1239777218-20213-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] sysstat: fix build on omap3 to actually work (gnu_hash problem like ltrace)
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
X-List-Received-Date: Wed, 15 Apr 2009 06:34:02 -0000

From: Carsten Haitzler (Rasterman <raster@rasterman.com>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/sysstat/sysstat_8.1.6.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/sysstat/sysstat_8.1.6.bb b/recipes/sysstat/sysstat_8.1.6.bb
index 0f394ed..a734d14 100644
--- a/recipes/sysstat/sysstat_8.1.6.bb
+++ b/recipes/sysstat/sysstat_8.1.6.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "The sysstat utilities are a collection of performance monitoring
 HOMEPAGE = "http://pagesperso-orange.fr/sebastien.godard/"
 LICENSE = "GPL"
 SECTION = "console/utils"
+PR = "r1"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz"
 
@@ -13,3 +14,4 @@ do_configure_prepend() {
 
 FILES_${PN} += "${libdir}/sa"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.5.6.5



