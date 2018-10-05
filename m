Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 7694374520
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 17:01:18 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id C79412201B5;
	Fri,  5 Oct 2018 19:01:18 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 19:01:07 +0200
Message-Id: <20181005170108.29819-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 1/2] ncmpc: update to the 0.32 release tag
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
X-List-Received-Date: Fri, 05 Oct 2018 17:01:18 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
index 936596a25..bc7764424 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
@@ -7,17 +7,14 @@ inherit meson
 
 DEPENDS += " \
     gettext-native \
-    glib-2.0 \
+    boost \
+    pcre \
     ncurses \
     libmpdclient \
 "
 
-# We're using a 0.32 pre-release commit which contains a fix for a
-# build failure.
-PV = "0.32~git${SRCPV}"
-
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc \
 "
-SRCREV = "1150f7931de7588643437069dd798724dc1ceb47"
+SRCREV = "b03703653d3f4a418c4a8b6a9e32834dd882a185"
 S = "${WORKDIR}/git"
-- 
2.19.0


