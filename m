Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOwNk-0004hW-5P
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 22:07:52 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so6634847wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WiAeMy39JMkgdudqXzrbjMvOOVp5sna4AxaD8grQ5jU=;
	b=YYBWV0ibR9Jm+pTnIJjyOEuNqvpyVxsdyugF4WGcXSIHrQWzGXiip47b3P/DPriKSV
	J8xoaRJLmQ0/DSdahp7iIAP1Xq0K8fNal228LnQ3ye0igL1a2iESpl+pvwIk+40yqXNb
	Q1p/Zl5FhrnZA1h4cr3x3E9TWApuxrmgAFUbf+gpGojnneW000JAmzxC3c56TEpCB3My
	7hKyDhxqe1zkhALdLnJap2S+Te7zJibsMV1xkR9kyBd2GzIj4FPIFB8mJ2MFfmd3Akyg
	1nfxEYuSC18dmdu1Kp5COxy8a7dO5Rp2+BbicE379oT1hUMGfGt/kg1mP+ARMekatGp2
	G14g==
Received: by 10.180.99.194 with SMTP id es2mr13535380wib.15.1350590074356;
	Thu, 18 Oct 2012 12:54:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm31092927wib.6.2012.10.18.12.54.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:54:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 21:54:29 +0200
Message-Id: <9610a228f0d8308baefe7457efebe7953bf02831.1350589969.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Thu, 18 Oct 2012 20:07:52 -0000

* bitbake uses PACKAGES_DYNAMIC as regexp
  ^ could make matching faster (and it will be more clear that we're expecting regexp not glob)
  * made all those last '-' optional, use .* (or nothing)
* use += instead of = in most cases to keep ${PN}-locale from
  bitbake.conf:PACKAGES_DYNAMIC = "^${PN}-locale-.*"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc         | 2 +-
 meta-efl/recipes-efl/efl/evas.inc                         | 2 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb         | 2 +-
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    | 2 +-
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb              | 2 +-
 meta-gnome/recipes-support/goffice/goffice_0.8.17.bb      | 2 +-
 meta-initramfs/recipes-devtools/klibc/klibc-utils.inc     | 2 +-
 meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb  | 2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc             | 2 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb         | 2 +-
 meta-oe/recipes-multimedia/libav/libav.inc                | 2 +-
 meta-oe/recipes-support/freerdp/freerdp.inc               | 2 +-
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb       | 2 +-
 meta-oe/recipes-support/pidgin/pidgin.inc                 | 2 +-
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb | 2 +-
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb  | 2 +-
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb              | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
index 7556eb2..cb11334 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -30,4 +30,4 @@ python populate_packages_prepend () {
 FILES_evas-generic-loader-xcf += "${libdir}/evas/utils/*.xcf.gz"
 FILES_${PN}-dbg += "${libdir}/evas/utils/.debug"
 
-PACKAGES_DYNAMIC = "evas-generic-loader-*"
+PACKAGES_DYNAMIC += "^evas-generic-loader-.*"
diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index b0ec0cf..e3e5d39 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -40,7 +40,7 @@ FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/ ${libdir}/evas/cserve2/
 FILES_${PN}-cserve2 += "${libexecdir}/evas_cserve2* ${libexecdir}/dummy_slave"
 
 PACKAGES += "${PN}-cserve2"
-PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-* evas-cserve2-*"
+PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
 
 # evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
 # http://www.intesis.hr/news/16-esvg-source
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 8c3aab4..60b970b 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -99,7 +99,7 @@ FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/AbiWord/strings"
 FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/AbiWord/system.profile*"
 FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
 
-PACKAGES_DYNAMIC = "${PN}-meta ${PN}-plugin-*"
+PACKAGES_DYNAMIC += "^${PN}-meta.* ^${PN}-plugin-.*"
 
 python populate_packages_prepend () {
     abiword_libdir    = bb.data.expand('${libdir}/abiword-2.8/plugins', d)
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 586eed8..46be86f 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -40,7 +40,7 @@ FILES_${PN}-dbg += " ${libdir}/gnome-vfs-2.0/modules/.debug"
 FILES_${PN}-dev += " ${libdir}/gnome-vfs-2.0/include"
 FILES_${PN}-doc += " ${datadir}/gtk-doc"
 
-PACKAGES_DYNAMIC = "gnome-vfs-plugin-*"
+PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
 
 python populate_packages_prepend () {
     print bb.data.getVar('FILES_gnome-vfs', d, 1)
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index c1f535b..32b54ef 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -72,7 +72,7 @@ FILES_${PN}-dbg += " \
                     ${libdir}/gtk-3.0/modules/.debug"
 
 
-PACKAGES_DYNAMIC += "gtk3-immodule-* gtk3-printbackend-*"
+PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
 
 python populate_packages_prepend () {
     import os.path
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
index c55a8ac..4b64731 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
@@ -36,7 +36,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
 
-PACKAGES_DYNAMIC = "goffice-plugin-*"
+PACKAGES_DYNAMIC += "^goffice-plugin-.*"
 
 python populate_packages_prepend () {
     goffice_libdir = bb.data.expand('${libdir}/goffice/${PV}/plugins/', d)
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index cd55dc2..2190ca2 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -92,7 +92,7 @@ RDEPENDS_klibc-utils-true = "${THIS_LIBKLIBC}"
 RDEPENDS_klibc-utils-umount = "${THIS_LIBKLIBC}"
 RDEPENDS_klibc-utils-uname = "${THIS_LIBKLIBC}"
 
-PACKAGES_DYNAMIC = "${KLIBC_UTILS_PKGNAME}-*"
+PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
 
 python populate_packages_prepend () {
 
diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
index 00030d3..c2f1cc8 100644
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
+++ b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
@@ -35,7 +35,7 @@ python populate_packages_prepend() {
 
 PACKAGES =+ "${PN}-gtk"
 
-PACKAGES_DYNAMIC = "libcanberra-*"
+PACKAGES_DYNAMIC += "^libcanberra-.*"
 
 FILES_${PN}-gtk = "\
   ${sysconfdir}/gconf \
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
index 50b6b0e..76669be 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -73,5 +73,5 @@ python populate_packages_prepend() {
     do_split_packages(d, plugindir, '(.*)\.so$', 'lcdd-driver-%s', 'LCDd driver for %s', prepend=True)
 }
 
-PACKAGES_DYNAMIC = "lcdd-driver-*"
+PACKAGES_DYNAMIC += "^lcdd-driver-.*"
 
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 0d03889..8e842c4 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -20,7 +20,7 @@ EXTRA_OECONF += "--with-plugins=none"
 
 PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome"
 
-PACKAGES_DYNAMIC += "${PN}-theme-*"
+PACKAGES_DYNAMIC += "^${PN}-theme-.*"
 
 python populate_packages_prepend() {
     theme_dir = bb.data.expand('${datadir}/themes/', d)
diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 4a1716f..0e80430 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -119,4 +119,4 @@ python populate_packages_prepend() {
                       allow_links=True)
 }
 
-PACKAGES_DYNAMIC = "lib(av(codec|device|filter|format|util)|postproc)*"
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc).*"
diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 46aecf6..673b372 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -23,7 +23,7 @@ PACKAGES =+ "libfreerdp"
 LEAD_SONAME = "libfreerdp.so"
 FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
 
-PACKAGES_DYNAMIC = "libfreerdp-plugin-*"
+PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
 python populate_packages_prepend () {
     freerdp_root = bb.data.expand('${libdir}/freerdp', d)
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 3ef12d3..8d9bd6c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -249,7 +249,7 @@ pkg_prerm_${PN}-slapd () {
     update-rc.d $D openldap remove
 }
 
-PACKAGES_DYNAMIC = "openldap-backends openldap-backend-*"
+PACKAGES_DYNAMIC += "^openldap-backends.* ^openldap-backend-.*"
 
 python populate_packages_prepend () {
     backend_dir    = bb.data.expand('${libexecdir}/openldap', d)
diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 90e2fd4..cb2a597 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -56,7 +56,7 @@ RRECOMMENDS_${PN} = "${PN}-data libpurple-plugin-ssl-gnutls libpurple-protocol-i
 FILES_${PN}-data = "${datadir}/pixmaps ${datadir}/sounds ${datadir}/icons"
 FILES_${PN}-dev += "${libdir}/${PN}/*.la"
 
-PACKAGES_DYNAMIC = "libpurple-protocol-* libpurple-plugin-* pidgin-plugin-* finch-plugin-*"
+PACKAGES_DYNAMIC += "^libpurple-protocol-.* ^libpurple-plugin-.* ^pidgin-plugin-.* ^finch-plugin-.*"
 
 python populate_packages_prepend () {
     pidgroot = bb.data.expand('${libdir}/pidgin', d)
diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index c018cb5..1826dd2 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -16,4 +16,4 @@ python populate_packages_prepend () {
     do_split_packages(d, themedir, '^(.*)', 'xfwm4-old-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
 }
 
-PACKAGES_DYNAMIC += "xfwm4-old-theme-*"
+PACKAGES_DYNAMIC += "^xfwm4-old-theme-.*"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
index 5d03425..bb914ba 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
@@ -20,7 +20,7 @@ python populate_packages_prepend() {
                                          '${bindir}/*%s*'])
 }
 
-PACKAGES_DYNAMIC = "${PN}-plugin-*"
+PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
                 ${libdir}/xfce4/panel/wrapper"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
index 049ac6f..f17d4e5 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
@@ -14,7 +14,7 @@ python populate_packages_prepend () {
     do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
 }
 
-PACKAGES_DYNAMIC += "xfwm4-theme-*"
+PACKAGES_DYNAMIC += "^xfwm4-theme-.*"
 
 ALTERNATIVE_${PN} = "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/xfwm4"
-- 
1.7.12.4



