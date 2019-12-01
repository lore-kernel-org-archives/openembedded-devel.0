Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD456C1CA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:53:08 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a137so28579627qkc.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q3NlAMSrLUm7jTJ0rAQ/QLHfaWmEk2Fi54BP9cOjN/4=;
	b=GnCcN8HvLexfvqEaciYd+BiDF1jYTwFBkB/BmzI1tmy6FyjEmOrx2QFXEg43EAoKAz
	Qz/N2ijKTR/TrxrBCjxe4Xv7p52ICkOLElrzQVc1W8SlPOcoY5dyBBt0W7PUo0mRGP/K
	SnX3SDH2mx3osSQCXFh+9Np+EENMlL/4ibcLkc6GZmB60VM2kFTAvY2posoCZwdPk89N
	mzYjBuYHx9YhqKfIjdEF10uJHzM2AX3KbeLf2Rl0mAFaE0hFOi+OeCJgphHrNRrLjtou
	+6mYCJkqem12qh/bu9i9bCey3UTGnhuDkphmWeFgy1DhsHiPX1J5BAzxEhDccnBkmuYt
	gUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q3NlAMSrLUm7jTJ0rAQ/QLHfaWmEk2Fi54BP9cOjN/4=;
	b=sASaEubUSBkol7erfn9ohHPoi9aBWvt6ypp+umbqTuK8q5tJZI2jiiLjcWWwEOYQ5S
	YOYeCfj/bN4NGgGcpOkReda9A1dHQYv9LznX42NwIbba+PTJz4dPVHM6JxniU5f5zFUB
	REKxpRDdf0tq89OTA2goozdCplpbo4A/VhLd62AHUoVkjxuKe54SSreHLgLaqZvgG1uV
	kZxochhEKXtO+H8FxyfSMGDIMEUvw2gQ4k8KW3KILp5it1lOzrL2597mGGVk43Z7HWps
	i8Q0V8wI91K3PbVmxUCNzUFF2A99OFh497/gm2Rjctovw1eZRB8+AcCu3SM+kYuZHysh
	BHiA==
X-Gm-Message-State: APjAAAWTSS4Pgzq0muuMuqn9KUkvlnCAH4ReuZpXygAF409cC6Lepp0M
	1ard75n2gjRYojW2Vb4gPZXt4NG7tz5R/olj4Vtaj7p5
X-Google-Smtp-Source: APXvYqxrwiuMOIwZcRyqKuJajFORoZfulrIPRWdtrlcf7dXZGxF6HtRV3wWSMsm2uPooX8ZDgAs55iQ85MBJwex1uKI=
X-Received: by 2002:a37:4cd3:: with SMTP id
	z202mr28887190qka.212.1575226388383; 
	Sun, 01 Dec 2019 10:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
	<20191201165123.12699-7-schnitzeltony@gmail.com>
In-Reply-To: <20191201165123.12699-7-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Dec 2019 10:52:42 -0800
Message-ID: <CAMKF1sr56E7Cr9x11AxXg_AJ4tvpHHigjqYOEGvjAQq4PASQ4w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 7/7] nodejs: Add PACKAGECONFIG share to allow other projects to use node as library
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
X-List-Received-Date: Sun, 01 Dec 2019 18:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 1, 2019 at 8:53 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> There are so many useful modules written for node.js I would like to use =
in
> C++/Qt projects.
>
> Run-tested both variants by installing node-red with npm and running it.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...Install-both-binaries-and-use-libdir.patch | 96 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_10.17.0.bb |  5 +-
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-b=
oth-binaries-and-use-libdir.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-bin=
aries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-In=
stall-both-binaries-and-use-libdir.patch
> new file mode 100644
> index 000000000..7aa70fec9
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-a=
nd-use-libdir.patch
> @@ -0,0 +1,96 @@
> +From 5bfeffdf4b5de1c60a2ff0d1ddf65db2bb9a1533 Mon Sep 17 00:00:00 2001
> +From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
> +Date: Tue, 19 Mar 2019 23:22:40 -0400
> +Subject: [PATCH 3/3] Install both binaries and use libdir.
> +
> +This allows us to build with a shared library for other users while
> +still providing the normal executable.
> +
> +Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
> +
> +Stolen from [1]
> +
> +[1] https://src.fedoraproject.org/rpms/nodejs/raw/master/f/0003-Install-=
both-binaries-and-use-libdir.patch
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +
> +---
> + configure.py     |  7 +++++++
> + tools/install.py | 31 ++++++++++++++-----------------
> + 2 files changed, 21 insertions(+), 17 deletions(-)
> +
> +diff --git a/configure.py b/configure.py
> +index cfd4207..eb26f7d 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -552,6 +552,12 @@ parser.add_option('--shared',
> +     help=3D'compile shared library for embedding node in another projec=
t. ' +
> +          '(This mode is not officially supported for regular applicatio=
ns)')
> +
> ++parser.add_option('--libdir',
> ++    action=3D'store',
> ++    dest=3D'libdir',
> ++    default=3D'lib',
> ++    help=3D'a directory to install the shared library into')
> ++
> + parser.add_option('--without-v8-platform',
> +     action=3D'store_true',
> +     dest=3D'without_v8_platform',
> +@@ -1095,6 +1101,7 @@ def configure_node(o):
> +   if options.code_cache_path:
> +     o['variables']['node_code_cache_path'] =3D options.code_cache_path
> +   o['variables']['node_shared'] =3D b(options.shared)
> ++  o['variables']['libdir'] =3D options.libdir
> +   node_module_version =3D getmoduleversion.get_version()
> +
> +   if sys.platform =3D=3D 'darwin':
> +diff --git a/tools/install.py b/tools/install.py
> +index 028c32e..bf443c4 100755
> +--- a/tools/install.py
> ++++ b/tools/install.py
> +@@ -117,26 +117,23 @@ def subdir_files(path, dest, action):
> +
> + def files(action):
> +   is_windows =3D sys.platform =3D=3D 'win32'
> +-  output_file =3D 'node'
> +   output_prefix =3D 'out/Release/'
> ++  output_libprefix =3D output_prefix
> +
> +-  if 'false' =3D=3D variables.get('node_shared'):
> +-    if is_windows:
> +-      output_file +=3D '.exe'
> ++  if is_windows:
> ++    output_bin =3D 'node.exe'
> ++    output_lib =3D 'node.dll'
> +   else:
> +-    if is_windows:
> +-      output_file +=3D '.dll'
> +-    else:
> +-      output_file =3D 'lib' + output_file + '.' + variables.get('shlib_=
suffix')
> +-      # GYP will output to lib.target except on OS X, this is hardcoded
> +-      # in its source - see the _InstallableTargetInstallPath function.
> +-      if sys.platform !=3D 'darwin':
> +-        output_prefix +=3D 'lib.target/'
> +-
> +-  if 'false' =3D=3D variables.get('node_shared'):
> +-    action([output_prefix + output_file], 'bin/' + output_file)
> +-  else:
> +-    action([output_prefix + output_file], 'lib/' + output_file)
> ++    output_bin =3D 'node'
> ++    output_lib =3D 'libnode.' + variables.get('shlib_suffix')
> ++    # GYP will output to lib.target except on OS X, this is hardcoded
> ++    # in its source - see the _InstallableTargetInstallPath function.
> ++    if sys.platform !=3D 'darwin':
> ++      output_libprefix +=3D 'lib.target/'
> ++
> ++  action([output_prefix + output_bin], 'bin/' + output_bin)
> ++  if 'true' =3D=3D variables.get('node_shared'):
> ++    action([output_libprefix + output_lib], variables.get('libdir') + '=
/' + output_lib)
> +
> +   if 'true' =3D=3D variables.get('node_use_dtrace'):
> +     action(['out/Release/node.d'], 'lib/dtrace/node.d')
> +--
> +2.23.0
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_10.17.0.bb
> index e36995c25..71a47636b 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> @@ -17,12 +17,13 @@ COMPATIBLE_HOST_riscv32 =3D "null"
>
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
> +           file://0003-Install-both-binaries-and-use-libdir.patch \
>             file://0004-Make-compatibility-with-gcc-4.8.patch \
>             file://0007-v8-don-t-override-ARM-CFLAGS.patch \
>             "
>  SRC_URI_append_class-target =3D " \
> -           file://0005-Link-atomic-library.patch \
>             file://0002-Using-native-torque.patch \
> +           file://0005-Link-atomic-library.patch \
>             "
>
>  SRC_URI[md5sum] =3D "d5a56d0abf764a91f627f0690cd4b9f3"
> @@ -57,6 +58,7 @@ PACKAGECONFIG[gyp] =3D ",,gyp-py2-native"
>  PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
>  PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>  PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
> +PACKAGECONFIG[shared] =3D "--shared"

perhaps --shared,, would be better to express the negative part as empty

>  PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
>
>  # We don't want to cross-compile during target compile,
> @@ -99,6 +101,7 @@ do_configure () {
>     ./configure --prefix=3D${prefix} --without-snapshot --shared-openssl =
\
>                 --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH'),=
 d)}" \
>                 --dest-os=3Dlinux \
> +               --libdir=3D${D}${libdir} \

Using D in configure variables seems questionable, this could break
sstate reuse.

>                 ${ARCHFLAGS} \
>                 ${PACKAGECONFIG_CONFARGS}
>  }
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

