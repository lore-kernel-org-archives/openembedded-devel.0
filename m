Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sq0se-0005Gz-6p
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jul 2012 13:51:24 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id E870BEA04B;
	Sat, 14 Jul 2012 13:44:42 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id D075160297; Sat, 14 Jul 2012 13:40:05 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jul 2012 13:40:05 +0200
Message-Id: <1342266005-31065-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH] git: update SRC_URI
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
X-List-Received-Date: Sat, 14 Jul 2012 11:51:24 -0000

Update SRC_URI to fetch git from one of the KERNELORG_MIRROR addresses
instead of relying on a single kernel mirror.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/git/git.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/git/git.inc b/recipes/git/git.inc
index 003d7fa..eb59a2c 100644
--- a/recipes/git/git.inc
+++ b/recipes/git/git.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 
-SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=src"
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/software/scm/git/git-${PV}.tar.bz2;name=src"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
1.7.10.4



