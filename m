Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335F0CD3424
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 00:15:00 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.7121.1695082493940109431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 17:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsBzNc1s;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5733aa10291so3318972eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 17:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695082493; x=1695687293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmlpGIO2bxa6mWiPZNXr+N7UyQpC0h7gSP01mYxYOIA=;
        b=GsBzNc1s7NeIrqN1IMvjHX4AJaJD8eFc/u2CIMUs8VfNC1fABvRLy783yWhlLLtmhE
         Op9UTDazrQCwL4E7JmjLS9q2tIuwiNYVk+GCeB5/ny1VqHwkVJXIi7p4JF1LBNQCTBm5
         BNxvAmMB6gzxVgwTUmo8WAdakd6fGIWBpK+TyuO7faac0TmX1mnRgkPpMuwbPq5YAhos
         ij0NeXZvrQVdI1WQewAgQcAClnkQ/tno7NUI6v6jdnQMpf8qi2NK4awZ0llnHw/R+Igv
         w51DnBRJ525Cp4l8xbPPxhm2H+9Nu8EvxHI5jEIyI8wj1TRR4qtDWnRz9iOEDXyn6eM4
         gelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695082493; x=1695687293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmlpGIO2bxa6mWiPZNXr+N7UyQpC0h7gSP01mYxYOIA=;
        b=weFb5ZvYRdc3QkRq6mBVl0MQ1w4hdKuUijWos8S6zhAWjiqvXWwrmdJ2ADAdpeVeuM
         fp0xgWW9eIvnL3ae4UIhUiE4pKX4W/J1jfhs2qBI5TzkJroVYEN2ri8gSF9mqFAJQIAp
         mBTJoDaq4xrCWsdHcgYC+zpIUvQMS4eHeI5GhIfkbz0pnl1ZvCQcvZfal1u4VlkJGpLh
         KzB5IH0bhsRG/0iPWkN8Z8zC7bjEW36g3hvFoF9bauf0qXKNzq5CoCGyxDtsaE7/rK/8
         rfOPdrRpZWc1ed8SHhcR4rKmLnvrnGYFVMIcdewg30WL/ZLrjbo675+fH8gmZES+Il2A
         xoMg==
X-Gm-Message-State: AOJu0YxdAHCS01AdFxirgv1Jv22sSLfq/SnM3+QQFMyNSl0FsPviQL4h
	PLFPaKzjnPAy3ndmUQbuQvPd8OOJXV4Pz+dPAfzlpngInqU=
X-Google-Smtp-Source: AGHT+IFAPhyGSQSfHPF5TthI6QY3CTirlQdQ0HmmHvyR7+mQPLiynVaLUeXGawXJDwlgAHu7cmJ4t8OAHp9K+++XURY=
X-Received: by 2002:a05:6871:70c:b0:1b0:17f2:6518 with SMTP id
 f12-20020a056871070c00b001b017f26518mr13021840oap.42.1695082493027; Mon, 18
 Sep 2023 17:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230918011813.12059-1-f_l_k@t-online.de>
In-Reply-To: <20230918011813.12059-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Sep 2023 17:14:26 -0700
Message-ID: <CAMKF1spHW9jAnk4nQSLHYH6pCM=LmXcbNwyn2t0L7BjmPAu0EQ@mail.gmail.com>
Subject: Re: [meta-gnome][PATCHv2] tracker: upgrade 3.5.1 -> 3.6.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 00:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104952

On Sun, Sep 17, 2023 at 6:18=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - fix various reproducibility issues
> - fix gobject-introspection build
> - build vapi dependent on GI_DATA_ENABLED
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../tracker/0001-fix-reproducibility.patch    | 78 +++++++++++++++++++
>  .../{tracker_3.5.1.bb =3D> tracker_3.6.0.bb}    | 19 +++--
>  2 files changed, 90 insertions(+), 7 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/tracker/tracker/0001-fix-rep=
roducibility.patch
>  rename meta-gnome/recipes-gnome/tracker/{tracker_3.5.1.bb =3D> tracker_3=
.6.0.bb} (63%)
>
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducib=
ility.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibi=
lity.patch
> new file mode 100644
> index 000000000..30a58923c
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
> @@ -0,0 +1,78 @@
> +From e5acd475f796420b4887969f2b0057dbf67979b3 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 18 Sep 2023 02:47:55 +0200
> +Subject: [PATCH] tracker: fix reproducibility issue
> +
> +Tracker's design seems to be strictly for non-cross builds and leaks bui=
ldpaths into the
> +binaries at various places. Avoid this to improve binary reproducibility=
.
> +
> +todo: Some of these paths may need to be adjusted to make the test envir=
onment work


This patch is missing upstream-status, since I have accepted this
already please send an incremental fix to update it.

AssertionError: 1 !=3D 0 : Found following patches with malformed or
missing upstream status:
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/tracker/tracker/0001-fix-reproducibility.patch


> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson.build                       | 6 +++---
> + src/libtracker-common/meson.build | 4 ++--
> + src/libtracker-sparql/meson.build | 4 ++--
> + 3 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 8442a216f..82844d7fd 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -348,7 +348,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
> + conf.set('HAVE_RTLD_NOLOAD', have_rtld_noload)
> +
> + # Config that goes in some other generated files (.desktop, .service, e=
tc)
> +-conf.set('abs_top_builddir', meson.current_build_dir())
> ++conf.set('abs_top_builddir', '/usr/src/debug/tracker')
> + conf.set('libexecdir', join_paths(get_option('prefix'), get_option('lib=
execdir')))
> +
> + configure_file(input: 'config.h.meson.in',
> +@@ -388,8 +388,8 @@ subdir('docs')
> + subdir('utils')
> +
> + test_c_args =3D tracker_c_args + [
> +-    '-DTOP_BUILDDIR=3D"@0@"'.format(build_root),
> +-    '-DTOP_SRCDIR=3D"@0@"'.format(source_root),
> ++    '-DTOP_BUILDDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
> ++    '-DTOP_SRCDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
> + ]
> +
> + tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
> +diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/m=
eson.build
> +index 9355d1c0d..cdbc05f28 100644
> +--- a/src/libtracker-common/meson.build
> ++++ b/src/libtracker-common/meson.build
> +@@ -51,10 +51,10 @@ libtracker_common =3D static_library('tracker-common=
',
> +   dependencies: [tracker_common_dependencies, gmodule],
> +   c_args: [
> +     '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
> +-    '-DBUILD_LIBDIR=3D"@0@"'.format(meson.current_build_dir()),
> ++    '-DBUILD_LIBDIR=3D"@0@"'.format('/usr/src/debug/tracker'),
> +     # Global build root is required to detect noinst situations (tests/=
introspection),
> +     # event when built as a subproject
> +-    '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
> ++    '-DBUILDROOT=3D"@0@"'.format('/usr/src/debug/tracker'),
> +   ] + tracker_c_args,
> +   include_directories: [configinc, srcinc],
> +   gnu_symbol_visibility: 'hidden',
> +diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
> +index 36288f5c3..61086a697 100644
> +--- a/src/libtracker-sparql/meson.build
> ++++ b/src/libtracker-sparql/meson.build
> +@@ -96,10 +96,10 @@ libtracker_sparql_private =3D static_library('tracke=
r-sparql-private',
> +     c_args: [
> +       '-include', 'libtracker-sparql/tracker-private.h',
> +         '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
> +-        '-DBUILD_LIBDIR=3D"@0@"'.format(meson.current_build_dir()),
> ++        '-DBUILD_LIBDIR=3D"@0@"'.format('/usr/src/debug/tracker'),
> +         # Global build root is required to detect noinst situations (te=
sts/introspection),
> +         # event when built as a subproject
> +-        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
> ++        '-DBUILDROOT=3D"@0@"'.format('/usr/src/debug/tracker'),
> +     ] + tracker_c_args,
> +
> +     dependencies: [libtracker_sparql_dependencies, gvdb_dep],
> +--
> +2.41.0
> +
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb b/meta-gno=
me/recipes-gnome/tracker/tracker_3.6.0.bb
> similarity index 63%
> rename from meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
> rename to meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
> index 6dd8af239..d2eb392a0 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
> @@ -20,14 +20,10 @@ DEPENDS =3D " \
>
>  GNOMEBASEBUILDCLASS =3D "meson"
>
> -inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages =
bash-completion features_check python3native
> +inherit gettext gnomebase gsettings gobject-introspection vala gtk-doc  =
bash-completion python3native
>
> -SRC_URI +=3D "file://0001-meson-Do-not-define-TOP_SRCDIR.patch"
> -SRC_URI[archive.sha256sum] =3D "f972d50ac7bafdccf113b1eb99dcae35404685a9=
9e55bfef16f3ac83b4de974d"
> -
> -# gobject-introspection is mandatory and cannot be configured
> -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> -GIR_MESON_OPTION =3D ""
> +SRC_URI +=3D "file://0001-fix-reproducibility.patch"
> +SRC_URI[archive.sha256sum] =3D "52592cfe19baffd16dbe47475be7da750dbd0b63=
33fd7acb60faa9da5bc40df2"
>
>  # text search is not an option anymore and requires sqlite3 build with
>  # PACKAGECONFIG[fts5] set (default)
> @@ -45,8 +41,17 @@ EXTRA_OEMESON =3D " \
>      -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
>      -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
>      -Dsoup=3Dsoup3 \
> +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Denabled', =
'-Dvapi=3Ddisabled', d)} \
>  "
>
> +do_install:prepend() {
> +    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/src/libtracker-sparql/tracker-sparql-enum-types.c
> +    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/src/libtracker-sparql/core/tracker-data-enum-types.c
> +}
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +
>  FILES:${PN} +=3D " \
>      ${datadir}/dbus-1 \
>      ${datadir}/tracker3 \
> --
> 2.41.0
>

