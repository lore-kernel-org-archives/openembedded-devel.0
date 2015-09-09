Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 03BB360053
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2015 03:03:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100498984"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2015 11:06:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t8933DFZ017466
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Sep 2015 11:03:13 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 9 Sep 2015 11:03:25 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Sep 2015 11:03:23 +0800
Message-ID: <1441767803-11635-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] uim_1.8.6: fix QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Sep 2015 03:03:31 -0000
Content-Type: text/plain

uim-1.8.6: uim: Files/directories were installed but not shipped in any
package:
  /usr/lib/gtk-3.0/3.0.0/immodules/im-uim.so
  /usr/lib/gtk-3.0/3.0.0/immodules/im-uim.la

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 8f3797f..5c502cf 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
 SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
 
 DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
-DEPENDS_class-target += "gtk+ uim-native takao-fonts"
+DEPENDS_class-target += "gtk+ gtk+3 uim-native takao-fonts"
 
 RDEPENDS_uim = "libuim0 libedit"
 RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
@@ -38,7 +38,17 @@ do_configure_prepend () {
     cp ${S}/sigscheme/m4/* ${S}/m4/
 }
 
-PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-fep uim-common uim-anthy libuim0 libuim-dev"
+do_install_append() {
+    rm -rf ${D}/${datadir}/applications
+}
+
+PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim-common uim-anthy libuim0 libuim-dev"
+
+FILES_${PN} = "${bindir}/uim-help \
+               ${libdir}/uim/plugin/libuim-* \
+               ${libdir}/libuim-scm* \
+               ${libdir}/libgcroots* \
+               ${libdir}/uim/plugin/libuim-*"
 
 FILES_libuim0 = "${libdir}/uim/plugin/libuim-custom-enabler.* \
                  ${libdir}/libuim-custom.so.* \
@@ -72,11 +82,19 @@ FILES_uim-common = "${datadir}/uim/pixmaps/*.png \
                     ${datadir}/uim"
 
 FILES_uim-fep = "${bindir}/uim-fep*"
+
 FILES_uim-gtk2.0 = "${libdir}/gtk-2.0 \
-                    ${bindir}/uim-toolbar-gtk* \
+                    ${bindir}/uim-toolbar-gtk \
+                    ${bindir}/uim-toolbar-gtk-systray \
                     ${bindir}/uim-*-gtk \
                     ${bindir}/uim-input-pad-ja \
-                    ${datadir}/uim/helperdata/uim-dict-ui.xml"
+                    ${libdir}/uim/uim-*-gtk"
+
+FILES_uim-gtk3 = "${libdir}/gtk-3.0 \
+                   ${bindir}/uim-toolbar-gtk3 \
+                   ${bindir}/uim-toolbar-gtk3-systray \
+                   ${bindir}/uim-*-gtk3 \
+                   ${libdir}/uim/uim-*-gtk3"
 
 FILES_uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
                  ${datadir}/uim/skk*.scm"
-- 
1.8.4.2


