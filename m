Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8B778E4B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 11:06:45 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 099E82209BB;
	Mon, 24 Sep 2018 13:06:46 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 13:06:30 +0200
Message-Id: <20180924110634.5059-3-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180924110634.5059-1-max+openembedded@blarg.de>
References: <20180924110634.5059-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v4 3/7] ncmpc: new recipe
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
X-List-Received-Date: Mon, 24 Sep 2018 11:06:45 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/ncmpc_0.32.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
new file mode 100644
index 000000000..936596a25
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.32.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A curses client for the Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE = "https://www.musicpd.org/clients/ncmpc/"
+
+inherit meson
+
+DEPENDS += " \
+    gettext-native \
+    glib-2.0 \
+    ncurses \
+    libmpdclient \
+"
+
+# We're using a 0.32 pre-release commit which contains a fix for a
+# build failure.
+PV = "0.32~git${SRCPV}"
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/ncmpc \
+"
+SRCREV = "1150f7931de7588643437069dd798724dc1ceb47"
+S = "${WORKDIR}/git"
-- 
2.19.0


