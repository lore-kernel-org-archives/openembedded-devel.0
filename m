Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCK-0003b0-M4
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:36 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id BC540EA04D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:13 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 5BD6A604CC; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:22 +0200
Message-Id: <d4d9422ffd23be20dcfa30734c45804942054e3d.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 04/14] udev/acl_2.2.49: update recipe SRC_URI
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

This updates the SRC_URI of the acl_2.2.49.bb recipe since
mirror.its.uidaho.edu seems to be down. Fetch acl package from
download.savannah.gnu.org from now on.
This commit is the result of rebasing my patch 6162ae from master.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/udev/acl_2.2.49.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
index 7b68a12..12bad33 100644
--- a/recipes/udev/acl_2.2.49.bb
+++ b/recipes/udev/acl_2.2.49.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 PR = "r5"
 DEPENDS = "attr"
 
-SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/acl/acl-${PV}.src.tar.gz \
+SRC_URI = "http://download.savannah.gnu.org/releases/acl/acl-${PV}.src.tar.gz \
 		file://nolargefile.patch"
 
 inherit autotools lib_package
-- 
1.7.10



