Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 850757E621
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 15:06:52 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u10so12852092lfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2BbIfJlfb1lA6dXCe9tRZ/v/oAOTUuCTxnAHfbpiHSk=;
	b=GWA2V4eO0Un+ZSi3eIc6Y2aAJLnRxboRepUhz1nYNHHaUHIydGO4Sch+uXs78l7YG3
	0W5zVIg8OsUY12JuruvqLjL6jVbMF5YjagshrDvvLCMc+BCVwIqEiasmZ6+itWikjZRx
	+tUi5MhHog47o1mmvN1SwjdV5uLdNgIvGUmg3HlmFtBvOV8sFzDiMtE74BA6KP532aQp
	DqACJ3Fvb3kMRwj1lrMPUSHh2wlxmFm8Ed2A9BVvhXxqJWKl1cR40cfm05imdhcg/rF0
	iqjannnXebRMLN9XA0C/qLpaRGlLzTRt5jFeiVNTBUukW+Kr3z42rswrOWn76H3gybBA
	OVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2BbIfJlfb1lA6dXCe9tRZ/v/oAOTUuCTxnAHfbpiHSk=;
	b=JCL2AGsf8h/wj3VMKbADu9ym4A7J1lkRxwcE8H1T9lyaHKSLgosTxLhcjaRJWkIrjH
	zS5AXKqfMSArL7DJMlzAzbXMK+abwQBkW8oXs7R8izV/pivkBON29kHlli0/IdlJ5MzU
	cmB6k6ztk1o8nl/hTg1/Qnut+X3aaDiV+Nf1jmV56ta8UzSeUdgSIWHj+EiyEvZc9faJ
	raZuWFHTko5OV7/SLVcQC6Ko3dfBANadmVNEp3rvmRerJLT4cbOleE8QFRTJkHb8fhgX
	xctk1FkBG0yHSyc8DWyudFinSyET8MbnEualEgwixhDRtFxTUe1E6bsi5AjfDEUovMwr
	NkVw==
X-Gm-Message-State: APjAAAUYnx0C5DI8VGU5CXIZzgONarOo/7SMNfxS/WUKDe/LOCGvjvUg
	v8v4pv09IvmlJ4GRRJIxtF6NTJwHUU1lJpB8WETrT0UB
X-Google-Smtp-Source: APXvYqzOCh4h1bAg2IA1Rf2NigwgIykE69aegR3YEH8/mvh3kNW5w05jv/Y08UKXJV7wC0Gk2LfN8TWbq45uszrmDqM=
X-Received: by 2002:a19:710b:: with SMTP id m11mr74222254lfc.135.1561475212908;
	Tue, 25 Jun 2019 08:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <PSXP216MB02772E83E6C1839E25C722E8DDE30@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB02772E83E6C1839E25C722E8DDE30@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Jun 2019 08:06:24 -0700
Message-ID: <CAKmqyKMGtZXZBcX2A8wBhXvy2A-Wx4_XB3G+a9jzQuNtrrdKzA@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] gpsd: Upgrade from 3.17 to 3.18.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 15:06:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 10:46 PM Alistair Francis
<alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Argh! This doesn't work, sending a v3.

Alistair

> ---
> v2:
>  - Fix install warnings
>
>  ...x-includepy-with-sysroot-and-drop-sy.patch | 32 +++++++++----------
>  .../0002-include-sys-ttydefaults.h.patch}     |  0
>  ...e-html-and-man-docs-building-becaus.patch} |  0
>  .../gpsd/{gpsd_3.17.bb => gpsd_3.18.1.bb}     | 10 +++---
>  4 files changed, 20 insertions(+), 22 deletions(-)
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.17 => gpsd-3.18.1}/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch (81%)
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.17/0001-include-sys-ttydefaults.h.patch => gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch} (100%)
>  rename meta-oe/recipes-navigation/gpsd/{gpsd-3.17/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch => gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch} (100%)
>  rename meta-oe/recipes-navigation/gpsd/{gpsd_3.17.bb => gpsd_3.18.1.bb} (93%)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
> similarity index 81%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
> index 1fa27c210..23ae5e509 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
> @@ -1,4 +1,4 @@
> -From 1e2cea8945bc2183fbe1a012dcd633a352125952 Mon Sep 17 00:00:00 2001
> +From 5464d9e1bfd1a1c54338ec7c4148cad1b222ef93 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Tue, 24 Apr 2012 18:45:14 +0200
>  Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysroot
> @@ -34,15 +34,16 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> +
>  ---
> - SConstruct | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> + SConstruct | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
>
>  diff --git a/SConstruct b/SConstruct
> -index 3318bb48..e1c4f963 100644
> +index b8f3fb1..883e06d 100644
>  --- a/SConstruct
>  +++ b/SConstruct
> -@@ -934,7 +934,7 @@ else:
> +@@ -980,7 +980,7 @@ else:
>
>   # Set up configuration for target Python
>
> @@ -51,7 +52,7 @@ index 3318bb48..e1c4f963 100644
>
>   PYTHON_CONFIG_NAMES = ['CC', 'CXX', 'OPT', 'BASECFLAGS',
>                          'CCSHARED', 'LDSHARED', 'SO', 'INCLUDEPY', 'LDFLAGS']
> -@@ -1364,7 +1364,7 @@ else:
> +@@ -1506,7 +1506,7 @@ else:
>                          LINK=ldshared,
>                          SHLIBPREFIX="",
>                          SHLIBSUFFIX=python_config['SO'],
> @@ -60,22 +61,19 @@ index 3318bb48..e1c4f963 100644
>                          CPPFLAGS=python_config['OPT'],
>                          CFLAGS=python_config['BASECFLAGS'],
>                          CXXFLAGS=python_config['BASECFLAGS'])
> -@@ -1662,12 +1662,15 @@ if ((not env['debug'] and not env['profiling'] and not env['nostrip']
> - if not env['python']:
> -     python_install = []
> - else:
> -+    python_libdir = python_libdir.replace(env['sysroot'], '')
> -     python_module_dir = python_libdir + os.sep + 'gps'
> +@@ -1808,12 +1808,14 @@ if ((not env['debug'] and not env['profiling'] and not env['nostrip'] and
> +     env.AddPostAction(binaryinstall, '$STRIP $TARGET')
> +
> + if env['python']:
> +-    python_module_dir = str(python_libdir) + os.sep + 'gps'
> ++    python_module_dir = python_libdir.replace(env['sysroot'], '') + os.sep + 'gps'
>       python_extensions_install = python_env.Install(DESTDIR + python_module_dir,
>                                                      python_built_extensions)
> -     if ((not env['debug'] and not env['profiling']
> -          and not env['nostrip'] and not sys.platform.startswith('darwin'))):
> +     if ((not env['debug'] and not env['profiling'] and
> +          not env['nostrip'] and not sys.platform.startswith('darwin'))):
>           python_env.AddPostAction(python_extensions_install, '$STRIP $TARGET')
>  +    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TARGET"' \
>  +                     % (python_libdir, ))
>
>       python_modules_install = python_env.Install(DESTDIR + python_module_dir,
>                                                   python_modules)
> ---
> -2.1.0
> -
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-include-sys-ttydefaults.h.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch
> similarity index 100%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-include-sys-ttydefaults.h.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch
> similarity index 100%
> rename from meta-oe/recipes-navigation/gpsd/gpsd-3.17/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch
> rename to meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0003-SConstruct-disable-html-and-man-docs-building-becaus.patch
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> similarity index 93%
> rename from meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
> rename to meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> index 7752e76b5..ef69ae096 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> @@ -13,11 +13,11 @@ EXTRANATIVEPATH += "chrpath-native"
>
>  SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>      file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
> -    file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
> -    file://0001-include-sys-ttydefaults.h.patch \
> +    file://0002-include-sys-ttydefaults.h.patch \
> +    file://0003-SConstruct-disable-html-and-man-docs-building-becaus.patch \
>  "
> -SRC_URI[md5sum] = "e0cfadcf4a65dfbdd2afb11c58f4e4a1"
> -SRC_URI[sha256sum] = "68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a"
> +SRC_URI[md5sum] = "3b11f26b295010666b1767b308f90bc5"
> +SRC_URI[sha256sum] = "5cb1e6d880ec9a52c62492dd0e3d77451b7c7ad625895bd652f6354215aec23e"
>
>  inherit scons update-rc.d python-dir pythonnative systemd bluetooth update-alternatives
>
> @@ -61,7 +61,7 @@ do_install() {
>
>      export DESTDIR="${D}"
>      # prefix is used for RPATH and DESTDIR/prefix for instalation
> -    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
> +    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} python_libdir=${libdir}install ${EXTRA_OESCONS} || \
>        bbfatal "scons install execution failed."
>  }
>
> --
> 2.21.0
>

