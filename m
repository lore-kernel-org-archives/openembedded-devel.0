Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id 616CE73167
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2016 19:25:26 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id DB459805D4;
	Mon,  6 Jun 2016 21:25:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uc51fntUlci3; Mon,  6 Jun 2016 21:25:22 +0200 (CEST)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id CBDF8804A4;
	Mon,  6 Jun 2016 21:25:21 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2016 21:25:10 +0200
Message-Id: <1465241110-6535-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.5.5
Subject: [meta-multimedia][PATCH] MPD: update to 0.19.15
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
X-List-Received-Date: Mon, 06 Jun 2016 19:25:29 -0000

This fixes a build issue

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 .../recipes-multimedia/musicpd/{mpd_0.19.10.bb => mpd_0.19.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.10.bb => mpd_0.19.15.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
index 7b124ca..caba589 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.10.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "da4bc3e47afd0faf9e7a67168e012102"
-SRC_URI[sha256sum] = "c386eb3d22f98dc993b5ae3c272f969aa7763713483c6800040ebf1791b15851"
+SRC_URI[md5sum] = "bb855b1689c9e863c2dd214ab1cb9344"
+SRC_URI[sha256sum] = "0cb9a223894b038ce966ce6d651d9b3ea3bdc7d7b9bec8d1e9e7e091cbc29b8b"
 
 inherit autotools useradd systemd
 
-- 
2.5.5


