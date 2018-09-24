Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC7D6093A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 11:06:45 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id CCBC12209BA;
	Mon, 24 Sep 2018 13:06:45 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 13:06:29 +0200
Message-Id: <20180924110634.5059-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180924110634.5059-1-max+openembedded@blarg.de>
References: <20180924110634.5059-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v4 2/7] mpc: new recipe
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
 .../recipes-multimedia/musicpd/mpc_0.30.bb       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.30.bb
new file mode 100644
index 000000000..6fac5b2e7
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
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/mpc \
+"
+SRCREV = "6fc4e639152daeebb19e0fdfb277252acc734fc5"
+S = "${WORKDIR}/git"
-- 
2.19.0


