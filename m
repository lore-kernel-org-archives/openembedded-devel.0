Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SU3po-0005jX-I2
	for openembedded-devel@openembedded.org; Tue, 15 May 2012 00:33:44 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 51D8EEA048;
	Tue, 15 May 2012 00:15:52 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id BA89A64387; Tue, 15 May 2012 00:03:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Tue, 15 May 2012 00:03:09 +0200
Message-Id: <1337032989-28606-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1337032989-28606-1-git-send-email-apelete@seketeli.net>
References: <1337032989-28606-1-git-send-email-apelete@seketeli.net>
Subject: [PATCH 1/1] util-linux-ng: Update SRC_URI to kernel.org valid URI
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
X-List-Received-Date: Mon, 14 May 2012 22:33:44 -0000

This updates SRC_URI as the former kernel.org URI was no longer valid.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/util-linux-ng/util-linux-ng.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 9c2a5da..7d5faf0 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -11,7 +11,7 @@ INC_PR = "r36"
 # allows for a release candidate
 RC ?= ""
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2;name=archive"
 
 SRC_URI_append_chinook-compat = " file://chinook_libtool.patch "
 
-- 
1.7.9.5



