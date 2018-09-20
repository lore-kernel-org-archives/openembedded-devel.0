Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 269D579884
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 19:59:31 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id C04EB22050E;
	Thu, 20 Sep 2018 21:59:31 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Sep 2018 21:59:29 +0200
Message-Id: <20180920195929.5625-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180920195929.5625-1-max+openembedded@blarg.de>
References: <20180920195929.5625-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/2] mpc: new recipe
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
X-List-Received-Date: Thu, 20 Sep 2018 19:59:31 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/mpc_0.30.bb       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
new file mode 100644
index 000000000..777a2ab62
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A minimalist command line interface to the Music Player Daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE = "https://www.musicpd.org/clients/mpc/"
+
+inherit meson
+
+DEPENDS += " \
+    libmpdclient \
+"
+
+TAG = "v${PV}"
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/mpc;tag=${TAG};nobranch=1 \
+"
+S = "${WORKDIR}/git"
-- 
2.18.0


