Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C53CCD37BB
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 08:56:47 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.8491.1694854596987990355
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 01:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id D6BC81FC4C
	for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 10:56:34 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.224.246]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhR6P-1Z1Eqe0; Sat, 16 Sep 2023 10:56:34 +0200
Date: Sat, 16 Sep 2023 10:56:37 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv3] appstream: remove workaround for
 cross-compile
To: openembedded-devel@lists.openembedded.org
Message-Id: <D6M21S.RM3LNTXPJR443@t-online.de>
In-Reply-To: <17855520D3A3C73F.14604@lists.openembedded.org>
References: <17855520D3A3C73F.14604@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-kOJ6aKgeNIJ0lrWHMAgB"
X-TOI-EXPURGATEID: 150726::1694854594-45FFA5E3-A7D043FC/0/0 CLEAN NORMAL
X-TOI-MSGID: e014c43b-f57c-490c-a0dd-c63aad917466
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 08:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104901

--=-kOJ6aKgeNIJ0lrWHMAgB
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

I had put the wrong URL in the upstream status line

On Sat, Sep 16 2023 at 10:53:39 AM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> This issue has been fixed upstream
> <https://github.com/ximion/appstream/pull/510/commits/1f301baa5bf59d75d56=
6a674bd76221847ca1d21>
>=20
> - backport this patch
> - fix api documentation build
> - build vapi dependent on gobject-introspection-data
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../appstream/0001-fix-crosscompile.patch     | 43=20
> -------------------
>  ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 ++++++++++++++++
>  .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
>  .../appstream/appstream_0.16.3.bb             | 18 +++-----
>  4 files changed, 74 insertions(+), 54 deletions(-)
>  delete mode 100644=20
> meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
>  create mode 100644=20
> meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-=
exe-wrapper.patch
>  create mode 100644=20
> meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-path.pa=
tch
>=20
> diff --git=20
> a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch=
=20
> b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> deleted file mode 100644
> index fe8dcff91..000000000
> ---=20
> a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00=20
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Mon, 12 Dec 2022 15:42:42 +0100
> -Subject: [PATCH] fix crosscompile
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> -
> -Upstream-Status: Inappropriate [oe-specific]
> ----
> - data/meson.build  | 2 +-
> - meson.build       | 2 +-
> - tools/meson.build | 9 +++++++++
> - 3 files changed, 11 insertions(+), 2 deletions(-)
> -
> -diff --git a/data/meson.build b/data/meson.build
> -index aea0cb25..1a085fc9 100644
> ---- a/data/meson.build
> -+++ b/data/meson.build
> -@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
> - metainfo_with_relinfo =3D custom_target('gen-output',
> -     input : ['../NEWS',=20
> 'org.freedesktop.appstream.cli.metainfo.xml'],
> -     output :=20
> ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainfo.xml'],
> --    command : [ascli_exe, 'news-to-metainfo', '--limit=3D6',=20
> '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> -+    command : ['appstreamcli', 'news-to-metainfo', '--limit=3D6',=20
> '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> - )
> -
> - metainfo_i18n =3D i18n.itstool_join(
> -diff --git a/meson.build b/meson.build
> -index fd0e3373..2f273ada 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -124,7 +124,7 @@ if get_option ('gir')
> -     dependency('gobject-introspection-1.0', version: '>=3D1.56')
> - endif
> -
> --stemmer_inc_dirs =3D include_directories(['/usr/include'])
> -+stemmer_inc_dirs =3D include_directories([''])
> - if get_option('stemming')
> -     stemmer_lib =3D cc.find_library('stemmer', required: true)
> -     if not cc.has_header('libstemmer.h')
> ---
> -2.34.1
> -
> diff --git=20
> a/meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-a=
n-exe-wrapper.patch=20
> b/meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-a=
n-exe-wrapper.patch
> new file mode 100644
> index 000000000..6214b6f4d
> --- /dev/null
> +++=20
> b/meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-a=
n-exe-wrapper.patch
> @@ -0,0 +1,36 @@
> +From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00=20
> 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D=20
> <marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>
> +Date: Wed, 26 Jul 2023 23:21:10 +0400
> +Subject: [PATCH 01/60] meson: do not rely on an exe wrapper
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com=20
> <mailto:marcandre.lureau@redhat.com>>
> +
> +Upstream-Status: Backport=20
> [<https://github.com/ximion/appstream/commit/79bf322768990b28c29a9d907edc=
ca52ff48e0b8>]
> +---
> + data/meson.build | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index aea0cb25..ec0e434f 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
> + install_data('its/metainfo.loc',
> +               install_dir: join_paths(get_option('datadir'),=20
> 'gettext', 'its'))
> +
> ++# Do not rely on an exe wrapper for rel-info, use the system one in=20
> that case
> ++if meson.is_cross_build()
> ++    dependency('appstream', version: '>=3D' + as_version, native:=20
> true,
> ++               not_found_message: 'Native appstream required for=20
> cross-building')
> ++    ascli_exe =3D find_program('appstreamcli')
> ++endif
> ++
> + # NOTE: We do not translate the release notes on purpose here.
> + # If you do want to give translators a chance to translate them,
> + # ascli news-to-metainfo needs to produce a temporary file to=20
> translate
> +--
> +2.41.0
> +
> diff --git=20
> a/meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-path.=
patch=20
> b/meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-path.=
patch
> new file mode 100644
> index 000000000..9cbfaca82
> --- /dev/null
> +++=20
> b/meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-path.=
patch
> @@ -0,0 +1,31 @@
> +From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00=20
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 12 Dec 2022 15:42:42 +0100
> +Subject: [PATCH] remove hardcoded path
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> +
> +Dont include hardcoded path. This fixes:
> +| cc1: error: include location "/usr/include" is unsafe for=20
> cross-compilation [-Werror=3Dpoison-system-directories]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.build       | 2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index fd0e3373..2f273ada 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -124,7 +124,7 @@ if get_option ('gir')
> +     dependency('gobject-introspection-1.0', version: '>=3D1.56')
> + endif
> +
> +-stemmer_inc_dirs =3D include_directories(['/usr/include'])
> ++stemmer_inc_dirs =3D include_directories([''])
> + if get_option('stemming')
> +     stemmer_lib =3D cc.find_library('stemmer', required: true)
> +     if not cc.has_header('libstemmer.h')
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb=20
> b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
> index 222cd80be..1d466ad18 100644
> --- a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
> +++ b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
> @@ -22,9 +22,13 @@ DEPENDS =3D " \
>  inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
>=20
>  GIR_MESON_OPTION =3D "gir"
> +GTKDOC_MESON_OPTION =3D "apidocs"
>=20
> -SRC_URI =3D=20
> "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.=
tar.xz=20
> <https://www.freedesktop.org/software/appstream/releases/AppStream-$%7BPV=
%7D.tar.xz>"
> -SRC_URI:append:class-target =3D " file://0001-fix-crosscompile.patch"=20
> <file://0001-fix-crosscompile.patch/>
> +SRC_URI =3D " \
> +	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}=
.tar.xz=20
> <https://www.freedesktop.org/software/appstream/releases/AppStream-$%7BPV=
%7D.tar.xz>=20
> \
> +	file://0001-remove-hardcoded-path.patch=20
> <file://0001-remove-hardcoded-path.patch/> \
> +	file://0001-meson-do-not-rely-on-an-exe-wrapper.patch=20
> <file://0001-meson-do-not-rely-on-an-exe-wrapper.patch/> \
> +"
>  SRC_URI[sha256sum] =3D=20
> "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
>=20
>  S =3D "${WORKDIR}/AppStream-${PV}"
> @@ -36,14 +40,6 @@ PACKAGECONFIG[stemming] =3D=20
> "-Dstemming=3Dtrue,-Dstemming=3Dfalse,libstemmer"
>=20
>  FILES:${PN} +=3D "${datadir}"
>=20
> -EXTRA_OEMESON:append =3D " -Ddocs=3Dfalse"
> -EXTRA_OEMESON:class-target +=3D=20
> "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
> -
> -do_write_config:append:class-target() {
> -    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> -[binaries]
> -appstreamcli =3D '${STAGING_BINDIR_NATIVE}/appstreamcli'
> -EOF
> -}
> +EXTRA_OEMESON +=3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True',=20
> '-Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)}"
>=20
>  BBCLASSEXTEND =3D "native"
> --
> 2.41.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104900):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/104900>
> Mute This Topic: <https://lists.openembedded.org/mt/101395656/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-kOJ6aKgeNIJ0lrWHMAgB
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I had put the wrong URL in the ups=
tream status line</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sa=
t, Sep 16 2023 at 10:53:39 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&=
gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"w=
hite-space: break-spaces;">This issue has been fixed upstream
<a href=3D"https://github.com/ximion/appstream/pull/510/commits/1f301baa5bf=
59d75d566a674bd76221847ca1d21">https://github.com/ximion/appstream/pull/510=
/commits/1f301baa5bf59d75d566a674bd76221847ca1d21</a>

- backport this patch
- fix api documentation build
- build vapi dependent on gobject-introspection-data

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../appstream/0001-fix-crosscompile.patch     | 43 -------------------
 ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 ++++++++++++++++
 .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
 .../appstream/appstream_0.16.3.bb             | 18 +++-----
 4 files changed, 74 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-cr=
osscompile.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-meson-=
do-not-rely-on-an-exe-wrapper.patch
 create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-remove=
-hardcoded-path.patch

diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscomp=
ile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompi=
le.patch
deleted file mode 100644
index fe8dcff91..000000000
--- a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.pat=
ch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
-Date: Mon, 12 Dec 2022 15:42:42 +0100
-Subject: [PATCH] fix crosscompile
-
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
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
-     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainfo.=
xml'],
--    command : [ascli_exe, 'news-to-metainfo', '--limit=3D6', '@INPUT0@', =
'@INPUT1@', '@OUTPUT@']
-+    command : ['appstreamcli', 'news-to-metainfo', '--limit=3D6', '@INPUT=
0@', '@INPUT1@', '@OUTPUT@']
- )
-=20
- metainfo_i18n =3D i18n.itstool_join(
-diff --git a/meson.build b/meson.build
-index fd0e3373..2f273ada 100644
---- a/meson.build
-+++ b/meson.build
-@@ -124,7 +124,7 @@ if get_option ('gir')
-     dependency('gobject-introspection-1.0', version: '&gt;=3D1.56')
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
diff --git a/meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-=
rely-on-an-exe-wrapper.patch b/meta-oe/recipes-support/appstream/appstream/=
0001-meson-do-not-rely-on-an-exe-wrapper.patch
new file mode 100644
index 000000000..6214b6f4d
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-meson-do-not-rely-on=
-an-exe-wrapper.patch
@@ -0,0 +1,36 @@
+From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D &lt;<a href=3D"mailto=
:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;
+Date: Wed, 26 Jul 2023 23:21:10 +0400
+Subject: [PATCH 01/60] meson: do not rely on an exe wrapper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Marc-Andr=E9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;
+
+Upstream-Status: Backport [<a href=3D"https://github.com/ximion/appstream/=
commit/79bf322768990b28c29a9d907edcca52ff48e0b8">https://github.com/ximion/=
appstream/commit/79bf322768990b28c29a9d907edcca52ff48e0b8</a>]
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
+               install_dir: join_paths(get_option('datadir'), 'gettext', '=
its'))
+=20
++# Do not rely on an exe wrapper for rel-info, use the system one in that =
case
++if meson.is_cross_build()
++    dependency('appstream', version: '&gt;=3D' + as_version, native: true=
,
++               not_found_message: 'Native appstream required for cross-bu=
ilding')
++    ascli_exe =3D find_program('appstreamcli')
++endif
++
+ # NOTE: We do not translate the release notes on purpose here.
+ # If you do want to give translators a chance to translate them,
+ # ascli news-to-metainfo needs to produce a temporary file to translate
+--=20
+2.41.0
+
diff --git a/meta-oe/recipes-support/appstream/appstream/0001-remove-hardco=
ded-path.patch b/meta-oe/recipes-support/appstream/appstream/0001-remove-ha=
rdcoded-path.patch
new file mode 100644
index 000000000..9cbfaca82
--- /dev/null
+++ b/meta-oe/recipes-support/appstream/appstream/0001-remove-hardcoded-pat=
h.patch
@@ -0,0 +1,31 @@
+From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.=
de</a>&gt;
+Date: Mon, 12 Dec 2022 15:42:42 +0100
+Subject: [PATCH] remove hardcoded path
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
+
+Dont include hardcoded path. This fixes:
+| cc1: error: include location "/usr/include" is unsafe for cross-compilat=
ion [-Werror=3Dpoison-system-directories]
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
+     dependency('gobject-introspection-1.0', version: '&gt;=3D1.56')
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
diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb b/meta-o=
e/recipes-support/appstream/appstream_0.16.3.bb
index 222cd80be..1d466ad18 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
@@ -22,9 +22,13 @@ DEPENDS =3D " \
 inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
=20
 GIR_MESON_OPTION =3D "gir"
+GTKDOC_MESON_OPTION =3D "apidocs"
=20
-SRC_URI =3D "<a href=3D"https://www.freedesktop.org/software/appstream/rel=
eases/AppStream-${PV}.tar.xz">https://www.freedesktop.org/software/appstrea=
m/releases/AppStream-${PV}.tar.xz</a>"
-SRC_URI:append:class-target =3D " <a href=3D"file://0001-fix-crosscompile.=
patch" "=3D"">file://0001-fix-crosscompile.patch"</a>
+SRC_URI =3D " \
+	<a href=3D"https://www.freedesktop.org/software/appstream/releases/AppStr=
eam-${PV}.tar.xz">https://www.freedesktop.org/software/appstream/releases/A=
ppStream-${PV}.tar.xz</a> \
+	<a href=3D"file://0001-remove-hardcoded-path.patch">file://0001-remove-ha=
rdcoded-path.patch</a> \
+	<a href=3D"file://0001-meson-do-not-rely-on-an-exe-wrapper.patch">file://=
0001-meson-do-not-rely-on-an-exe-wrapper.patch</a> \
+"
 SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6=
344a2b318b98b1"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
@@ -36,14 +40,6 @@ PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemmin=
g=3Dfalse,libstemmer"
=20
 FILES:${PN} +=3D "${datadir}"
=20
-EXTRA_OEMESON:append =3D " -Ddocs=3Dfalse"
-EXTRA_OEMESON:class-target +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cro=
ss"
-
-do_write_config:append:class-target() {
-    cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
-[binaries]
-appstreamcli =3D '${STAGING_BINDIR_NATIVE}/appstreamcli'
-EOF
-}
+EXTRA_OEMESON +=3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.co=
ntains</a>('GI_DATA_ENABLED', 'True', '-Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)=
}"
=20
 BBCLASSEXTEND =3D "native"
<div>--=20
</div>2.41.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#104900): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104900">https://lists.openembedded.org/g/openembed=
ded-devel/message/104900</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101395656/361=
8223">https://lists.openembedded.org/mt/101395656/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-kOJ6aKgeNIJ0lrWHMAgB--


