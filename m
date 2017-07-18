Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 530 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Jul 2017 09:45:35 UTC
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id B29A477BBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 09:45:35 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 2199E8008A;
	Tue, 18 Jul 2017 11:36:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 18KEgTiqCBKv; Tue, 18 Jul 2017 11:36:44 +0200 (CEST)
Received: from localhost.localdomain (unknown [5.159.216.117])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id B5F97800DD;
	Tue, 18 Jul 2017 11:36:44 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 11:36:33 +0200
Message-Id: <1500370593-22042-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] xf86-video-nouveau: bump version to 1.0.15
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
X-List-Received-Date: Tue, 18 Jul 2017 09:45:37 -0000

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 .../{xf86-video-nouveau_1.0.12.bb => xf86-video-nouveau_1.0.15.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-nouveau_1.0.12.bb => xf86-video-nouveau_1.0.15.bb} (58%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
similarity index 58%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
index 444189a..b10ee71 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
@@ -12,8 +12,5 @@ RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "dc79910c7b9e32321cefc7af250c7765"
-SRC_URI[sha256sum] = "0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e"
-
-
-PNBLACKLIST[xf86-video-nouveau] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130657/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+SRC_URI[md5sum] = "717203cb87029cddcbccf7398f9ad8c3"
+SRC_URI[sha256sum] = "aede10fd395610a328697adca3434fb14e9afbd79911d6c8545cfa2c0e541d4c"
-- 
2.7.4


