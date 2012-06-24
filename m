Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SinRz-0004jg-Cu
	for openembedded-devel@openembedded.org; Sun, 24 Jun 2012 16:06:03 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 99D7FEA042;
	Sun, 24 Jun 2012 16:02:20 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 92D7D603C4; Sun, 24 Jun 2012 15:55:03 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Sun, 24 Jun 2012 15:55:03 +0200
Message-Id: <1340546103-17137-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340546103-17137-1-git-send-email-apelete@seketeli.net>
References: <1340546103-17137-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 1/1] base-passwd: update SRC_URI of base-passwd-3.5.20 recipe
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
X-List-Received-Date: Sun, 24 Jun 2012 14:06:03 -0000

This patch updates the SRC_URI of base-passwd_3.5.20.bb to the direct
link on snapshot.debian.org, instead of letting the automatic mirror
search point to the index page.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/base-passwd/base-passwd_3.5.20.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/base-passwd/base-passwd_3.5.20.bb b/recipes/base-passwd/base-passwd_3.5.20.bb
index 6e9c51b..ac3de3f 100644
--- a/recipes/base-passwd/base-passwd_3.5.20.bb
+++ b/recipes/base-passwd/base-passwd_3.5.20.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR = "r1"
 
 SRC_URI = "\
-  ${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
+  http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool/main/b/base-passwd/base-passwd_${PV}.tar.gz \
   file://nobash.patch \
   file://root-home.patch \
   file://mysql.patch \
-- 
1.7.10



