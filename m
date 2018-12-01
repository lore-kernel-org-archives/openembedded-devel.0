Return-Path: <niko.mauno@iki.fi>
Received: from sypressi2.dnainternet.net (sypressi3.dnainternet.net
	[83.102.40.158])
	by mail.openembedded.org (Postfix) with ESMTP id 454586D45C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 18:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 59D6116CE6;
	Sat,  1 Dec 2018 19:58:11 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.158])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id JsXX3h0HJzeU; Sat,  1 Dec 2018 19:58:10 +0200 (EET)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
	[83.102.40.54])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id E9BC916CD8;
	Sat,  1 Dec 2018 19:58:10 +0200 (EET)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 762D1270;
	Sat,  1 Dec 2018 19:58:07 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 19:57:11 +0200
Message-Id: <20181201175714.119435-4-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181201175714.119435-1-niko.mauno@iki.fi>
References: <20181201175714.119435-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/7] python-pygobject: Only check for even upstream versions
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
X-List-Received-Date: Sat, 01 Dec 2018 18:03:48 -0000
Content-Transfer-Encoding: 8bit

Reflect following change in Pythonv3 variant of this recipe
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta?id=fed093329b504cd46aa758983db6073b70c2af29
and add inherit for upstream-version-is-even.bbclass

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
index fb4a0b181..b2af3faf7 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools pkgconfig gnomebase gobject-introspection distutils-base
+inherit autotools pkgconfig gnomebase gobject-introspection distutils-base upstream-version-is-even
 
 DEPENDS += "python glib-2.0"
 
-- 
2.19.2


