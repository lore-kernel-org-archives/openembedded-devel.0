Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id EB88E6011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 19:20:34 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id C7A40803F4;
	Mon,  4 Jul 2016 21:20:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WMtnGnEaGcuJ; Mon,  4 Jul 2016 21:20:32 +0200 (CEST)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 0E3E9800B1;
	Mon,  4 Jul 2016 21:20:32 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jul 2016 21:20:24 +0200
Message-Id: <1467660024-32198-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-multimedia][PATCH] Mpd: use libsystemd
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
X-List-Received-Date: Mon, 04 Jul 2016 19:20:35 -0000

Mpd tries to find and link to libsystemd-daemon by default,
but there's only libsystemd in OpenEmbedded. Fixing this makes
socket activation work.

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
index caba589..5c574c1 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.15.bb
@@ -22,6 +22,10 @@ PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
 PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
 
+do_configure_prepend() {
+    sed -i -e 's|libsystemd-daemon|libsystemd|' ${S}/configure.ac
+}
+
 do_install_append() {
     install -d ${D}/${localstatedir}/lib/mpd/music
     chmod 775 ${D}/${localstatedir}/lib/mpd/music
-- 
2.7.4


