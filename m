Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7F1EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:45:32 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.16763.1690487128234175022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CSbEUiF3;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bc481fe23eso1132167a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690487127; x=1691091927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mLheY94ck5wygcvmXCiciDXkTt5BpF9IyVQabDJpzE=;
        b=CSbEUiF3sAsokvVDtrslAnzOma09fK+75ukmWvEoBDeTD3gi1KuH/y6Ge7TGplt2JZ
         Qx8SIAc/dLP98ZpKcVVOG/5jCZ7m56gMtJnJc/si2yC5GwEUT13pasom4lgF5KO6LIZS
         n6060+E/Wo5vx3CRYRTB808OODssZjPCz2QW5Vku1kV/GE5UfZIX+p0BMFWynNrVg5q7
         gg5sxw++BX0RoG0ey0swqYj+0A2qBEuSy/UEdY880WSZ5aYLknzr6mIdwAiq04xmfAjo
         2H9elEPZ1xow4biwRWwW7KbUO9uKjvqd6mdl+GMMs4YleUNZ4pb3Q6tuaVBIl1utjsMm
         bMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487127; x=1691091927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mLheY94ck5wygcvmXCiciDXkTt5BpF9IyVQabDJpzE=;
        b=LSUfB86XVNAMLDnXr6jeubuiHRrHpw/kW3wSLJMVjPyMNImx9QhnKqEbvRnzen/ovO
         AB4Hy43/tN2WBP+rK1WTFyvaR8oWyGU/RXgnJZ68W4xalu+FfAuxJ9oETBB468/2LhOG
         5hnPQNrgBdIn3VD58FlyFVoxGx4F2U83IridU4K+PtIpKlNln640sCLQ53qFLt542kOV
         zaoUSFFgV3OmhvkblQ5ElNobeayNTUCzXEypx9/NvSUtF0bT0MWwqgvsYbHKLW1TENYR
         qIUuC/AQNcrH5gR8qiiXhUVPH07l4lb4ZcaPFaCXVk+u7nPiT3toYQXhk7efiNXXOg+S
         Niug==
X-Gm-Message-State: ABy/qLYmG0ZJH3X6gTNtU1VvrBTVAygKIwy0tutUhWohspgWfoqO/2er
	XYJHOeF9MttcccDXl+QYXelStftApwPCFlcatTg=
X-Google-Smtp-Source: APBJJlG2VktjtKopVqlud1FK8o3OJW0zKO26C9H/0NHZNvQfd+/xs7qVyfDD5a9AL7xxV5e4IN0J/M0YGHlGy79oChk=
X-Received: by 2002:a05:6870:8190:b0:1bb:4325:7698 with SMTP id
 k16-20020a056870819000b001bb43257698mr549240oae.6.1690487126899; Thu, 27 Jul
 2023 12:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230727113837.4774-1-f_l_k@t-online.de>
In-Reply-To: <20230727113837.4774-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jul 2023 12:45:00 -0700
Message-ID: <CAMKF1sq9SOteJkms6b+7LMozVKD=f57h0ifXkuBoYY3ZXJX0-Q@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-gnome][PATCHv3] webkitgtk3: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 19:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104059

I think there are some recipes in meta-oe which need it too see -
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2945/step=
s/14/logs/errors
so perhaps move those recipes to meta-gnome as well or put webkitgtk3
in meta-oe.

On Thu, Jul 27, 2023 at 4:38=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - Change the meta-gnome recipes to use the gtk3 variant of webkitgtk
> - Import gcr3 recipe from oe-core
>
> Most Gnome recipes require webkitgtk built with gtk+3. oe-core is in the
> process of updating webkitgtk to be built with gtk4. It will be necessary
> to add a recipe that provides the gtk+3 variant, or we wont be able
> to use e.g. geary with gmail addresses or provide google integration for
> gnome-calendar or nautilus/files.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-connectivity/geary/geary_43.0.bb  |   2 +-
>  .../evolution-data-server.bb                  |   2 +-
>  ...ectly-handle-disabled-ssh_agent-opti.patch |  36 ++
>  meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb   |  59 ++++
>  .../gnome-online-accounts_3.48.0.bb           |   2 +-
>  meta-gnome/recipes-gnome/yelp/yelp_42.2.bb    |   2 +-
>  .../recipes-gnome/zenity/zenity_3.44.0.bb     |   2 +-
>  ...spection.cmake-prefix-variables-obta.patch |  29 ++
>  ...tCore-CMakeLists.txt-ensure-reproduc.patch |  28 ++
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 310 ++++++++++++++++++
>  ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |  41 +++
>  .../check-GST_GL_HAVE_PLATFORM_GLX.patch      |  33 ++
>  .../webkitgtk3/reproducibility.patch          |  22 ++
>  .../webkitgtk/webkitgtk3_2.40.2.bb            | 169 ++++++++++
>  .../wxwidgets/wxwidgets_3.2.1.bb              |   2 +-
>  meta-oe/recipes-graphics/surf/surf_2.1.bb     |   2 +-
>  16 files changed, 734 insertions(+), 7 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-co=
rrectly-handle-disabled-ssh_agent-opti.patch
>  create mode 100644 meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-=
FindGObjectIntrospection.cmake-prefix-variables-obta.patch
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-=
Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d334=
4e17d258106617b0e6d783d073b188a2548.patch
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/49772=
90ab4ab35258a6da9b13795c9b0f7894bf4.patch
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/check=
-GST_GL_HAVE_PLATFORM_GLX.patch
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/repro=
ducibility.patch
>  create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.=
2.bb
>
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_43.0.bb
> index 6085d94fdc..bab4f909e0 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> @@ -26,7 +26,7 @@ DEPENDS =3D " \
>      libstemmer \
>      libxml2 \
>      sqlite3 \
> -    webkitgtk \
> +    webkitgtk3 \
>  "
>
>  RDEPENDS:${PN} =3D "gnome-keyring"
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data=
-server.bb
> index 43717a84cd..edbe30ff87 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> @@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=
=3D${STAGING_BINDIR}/g-ir-scan
>  PACKAGECONFIG ?=3D "oauth"
>
>  PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
> -PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEBKI=
TGTK=3DOFF,webkitgtk json-glib"
> +PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEBKI=
TGTK=3DOFF,webkitgtk3 json-glib"
>  PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
>  PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
>  # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
> diff --git a/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly=
-handle-disabled-ssh_agent-opti.patch b/meta-gnome/recipes-gnome/gcr/gcr3/0=
001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> new file mode 100644
> index 0000000000..d3c26d97ae
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle=
-disabled-ssh_agent-opti.patch
> @@ -0,0 +1,36 @@
> +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 16 Nov 2022 11:27:24 +0100
> +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent op=
tion
> +
> +Existing code produces these errors:
> +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found ext=
ernal program
> +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> +
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
> +Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/=
9b67bb18d8409e0e693cc6000507acbd73a30eab ]
> +---
> + meson.build | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3f35173..11d7fa7 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++if get_option('ssh_agent')
> ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++endif
> + conf.set10('WITH_SYSTEMD', with_systemd)
> + config_file =3D configure_file(
> +   output: 'config.h',
> +--
> +2.34.1
> +
> diff --git a/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-gnome/rec=
ipes-gnome/gcr/gcr3_3.41.1.bb
> new file mode 100644
> index 0000000000..ba5660a5ed
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gcr/gcr3_3.41.1.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "A library for bits of crypto UI and parsing etc"
> +DESCRIPTION =3D "GCR is a library for displaying certificates, and crypt=
o UI, \
> +accessing key stores. It also provides the viewer for crypto files on th=
e \
> +GNOME desktop."
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
> +BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +
> +DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
> +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-nati=
ve', '', d)}"
> +
> +CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
> +
> +CFLAGS +=3D "-D_GNU_SOURCE"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> +inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
> +UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
> +
> +SRC_URI =3D "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.x=
z;name=3Darchive"
> +SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agen=
t-opti.patch"
> +SRC_URI[archive.sha256sum] =3D "bb7128a3c2febbfee9c03b90d77d498d0ceb237b=
0789802d60185c71c4bea24f"
> +
> +S =3D "${WORKDIR}/gcr-${PV}"
> +
> +PACKAGECONFIG ??=3D " \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)}=
 \
> +"
> +PACKAGECONFIG[gtk] =3D "-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3"
> +PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-3 \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> +"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20229/
> +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> +ARM_INSTRUCTION_SET:armv6 =3D "arm"
> +
> +EXTRA_OEMESON +=3D "--cross-file ${WORKDIR}/meson-${PN}.cross"
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +gpg2 =3D '${bindir}/gpg2'
> +ssh-add =3D '${bindir}/ssh-add'
> +ssh-agent =3D '${bindir}/ssh-agent'
> +EOF
> +}
> diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-o=
nline-accounts_3.48.0.bb
> index ca78fa0119..cd14b48508 100644
> --- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
> @@ -14,7 +14,7 @@ SRC_URI[archive.sha256sum] =3D "418bb9fcffdbd72a98205ad=
365137617fc1e3551a54de74f6a
>  PACKAGECONFIG ?=3D "goabackend kerberos owncloud lastfm google windows_l=
ive"
>
>  # goabackend requires webkitgtk to be built with gtk+3 and gcr3
> -PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk"
> +PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk3"
>  PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr3"
>  PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
>  PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_42.2.bb
> index 200ed0f709..51d51ee0ab 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> @@ -19,7 +19,7 @@ DEPENDS +=3D " \
>      libxslt \
>      sqlite3 \
>      libhandy \
> -    webkitgtk \
> +    webkitgtk3 \
>      yelp-xsl \
>  "
>  PACKAGECONFIG_SOUP ?=3D "soup3"
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb b/meta-gnom=
e/recipes-gnome/zenity/zenity_3.44.0.bb
> index 8ea24ca49b..3548cc5bbe 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb
> @@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] =3D "c15582301ed90b9d42ce521=
dbccf99a989f22f12041bdd5279
>  SRC_URI +=3D "file://0001-Harcode-shebang-to-avoid-pointing-to-build-sys=
tem-s-.patch"
>
>  PACKAGECONFIG ?=3D "webkitgtk"
> -PACKAGECONFIG[webkitgtk] =3D "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Dfalse,web=
kitgtk"
> +PACKAGECONFIG[webkitgtk] =3D "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=3Dfalse,web=
kitgtk3"
>
>  PACKAGES =3D+ "${PN}-gdialog"
>  FILES:${PN}-gdialog =3D "${bindir}/gdialog"
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGOb=
jectIntrospection.cmake-prefix-variables-obta.patch b/meta-gnome/recipes-su=
pport/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-varia=
bles-obta.patch
> new file mode 100644
> index 0000000000..8ae39f14e1
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectInt=
rospection.cmake-prefix-variables-obta.patch
> @@ -0,0 +1,29 @@
> +From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 27 Oct 2015 16:02:19 +0200
> +Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtain=
ed
> + from pkg-config with PKG_CONFIG_SYSROOT_DIR
> +
> +See discussion at https://bugs.webkit.org/show_bug.cgi?id=3D232933 for
> +reasons why this is not approproiate for upstream submission.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Source/cmake/FindGI.cmake | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
> +index af039cbb..b3e810cd 100644
> +--- a/Source/cmake/FindGI.cmake
> ++++ b/Source/cmake/FindGI.cmake
> +@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
> +     endif ()
> + endif ()
> +
> ++set(_GI_SCANNER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_EXE}")
> ++set(_GI_COMPILER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILER_EXE}")
> ++
> + find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)
> + find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} g-ir-compiler)
> +
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-=
JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch b/meta-gnome/recipes-su=
pport/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure=
-reproduc.patch
> new file mode 100644
> index 0000000000..bbe265059d
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScr=
iptCore-CMakeLists.txt-ensure-reproduc.patch
> @@ -0,0 +1,28 @@
> +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Mon, 26 Jun 2023 14:30:02 +0200
> +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducib=
ility
> + of __TIMESTAMP__
> +
> +__TIMESTAMP__ refers to mtime of the file that contains it, which is uns=
table
> +and breaks binary reproducibility when the file is generated at build ti=
me. To ensure
> +this does not happen, mtime should be set from the original file.
> +
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/15293]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/JavaScriptCore/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCor=
e/CMakeLists.txt
> +index 43dc22ff..c2e3b1cd 100644
> +--- a/Source/JavaScriptCore/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/CMakeLists.txt
> +@@ -159,6 +159,7 @@ add_custom_command(
> +     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersio=
n.cpp
> +     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersi=
on.cpp.in
> +     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ =
${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > ${JavaScript=
Core_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
> ++    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVers=
ion.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cp=
p
> +             VERBATIM
> + )
> +
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d25=
8106617b0e6d783d073b188a2548.patch b/meta-gnome/recipes-support/webkitgtk/w=
ebkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> new file mode 100644
> index 0000000000..34e0ff9af3
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617=
b0e6d783d073b188a2548.patch
> @@ -0,0 +1,310 @@
> +From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Thu, 2 Jun 2022 11:19:06 +0300
> +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seem=
s
> + unused https://bugs.webkit.org/show_bug.cgi?id=3D241182
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Move the NEON fast path for the SVG lighting filter effects into
> +FELightingSoftwareApplier, and arrange to actually use them by
> +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> +
> +Some changes were needed to adapt platformApplyNeon() to the current
> +state of filters after r286140. This was not detected because the code
> +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
> +not get used much these days: CPU(ARM_THUMB2) is more common. It should
> +be possible to use the NEON fast paths also in Thumb mode, but that is
> +left for a follow-up fix.
> +
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> +(WebCore::FELighting::getPowerCoefficients): Deleted.
> +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> +(WebCore::FELighting::platformApplyNeon): Deleted.
> +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> +* Source/WebCore/platform/graphics/filters/FELighting.h:
> +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareAp=
plier.h:
> +
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> + .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
> + .../graphics/filters/DistantLightSource.h     |  4 ++
> + .../platform/graphics/filters/FELighting.h    |  7 ---
> + .../graphics/filters/PointLightSource.h       |  4 ++
> + .../graphics/filters/SpotLightSource.h        |  4 ++
> + .../software/FELightingSoftwareApplier.h      | 16 ++++++
> + 7 files changed, 56 insertions(+), 35 deletions(-)
> +
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
cpp
> +index f6ff8c20..42a97ffc 100644
> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
> +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> +     return s_FELightingConstantsForNeon;
> + }
> +
> +-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon*=
 parameters)
> ++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaint=
ingDataForNeon* parameters)
> + {
> +     neonDrawLighting(parameters);
> + }
> +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> +     "b .lightStrengthCalculated" NL
> + ); // NOLINT
> +
> +-int FELighting::getPowerCoefficients(float exponent)
> ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> + {
> +     // Calling a powf function from the assembly code would require to =
save
> +     // and reload a lot of NEON registers. Since the base is in range [=
0..1]
> +diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +index b17c603d..e4629cda 100644
> +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> +@@ -24,14 +24,15 @@
> +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +  */
> +
> +-#ifndef FELightingNEON_h
> +-#define FELightingNEON_h
> ++#pragma once
> +
> + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> +
> +-#include "FELighting.h"
> ++#include "FELightingSoftwareApplier.h"
> ++#include "ImageBuffer.h"
> + #include "PointLightSource.h"
> + #include "SpotLightSource.h"
> ++#include <wtf/ObjectIdentifier.h>
> + #include <wtf/ParallelJobs.h>
> +
> + namespace WebCore {
> +@@ -93,14 +94,14 @@ extern "C" {
> + void neonDrawLighting(FELightingPaintingDataForNeon*);
> + }
> +
> +-inline void FELighting::platformApplyNeon(const LightingData& data, con=
st LightSource::PaintingData& paintingData)
> ++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELighti=
ngSoftwareApplier::LightingData& data, const LightSource::PaintingData& pai=
ntingData)
> + {
> +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> +-    FELightingPaintingDataForNeon neonData =3D {
> ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments=
;
> ++    WebCore::FELightingPaintingDataForNeon neonData =3D {
> +         data.pixels->data(),
> +         1,
> +-        data.widthDecreasedByOne - 1,
> +-        data.heightDecreasedByOne - 1,
> ++        data.width - 2,
> ++        data.height - 2,
> +         0,
> +         0,
> +         0,
> +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
> +     // Set light source arguments.
> +     floatArguments.constOne =3D 1;
> +
> +-    auto color =3D m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().r=
esolved();
> ++    auto color =3D data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>(=
).resolved();
> +
> +     floatArguments.colorRed =3D color.red;
> +     floatArguments.colorGreen =3D color.green;
> +     floatArguments.colorBlue =3D color.blue;
> +     floatArguments.padding4 =3D 0;
> +
> +-    if (m_lightSource->type() =3D=3D LS_POINT) {
> ++    if (data.lightSource->type() =3D=3D LS_POINT) {
> +         neonData.flags |=3D FLAG_POINT_LIGHT;
> +-        PointLightSource& pointLightSource =3D static_cast<PointLightSo=
urce&>(m_lightSource.get());
> ++        const auto& pointLightSource =3D *static_cast<const PointLightS=
ource*>(data.lightSource);
> +         floatArguments.lightX =3D pointLightSource.position().x();
> +         floatArguments.lightY =3D pointLightSource.position().y();
> +         floatArguments.lightZ =3D pointLightSource.position().z();
> +         floatArguments.padding2 =3D 0;
> +-    } else if (m_lightSource->type() =3D=3D LS_SPOT) {
> ++    } else if (data.lightSource->type() =3D=3D LS_SPOT) {
> +         neonData.flags |=3D FLAG_SPOT_LIGHT;
> +-        SpotLightSource& spotLightSource =3D static_cast<SpotLightSourc=
e&>(m_lightSource.get());
> ++        const auto& spotLightSource =3D *static_cast<const SpotLightSou=
rce*>(data.lightSource);
> +         floatArguments.lightX =3D spotLightSource.position().x();
> +         floatArguments.lightY =3D spotLightSource.position().y();
> +         floatArguments.lightZ =3D spotLightSource.position().z();
> +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
> +         if (spotLightSource.specularExponent() =3D=3D 1)
> +             neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
> +     } else {
> +-        ASSERT(m_lightSource->type() =3D=3D LS_DISTANT);
> ++        ASSERT(data.lightSource->type() =3D=3D LS_DISTANT);
> +         floatArguments.lightX =3D paintingData.initialLightingData.ligh=
tVector.x();
> +         floatArguments.lightY =3D paintingData.initialLightingData.ligh=
tVector.y();
> +         floatArguments.lightZ =3D paintingData.initialLightingData.ligh=
tVector.z();
> +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
> +     // Set lighting arguments.
> +     floatArguments.surfaceScale =3D data.surfaceScale;
> +     floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScal=
e / 4;
> +-    if (m_lightingType =3D=3D FELighting::DiffuseLighting)
> +-        floatArguments.diffuseConstant =3D m_diffuseConstant;
> ++    if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting)
> ++        floatArguments.diffuseConstant =3D data.diffuseConstant;
> +     else {
> +         neonData.flags |=3D FLAG_SPECULAR_LIGHT;
> +-        floatArguments.diffuseConstant =3D m_specularConstant;
> +-        neonData.specularExponent =3D getPowerCoefficients(m_specularEx=
ponent);
> +-        if (m_specularExponent =3D=3D 1)
> ++        floatArguments.diffuseConstant =3D data.specularConstant;
> ++        neonData.specularExponent =3D getPowerCoefficients(data.specula=
rExponent);
> ++        if (data.specularExponent =3D=3D 1)
> +             neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1;
> +     }
> +     if (floatArguments.diffuseConstant =3D=3D 1)
> +         neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1;
> +
> +-    int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) * (data=
.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> ++    static constexpr int minimalRectDimension =3D 100 * 100; // Empiric=
al data limit for parallel jobs
> ++    int optimalThreadNumber =3D ((data.width - 2) * (data.height - 2)) =
/ minimalRectDimension;
> +     if (optimalThreadNumber > 1) {
> +         // Initialize parallel jobs
> +-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCo=
re::FELighting::platformApplyNeonWorker, optimalThreadNumber);
> ++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELig=
htingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
> +
> +         // Fill the parameter array
> +         int job =3D parallelJobs.numberOfJobs();
> +         if (job > 1) {
> +             int yStart =3D 1;
> +-            int yStep =3D (data.heightDecreasedByOne - 1) / job;
> ++            int yStep =3D (data.height - 2) / job;
> +             for (--job; job >=3D 0; --job) {
> +                 FELightingPaintingDataForNeon& params =3D parallelJobs.=
parameter(job);
> +                 params =3D neonData;
> +                 params.yStart =3D yStart;
> +-                params.pixels +=3D (yStart - 1) * (data.widthDecreasedB=
yOne + 1) * 4;
> ++                params.pixels +=3D (yStart - 1) * data.width * 4;
> +                 if (job > 0) {
> +                     params.absoluteHeight =3D yStep;
> +                     yStart +=3D yStep;
> +                 } else
> +-                    params.absoluteHeight =3D data.heightDecreasedByOne=
 - yStart;
> ++                    params.absoluteHeight =3D (data.height - 1) - yStar=
t;
> +             }
> +             parallelJobs.execute();
> +             return;
> +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
> + } // namespace WebCore
> +
> + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> +-
> +-#endif // FELightingNEON_h
> +diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource=
.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +index 70c6512f..b032c82e 100644
> +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> +@@ -26,6 +26,10 @@
> + #include <wtf/ArgumentCoder.h>
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class DistantLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Sou=
rce/WebCore/platform/graphics/filters/FELighting.h
> +index 53beb596..e78a9354 100644
> +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
> ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> +@@ -35,8 +35,6 @@
> +
> + namespace WebCore {
> +
> +-struct FELightingPaintingDataForNeon;
> +-
> + class FELighting : public FilterEffect {
> + public:
> +     const Color& lightingColor() const { return m_lightingColor; }
> +@@ -64,11 +62,6 @@ protected:
> +
> +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override;
> +
> +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> +-    static int getPowerCoefficients(float exponent);
> +-    inline void platformApplyNeon(const LightingData&, const LightSourc=
e::PaintingData&);
> +-#endif
> +-
> +     Color m_lightingColor;
> +     float m_surfaceScale;
> +     float m_diffuseConstant;
> +diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h=
 b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +index 3a5723f0..675d63f5 100644
> +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class PointLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h =
b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +index 684626f7..dea58389 100644
> +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> +@@ -26,6 +26,10 @@
> + #include "LightSource.h"
> + #include <wtf/Ref.h>
> +
> ++namespace WTF {
> ++class TextStream;
> ++} // namespace WTF
> ++
> + namespace WebCore {
> +
> + class SpotLightSource : public LightSource {
> +diff --git a/Source/WebCore/platform/graphics/filters/software/FELightin=
gSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELi=
ghtingSoftwareApplier.h
> +index c974d921..e2896660 100644
> +--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
> ++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
> +@@ -36,6 +36,7 @@
> + namespace WebCore {
> +
> + class FELighting;
> ++struct FELightingPaintingDataForNeon;
> +
> + class FELightingSoftwareApplier final : public FilterEffectConcreteAppl=
ier<FELighting> {
> +     WTF_MAKE_FAST_ALLOCATED;
> +@@ -132,8 +133,23 @@ private:
> +
> +     static void applyPlatformGenericPaint(const LightingData&, const Li=
ghtSource::PaintingData&, int startY, int endY);
> +     static void applyPlatformGenericWorker(ApplyParameters*);
> ++
> ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> ++    static int getPowerCoefficients(float exponent);
> ++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*)=
;
> ++    inline static void applyPlatformNeon(const LightingData&, const Lig=
htSource::PaintingData&);
> ++
> ++    inline static void applyPlatformGeneric(const LightingData& data, c=
onst LightSource::PaintingData& paintingData)
> ++    {
> ++        applyPlatformNeon(data, paintingData);
> ++    }
> ++#else
> +     static void applyPlatformGeneric(const LightingData&, const LightSo=
urce::PaintingData&);
> ++#endif
> ++
> +     static void applyPlatform(const LightingData&);
> + };
> +
> + } // namespace WebCore
> ++
> ++#include "FELightingNEON.h"
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab=
35258a6da9b13795c9b0f7894bf4.patch b/meta-gnome/recipes-support/webkitgtk/w=
ebkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
> new file mode 100644
> index 0000000000..79da855ff4
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6=
da9b13795c9b0f7894bf4.patch
> @@ -0,0 +1,41 @@
> +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
> +From: Diego Pino Garcia <dpino@igalia.com>
> +Date: Mon, 22 May 2023 19:58:50 -0700
> +Subject: [PATCH] [GLIB] Fix build error after 264196@main
> + https://bugs.webkit.org/show_bug.cgi?id=3D256917
> +
> +Reviewed by Michael Catanzaro.
> +
> +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
> +enabled.
> +
> +* Source/WTF/wtf/glib/Sandbox.cpp:
> +(WTF::isInsideUnsupportedContainer):
> +
> +Canonical link: https://commits.webkit.org/264395@main
> +Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/49772=
90ab4ab35258a6da9b13795c9b0f7894bf4]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandb=
ox.cpp
> +index 7d84e830ab33e..9b07bb8cb5a9b 100644
> +--- a/Source/WTF/wtf/glib/Sandbox.cpp
> ++++ b/Source/WTF/wtf/glib/Sandbox.cpp
> +@@ -36,6 +36,7 @@ bool isInsideFlatpak()
> +     return returnValue;
> + }
> +
> ++#if ENABLE(BUBBLEWRAP_SANDBOX)
> + bool isInsideUnsupportedContainer()
> + {
> +     static bool inContainer =3D g_file_test("/run/.containerenv", G_FIL=
E_TEST_EXISTS);
> +@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
> +
> +     return inContainer && !supportedContainer;
> + }
> ++#endif
> +
> + bool isInsideSnap()
> + {
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL=
_HAVE_PLATFORM_GLX.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/=
check-GST_GL_HAVE_PLATFORM_GLX.patch
> new file mode 100644
> index 0000000000..ae99810ced
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_P=
LATFORM_GLX.patch
> @@ -0,0 +1,33 @@
> +Add additional check on GST_GL_HAVE_PLATFORM_GLX before using gst_gl_dis=
play_x11_new_with_display
> +
> +This ensures that there is a compile time check for glx support in gstre=
amer as
> +runtime check is not enough because gst_gl_display_x11_new_with_display(=
) API comes from
> +gst/gl/x11/gstgldisplay_x11.h which is only included when GST_GL_HAVE_PL=
ATFORM_GLX is defined
> +therefore make this check consistent to fix build with some platforms wh=
ich use pvr gl drivers
> +where this problem appear at compile time.
> +
> +
> +/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/w=
ebkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayG=
Streamer.cpp:68:31: error: use of undeclared identifier 'gst_gl_display_x11=
_new_with_display'; did you mean 'gst_gl_display_egl_new_with_egl_display'?
> +   68 |         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_displa=
y(downcast<PlatformDisplayX11>(sharedDisplay).native()));
> +      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> +      |                               gst_gl_display_egl_new_with_egl_di=
splay
> +
> +This issue is 2.40 specific since GLX support is removed [1] from trunk =
upstream, therefore
> +this patch wont be needed when upgrading to 2.42+
> +
> +[1] https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005=
e0c75eb91abf
> +
> +Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreame=
r.cpp  2023-02-20 01:22:18.917743700 -0800
> ++++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreame=
r.cpp  2023-07-08 08:45:09.739177065 -0700
> +@@ -63,7 +63,7 @@
> +     if (glPlatform =3D=3D GST_GL_PLATFORM_EGL)
> +         return GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(s=
haredDisplay.eglDisplay()));
> + #endif
> +-#if USE(GLX)
> ++#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX
> +     if (is<PlatformDisplayX11>(sharedDisplay) && glPlatform =3D=3D GST_=
GL_PLATFORM_GLX)
> +         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downc=
ast<PlatformDisplayX11>(sharedDisplay).native()));
> + #endif
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibil=
ity.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility=
.patch
> new file mode 100644
> index 0000000000..e866a1a193
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.pat=
ch
> @@ -0,0 +1,22 @@
> +Injection a year based on the current date isn't reproducible. Hack this
> +to a specific year for now for reproducibilty and to avoid autobuilder f=
ailures.
> +
> +The correct fix would be to use SOURCE_DATE_EPOCH from the environment a=
nd
> +then this could be submitted upstream, sadly my ruby isn't up to that.
> +
> +Upstream-Status: Pending [could be reworked]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.=
rb
> ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +@@ -25,7 +25,7 @@ require 'date'
> + require 'digest'
> +
> + $LICENSE =3D <<-EOF
> +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
> ++Copyright (C) 2021 Apple Inc. All rights reserved.
> +
> + Redistribution and use in source and binary forms, with or without
> + modification, are permitted provided that the following conditions
> diff --git a/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb b/=
meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> new file mode 100644
> index 0000000000..9bd0c4e198
> --- /dev/null
> +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.2.bb
> @@ -0,0 +1,169 @@
> +SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE =3D "https://www.webkitgtk.org/"
> +BUGTRACKER =3D "https://bugs.webkit.org/"
> +
> +LICENSE =3D "BSD-2-Clause & LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c=
6d6397a5d84286dda758da57bd691 \
> +                    file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082=
c40bcf298c285f8bab0b12 \
> +                    file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde=
2b64ae177b2494445b79d21 \
> +                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33=
ef338abbaf8b8a7c36b6eec80 \
> +                    "
> +
> +SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
> +           file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
> +           file://reproducibility.patch \
> +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> +           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
> +           file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-repro=
duc.patch \
> +           file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
> +           "
> +SRC_URI[sha256sum] =3D "96898870d994da406ee7a632816dcde9a3bb395ee5f344fc=
b3f3b8cc8a77e000"
> +
> +inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
> +
> +S =3D "${WORKDIR}/webkitgtk-${PV}"
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'w=
ayland', 'opengl', '', d)}"
> +
> +CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
> +
> +DEPENDS +=3D " \
> +          ruby-native \
> +          gperf-native \
> +          unifdef-native \
> +          cairo \
> +          harfbuzz \
> +          jpeg \
> +          atk \
> +          libwebp \
> +          gtk+3 \
> +          libxslt \
> +          libtasn1 \
> +          libnotify \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          glib-2.0-native \
> +          gettext-native \
> +          "
> +
> +PACKAGECONFIG_SOUP ?=3D "soup3"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayl=
and x11', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'w=
ebgl gles2', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl-or-es', '', d)} \
> +                   enchant \
> +                   libsecret \
> +                   ${PACKAGECONFIG_SOUP} \
> +                  "
> +
> +PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAN=
D_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native"
> +PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF=
"
> +PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DO=
FF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATI=
ON=3DOFF,geoclue"
> +PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2"
> +PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtu=
al/libgles2"
> +PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtu=
al/egl"
> +PACKAGECONFIG[opengl] =3D "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GR=
APHICS_CONTEXT_GL=3DOFF,virtual/egl"
> +PACKAGECONFIG[opengl-or-es] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR=
_ES=3DOFF"
> +PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOFF=
,libsecret"
> +PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPHEN=3DOFF=
,libhyphen"
> +PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,woff2"
> +PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OPENJPEG=3DOFF,op=
enjpeg"
> +PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,syste=
md"
> +PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DCMAKE_=
BUILD_TYPE=3DRelease,,"
> +PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
> +PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4=
,,,soup3"
> +PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
> +PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JOURNAL=
D_LOG=3DOFF,systemd"
> +PACKAGECONFIG[avif] =3D "-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,libavif"
> +PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_RECORDER=3DON,-DENABLE=
_MEDIA_RECORDER=3DOFF,gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF=
,libmanette"
> +PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF"
> +PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON -DBWRAP_=
EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-p=
roxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy"
> +
> +EXTRA_OECMAKE =3D " \
> +               -DPORT=3DGTK \
> +               ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE=
_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
> +               ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABL=
E_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
> +               -DENABLE_MINIBROWSER=3DON \
> +               "
> +
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS:append:arc =3D " -mlong-calls"
> +CXXFLAGS:append:arc =3D " -mlong-calls"
> +
> +# Needed for non-mesa graphics stacks when x11 is disabled
> +CXXFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL=
_NO_X11=3D1', d)}"
> +
> +# Javascript JIT is not supported on powerpc
> +EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF "
> +EXTRA_OECMAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF "
> +
> +# ARM JIT code does not build on ARMv4/5/6 anymore
> +EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
> +EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
> +EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
> +
> +EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
> +EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
> +
> +# JIT and gold linker does not work on RISCV
> +EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
> +EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF"
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=
=3DON "
> +
> +# JIT not supported on X32
> +# An attempt was made to upstream JIT support for x32 in
> +# https://bugs.webkit.org/show_bug.cgi?id=3D100450, but this was closed =
as
> +# unresolved due to limited X32 adoption.
> +EXTRA_OECMAKE:append:x86-x32 =3D " -DENABLE_JIT=3DOFF "
> +
> +SECURITY_CFLAGS:remove:aarch64 =3D "-fpie"
> +SECURITY_CFLAGS:append:aarch64 =3D " -fPIE"
> +
> +FILES:${PN} +=3D "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtk=
injectedbundle.so"
> +
> +RRECOMMENDS:${PN} +=3D "ca-certificates shared-mime-info"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20370/
> +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> +ARM_INSTRUCTION_SET:armv6 =3D "arm"
> +
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthum=
b).
> +ARM_INSTRUCTION_SET:armv7a =3D "thumb"
> +ARM_INSTRUCTION_SET:armv7r =3D "thumb"
> +ARM_INSTRUCTION_SET:armv7ve =3D "thumb"
> +
> +# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
> +COMPATIBLE_HOST:x86 =3D "${@bb.utils.contains_any('TUNE_FEATURES', 'core=
2 corei7', '.*', 'null', d)}"
> +
> +# introspection inside qemu-arm hangs forever on musl/arm builds
> +# therefore disable GI_DATA
> +GI_DATA_ENABLED:libc-musl:armv7a =3D "False"
> +GI_DATA_ENABLED:libc-musl:armv7ve =3D "False"
> +
> +do_install:append() {
> +       mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3
> +}
> +
> +PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
> +src_package_preprocess () {
> +        # Trim build paths from comments in generated sources to ensure =
reproducibility
> +        sed -i -e "s,${WORKDIR},,g" \
> +            ${B}/JavaScriptCore/DerivedSources/*.h \
> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> +            ${B}/WebCore/DerivedSources/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
> +}
> +
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> index 39b6a2bc7c..91653e2852 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
> @@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] =3D "-DwxUSE_LIBLZMA=3DON,-DwxUSE_L=
IBLZMA=3DOFF,xz"
>  PACKAGECONFIG[mspack] =3D "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DOF=
F,libmspack"
>  PACKAGECONFIG[opengl] =3D "-DwxUSE_OPENGL=3DON,-DwxUSE_OPENGL=3DOFF,libg=
lu"
>  PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,l=
ibsdl2"
> -PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_W=
EBKIT=3DOFF,webkitgtk,,,no_gui"
> +PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_W=
EBKIT=3DOFF,webkitgtk3,,,no_gui"
>  PACKAGECONFIG[curl] =3D "-DwxUSE_WEBREQUEST_CURL=3DON,-DwxUSE_WEBREQUEST=
_CURL=3DOFF,curl"
>
>  # Support LFS unconditionally
> diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-=
graphics/surf/surf_2.1.bb
> index 7140a72845..4d9d4d3dd0 100644
> --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
> +++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
> @@ -5,7 +5,7 @@ SECTION =3D "x11/graphics"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a6f86d002ae9ae1eb1ccc466289f=
146"
>
> -DEPENDS =3D "webkitgtk gtk+3 glib-2.0 gcr3"
> +DEPENDS =3D "webkitgtk3 gtk+3 glib-2.0 gcr3"
>
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>
> --
> 2.39.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104052): https://lists.openembedded.org/g/openembedde=
d-devel/message/104052
> Mute This Topic: https://lists.openembedded.org/mt/100388556/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

