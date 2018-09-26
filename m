Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id C614479585
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:21:25 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 940722209BE;
	Wed, 26 Sep 2018 15:21:26 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 15:21:13 +0200
Message-Id: <20180926132115.10455-5-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180926132115.10455-1-max+openembedded@blarg.de>
References: <20180926132115.10455-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 5/7] mpd: eliminate `chmod`/`chown` calls by using `install`
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
X-List-Received-Date: Wed, 26 Sep 2018 13:21:26 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-multimedia/musicpd/mpd_0.20.21.bb          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index e23c8d523..9123673fb 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -66,11 +66,11 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    install -d ${D}/${localstatedir}/lib/mpd/music
-    chmod 775 ${D}/${localstatedir}/lib/mpd/music
-    install -d ${D}/${localstatedir}/lib/mpd/playlists
-    chown -R mpd ${D}/${localstatedir}/lib/mpd
-    chown mpd:mpd ${D}/${localstatedir}/lib/mpd/music
+    install -o mpd -d \
+        ${D}/${localstatedir}/lib/mpd \
+        ${D}/${localstatedir}/lib/mpd/playlists
+    install -m775 -o mpd -g mpd -d \
+        ${D}/${localstatedir}/lib/mpd/music
 
     install -d ${D}/${sysconfdir}
     install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
-- 
2.19.0


