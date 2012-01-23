Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RpESb-00031m-K0
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 08:37:02 +0100
Received: (qmail invoked by alias); 23 Jan 2012 07:22:38 -0000
Received: from p5B0A202F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.32.47]
	by mail.gmx.net (mp007) with SMTP; 23 Jan 2012 08:22:38 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1823X1ZNUg2KasWe2bw6ITqgKuBNhIi241j47dypx
	ek1z5cBSYKVkHu
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 08:24:28 +0100
Message-Id: <1327303469-12803-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1327303469-12803-1-git-send-email-schnitzeltony@gmx.de>
References: <1327303469-12803-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe 2/3] gegl: initial add 0.1.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2012 07:37:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

based on oe-classic [1]

[1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gegl_git.bb

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb b/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
new file mode 100644
index 0000000..5ae2082
--- /dev/null
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "GEGL (Generic Graphics Library) is a graph based image processing framework."
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl"
+
+inherit gnome
+
+EXTRA_OECONF = "--disable-docs "
+
+SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "c8279b86b3d584ee4f503839fc500425"
+SRC_URI[sha256sum] = "106b9574b6d5fb282683794f7a7f090a1a3f4a388890e592b202827a4ca76f75"
+
+FILES_${PN} += "${libdir}/gegl-*/*.so"
+FILES_${PN}-dev += "${libdir}/gegl-*/*.la"
+FILES_${PN}-dbg += "${libdir}/gegl-*/.debug"
-- 
1.7.4.4



