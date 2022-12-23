Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B867DC4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 03:11:35 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.64369.1671765088555903795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 19:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id 55E7941BE
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 04:11:26 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.10]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p8YSq-4MWH3a0; Fri, 23 Dec 2022 04:11:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 2/3] appstream: add recipe
Date: Fri, 23 Dec 2022 04:11:03 +0100
Message-Id: <20221223031104.13517-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221223031104.13517-1-f_l_k@t-online.de>
References: <20221223031104.13517-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671765076-FAC5D742-63680497/0/0 CLEAN NORMAL
X-TOI-MSGID: 90a2fc7e-657b-45c1-b81c-935a94ee81a9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 03:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100194

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/0001-fix-crosscompile.patch     | 43 +++++++++++++++++++
 .../appstream/appstream_0.15.5.bb             | 33 ++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-=
crosscompile.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream_0.15.5.bb

diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crossco=
mpile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crossc=
ompile.patch
new file mode 100644
index 000000000..3cf039259
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
++    command : ['/usr/bin/appstreamcli', 'news-to-metainfo', '--limit=3D=
6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
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
index 000000000..f9f04526f
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "AppStream is a collaborative effort for making machine-read=
able software metadata easily available."
+HOMEPAGE =3D "https://github.com/ximion/appstream"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
+
+DEPENDS =3D " \
+    curl-native \
+    curl \
+    docbook-xml-dtd4-native \
+    gperf-native \
+    glib-2.0 \
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
+SRC_URI =3D " \
+    https://www.freedesktop.org/software/appstream/releases/AppStream-${=
PV}.tar.xz \
+    file://0001-fix-crosscompile.patch \
+"
+
+SRC_URI[sha256sum] =3D "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc=
55e70a25500e04c2"
+S =3D "${WORKDIR}/AppStream-${PV}"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


