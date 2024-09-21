Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DF7CF9C5B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 15:30:35 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.11660.1726932632537749014
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 08:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UJGdVwg/;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e03d17365bso1906349b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726932632; x=1727537432; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhEzj8y14ZZV5faRDNEJnZ9FQKEexgG6qwdtKvMuzmk=;
        b=UJGdVwg/8RpIixetPweh5f4/Itsy0GxLMITshPqJNK+a+Y2TVDc1oS4aAukRXTa4Qn
         MH0+ttZbGWmdBKP8Tc5OawF5xHoIiYbKIqSQTvmoI+s0AxfNoKSnw4yPet3+xQr+18Pk
         nHFvmKPybeLHuV+EZl126lNEocjRwFzEp8PVppoavkGgqUVvtKt1h4IIXZ3HKR7bdXSA
         SaOs7r0SK8Nscl96RE+8GIU1zN65qTW08/dPctjRx2vNmEtCZhsweRCu9BbSAANM9U60
         kTEzTacB4xex7ABW2lhD5668KCu7j1s+xtYbP4dpiBVFKQNgnHCe1WbVnd60hK3v8DSp
         dAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726932632; x=1727537432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhEzj8y14ZZV5faRDNEJnZ9FQKEexgG6qwdtKvMuzmk=;
        b=GubZvs/4xFtr54tUbogkA1vurDiQnCvON/NFIXKORYYQ1v8E8KSCt48JZcFN99Xd3Y
         bWIYM6nWeVQPlclLgCtbT+oOy5m7u9pNfFhvbfS3LFrmDKqKuMHlluzQ7DcUS/l0WFAq
         Pkm8EqWevwF8CqOFmpzWDqKFGXpXidY/ZcWwIu2YFiEmBplLU3pFI0DMXEZ7NUvPStq5
         y5w9cK1Y3gp22j/ED5XZXS/s8FgWy6ZSngHB4gagEzBic9ZoF7P66RE5vwiQgdihhLF/
         AIRLp3Us2Is7eAChDvWp6kagicIDY1V1HWYJBllbMts5Ke0oyxEubmIRWQ1uFboEWUtX
         gxOQ==
X-Gm-Message-State: AOJu0YxcvYR1RLUHOKI6FzXq1Ip0UWTzCIkOXX8MYLbEXK9i116bmhp6
	iXs19Lf44sPOQoa6Xg7qLXl0I5jWJsocscmZy/8gWbpCawEyhFKkKHYYsxrHIyYSL8Q91fAwQ0k
	/1N56OAXAgK9dfHn9zt7cmzA5Cdg=
X-Google-Smtp-Source: AGHT+IFivBrlRGH7CuIb8XxjSkhaxWb00tOqy2ul9n3Bs5PADGZv6akxmvTY69Kv1cX6OoMeGE081txbPlmh3cIrMLg=
X-Received: by 2002:a05:6808:2dc9:b0:3e0:4075:25a6 with SMTP id
 5614622812f47-3e27290b31emr4210066b6e.6.1726932631448; Sat, 21 Sep 2024
 08:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240920150822.1131707-1-f_l_k@t-online.de> <20240920150822.1131707-22-f_l_k@t-online.de>
In-Reply-To: <20240920150822.1131707-22-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Sep 2024 11:30:05 -0400
Message-ID: <CAMKF1sr9RmTW=+p+dXWHE5c6X=kTQLf5t=LextvOBwFeY1mc7Q@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 22/23] tracker: update 3.7.1 -> 3.8.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 15:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112429

seeing this on AB, I wonder if its related to this.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4154

stdio: ERROR: Nothing PROVIDES 'tracker' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-photos/gnome-photos_44.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/grilo/grilo-plugins_0.3.16.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'tracker' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-photos/gnome-photos_44.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/grilo/grilo-plugins_0.3.16.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'tracker' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-photos/gnome-photos_44.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/grilo/grilo-plugins_0.3.16.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'tracker' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-photos/gnome-photos_44.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/grilo/grilo-plugins_0.3.16.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'tracker' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-photos/gnome-photos_44.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/grilo/grilo-plugins_0.3.16.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.

Another error happens on gutenprint as well.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4154/step=
s/14/logs/stdio

On Fri, Sep 20, 2024 at 11:08=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> - Dont inherit python3native. It seems to be unneeded
> - Rename to tinysparql
> - Drop dependencies for python3-pygobject-native and libarchive
> - Disable tests by default
> - Add PACKAGECONFIG for avahi
> - Fix sed hack to keep buildpath out of enum-types.c
> - Add patch that avoids to create compatibility links which would lead to=
 package_qa error:
> Exception: Exception: KeyError: 'getpwuid(): uid not found: 1000'
> Path /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/tinysparql/3=
.8.0/sstate-build-package/package/usr/lib/libtracker-sparql-3.0.so is owned=
 by uid 1000, gid 100, which doesn't match any user/group on target. This m=
ay be due to host contamination.
> - Refresh fix-reproducibility.patch and additionally edit tracker-http.c =
to avoid another buildpath leakage
> ---
>  .../0001-fix-reproducibility.patch            | 49 ++++++++++++++-----
>  ...parql-meson.build-dont-create-compat.patch | 32 ++++++++++++
>  .../{tracker_3.7.3.bb =3D> tinysparql_3.8.0.bb} | 28 +++++------
>  3 files changed, 83 insertions(+), 26 deletions(-)
>  rename meta-gnome/recipes-gnome/tracker/{tracker =3D> tinysparql}/0001-f=
ix-reproducibility.patch (67%)
>  create mode 100644 meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-=
libtracker-sparql-meson.build-dont-create-compat.patch
>  rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.3.bb =3D> tinysparq=
l_3.8.0.bb} (68%)
>
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducib=
ility.patch b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproduc=
ibility.patch
> similarity index 67%
> rename from meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibi=
lity.patch
> rename to meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducib=
ility.patch
> index 4527f9efa..23da5bb97 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
> +++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibilit=
y.patch
> @@ -1,4 +1,4 @@
> -From ae34fb111e1f2498f37b21c0c32ace6c9928ad66 Mon Sep 17 00:00:00 2001
> +From 1eec06fc1ef26e4954507001c1c2f981eab8d77d Mon Sep 17 00:00:00 2001
>  From: Markus Volk <f_l_k@t-online.de>
>  Date: Mon, 18 Sep 2023 02:47:55 +0200
>  Subject: [PATCH] tracker: fix reproducibility issue
> @@ -12,16 +12,18 @@ Upstream-Status: Inappropriate [oe-specific]
>
>  Signed-off-by: Markus Volk <f_l_k@t-online.de>
>  ---
> - meson.build                       | 6 +++---
> - src/libtracker-common/meson.build | 4 ++--
> - src/libtracker-sparql/meson.build | 4 ++--
> - 3 files changed, 7 insertions(+), 7 deletions(-)
> + meson.build                        | 6 +++---
> + src/libtracker-common/meson.build  | 4 ++--
> + src/libtracker-http/meson.build    | 8 ++++----
> + src/libtracker-http/tracker-http.c | 4 ++--
> + src/libtracker-sparql/meson.build  | 4 ++--
> + 5 files changed, 13 insertions(+), 13 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index bc9f93a..6c86e5a 100644
> +index 41c00fafc..6e7282cb7 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -357,7 +357,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
> +@@ -333,7 +333,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
>   conf.set('HAVE_RTLD_NOLOAD', have_rtld_noload)
>
>   # Config that goes in some other generated files (.desktop, .service, e=
tc)
> @@ -30,7 +32,7 @@ index bc9f93a..6c86e5a 100644
>   conf.set('libexecdir', join_paths(get_option('prefix'), get_option('lib=
execdir')))
>
>   configure_file(input: 'config.h.meson.in',
> -@@ -396,8 +396,8 @@ subdir('docs')
> +@@ -372,8 +372,8 @@ subdir('docs')
>   subdir('utils')
>
>   test_c_args =3D tracker_c_args + [
> @@ -42,7 +44,7 @@ index bc9f93a..6c86e5a 100644
>
>   tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
>  diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/m=
eson.build
> -index 9355d1c..cdbc05f 100644
> +index 72c2ae073..12218c870 100644
>  --- a/src/libtracker-common/meson.build
>  +++ b/src/libtracker-common/meson.build
>  @@ -51,10 +51,10 @@ libtracker_common =3D static_library('tracker-common=
',
> @@ -58,11 +60,31 @@ index 9355d1c..cdbc05f 100644
>     ] + tracker_c_args,
>     include_directories: [configinc, srcinc],
>     gnu_symbol_visibility: 'hidden',
> +diff --git a/src/libtracker-http/tracker-http.c b/src/libtracker-http/tr=
acker-http.c
> +index dd82e9928..3cc68b240 100644
> +--- a/src/libtracker-http/tracker-http.c
> ++++ b/src/libtracker-http/tracker-http.c
> +@@ -53,13 +53,13 @@ ensure_types (void)
> +
> +               current_dir =3D g_get_current_dir ();
> +
> +-              if (g_strcmp0 (current_dir, BUILDROOT) =3D=3D 0) {
> ++              if (0) {
> +                       /* Detect in-build runtime of this code, this may=
 happen
> +                        * building introspection information or running =
tests.
> +                        * We want the in-tree modules to be loaded then.
> +                        */
> +                       module_path =3D g_strdup_printf (BUILD_LIBDIR "/%=
s", modules[i]);
> +-              } else {
> ++              } else {
> +                       module_path =3D g_strdup_printf (PRIVATE_LIBDIR "=
/%s", modules[i]);
> +               }
> +
>  diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
> -index 4143eac..b73f1c9 100644
> +index 5eccb92fc..161f6ea21 100644
>  --- a/src/libtracker-sparql/meson.build
>  +++ b/src/libtracker-sparql/meson.build
> -@@ -98,10 +98,10 @@ libtracker_sparql_private =3D static_library('tracke=
r-sparql-private',
> +@@ -102,10 +102,10 @@ libtracker_sparql_private =3D static_library('trac=
ker-sparql-private',
>       c_args: [
>         '-include', 'libtracker-sparql/tracker-private.h',
>           '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
> @@ -74,4 +96,7 @@ index 4143eac..b73f1c9 100644
>  +        '-DBUILDROOT=3D"@0@"'.format('/usr/src/debug/tracker'),
>       ] + tracker_c_args,
>
> -     dependencies: [libtracker_sparql_dependencies, gvdb_dep],
> +     dependencies: [libtracker_sparql_dependencies],
> +--
> +2.46.0
> +
> diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtrac=
ker-sparql-meson.build-dont-create-compat.patch b/meta-gnome/recipes-gnome/=
tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-compa=
t.patch
> new file mode 100644
> index 000000000..d6cc4f45d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-spa=
rql-meson.build-dont-create-compat.patch
> @@ -0,0 +1,32 @@
> +From 0dfdbeef174c18e846b98af816a9675c12a42845 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Fri, 20 Sep 2024 16:43:44 +0200
> +Subject: [PATCH] src/libtracker-sparql/meson.build: dont create compatib=
ility
> + symlinks
> +
> +Using the sh script will cause package_qa error:
> +Exception: Exception: KeyError: 'getpwuid(): uid not found: 1000'
> +Path /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/tinysparql/=
3.8.0/sstate-build-package/package/usr/lib/libtracker-sparql-3.0.so is owne=
d by uid 1000, gid 100, which doesn't match any user/group on target. This =
may be due to host contamination.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + src/libtracker-sparql/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
> +index 5eccb92fc..6ed7c2b1f 100644
> +--- a/src/libtracker-sparql/meson.build
> ++++ b/src/libtracker-sparql/meson.build
> +@@ -247,6 +247,6 @@ endif
> +
> + tracker_sparql_uninstalled_dir =3D meson.current_build_dir()
> +
> +-meson.add_install_script('symlink-libtracker-sparql.sh', get_option('li=
bdir'), meson.current_build_dir())
> ++#meson.add_install_script('symlink-libtracker-sparql.sh', get_option('l=
ibdir'), meson.current_build_dir())
> +
> + meson.override_dependency('tinysparql-3.0', tracker_sparql_dep)
> +--
> +2.46.0
> +
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb b/meta-gno=
me/recipes-gnome/tracker/tinysparql_3.8.0.bb
> similarity index 68%
> rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
> rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb
> index 885f3515d..628384464 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb
> @@ -7,22 +7,20 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS =3D " \
>      dbus-native \
> -    python3-pygobject-native \
>      glib-2.0 \
>      sqlite3 \
> -    libarchive \
>      dbus \
>      icu \
>      json-glib \
> -    libsoup-3.0 \
> +    libsoup \
>      libstemmer \
>  "
>
> -
> -inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion python3native
> +inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion
>
>  SRC_URI +=3D "file://0001-fix-reproducibility.patch"
> -SRC_URI[archive.sha256sum] =3D "ab3d4a50937e04c5ed7846f6dbb999e290981940=
2f389ca592ee6b77dd28d1f9"
> +SRC_URI +=3D "file://0001-src-libtracker-sparql-meson.build-dont-create-=
compat.patch"
> +SRC_URI[archive.sha256sum] =3D "c0fcda77520f531548b2395137dcd193ee9cde5e=
222d3c9d273f030d1762a504"
>
>  # text search is not an option anymore and requires sqlite3 build with
>  # PACKAGECONFIG[fts5] set (default)
> @@ -39,21 +37,23 @@ EXTRA_OEMESON =3D " \
>      -Dman=3Dfalse \
>      -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
>      -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
> -    -Dsoup=3Dsoup3 \
> +    -Dtests=3Dfalse \
>      ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Denabled', =
'-Dvapi=3Ddisabled', d)} \
>  "
>
> -do_install:prepend() {
> -    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/src/li=
btracker-sparql/tracker-sparql-enum-types.c
> -    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/src/li=
btracker-sparql/core/tracker-data-enum-types.c
> -}
> -
>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>
> +PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "zeroconf",=
 "avahi", "", d)}"
> +PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi,"
> +
> +do_install:prepend() {
> +    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql=
/tracker-sparql-enum-types.c
> +    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql=
/core/tracker-data-enum-types.c
> +}
> +
>  FILES:${PN} +=3D " \
>      ${datadir}/dbus-1 \
> -    ${datadir}/tracker3 \
> -    ${libdir}/tracker-3.0 \
> +    ${libdir}/tinysparql-3.0 \
>      ${systemd_user_unitdir} \
>  "
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112425): https://lists.openembedded.org/g/openembedde=
d-devel/message/112425
> Mute This Topic: https://lists.openembedded.org/mt/108560580/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

