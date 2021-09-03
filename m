Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.2950.1630668203339653451
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Sep 2021 04:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id B22EA14CBB
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Sep 2021 13:23:19 +0200 (CEST)
Received: from flk.fritz.box ([84.154.173.166]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mM7Hz-44Ie930; Fri, 3 Sep 2021 13:23:19 +0200
From: "Markus Volk" <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH v2] gimp: add recipe for current developement version
Date: Fri,  3 Sep 2021 13:23:08 +0200
Message-Id: <20210903112308.4288-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1630668199-00013856-5B96B170/0/0 CLEAN NORMAL
X-TOI-MSGID: 557c909c-0874-48d9-8cba-812e4da7f40a
Content-Transfer-Encoding: quoted-printable

Reworked the gimp recipe to use the latest developement release.
Switched buildsystem to meson.

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
---
 .../gimp/0001-meson-make-gir-buildable.patch  |  43 +++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb   | 109 ++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir=
-buildable.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-builda=
ble.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-buildab=
le.patch
new file mode 100644
index 000000000..632ae17c2
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-buildable.pat=
ch
@@ -0,0 +1,43 @@
+From c8f73f57d63779cfaad140e0521be40972fbec8f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 1 Sep 2021 16:44:13 +0200
+Subject: [PATCH] meson: make gir buildable
+
+yocto/oe is capable of building gobject introspection despite cross-comp=
iling.
+add an option to enable gir build even if cross-compiling
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ libgimp/meson.build | 2 +-
+ meson_options.txt   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgimp/meson.build b/libgimp/meson.build
+index 9e7b4fbbe3..99614733d7 100644
+--- a/libgimp/meson.build
++++ b/libgimp/meson.build
+@@ -384,7 +384,7 @@ libgimpui_introspectable_files =3D [
+   libgimpwidgets_introspectable,
+ ]
+=20
+-if meson.is_cross_build()
++if meson.is_cross_build() and not get_option('introspection')
+   have_gobject_introspection =3D false
+   gobject_introspection_warning =3D '\n      '.join(['',
+     'GObject Introspection is disabled while cross-compiling because',
+diff --git a/meson_options.txt b/meson_options.txt
+index 7b6ad78045..c29fdb5b40 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -52,7 +52,7 @@ option('headless-tests',    type: 'feature', value: 'a=
uto', description: 'Use xv
+ option('gtk-doc',           type: 'boolean', value: true,   description=
: 'Build developer documentation')
+ option('gtk-doc-app',       type: 'boolean', value: false,  description=
: 'Build developer documentation for app')
+ option('g-ir-doc',          type: 'boolean', value: false,  description=
: 'Build developer documentation for introspected API')
+-
++option('introspection',   type: 'boolean', value: false,  description: =
'GIR is buildable even if crosscompiling')
+ option('linux-input',       type: 'feature', value: 'auto', description=
: 'Linux input event controller module')
+ option('vec-icons',         type: 'boolean', value: true,   description=
: 'Use vector icons rather than raster ones')
+=20
+--=20
+2.25.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb b/meta-gnome/rec=
ipes-gimp/gimp/gimp_2.99.6.bb
new file mode 100644
index 000000000..c1e33d23d
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb
@@ -0,0 +1,109 @@
+SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
+HOMEPAGE =3D "http://www.gimp.org"
+SECTION =3D "graphics"
+LICENSE =3D "GPLv3"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+
+DEPENDS =3D " \
+    appstream-glib \
+    atk \
+    babl \
+    bison-native \
+    cairo \
+    dbus-glib \
+    fontconfig \
+    freetype \
+    gdk-pixbuf-native \
+    gegl \
+    gegl-native \
+    gexiv2 \
+    gtk+3 \
+    harfbuzz \
+    intltool-native \
+    json-glib \
+    lcms \
+    libarchive \
+    libexif \
+    libmypaint \
+    libxslt-native \
+    mypaint-brushes-1.0 \
+    pango \
+    poppler \
+    poppler-data \
+"
+
+DEPENDS:append:libc-musl =3D " libexecinfo"
+RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking"
+
+inherit meson gtk-icon-cache mime-xdg pkgconfig features_check gobject-i=
ntrospection
+
+SRC_URI =3D " \
+    git://github.com/GNOME/gimp.git;protocol=3Dhttps \
+    file://0001-meson-make-gir-buildable.patch \
+"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "GIMP_2_99_6"
+
+PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
+PACKAGECONFIG[appdata-test] =3D "-Dappdata-test=3Denabled,-Dappdata-test=
=3Ddisabled,appstream-glib-native"
+PACKAGECONFIG[bzip2] =3D ",,bzip2"
+PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-pdf=3Ddisabl=
ed"
+PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dtrue,-Dcheck-update=3D=
false"
+PACKAGECONFIG[enable-console-bin] =3D "-Denable-console-bin=3Dtrue,-Dena=
ble-console-bin=3Dfalse"
+PACKAGECONFIG[ghostscript] =3D "-Dghostscript=3Denabled,-Dghostscript=3D=
disabled,ghostscript"
+PACKAGECONFIG[gtk-doc] =3D "-Dgtk-doc=3Dtrue,-Dgtk-doc=3Dfalse,gtk-doc-n=
ative"
+PACKAGECONFIG[gtk-doc-app] =3D "-Dgtk-doc-app=3Dtrue,-Dgtk-doc-app=3Dfal=
se,gtk-doc-native"
+PACKAGECONFIG[gudev] =3D "-Dgudev=3Denabled,-Dgudev=3Ddisabled,libgudev"
+PACKAGECONFIG[javascript] =3D "-Djavascript=3Dtrue,-Djavascript=3Dfalse,=
,openjre-8"
+PACKAGECONFIG[jpeg2000] =3D "-Djpeg2000=3Denabled,-Djpeg2000=3Ddisabled,=
jasper"
+PACKAGECONFIG[jpeg] =3D ",,jpeg"
+PACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lgi"
+PACKAGECONFIG[lzma] =3D ",,xz"
+PACKAGECONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng"
+PACKAGECONFIG[png] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
+PACKAGECONFIG[python] =3D "-Dpython=3Dtrue,-Dpython=3Dfalse,,python3 pyt=
hon3-pygobject"
+PACKAGECONFIG[rsvg] =3D ",,librsvg"
+PACKAGECONFIG[tiff] =3D ",,tiff"
+PACKAGECONFIG[vala-plugins] =3D "-Dvala-plugins=3Denabled,-Dvala-plugins=
=3Ddisabled"
+PACKAGECONFIG[webkit] =3D "-Dwebkit=3Denabled,-Dwebkit=3Ddisabled,webkit=
gtk"
+PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
+PACKAGECONFIG[xcursor] =3D "-Dxcursor=3Denabled,-Dxcursor=3Ddisabled,lib=
xcursor"
+PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-Dxpm=3Ddisabled,libxpm libxmu"
+PACKAGECONFIG[zlib] =3D ",,zlib"
+
+PACKAGECONFIG ?=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+    alsa \
+    bzip2 \
+    cairo-pdf \
+    gtk-doc-app \
+    gudev \
+    jpeg \
+    jpeg2000 \
+    lua \
+    lzma \
+    mng \
+    png \
+    python \
+    rsvg \
+    tiff \
+    webp \
+    zlib \
+"
+
+FILES:${PN} +=3D " \
+    ${datadir}/metainfo \
+    ${datadir}/gir-1.0 \
+    ${datadir}/appdata \
+    ${libdir}/girepository-1.0 \
+"
+
+EXTRA_OEMESON +=3D " \
+    -Dshmem-type=3Dposix \
+    --buildtype release \
+"
+
--=20
2.25.1

