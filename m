Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCK-0003az-MU
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:36 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id AEC80EA048
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:13 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 32B22604B5; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:20 +0200
Message-Id: <f86819a528b35c48028100f719487a5727cd9e6d.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 02/14] util-linux-ng: update SRC_URI to kernel.org valid URI
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:36 -0000

This updates SRC_URI as the former kernel.org URI was no longer valid.
This commit is the result of rebasing my patch 8007a4 from master.

Signed-off-by: Apelete Seketeli <apelete@seleteli.net>
Acked-by: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 51f25b2..102c7d7 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -11,7 +11,7 @@ INC_PR = "r36"
 # allows for a release candidate
 RC ?= ""
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
 
 SRC_URI_append_chinook-compat = " file://chinook_libtool.patch "
 
-- 
1.7.10



