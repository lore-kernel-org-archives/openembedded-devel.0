Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002bo-Ny
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 94B70EA04B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:34 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 55DC560C09; Thu, 19 Jul 2012 19:20:41 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:38 +0200
Message-Id: <c30318747505f8a800b37f7d6c0a0c7199c62f8e.1342677799.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 7/9] tzdata: update SRC_URI
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

Update the SRC_URI of tzdata.inc to tzmirror.sunbase.org since
elsie.nci.nih.gov seems to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/tzdata/tzdata.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index dd5c2c9..c9997d3 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -12,7 +12,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tar"
+SRC_URI = "http://tzmirror.sunbase.org/tzfiles/oldtz/tzdata${PV}.tar.gz;name=tar"
 
 S = "${WORKDIR}"
 
-- 
1.7.10.4



