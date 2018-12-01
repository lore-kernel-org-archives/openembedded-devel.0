Return-Path: <niko.mauno@iki.fi>
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net
	[83.102.40.152])
	by mail.openembedded.org (Postfix) with ESMTP id 435016B074
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 18:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id AD7EB1BF5F;
	Sat,  1 Dec 2018 19:58:38 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id Cc81aDvwwDii; Sat,  1 Dec 2018 19:58:38 +0200 (EET)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
	[83.102.40.54])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 51C2B1BF50;
	Sat,  1 Dec 2018 19:58:38 +0200 (EET)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id DA679270;
	Sat,  1 Dec 2018 19:58:34 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 19:57:14 +0200
Message-Id: <20181201175714.119435-7-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181201175714.119435-1-niko.mauno@iki.fi>
References: <20181201175714.119435-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/7] python-pygobject: Tune remove operation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Dec 2018 18:05:20 -0000
Content-Transfer-Encoding: 8bit

Drop '-f, --force' operator from rm command as that will hide the fact
if the removed artifacts cease to exist in later version of this recipe.
Also drop a superfluous slash from artifact path.

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
index 87c1202a1..348a0398f 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
@@ -27,5 +27,5 @@ RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
     # Remove files that clash with python3-pygobject; their content is same
-    rm -rf ${D}${includedir}/pygobject-3.0//pygobject.h ${D}${libdir}/pkgconfig
+    rm -r ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig
 }
-- 
2.19.2


