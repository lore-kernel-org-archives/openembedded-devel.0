Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 82F396093A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 11:06:45 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 3E9E42209BC;
	Mon, 24 Sep 2018 13:06:46 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 13:06:31 +0200
Message-Id: <20180924110634.5059-4-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180924110634.5059-1-max+openembedded@blarg.de>
References: <20180924110634.5059-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v4 4/7] mpd: update 0.20.21
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
 .../musicpd/{mpd_0.20.18.bb => mpd_0.20.21.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.20.18.bb => mpd_0.20.21.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.18.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.18.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index 6754f347e..ab54fe80c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.18.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -46,8 +46,8 @@ SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.20/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-SRC_URI[md5sum] = "8dc87ba95473fd738f2aff9bd69cc212"
-SRC_URI[sha256sum] = "6a582dc2ae90b94ff3853f9ffd7d80b2c2b5fe2e2c35cb1da0b36f3f3dfad434"
+SRC_URI[md5sum] = "d93c3c86f5e0fc56cc2e1020f80f8b66"
+SRC_URI[sha256sum] = "8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01acc58dc"
 
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-- 
2.19.0


