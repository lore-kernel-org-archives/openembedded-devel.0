Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCL-0003bW-88
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:37 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 61F30EA042
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:14 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 70A3D60971; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:23 +0200
Message-Id: <bccf1fdadbbfac877d0247a9a1f90fd865af982f.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 05/14] udev/attr_2.4.44: update recipe SRC_URI
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:37 -0000

This updates the SRC_URI of the attr_2.4.44.bb recipe since
mirrors.its.uidaho.edu seems down. Fetch attr package from
download.savannah.gnu.org from now on.
This commit is the result of rebasing my patch ba7351 from master.

Signed-off-by: Apelete Sekteli <apelete@seketeli.net>
---
 recipes/udev/attr_2.4.44.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
index 00aafce..1b95c58 100644
--- a/recipes/udev/attr_2.4.44.bb
+++ b/recipes/udev/attr_2.4.44.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 
 PR = "r4"
 
-SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/attr/attr-${PV}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/attr/attr-${PV}.src.tar.gz"
 
 inherit gettext autotools lib_package
 EXTRA_OECONF = " --enable-gettext=yes \
-- 
1.7.10



