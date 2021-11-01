Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C34C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 13:43:30 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.43978.1635774210020820210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 06:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qmQlv0rR;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id bk22so9778443qkb.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bsGjbhRajevtv721+kDaT6F8ZsNxXVgDVZU8u8nXf+Q=;
        b=qmQlv0rRueNw50W6uEWP3r94we+Y4fKac+AUfGHRxdMfdEMkNry//gxYWTk0visqW3
         GBxJh23eWZwXk5E4LoVRlRyRqZLNI88PtO/XNKTvHBGHcbCkgSNtkjuTQVDzkRDtJpdx
         4ho7dssbvNcU4VJO7Smu1Be8AHoIFJuMmzQmk6VakNWf/g9C3RLtdHUUaUw/8K5O4EiS
         9lY6r3AMTlwBN8onsBtkbmqs9ZgSLr6uT49CQ3vbHDdESUweWlSPYIP0ktm4IixJ9SHa
         u0NMOv2cLt0Nky67vL6tOWCzi79EKSky5kNzLZZGXx7P7EUgjF3fr1wGB37peer1sL53
         P8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bsGjbhRajevtv721+kDaT6F8ZsNxXVgDVZU8u8nXf+Q=;
        b=eQPTxk7b+N5mWnAeN8YBaFXW2VGKjHCEldVUCG9gNDD8CvEYILktTcQ7/NW2keo6pB
         JweeCjTcstfDNk411vya7WA8iR1LWexLkof+4gTkzmB04MieSEmNXUv9PcNoSSBRb5Gw
         gRN00qlkYj+wthr2Aso8K9fSkCkUMkpPUnz79F19GQ8hTtHJ25aL5wQrf5/EKwg6jeVE
         kVwl3IiOl4BZCYNyY9a7D56S1LH59HDPHgJ9RAxyT9DwHJNvDgo2WdTvRtZLXxmv8o0H
         HjOQ78vA0/P8nB9f5VeLnnEgFV2nGKxTHAIf1EpGImGBFcECzk32syLljLXr/pQmMMLl
         0JJw==
X-Gm-Message-State: AOAM533xUG5ghf97rI7TIGl7iNXl019FJ5SGrDsRo54TjyMy2yU/Rl+l
	klypZ0JSCfIFUbJF5W5yyOnjShjwXCcYvLjP9J8fVwZ+jP0=
X-Google-Smtp-Source: 
 ABdhPJxn//MxCeW3D+PmMbLn+tT2nZ8WydkQrkoy7NCJmSUoWYy129wTfksk1JyVl7HsLcfR3tLHWmfv4Ra/DLGWT9U=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr22692855qkf.47.1635774208775;
 Mon, 01 Nov 2021 06:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
In-Reply-To: <20211101114934.3646836-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2021 06:43:02 -0700
Message-ID: 
 <CAMKF1spFaSR8DdV3rQRtUD3MOa5kbSWpUxdaHPUEY3DovoeAHw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 00/31] De-rotten meta-gnome
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 13:43:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93743

seeing these when polkit is not in distro features, is there a way out ?

ERROR: Nothing PROVIDES 'accountsservice' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gdm/gd=
m_41.0.bb
DEPENDS on or otherwise requires it)
accountsservice was skipped: missing required distro feature 'polkit'
(not in DISTRO_FEATURES)
ERROR: Nothing RPROVIDES 'gdm-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gdm/gd=
m_41.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'gdm-dev'
NOTE: Runtime target 'gdm-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gdm-dev']
ERROR: Nothing RPROVIDES 'gdm' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gdm/gd=
m_41.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'gdm'
NOTE: Runtime target 'gdm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gdm']
ERROR: Nothing RPROVIDES 'gdm-base' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gdm/gd=
m_41.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'gdm-base'
NOTE: Runtime target 'gdm-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gdm-base']

On Mon, Nov 1, 2021 at 4:49 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Most notable changes:
>
> * Add mozjs-78 for gjs. It does not conflict with mozjs-91
> * Add gtk4 to fullfill latest gnome-shell's requirement
>
> Due to mozjs being somewhat special in all kinds, this series has seen wi=
de
> build tests:
>
> for glibc:
> * raspberrypi4 / raspberrypi4-64
> * qemuriscv32 / qemuriscv64
> * qemumips / qemumips64
> * qemux86 / qemux86-64
> * qemuppc / qemuppc64
>
> for musl+gold
> * raspberrypi4-64
>
> The following changes since commit 2f6797d8d6356d6e0556b53f14514e57ce3093=
50:
>
>   python3-prettytable: Upgrade 2.1.0 -> 2.2.1 (2021-10-28 09:01:25 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/schnitzeltony/meta-openembedded.git de-rotten-meta-g=
nome-part-I
>
> for you to fetch changes up to 1b89d68f83df14abd9222b0c54b0d823f06cf500:
>
>   mozjs-91: Fix build on powerpc (2021-11-01 10:13:29 +0100)
>
> ----------------------------------------------------------------
> Andreas M=C3=BCller (31):
>   xfce4-sensors-plugin: upgrade 1.3.95 -> 1.4.1
>   fftw: remove unused patch
>   mozjs: Move back to recipes-extended - no meta-python specifics
>     required
>   Rename mozjs -> mozjs-91 to allow multiple versions of mozjs
>   polkit: Adjust to mozjs-91 in DEPENDS
>   mozjs-91: remove static library
>   mozjs-78: Initial add
>   graphene: enable introspection by default - gtk4 & mutter 41 require
>     it
>   graphene: extend to native and nativesdk
>   graphene: Tidy up recipe a bit
>   gtk4: initial add 4.4.0
>   gjs: upgrade 1.58.8 -> 1.70.0
>   mutter: upgrade 3.34.6 -> 41.0
>   gdm: upgrade 3.36.3 -> 41.0
>   upower: upgrade 0.99.11 -> 0.99.13
>   udisks2: upgrade 2.9.3 -> 2.9.4
>   gnome-settings-daemon: upgrade 3.36.1 -> 41.0
>   gnome-shell: upgrade 3.34.5 -> 41.0
>   gnome-shell-extensions: upgrade 3.34.2 -> 40.1
>   gnome-desktop: upgrade 3.38.8 -> 41.0 and give up '3' receipe name
>     suffix
>   gnome-session: upgrade 3.36.0 -> 40.1.1
>   gnome-control-center: upgrade 3.36.4 -> 41.1
>   gexiv2: upgrade 0.12.2 -> 0.14.0
>   gparted: upgrade 1.3.0 -> 1.3.1
>   gnome-backgrounds: upgrade 3.38.0 -> 41.0
>   gnome-tweaks: upgrade 3.34.0 -> 40.0
>   gnome-terminal: upgrade 3.40.2 -> 3.42.0 / meson build
>   gnome-panel: upgrade 3.36.1 -> 3.38.0
>   grilo: upgrade 0.3.13 -> 0.3.14
>   grilo-plugins: upgrade 0.3.13 -> 0.3.14
>   mozjs-91: Fix build on powerpc
>
>  .../{gparted_1.3.0.bb =3D> gparted_1.3.1.bb}    |   2 +-
>  .../0001-Ensure-pam-file-installation.patch   |  48 ---
>  .../gdm/{gdm_3.36.3.bb =3D> gdm_41.0.bb}        |  21 +-
>  .../recipes-gnome/gexiv2/gexiv2_0.12.2.bb     |  19 --
>  .../recipes-gnome/gexiv2/gexiv2_0.14.0.bb     |  21 ++
>  .../gjs/gjs/0001-Disable-tests-on-host.patch  |  33 --
>  ...01-Support-cross-builds-a-bit-better.patch |  50 +++
>  ...id-g_once_init_enter-error-in-GCC-11.patch |  77 -----
>  ...ot-add-dir-installed-tests-when-inst.patch |  34 ++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb    |  42 ---
>  meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb    |  38 +++
>  ...ds_3.38.0.bb =3D> gnome-backgrounds_41.0.bb} |   4 +-
>  ...3.36.4.bb =3D> gnome-control-center_41.1.bb} |   5 +-
>  ...ild-Disable-libseccomp-for-all-archs.patch |   8 +-
>  ...sktop3_3.38.8.bb =3D> gnome-desktop_41.0.bb} |  28 +-
>  ...-panel_3.36.1.bb =3D> gnome-panel_3.38.0.bb} |   3 +-
>  ...sion_3.36.0.bb =3D> gnome-session_40.1.1.bb} |   8 +-
>  ....36.1.bb =3D> gnome-settings-daemon_41.0.bb} |   5 +-
>  ...34.2.bb =3D> gnome-shell-extensions_41.0.bb} |   5 +-
>  ...s-gjs_path-to-optionally-set-path-to.patch | 112 +++++++
>  ...me-shell_3.34.5.bb =3D> gnome-shell_41.0.bb} |  12 +-
>  ...EXITCODE-macro-for-non-glibc-systems.patch |  19 +-
>  ...nal_3.40.2.bb =3D> gnome-terminal_3.42.0.bb} |  10 +-
>  .../0001-Make-python-path-configurable.patch  |   6 +-
>  ...-tweaks_3.34.0.bb =3D> gnome-tweaks_40.0.bb} |   5 +-
>  .../recipes-gnome/graphene/graphene_1.10.6.bb |   7 +-
>  ...gins_0.3.13.bb =3D> grilo-plugins_0.3.14.bb} |   2 +-
>  .../{grilo_0.3.13.bb =3D> grilo_0.3.14.bb}      |   2 +-
>  meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb   | 139 ++++++++
>  .../0001-EGL-Include-EGL-eglmesaext.h.patch   |  72 -----
>  .../{mutter_3.34.6.bb =3D> mutter_41.0.bb}      |  21 +-
>  ...figure-Skip-all-target-manipulations.patch |  66 ++++
>  ...-autoconf-s-config.sub-to-canonicali.patch |  33 ++
>  ...003-Cargo.toml-do-not-abort-on-panic.patch |  33 ++
>  ...ibility-of-mozbuild-with-Python-3.10.patch | 304 ++++++++++++++++++
>  .../0005-use-asm-sgidefs.h.patch}             |   0
>  .../0006-fix-musl-build.patch}                |   0
>  .../mozjs/mozjs-78/0007-riscv.patch           |  52 +++
>  ...0008-riscv-Disable-atomic-operations.patch |  52 +++
>  .../0009-riscv-Set-march-correctly.patch      |  60 ++++
>  ...ace-include-by-code-to-fix-arm-build.patch |  43 +++
>  ...aredArrayRawBufferRefs-to-public-API.patch |  35 ++
>  .../mozjs/mozjs-78_78.15.0.bb                 | 140 ++++++++
>  ...001-Cargo.toml-do-not-abort-on-panic.patch |   0
>  ...-autoconf-s-config.sub-to-canonicali.patch |   0
>  ...nfigure-do-not-look-for-llvm-objdump.patch |   0
>  ...o-not-try-to-find-a-suitable-upstrea.patch |   0
>  .../mozjs-91/0004-use-asm-sgidefs.h.patch     |  35 ++
>  .../mozjs-91/0005-nojit-32bit-arch-fix.patch} |   0
>  .../mozjs-91/0006-Fix-build-on-powerpc.patch  |  36 +++
>  .../mozjs/mozjs-91/fix-musl-build.patch       |  15 +
>  .../mozjs/mozjs-91}/riscv32.patch             |   0
>  .../mozjs/mozjs-91_91.2.0.bb}                 |  13 +-
>  .../recipes-extended/polkit/polkit_0.119.bb   |   2 +-
>  .../fftw/fftw/club-libtool.patch              |   9 -
>  .../{udisks2_2.9.3.bb =3D> udisks2_2.9.4.bb}    |   2 +-
>  .../{upower_0.99.11.bb =3D> upower_0.99.13.bb}  |  13 +-
>  ....3.95.bb =3D> xfce4-sensors-plugin_1.4.1.bb} |   2 +-
>  58 files changed, 1407 insertions(+), 396 deletions(-)
>  rename meta-gnome/recipes-extended/gparted/{gparted_1.3.0.bb =3D> gparte=
d_1.3.1.bb} (91%)
>  delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file=
-installation.patch
>  rename meta-gnome/recipes-gnome/gdm/{gdm_3.36.3.bb =3D> gdm_41.0.bb} (68=
%)
>  delete mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.2.bb
>  create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-o=
n-host.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Support-cross-b=
uilds-a-bit-better.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_o=
nce_init_enter-error-in-GCC-11.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0002-meson.build-Do-=
not-add-dir-installed-tests-when-inst.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
>  rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_3.3=
8.0.bb =3D> gnome-backgrounds_41.0.bb} (62%)
>  rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_3.36.4.bb =3D> gnome-control-center_41.1.bb} (88%)
>  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.38.8.bb =
=3D> gnome-desktop_41.0.bb} (57%)
>  rename meta-gnome/recipes-gnome/gnome-panel/{gnome-panel_3.36.1.bb =3D> =
gnome-panel_3.38.0.bb} (77%)
>  rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_3.36.0.bb =
=3D> gnome-session_40.1.1.bb} (82%)
>  rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_3.36.1.bb =3D> gnome-settings-daemon_41.0.bb} (85%)
>  rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_3.34=
.2.bb =3D> gnome-shell-extensions_41.0.bb} (67%)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001=
-Introduce-options-gjs_path-to-optionally-set-path-to.patch
>  rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.5.bb =3D> =
gnome-shell_41.0.bb} (83%)
>  rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.40.2.bb=
 =3D> gnome-terminal_3.42.0.bb} (78%)
>  rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_3.34.0.bb =3D=
> gnome-tweaks_40.0.bb} (82%)
>  rename meta-gnome/recipes-gnome/grilo/{grilo-plugins_0.3.13.bb =3D> gril=
o-plugins_0.3.14.bb} (83%)
>  rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.13.bb =3D> grilo_0.3.14=
.bb} (89%)
>  create mode 100644 meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
>  delete mode 100644 meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Inclu=
de-EGL-eglmesaext.h.patch
>  rename meta-gnome/recipes-gnome/mutter/{mutter_3.34.6.bb =3D> mutter_41.=
0.bb} (78%)
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0001-rust.configure-Skip-all-target-manipulations.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.pat=
ch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0003-Cargo.toml-do-not-abort-on-panic.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/{mozjs/=
0004-use-asm-sgidefs.h.patch =3D> mozjs-78/0005-use-asm-sgidefs.h.patch} (1=
00%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/{mozjs/=
fix-musl-build.patch =3D> mozjs-78/0006-fix-musl-build.patch} (100%)
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0007-riscv.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0008-riscv-Disable-atomic-operations.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0009-riscv-Set-march-correctly.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0010-replace-include-by-code-to-fix-arm-build.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0011-Add-SharedArrayRawBufferRefs-to-public-API.patch
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78_78.15.0.bb
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs =
=3D> recipes-extended/mozjs/mozjs-91}/0001-Cargo.toml-do-not-abort-on-panic=
.patch (100%)
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs =
=3D> recipes-extended/mozjs/mozjs-91}/0001-build-do-not-use-autoconf-s-conf=
ig.sub-to-canonicali.patch (100%)
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs =
=3D> recipes-extended/mozjs/mozjs-91}/0002-moz.configure-do-not-look-for-ll=
vm-objdump.patch (100%)
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs =
=3D> recipes-extended/mozjs/mozjs-91}/0003-rust.configure-do-not-try-to-fin=
d-a-suitable-upstrea.patch (100%)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0004-use-asm-=
sgidefs.h.patch
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/=
nojit-32bit-arch-fix.patch =3D> recipes-extended/mozjs/mozjs-91/0005-nojit-=
32bit-arch-fix.patch} (100%)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0006-Fix-buil=
d-on-powerpc.patch
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/fix-musl-buil=
d.patch
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs =
=3D> recipes-extended/mozjs/mozjs-91}/riscv32.patch (100%)
>  rename meta-oe/{dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_=
91.2.0.bb =3D> recipes-extended/mozjs/mozjs-91_91.2.0.bb} (88%)
>  delete mode 100644 meta-oe/recipes-support/fftw/fftw/club-libtool.patch
>  rename meta-oe/recipes-support/udisks/{udisks2_2.9.3.bb =3D> udisks2_2.9=
.4.bb} (96%)
>  rename meta-oe/recipes-support/upower/{upower_0.99.11.bb =3D> upower_0.9=
9.13.bb} (78%)
>  rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.3=
.95.bb =3D> xfce4-sensors-plugin_1.4.1.bb} (91%)
>
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93700): https://lists.openembedded.org/g/openembedded=
-devel/message/93700
> Mute This Topic: https://lists.openembedded.org/mt/86737122/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

