Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5D27F33D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 22:00:41 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id DC7A6103768;
	Sat, 17 Aug 2019 22:00:41 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2019 00:00:32 +0200
Message-Id: <20190817220032.6778-3-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190817220032.6778-1-tworaz@tworaz.net>
References: <20190817220032.6778-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 3/3] libgee: Update to version 0.20.2
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
X-List-Received-Date: Sat, 17 Aug 2019 22:00:41 -0000
Content-Transfer-Encoding: 8bit

This is the latest upstream stable version of this package.

While doing the update also switch the package to use gnomebase bbclass
from oe-core. This bbclass uses much  better SRC_URI pattern that can
also use GNOME mirrors.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../libgee/{libgee_0.20.1.bb => libgee_0.20.2.bb}        | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.20.1.bb => libgee_0.20.2.bb} (57%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
similarity index 57%
rename from meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
index 190e5dd4e..94ea0a19d 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
@@ -8,9 +8,8 @@ BBCLASSEXTEND = "native"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-PE = "1"
+inherit gnomebase vala gobject-introspection
 
-inherit autotools vala pkgconfig gobject-introspection
 do_configure_prepend() {
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
     for i in ${MACROS}; do
@@ -18,7 +17,5 @@ do_configure_prepend() {
     done
 }
 
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
-SRC_URI[md5sum] = "d224dca55bb909f6730f40cc267337be"
-SRC_URI[sha256sum] = "bb2802d29a518e8c6d2992884691f06ccfcc25792a5686178575c7111fea4630"
+SRC_URI[archive.md5sum] = "45db478f2b300ada8e039ebc6c9458de"
+SRC_URI[archive.sha256sum] = "9e035c4b755f46bfae70ba81cdcf8328b03f554373cec8c816e8b5680f85353c"
-- 
2.21.0


