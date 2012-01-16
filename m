Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rmpb5-00062o-N2
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 17:39:52 +0100
Received: (qmail invoked by alias); 16 Jan 2012 16:32:15 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.zera.local) [95.222.156.232]
	by mail.gmx.net (mp008) with SMTP; 16 Jan 2012 17:32:15 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX187yDVPens7kKPnHHKCcjW+nu/PLwT0ZKj4bAKRGr
	VDau9RqMUUuEG4
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jan 2012 17:32:20 +0100
Message-Id: <1326731540-15786-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-gnome] evince: add cross-compile-fix.patch from classic oe to fix build error
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
X-List-Received-Date: Mon, 16 Jan 2012 16:39:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was

| warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
| make[2]: *** [evince-C.omf] Error 1

[1] http://cgit.openembedded.org/openembedded/tree/recipes/evince/evince/cross-compile-fix.patch

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../evince/evince/cross-compile-fix.patch          |   25 ++++++++++++++++++++
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |    4 +++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch b/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
new file mode 100644
index 0000000..6f5420a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
@@ -0,0 +1,25 @@
+Index: evince-2.30.0/gnome-doc-utils.make
+===================================================================
+--- evince-2.30.0.orig/gnome-doc-utils.make	2010-03-29 11:52:47.000000000 -0700
++++ evince-2.30.0/gnome-doc-utils.make	2010-08-17 15:20:22.597646001 -0700
+@@ -132,13 +132,12 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
+ 
+ _xml2po ?= `which xml2po`
+ _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
+-
+-_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
+-_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
+-_malrng  ?= `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
+-_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
+-_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
+-_ids ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_malrng  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable malrng gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
+ 
+ if ENABLE_SK
+ _ENABLE_SK = true
+
diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index 899d416..ec54fbc 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -4,8 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 
+PR = "r1"
+
 inherit gnome pkgconfig gtk-icon-cache
 
+SRC_URI += "file://cross-compile-fix.patch"
+
 SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
 SRC_URI[archive.sha256sum] = "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7"
 
-- 
1.7.6.4



