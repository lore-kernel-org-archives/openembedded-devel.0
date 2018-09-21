Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 35683798B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 09:28:04 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id 0B8252201A1; Fri, 21 Sep 2018 11:28:05 +0200 (CEST)
Date: Fri, 21 Sep 2018 11:28:05 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180921092805.7pa2zotfukuahyh7@swift.blarg.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <CAMKF1spB414U2iQh0k9DYTK0WV2ay___ahp932cfCU8Stzc20Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spB414U2iQh0k9DYTK0WV2ay___ahp932cfCU8Stzc20Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2] libmpdclient: new recipe
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
X-List-Received-Date: Fri, 21 Sep 2018 09:28:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/libmpdclient_2.15.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
new file mode 100644
index 000000000..dbee66e8d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.15.bb
@@ -0,0 +1,12 @@
+SUMMARY = "C client library for the Music Player Daemon"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=06b9dfd2f197dc514d8ef06549684b77"
+HOMEPAGE = "https://www.musicpd.org/libs/libmpdclient/"
+
+inherit meson
+
+SRC_URI = " \
+    git://github.com/MusicPlayerDaemon/libmpdclient \
+"
+SRCREV = "7754ffdfb9371cd398371cb2670a54e9e1e623e2"
+S = "${WORKDIR}/git"
-- 
2.18.0

