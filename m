Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE4B74520
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 09:28:13 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id F3A462201A1; Fri, 21 Sep 2018 11:28:13 +0200 (CEST)
Date: Fri, 21 Sep 2018 11:28:13 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180921092813.ejvgd6d3anzqnhzg@swift.blarg.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <CAMKF1sqitMcnQHt73gDbsMyWpFatxOmKoH=suurNz7HmFt45CA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqitMcnQHt73gDbsMyWpFatxOmKoH=suurNz7HmFt45CA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2] mpc: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 09:28:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
2.18.0

