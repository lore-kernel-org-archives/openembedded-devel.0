Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1E0EE645A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 12:01:44 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.18722.1694779296734275570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 05:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id B7747517B9
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 14:01:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.231.62]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qh7Vu-1OVnzF0; Fri, 15 Sep 2023 14:01:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] appstream: remove workaround for cross-compile
Date: Fri, 15 Sep 2023 14:01:31 +0200
Message-ID: <20230915120131.251678-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694779294-7D9FFE98-BF9C8FC4/0/0 CLEAN NORMAL
X-TOI-MSGID: d7ffb4e2-92f1-4f61-b1a9-a28979f68b15
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 12:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104894

This issue has been fixed upstream
https://github.com/ximion/appstream/pull/510/commits/1f301baa5bf59d75d566=
a674bd76221847ca1d21

- fix api documentation build
- build vapi dependent on gobject-introspection-data

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/0001-fix-crosscompile.patch     | 43 -------------------
 .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
 .../appstream/appstream_0.16.3.bb             | 17 +++-----
 3 files changed, 37 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-=
crosscompile.patch
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
index 222cd80be..5a6c5336c 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
@@ -22,9 +22,12 @@ DEPENDS =3D " \
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
+"
 SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8=
e6344a2b318b98b1"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
@@ -36,14 +39,6 @@ PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemm=
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


