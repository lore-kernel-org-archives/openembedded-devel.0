Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id DA11879C23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 16:34:53 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F1FD200529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f1f:d200:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 81062220515;
	Fri, 26 Oct 2018 18:34:54 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 18:34:51 +0200
Message-Id: <20181026163451.447-3-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026163451.447-1-max+openembedded@blarg.de>
References: <20181026163451.447-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2 3/3] mpd: eliminate systemd ExecStart edit
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
X-List-Received-Date: Fri, 26 Oct 2018 16:34:54 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

This was never necessary because MPD's build script already inserts
the correct path.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
index 92514d87d..6c6ad4237 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
@@ -82,12 +82,6 @@ do_install_append() {
         -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
         ${D}/${sysconfdir}/mpd.conf
 
-    if [ -e ${D}/${systemd_unitdir}/system/mpd.service ] ; then
-        sed -i \
-            's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
-            ${D}/${systemd_unitdir}/system/mpd.service
-    fi
-
     # we don't need the icon
     rm -rf ${D}${datadir}/icons
 }
-- 
2.19.1


