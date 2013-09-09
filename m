Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D39486186C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2013 07:05:29 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so2958963wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Sep 2013 00:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aKMdws0bUpyQhtuSANYXuQEPMSPWJ853AfUBOOtn62E=;
	b=C+iWeeqn0XBZEByzQgb3A97so+8CxJUvWvZgu+RkyfozB/tFmL48NoER/OiyLEG096
	V9fToUK9ycASS4r/ao8fz5knZOviiVgs0/T4jfaA92HYUiaBoTmQMtQcCa7jRXGiZ8Zr
	D/FN1B2AtLVpFVfpUBR0tCyp4JEmIP6komP5U7ecVVRUs4GIhRQTACaoLgk5q5OsUw/E
	tcQf5t7O0aUV2U9v54aPmxvXPm0uDV4cHvDXh7rm1FGdxreKA0HeLpoJHeMOHR1kqj40
	jbc4xe+sl1AeFRyVEF2Y78UZHoFaQaovrlzSMAvgmByIR68Rd9TgJe7ZFG1rt4i7qi+1
	cvDQ==
X-Gm-Message-State: ALoCoQlZTxnkzMWMEr0bCZGqa8AM6cnnsUc+kEpF221Vl3rCeaD8fS72vzmkLQ6azWOdi03sR/id
X-Received: by 10.180.81.71 with SMTP id y7mr3403611wix.63.1378710330717;
	Mon, 09 Sep 2013 00:05:30 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by mx.google.com with ESMTPSA id
	iz19sm12302537wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 00:05:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Sep 2013 09:05:17 +0200
Message-Id: <1378710318-18248-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.2.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/2] wxwidgets: add 2.9.5
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
X-List-Received-Date: Mon, 09 Sep 2013 07:05:31 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Incredibly ugly recipe that doesn't use PACKAGECONFIG because wxPython is too stupid to deal with non-superset wx configs. This is not meant to be applied, just posting it here for people needing wx.

 .../recipes-graphics/wxwidgets/wxwidgets_2.9.5.bb  | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/wxwidgets/wxwidgets_2.9.5.bb

diff --git a/meta-oe/recipes-graphics/wxwidgets/wxwidgets_2.9.5.bb b/meta-oe/recipes-graphics/wxwidgets/wxwidgets_2.9.5.bb
new file mode 100644
index 0000000..a844c67
--- /dev/null
+++ b/meta-oe/recipes-graphics/wxwidgets/wxwidgets_2.9.5.bb
@@ -0,0 +1,88 @@
+DESCRIPTION = "wxWidgets is a cross platform application framework utilizing native widgets."
+HOMEPAGE = "http://www.wxwidgets.org"
+
+LICENSE = "wxWindows"
+LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=18346072db6eb834b6edbd2cdc4f109b"
+
+DEPENDS = "webkit-gtk gstreamer gtk+ jpeg tiff libpng zlib expat libxinerama libglu"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/wxwindows/wxWidgets-${PV}.tar.bz2"
+SRC_URI[md5sum] = "e98c5f92805493f150656403ffef3bb0"
+SRC_URI[sha256sum] = "b74ba96ca537cc5d049d21ec9ab5eb2670406a4aa9f1ea4845ea84a9955a6e02"
+
+S = "${WORKDIR}/wxWidgets-${PV}"
+
+inherit autotools pkgconfig binconfig
+
+EXTRA_AUTORECONF = " -I ${S}/build/aclocal"
+EXTRA_OECONF = " --without-sdl \
+                 --with-opengl \
+                 --enable-mediactrl=yes \
+                 --enable-webviewwebkit=yes \
+                 --disable-gpe \
+                 --disable-visibility \
+                 --disable-rpath \
+               "
+
+CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
+
+# Broken autotools :/
+do_configure() {
+	oe_runconf
+}
+
+# wx-config contains entries like this:
+# this_prefix=`check_dirname "/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/cortexa8hf-vfp-neon-angstrom-linux-gnueabi/wxwidgets/2.9.5-r0/wxWidgets-2.9.5"`
+do_install_prepend() {
+	sed -i -e s:${S}:${STAGING_DIR_HOST}${prefix}:g ${S}/wx-config
+}
+
+# wx-config doesn't handle the suffixed libwx_media, xrc, etc, make a compat symlink
+do_install_append() {
+	for lib in adv aui core html media propgrid qa ribbon richtext stc webview xrc ; do
+		ln -sf libwx_gtk2u_$lib-2.9.so.5.0.0 ${D}${libdir}/libwx_gtk2u_$lib-2.9.so
+	done
+}
+
+SYSROOT_PREPROCESS_FUNCS += "wxwidgets_sysroot_preprocess"
+wxwidgets_sysroot_preprocess () {
+    sed -i -e 's,includedir="/usr/include",includedir="${STAGING_INCDIR}",g' ${SYSROOT_DESTDIR}${libdir}/wx/config/*
+    sed -i -e 's,libdir="/usr/lib",libdir="${STAGING_LIBDIR}",g' ${SYSROOT_DESTDIR}${libdir}/wx/config/*
+}
+
+PACKAGESPLITFUNCS_prepend = " split_wxwidgets_packages "
+python split_wxwidgets_packages () {
+    libdir = d.expand('${libdir}')
+
+    do_split_packages(d, libdir, '^libwx(.*)\.so\.*', 'libwx%s', 'wxWidgets %s library', extra_depends='', allow_links=True)
+}
+
+PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
+python set_metapkg_rdepends () {
+    import os
+
+    pn = d.getVar('PN', True)
+    metapkg = pn
+    blacklist = [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc', pn + '-meta' ]
+    metapkg_rdepends = []
+    packages = d.getVar('PACKAGES', True).split()
+    pkgdest = d.getVar('PKGDEST', True)
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
+            # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
+            # If this subdirectory is empty, then the package is.
+            # Empty packages do not get added to the meta package's RDEPENDS
+            pkgdir = os.path.join(pkgdest, pkg)
+            if os.path.exists(pkgdir):
+                dir_contents = os.listdir(pkgdir) or []
+            else:
+                dir_contents = []
+            is_empty = len(dir_contents) == 0
+            if not is_empty:
+                metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
+}
+
+FILES_${PN} = "${bindir} ${libdir}/wx/config"
+FILES_${PN}-dev += "${libdir}/wx/include ${datadir}/bakefile"
-- 
1.8.2.1


