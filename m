Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B632CD37B6
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 08:22:26 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.8178.1694852540939796270
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 87DA6256FB
	for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 10:21:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.246]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhQYT-2p3HKD0; Sat, 16 Sep 2023 10:21:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] appstream: remove workaround for cross-compile
Date: Sat, 16 Sep 2023 10:21:08 +0200
Message-ID: <20230916082121.11335-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1694852489-350C916C-CB5EF246/0/0 CLEAN NORMAL
X-TOI-MSGID: 35859378-a1e6-4e94-a9e4-20555545ddfb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 08:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104898

This issue has been fixed upstream
https://github.com/ximion/appstream/pull/510/commits/1f301baa5bf59d75d566=
a674bd76221847ca1d21

- backport this patch
- fix api documentation build
- build vapi dependent on gobject-introspection-data

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/0001-fix-crosscompile.patch     | 43 -------------------
 ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 ++++++++++++++++
 .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
 .../appstream/appstream_0.16.3.bb             | 18 +++-----
 4 files changed, 74 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-=
crosscompile.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-meso=
n-do-not-rely-on-an-exe-wrapper.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-remo=
ve-hardcoded-path.patch

diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crossco=
mpile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crossc=
ompile.patch
deleted file mode 100644
index fe8dcff91..000000000
--- a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.p=
atch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Mon, 12 Dec 2022 15:42:42 +0100
-Subject: [PATCH] fix crosscompile
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Inappropriate [oe-specific]
----
- data/meson.build  | 2 +-
- meson.build       | 2 +-
- tools/meson.build | 9 +++++++++
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index aea0cb25..1a085fc9 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
- metainfo_with_relinfo =3D custom_target('gen-output',
-     input : ['../NEWS', 'org.freedesktop.appstream.cli.metainfo.xml'],
-     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainf=
o.xml'],
--    command : [ascli_exe, 'news-to-metainfo', '--limit=3D6', '@INPUT0@'=
, '@INPUT1@', '@OUTPUT@']
-+    command : ['appstreamcli', 'news-to-metainfo', '--limit=3D6', '@INP=
UT0@', '@INPUT1@', '@OUTPUT@']
- )
-=20
- metainfo_i18n =3D i18n.itstool_join(
-diff --git a/meson.build b/meson.build
-index fd0e3373..2f273ada 100644
---- a/meson.build
-+++ b/meson.build
-@@ -124,7 +124,7 @@ if get_option ('gir')
-     dependency('gobject-introspection-1.0', version: '>=3D1.56')
- endif
-=20
--stemmer_inc_dirs =3D include_directories(['/usr/include'])
-+stemmer_inc_dirs =3D include_directories([''])
- if get_option('stemming')
-     stemmer_lib =3D cc.find_library('stemmer', required: true)
-     if not cc.has_header('libstemmer.h')
---=20
-2.34.1
-
diff --git a/meta-oe/recipes-support/appstream/appstream/0001-meson-do-no=
t-rely-on-an-exe-wrapper.patch b/meta-oe/recipes-support/appstream/appstr=
eam/0001-meson-do-not-rely-on-an-exe-wrapper.patch
new file mode 100644
index 000000000..21a940fbe
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-rely-=
on-an-exe-wrapper.patch
@@ -0,0 +1,36 @@
+From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Wed, 26 Jul 2023 23:21:10 +0400
+Subject: [PATCH 01/60] meson: do not rely on an exe wrapper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [https://github.com/ximion/appstream/commit/82=
8a69e0606bea3addeb7df62c57be3a8a46413d]
+---
+ data/meson.build | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/data/meson.build b/data/meson.build
+index aea0cb25..ec0e434f 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
+ install_data('its/metainfo.loc',
+               install_dir: join_paths(get_option('datadir'), 'gettext',=
 'its'))
+=20
++# Do not rely on an exe wrapper for rel-info, use the system one in tha=
t case
++if meson.is_cross_build()
++    dependency('appstream', version: '>=3D' + as_version, native: true,
++               not_found_message: 'Native appstream required for cross-=
building')
++    ascli_exe =3D find_program('appstreamcli')
++endif
++
+ # NOTE: We do not translate the release notes on purpose here.
+ # If you do want to give translators a chance to translate them,
+ # ascli news-to-metainfo needs to produce a temporary file to translate
+--=20
+2.41.0
+
diff --git a/meta-oe/recipes-support/appstream/appstream/0001-remove-hard=
coded-path.patch b/meta-oe/recipes-support/appstream/appstream/0001-remov=
e-hardcoded-path.patch
new file mode 100644
index 000000000..9cbfaca82
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-p=
ath.patch
@@ -0,0 +1,31 @@
+From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 12 Dec 2022 15:42:42 +0100
+Subject: [PATCH] remove hardcoded path
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Dont include hardcoded path. This fixes:
+| cc1: error: include location "/usr/include" is unsafe for cross-compil=
ation [-Werror=3Dpoison-system-directories]
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build       | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
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
diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb b/meta=
-oe/recipes-support/appstream/appstream_0.16.3.bb
index 222cd80be..1d466ad18 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
@@ -22,9 +22,13 @@ DEPENDS =3D " \
 inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
=20
 GIR_MESON_OPTION =3D "gir"
+GTKDOC_MESON_OPTION =3D "apidocs"
=20
-SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/App=
Stream-${PV}.tar.xz"
-SRC_URI:append:class-target =3D " file://0001-fix-crosscompile.patch"
+SRC_URI =3D " \
+	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}=
.tar.xz \
+	file://0001-remove-hardcoded-path.patch \
+	file://0001-meson-do-not-rely-on-an-exe-wrapper.patch \
+"
 SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8=
e6344a2b318b98b1"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
@@ -36,14 +40,6 @@ PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemm=
ing=3Dfalse,libstemmer"
=20
 FILES:${PN} +=3D "${datadir}"
=20
-EXTRA_OEMESON:append =3D " -Ddocs=3Dfalse"
-EXTRA_OEMESON:class-target +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.c=
ross"
-
-do_write_config:append:class-target() {
-    cat >${WORKDIR}/meson-${PN}.cross <<EOF
-[binaries]
-appstreamcli =3D '${STAGING_BINDIR_NATIVE}/appstreamcli'
-EOF
-}
+EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.41.0


