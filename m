Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@beast.se-eng.com>) id 1Qitda-00041t-Rf
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 21:37:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 6CFE820C9F4E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 13:24:46 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2IhvlpoPqK5G; Mon, 18 Jul 2011 13:24:45 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTP id F006720C9524;
	Mon, 18 Jul 2011 13:24:45 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id 192FF3136E; Mon, 18 Jul 2011 13:25:18 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2011 13:25:15 -0600
Message-Id: <1311017115-28352-3-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>
Subject: [PATCH 3/3] libpng: Corrected SRC_URI
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
X-List-Received-Date: Mon, 18 Jul 2011 19:37:55 -0000

Point to the SOURCEFORGE_MIRROR as the other mirror had archived files and was periodically offline.

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
 recipes/libpng/libpng.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/libpng/libpng.inc b/recipes/libpng/libpng.inc
index 7c6d247..3461c14 100644
--- a/recipes/libpng/libpng.inc
+++ b/recipes/libpng/libpng.inc
@@ -12,7 +12,8 @@ BBCLASSEXTEND = "native"
 
 RPROVIDES += "libpng3"
 
-SRC_URI = "ftp://ftp.simplesystems.org/pub/png/src/libpng-${PV}.tar.bz2;name=libpng"
+SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/libpng-${PV}.tar.bz2;name=libpng"
+
 S = "${WORKDIR}/libpng-${PV}"
 
 inherit autotools pkgconfig binconfig
-- 
1.7.0.4



