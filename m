Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SntE0-0000GA-NI
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jul 2012 17:16:40 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 893DDEA040;
	Sun,  8 Jul 2012 17:10:51 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 7E7FD604C9; Sun,  8 Jul 2012 17:05:29 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Jul 2012 17:05:29 +0200
Message-Id: <1341759929-32341-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH] libpng: update SRC_URI
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
X-List-Received-Date: Sun, 08 Jul 2012 15:16:40 -0000

Update the SRC_URI of libpng.inc to ftp.lfs-matrix.net since
ftp.simplesystems.org seems to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/libpng/libpng.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/libpng/libpng.inc b/recipes/libpng/libpng.inc
index 7c6d247..d18408b 100644
--- a/recipes/libpng/libpng.inc
+++ b/recipes/libpng/libpng.inc
@@ -12,7 +12,7 @@ BBCLASSEXTEND = "native"
 
 RPROVIDES += "libpng3"
 
-SRC_URI = "ftp://ftp.simplesystems.org/pub/png/src/libpng-${PV}.tar.bz2;name=libpng"
+SRC_URI = "http://ftp.lfs-matrix.net/pub/blfs/conglomeration/libpng/libpng-${PV}.tar.bz2;name=libpng"
 S = "${WORKDIR}/libpng-${PV}"
 
 inherit autotools pkgconfig binconfig
-- 
1.7.10



