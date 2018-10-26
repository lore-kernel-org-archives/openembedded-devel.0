Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4EA79C23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 16:34:52 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F1FD200529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f1f:d200:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id D31A9220515;
	Fri, 26 Oct 2018 18:34:52 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 18:34:49 +0200
Message-Id: <20181026163451.447-1-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2 1/3] mpd: update to 0.20.22
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
X-List-Received-Date: Fri, 26 Oct 2018 16:34:52 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../musicpd/{mpd_0.20.21.bb => mpd_0.20.22.bb}               | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.20.21.bb => mpd_0.20.22.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
index d4edd5b31..3c92f8d03 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
@@ -20,7 +20,7 @@ SRC_URI = " \
     git://github.com/MusicPlayerDaemon/MPD;branch=v0.20.x \
     file://mpd.conf.in \
 "
-SRCREV = "98afae2520fbe5a322f803335b3142612fda4762"
+SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "enable_bzip2=yes"
@@ -88,6 +88,9 @@ do_install_append() {
             's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
             ${D}/${systemd_unitdir}/system/mpd.service
     fi
+
+    # we don't need the icon
+    rm -rf ${D}${datadir}/icons
 }
 
 RPROVIDES_${PN} += "${PN}-systemd"
-- 
2.19.1


