Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76CB56196B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 17:25:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d22so2078129qtn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6MyI4nmqMpILo4aNjUR15AyiSf4RRoD9AbjKjRHgyL4=;
	b=KWGe62TI4JMIeRhnwHbh8O+/vhQnPzFi1Otlxb2f6Scx4uXTpOJczsiilbVYLfo/na
	xEbRY7QryH0lP7m3TaQTrESV0ZDVzH6An05TiXMow0BqTvD7nwveSfDM5vAOqzBrHHGv
	M8c3yGGnqiDRdhF17y6m8G+ut7im9teMjNwyjFaJjEkgbN9zvaCfyKc2blT6xARlfo3v
	XgoON8zaeXgXmo48dGoUf767KQhx+jjvG48+OI1W5REKZgD57SGLjAuyGKch+zxvsd9c
	arkqw4Tj4hw/L/5bF0BttmD4IjNmwuMq5jAeTUXiqbnaB/eof1XSxXAtOMEKgLV+81br
	0Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6MyI4nmqMpILo4aNjUR15AyiSf4RRoD9AbjKjRHgyL4=;
	b=OwKgG1NFRjtpf5E4nTuFwzEoWBD2VqtEBCHl2I712Qu3vvxd/0qZtJFwVmBElls/Qu
	4s8VVFqfOtAbhm89HG1vRPz1HxASFG8CV5tpVk1TBi9WNHpyOJ80ewKhKXAfcZTNd7GH
	877P28donucdnpLJXYXw68VzhafyJNanADfYOjxFmgVp6k1JBvpKxUc8og/1h+XXuFQ6
	P+IS1mh1u6ewFXUcJwYmeaBTMUfvVbPHW/wcI8cLFDFqzO+21VPFRU6fkba7l75KmBft
	tPR8F3bCfRsJkveJwnLqO+krwHvPSoh6yIDSFWjjONCGcdoynMJiRC4LPPv+XEQu917O
	p+Mg==
X-Gm-Message-State: ANhLgQ2dgg31eaps+AM49NVdUgpaENNqRQ0PCn4Y6/e3YQX/PeD8O3Ow
	6lkh0LR25QY1Vu4H1BWiBJd4u/UogTQz7BHPlpg=
X-Google-Smtp-Source: ADFU+vtb6WpzKqYpxWgNK8XM9tU3MW5bXZwWtEbPeMtbPofODnfubEXYq9PZwY/vbYQku/TuExvSHUtbJ9F1jzvX8y8=
X-Received: by 2002:ac8:6754:: with SMTP id n20mr5328113qtp.293.1583256321163; 
	Tue, 03 Mar 2020 09:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20200303134534.36509-1-git@andred.net>
	<20200303134534.36509-3-git@andred.net>
In-Reply-To: <20200303134534.36509-3-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2020 09:24:54 -0800
Message-ID: <CAMKF1sqnBNGEGU5b2DXT7B08XsOYu6mBMqYJgb0RPePCiZx3Rw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] nodejs: allow use of system brotli (and make default)
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
X-List-Received-Date: Tue, 03 Mar 2020 17:25:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

can you rebase it on top of master-next and resend

On Tue, Mar 3, 2020 at 5:46 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> Use system brotli via PACKAGECONFIG by default. So far,
> nodejs had been built using its embedded copy of brotli,
> which we generally try to avoid, for the known reasons
> (independent updates, cve & license checks, etc).
>
> The nodejs patches to enable this have been submitted.
> brotli is in meta-oe, so enabling this by default should
> not be a problem.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  ...-passing-multiple-libs-to-pkg_config.patch | 41 ++++++++++++
>  ...allow-use-of-system-installed-brotli.patch | 66 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_12.14.1.bb |  7 +-
>  3 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-all=
ow-passing-multiple-libs-to-pkg_config.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-build-all=
ow-use-of-system-installed-brotli.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-pass=
ing-multiple-libs-to-pkg_config.patch b/meta-oe/recipes-devtools/nodejs/nod=
ejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
> new file mode 100644
> index 000000000..13edf229b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-mul=
tiple-libs-to-pkg_config.patch
> @@ -0,0 +1,41 @@
> +From fdaa0e3bef93c5c72a7258b5f1e30718e7d81f9b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
> +Date: Mon, 2 Mar 2020 12:17:09 +0000
> +Subject: [PATCH 1/2] build: allow passing multiple libs to pkg_config
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Sometimes it's necessary to pass multiple library names to pkg-config,
> +e.g. the brotli shared libraries can be pulled in with
> +    pkg-config libbrotlienc libbrotlidec
> +
> +Update the code to handle both, strings (as used so far), and lists
> +of strings.
> +
> +Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> +---
> +Upstream-Status: Submitted [https://github.com/nodejs/node/pull/32046]
> + configure.py | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.py b/configure.py
> +index beb08df088..e3f78f2fed 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -680,7 +680,11 @@ def pkg_config(pkg):
> +   retval =3D ()
> +   for flag in ['--libs-only-l', '--cflags-only-I',
> +                '--libs-only-L', '--modversion']:
> +-    args +=3D [flag, pkg]
> ++    args +=3D [flag]
> ++    if isinstance(pkg, list):
> ++      args +=3D pkg
> ++    else:
> ++      args +=3D [pkg]
> +     try:
> +       proc =3D subprocess.Popen(shlex.split(pkg_config) + args,
> +                               stdout=3Dsubprocess.PIPE)
> +--
> +2.25.0
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-=
of-system-installed-brotli.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0=
002-build-allow-use-of-system-installed-brotli.patch
> new file mode 100644
> index 000000000..fc038f3aa
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-syst=
em-installed-brotli.patch
> @@ -0,0 +1,66 @@
> +From f0f927feee8cb1fb173835d5c3f6beb6bf7d5e54 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
> +Date: Mon, 2 Mar 2020 12:17:35 +0000
> +Subject: [PATCH 2/2] build: allow use of system-installed brotli
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +brotli is available as a shared library since 2016, so it makes sense
> +to allow its use as a system-installed version.
> +
> +Some of the infrastructure was in place already (node.gyp and
> +node.gypi), but some bits in the configure script here were missing.
> +
> +Add them, keeping the default as before, to use the bundled version.
> +
> +Refs: https://github.com/google/brotli/pull/421
> +Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> +---
> +Upstream-Status: Submitted [https://github.com/nodejs/node/pull/32046]
> + configure.py | 22 ++++++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> +
> +diff --git a/configure.py b/configure.py
> +index e3f78f2fed..0190e31b41 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -301,6 +301,27 @@ shared_optgroup.add_option('--shared-zlib-libpath',
> +     dest=3D'shared_zlib_libpath',
> +     help=3D'a directory to search for the shared zlib DLL')
> +
> ++shared_optgroup.add_option('--shared-brotli',
> ++    action=3D'store_true',
> ++    dest=3D'shared_brotli',
> ++    help=3D'link to a shared brotli DLL instead of static linking')
> ++
> ++shared_optgroup.add_option('--shared-brotli-includes',
> ++    action=3D'store',
> ++    dest=3D'shared_brotli_includes',
> ++    help=3D'directory containing brotli header files')
> ++
> ++shared_optgroup.add_option('--shared-brotli-libname',
> ++    action=3D'store',
> ++    dest=3D'shared_brotli_libname',
> ++    default=3D'brotlidec,brotlienc',
> ++    help=3D'alternative lib name to link to [default: %default]')
> ++
> ++shared_optgroup.add_option('--shared-brotli-libpath',
> ++    action=3D'store',
> ++    dest=3D'shared_brotli_libpath',
> ++    help=3D'a directory to search for the shared brotli DLL')
> ++
> + shared_optgroup.add_option('--shared-cares',
> +     action=3D'store_true',
> +     dest=3D'shared_cares',
> +@@ -1692,6 +1713,7 @@ configure_napi(output)
> + configure_library('zlib', output)
> + configure_library('http_parser', output)
> + configure_library('libuv', output)
> ++configure_library('brotli', output, pkgname=3D['libbrotlidec', 'libbrot=
lienc'])
> + configure_library('cares', output, pkgname=3D'libcares')
> + configure_library('nghttp2', output, pkgname=3D'libnghttp2')
> + configure_v8(output)
> +--
> +2.25.0
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_12.14.1.bb
> index 49bb71e28..1ea438c5b 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> @@ -20,6 +20,8 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>             file://0003-Install-both-binaries-and-use-libdir.patch \
>             file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>             file://big-endian.patch \
> +           file://0001-build-allow-passing-multiple-libs-to-pkg_config.p=
atch \
> +           file://0002-build-allow-use-of-system-installed-brotli.patch =
\
>             "
>  SRC_URI_append_class-target =3D " \
>             file://0002-Using-native-binaries.patch \
> @@ -51,8 +53,9 @@ ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATURES'=
, 'callconvention-hard', '-
>  GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
>  ARCHFLAGS ?=3D ""
>
> -PACKAGECONFIG ??=3D "ares icu libuv zlib"
> +PACKAGECONFIG ??=3D "ares brotli icu libuv zlib"
>  PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
> +PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli"
>  PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
>  PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>  PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
> @@ -81,6 +84,8 @@ python do_unpack() {
>      shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
>      if 'ares' in d.getVar('PACKAGECONFIG'):
>          shutil.rmtree(d.getVar('S') + '/deps/cares', True)
> +    if 'brotli' in d.getVar('PACKAGECONFIG'):
> +        shutil.rmtree(d.getVar('S') + '/deps/brotli', True)
>      if 'libuv' in d.getVar('PACKAGECONFIG'):
>          shutil.rmtree(d.getVar('S') + '/deps/uv', True)
>      if 'nghttp2' in d.getVar('PACKAGECONFIG'):
> --
> 2.23.0.rc1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

