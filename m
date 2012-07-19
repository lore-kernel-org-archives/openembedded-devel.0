Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002bm-MH
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 86535EA052
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:34 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id F2AF860BFA; Thu, 19 Jul 2012 19:20:40 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:37 +0200
Message-Id: <197b3b95893dc7e0bfa889bc54d27c4ca7e3df3e.1342677799.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 6/9] tzcode: update SRC_URI
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
X-List-Received-Date: Thu, 19 Jul 2012 17:32:02 -0000

Update the SRC_URI of tzcode-native.inc to tzmirror.sunbase.org since
elsie.nci.nih.gov seems to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/tzcode/tzcode-native.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/tzcode/tzcode-native.inc b/recipes/tzcode/tzcode-native.inc
index 78ddec5..d2c711a 100644
--- a/recipes/tzcode/tzcode-native.inc
+++ b/recipes/tzcode/tzcode-native.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 INC_PR = "r4"
 
 SRC_URI = " \
-        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
-        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV} \
+        http://tzmirror.sunbase.org/tzfiles/oldtz/tzcode${PV}.tar.gz;name=tzcode-${PV} \
+        http://tzmirror.sunbase.org/tzfiles/oldtz/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV} \
 	"
 
 S = "${WORKDIR}"
-- 
1.7.10.4



