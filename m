Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 512487F326
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:58:45 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 0A06D103740;
	Sat, 17 Aug 2019 21:58:46 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 23:58:08 +0200
Message-Id: <20190817215808.6585-2-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190817215808.6585-1-tworaz@tworaz.net>
References: <20190817215808.6585-1-tworaz@tworaz.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] telepathy-glib: Enable vala bindings
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
X-List-Received-Date: Sat, 17 Aug 2019 21:58:45 -0000
Content-Transfer-Encoding: 8bit

The package does offer optional vala bindings. They are used by gnome
components like folks library. Since vala bindings do not affect main
package and only add two small files in dev package enable them by
default.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 8bbfcc085..2b05c61a0 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -10,7 +10,9 @@ SRC_URI[sha256sum] = "9e0df1d8f857e0270cf0b32e2d1ca5a24aa7282873361785d573f72ad7
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-inherit autotools pkgconfig gettext gobject-introspection
+inherit autotools pkgconfig gettext gobject-introspection vala
+
+EXTRA_OECONF = "--enable-vala-bindings"
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
2.21.0


