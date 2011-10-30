Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKb9v-0005zh-QP
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 20:35:07 +0100
Received: (qmail invoked by alias); 30 Oct 2011 19:29:03 -0000
Received: from p4FDF1C25.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.37]
	by mail.gmx.net (mp011) with SMTP; 30 Oct 2011 20:29:03 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19WBGx5qm5WHI8hbp8m1E6p/1z6XGOwMWio5Bfihj
	Xc/R2zGLPUAOPg
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2011 20:33:44 +0100
Message-Id: <1320003224-12913-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-gnome] evince: initial add 2.32.0
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
X-List-Received-Date: Sun, 30 Oct 2011 19:35:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* recipe based on oe-classic: evince_2.30.0.bb
  commit 5dba154457691d2096f2b1a7ef24bdc6f1b51859
* run tested on overo
* TODO further doctype support
  configure option  ->    current configure result
  ------------------------------------------------
  --enable-ps       ->    PostScript Backend.:  no
  --enable-djvu     ->    DJVU Backend.......:  no
  --enable-impress  ->    Impress Backend....:  no

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb |   39 ++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb

diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
new file mode 100644
index 0000000..899d416
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Evince is a document viewer for document formats like pdf, ps, djvu."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
+SECTION = "x11/office"
+DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
+
+inherit gnome pkgconfig gtk-icon-cache
+
+SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
+SRC_URI[archive.sha256sum] = "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7"
+
+EXTRA_OECONF = " --enable-thumbnailer \
+                 --enable-nautilus \
+                 --disable-scrollkeeper \
+                 --enable-pixbuf \
+               "
+
+do_install_append() {
+	install -d install -d ${D}${datadir}/pixmaps
+	install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/
+}
+
+RDEPENDS_${PN} += "glib-2.0-utils"
+
+PACKAGES =+ "${PN}-nautilus-extension"
+FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN}-dbg += "${libdir}/*/*/.debug \
+                    ${libdir}/*/*/*/.debug"
+FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
+FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
+
+pkg_postinst_${PN} () {
+if [ -n "$D" ]; then
+    exit 1
+fi
+
+glib-compile-schemas ${datadir}/glib-2.0/schemas
+}
-- 
1.7.4.4



