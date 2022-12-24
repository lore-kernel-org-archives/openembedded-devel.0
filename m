Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD6DC4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 06:30:54 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.91753.1671863449399237440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Dec 2022 22:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout09.t-online.de (Postfix) with SMTP id 8C429138
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 07:30:46 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.233]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p8y3H-0askiH0; Sat, 24 Dec 2022 07:30:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3] appstream: add recipe
Date: Sat, 24 Dec 2022 07:30:27 +0100
Message-Id: <20221224063027.30255-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671863436-E6FDD07E-28456B95/0/0 CLEAN NORMAL
X-TOI-MSGID: bcf77aab-5549-483c-ad6d-c545bdb84181
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 06:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100204

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/0001-fix-crosscompile.patch     | 43 ++++++++++++++++++
 .../appstream/appstream_0.15.5.bb             | 45 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-=
crosscompile.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream_0.15.5.bb

diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crossco=
mpile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crossc=
ompile.patch
new file mode 100644
index 000000000..fe8dcff91
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.p=
atch
@@ -0,0 +1,43 @@
+From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 12 Dec 2022 15:42:42 +0100
+Subject: [PATCH] fix crosscompile
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ data/meson.build  | 2 +-
+ meson.build       | 2 +-
+ tools/meson.build | 9 +++++++++
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index aea0cb25..1a085fc9 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
+ metainfo_with_relinfo =3D custom_target('gen-output',
+     input : ['../NEWS', 'org.freedesktop.appstream.cli.metainfo.xml'],
+     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainf=
o.xml'],
+-    command : [ascli_exe, 'news-to-metainfo', '--limit=3D6', '@INPUT0@'=
, '@INPUT1@', '@OUTPUT@']
++    command : ['appstreamcli', 'news-to-metainfo', '--limit=3D6', '@INP=
UT0@', '@INPUT1@', '@OUTPUT@']
+ )
+=20
+ metainfo_i18n =3D i18n.itstool_join(
+diff --git a/meson.build b/meson.build
+index fd0e3373..2f273ada 100644
+--- a/meson.build
++++ b/meson.build
+@@ -124,7 +124,7 @@ if get_option ('gir')
+     dependency('gobject-introspection-1.0', version: '>=3D1.56')
+ endif
+=20
+-stemmer_inc_dirs =3D include_directories(['/usr/include'])
++stemmer_inc_dirs =3D include_directories([''])
+ if get_option('stemming')
+     stemmer_lib =3D cc.find_library('stemmer', required: true)
+     if not cc.has_header('libstemmer.h')
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb b/meta=
-oe/recipes-support/appstream/appstream_0.15.5.bb
new file mode 100644
index 000000000..80f487852
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
@@ -0,0 +1,45 @@
+SUMMARY =3D "AppStream is a collaborative effort for making machine-read=
able software metadata easily available."
+HOMEPAGE =3D "https://github.com/ximion/appstream"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
+
+DEPENDS =3D " \
+    appstream-native \
+    curl-native \
+    curl \
+    docbook-xml-dtd4-native \
+    gperf-native \
+    glib-2.0 \
+    glib-2.0-native \
+    libyaml \
+    libstemmer \
+    libxml2 \
+    libxmlb \
+    libxslt-native \
+    itstool-native \
+    docbook-xsl-stylesheets-native \
+    python3-pygments-native \
+"
+
+inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
+
+GIR_MESON_OPTION =3D ""
+
+SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/App=
Stream-${PV}.tar.xz"
+SRC_URI:append:class-target =3D " file://0001-fix-crosscompile.patch"
+SRC_URI[sha256sum] =3D "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc=
55e70a25500e04c2"
+
+S =3D "${WORKDIR}/AppStream-${PV}"
+
+FILES:${PN} +=3D "${datadir}"
+
+EXTRA_OEMESON:class-target +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.c=
ross"
+
+do_write_config:append:class-target() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+appstreamcli =3D '${STAGING_BINDIR_NATIVE}/appstreamcli'
+EOF
+}
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


