Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SkLT3-0004ND-It
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 22:37:33 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 75C4CEA040;
	Thu, 28 Jun 2012 22:33:12 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 6ADD8604DE; Thu, 28 Jun 2012 22:26:38 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 22:26:38 +0200
Message-Id: <1340915198-26932-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340915198-26932-1-git-send-email-apelete@seketeli.net>
References: <1340915198-26932-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 1/1] xcursor-transparent-theme_0.1.1: update SRC_URI
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
X-List-Received-Date: Thu, 28 Jun 2012 20:37:33 -0000

This patch updates the SRC_URI of xcursor-transparent-theme_0.1.1.bb
to projects.o-hand.com since the matchbox-project.org repository seems
to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index ef746a8..aff7ccf 100644
--- a/recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Transparent xcursor theme for handheld systems"
 SECTION = "x11/base"
 PR ="r2"
 
-SRC_URI = "http://matchbox-project.org/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
+SRC_URI = "http://projects.o-hand.com/matchbox/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
 	   file://use-relative-symlinks.patch \
 	   file://fix_watch_cursor.patch"
 FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
-- 
1.7.10



