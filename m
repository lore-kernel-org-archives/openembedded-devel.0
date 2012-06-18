Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sgk4X-00060y-UE
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 00:05:41 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id C5D8BEA042;
	Tue, 19 Jun 2012 00:02:29 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 18432604DE; Mon, 18 Jun 2012 23:47:43 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org, Martin Jansa <martin.jansa@gmail.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Date: Mon, 18 Jun 2012 23:46:34 +0200
Message-Id: <1340055995-14534-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340055995-14534-1-git-send-email-apelete@seketeli.net>
References: <1340055995-14534-1-git-send-email-apelete@seketeli.net>
Subject: [PATCH 1/2] This updates SRC_URI since mirror.its.uidaho.edu seems to be down. Fetch acl package from download.savannah.gnu.org from now on.
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
X-List-Received-Date: Mon, 18 Jun 2012 22:05:43 -0000

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



