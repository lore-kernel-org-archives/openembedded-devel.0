Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
	[209.85.221.179])
	by mail.openembedded.org (Postfix) with ESMTP id CAE5961994
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 16:29:51 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id f17so894088vkk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 08:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=KS7oE2Oour3RRHIO85JvV2v3I2LAlHrqX2RGdmnTC7M=;
	b=aJDqkWwLfvEwzMT346OaJz8uWkJst8Uaxb+kpswkEYQo/b+0rxVVyTEqWeGGNzrBWu
	MNF75LBlwwLAeQAYd0wt7eiCsxlCkjT+lHIkgXGWwYsHNqKVgYf7+fxAwBCC54EQyZ5E
	vYmM/foJgeni0Hknj5y6v8jYBGnyDsKT8r57pApyZkpAP2crB7noKpS/1YBamRPo7FMF
	Xf8iCKdqiT0DwoNzU8dAWPNqtAmNje653B6s1WQCMm+fle5gmvdGMdvMn2RBZ79msjej
	zR/Ul90/hNjX6UTgOz+2jNofyCV27LlwsWXZhWZEeGfinibFrAJ2y9iqqXVJPlyritVz
	rPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=KS7oE2Oour3RRHIO85JvV2v3I2LAlHrqX2RGdmnTC7M=;
	b=B3kkVX7pHjqveISrmtKma0TQCk8cGYJwOfGK/ri9uPkgExJLcggcBE+ePMMqeTirJC
	0Jw966bMMJ+PK4aTrfBcD0ABlOdDuQmKB2OgttnCgKQEQMya6Tq+P12BkGUDVpgOW7+g
	FybBOE6o7m+AKAaZtt0pxtVHTnRIMQvppmLr1us8JbYUuX/SPrm+VwRDp4fs9kUgEv5X
	1P4Q/onf0DYUH3iwshbNS/ebfLfkfw8fPkjrlLeqPgQWM9AnXImix7K/+fdAOErWfeoe
	hMFUlYjSR6T5+2s4ZiunOMCG+kjpY/IchSBWi1Bfoy45nmKwd6zaNvTXsn7VDyOW3edM
	gBlw==
X-Gm-Message-State: ANhLgQ3wue17xDy4wVZzu42hlSmkV1lGz0UHLxyo+PNcn7aehRe8WJCk
	BbktoSH7S3TyiNnIV59ZF9mWJo43zZ6xnUbo5NGAqw==
X-Google-Smtp-Source: ADFU+vvyIGv8boJLzge+t17epPXp/eYWUwKbOlE+nxV5xbEZGGd0GazQQPKrt7D5j3YqaDKBbJCcCcsRIYqg/pPmpds=
X-Received: by 2002:ac5:cce6:: with SMTP id k6mr3382819vkn.1.1582993792308;
	Sat, 29 Feb 2020 08:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20200229101336.30490-1-alex.kanavin@gmail.com>
In-Reply-To: <20200229101336.30490-1-alex.kanavin@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Feb 2020 17:29:41 +0100
Message-ID: <CANNYZj84xRM4NCHOkQz3Q3KSLNhKEW5Ew+FGenNDXRXqr5BPkA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] python3-numpy: add from oe-core
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
X-List-Received-Date: Sat, 29 Feb 2020 16:29:52 -0000
Content-Type: text/plain; charset="UTF-8"

Please ignore this set; the recipes will stay in core for now.

Alex

On Sat, 29 Feb 2020 at 11:14, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-and-so-on-for-libraries-by-default-.patch | 70 +++++++++++++++++++
>  ...up.py-remove-the-detection-of-x86-ta.patch | 32 +++++++++
>  .../python-numpy/python-numpy.inc             | 52 ++++++++++++++
>  .../python-numpy/python3-numpy_1.17.4.bb      |  3 +
>  4 files changed, 157 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
>  create mode 100644
> meta-python/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
>  create mode 100644
> meta-python/recipes-devtools/python-numpy/python-numpy.inc
>  create mode 100644 meta-python/recipes-devtools/python-numpy/
> python3-numpy_1.17.4.bb
>
> diff --git
> a/meta-python/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> b/meta-python/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> new file mode 100644
> index 000000000..98a970583
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> @@ -0,0 +1,70 @@
> +From 672a75c8417ce08db9e31fc415ec445479231d5a Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 10 Dec 2015 13:20:30 +0200
> +Subject: [PATCH] Don't search /usr and so on for libraries by default to
> +
> + avoid host contamination.
> +
> +Upstream-Status: Inappropriate (As the code stands, this is a hack)
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + numpy/distutils/system_info.py | 42 ++++------------------------------
> + 1 file changed, 5 insertions(+), 37 deletions(-)
> +
> +diff --git a/numpy/distutils/system_info.py
> b/numpy/distutils/system_info.py
> +index ba2b1f4..f94dce1 100644
> +--- a/numpy/distutils/system_info.py
> ++++ b/numpy/distutils/system_info.py
> +@@ -278,45 +278,13 @@ if sys.platform == 'win32':
> +             add_system_root(os.path.join(conda_dir, 'Library'))
> +
> + else:
> +-    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib',
> '/usr/lib',
> +-                                 '/opt/local/lib', '/sw/lib'],
> platform_bits)
> +     default_runtime_dirs = []
> +-    default_include_dirs = ['/usr/local/include',
> +-                            '/opt/include', '/usr/include',
> +-                            # path of umfpack under macports
> +-                            '/opt/local/include/ufsparse',
> +-                            '/opt/local/include', '/sw/include',
> +-                            '/usr/include/suitesparse']
> +-    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
> +-
> +-    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
> +-                                     '/usr/lib'], platform_bits)
> +-    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
> +-                                '/usr/include']
> +-
> +-    if os.path.exists('/usr/lib/X11'):
> +-        globbed_x11_dir = glob('/usr/lib/*/libX11.so')
> +-        if globbed_x11_dir:
> +-            x11_so_dir = os.path.split(globbed_x11_dir[0])[0]
> +-            default_x11_lib_dirs.extend([x11_so_dir, '/usr/lib/X11'])
> +-            default_x11_include_dirs.extend(['/usr/lib/X11/include',
> +-                                             '/usr/include/X11'])
> +-
> +-    with open(os.devnull, 'w') as tmp:
> +-        try:
> +-            p = subprocess.Popen(["gcc", "-print-multiarch"],
> stdout=subprocess.PIPE,
> +-                         stderr=tmp)
> +-        except (OSError, DistutilsError):
> +-            # OSError if gcc is not installed, or SandboxViolation
> (DistutilsError
> +-            # subclass) if an old setuptools bug is triggered (see
> gh-3160).
> +-            pass
> +-        else:
> +-            triplet = str(p.communicate()[0].decode().strip())
> +-            if p.returncode == 0:
> +-                # gcc supports the "-print-multiarch" option
> +-                default_x11_lib_dirs += [os.path.join("/usr/lib/",
> triplet)]
> +-                default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
> ++    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
> ++    default_include_dirs = ['/deaddir/include']
> ++    default_src_dirs = ['.', '/deaddir/src']
> +
> ++    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
> ++    default_x11_include_dirs = ['/deaddir/include']
> +
> + if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
> +     default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
> diff --git
> a/meta-python/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
> b/meta-python/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
> new file mode 100644
> index 000000000..9da6a2b3d
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python-numpy/files/0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
> @@ -0,0 +1,32 @@
> +From b881e0b2ba9cf1a4aa351a1c1ea90b1e1776ce21 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 12 Aug 2019 15:37:36 +0200
> +Subject: [PATCH] numpy/random/setup.py: remove the detection of x86
> targets
> + via uname()
> +
> +This was badly breaking compilation for ARM targets (and possibly
> +other non-x86 targets); if -msse2 is desirable for x86 builds it has
> +to be passed through another channel.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + numpy/random/setup.py | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/numpy/random/setup.py b/numpy/random/setup.py
> +index a1bf3b8..60fb534 100644
> +--- a/numpy/random/setup.py
> ++++ b/numpy/random/setup.py
> +@@ -49,11 +49,6 @@ def configuration(parent_package='', top_path=None):
> +     elif not is_msvc:
> +         # Some bit generators require c99
> +         EXTRA_COMPILE_ARGS += ['-std=c99']
> +-        INTEL_LIKE = any(arch in platform.machine()
> +-                         for arch in ('x86', 'i686', 'i386', 'amd64'))
> +-        if INTEL_LIKE:
> +-            # Assumes GCC or GCC-like compiler
> +-            EXTRA_COMPILE_ARGS += ['-msse2']
> +
> +     # Use legacy integer variable sizes
> +     LEGACY_DEFS = [('NP_RANDOM_LEGACY', '1')]
> diff --git a/meta-python/recipes-devtools/python-numpy/python-numpy.inc
> b/meta-python/recipes-devtools/python-numpy/python-numpy.inc
> new file mode 100644
> index 000000000..8413434af
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python-numpy/python-numpy.inc
> @@ -0,0 +1,52 @@
> +SUMMARY = "A sophisticated Numeric Processing Package for Python"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=1a32aba007a415aa8a1c708a0e2b86a1"
> +
> +SRCNAME = "numpy"
> +
> +SRC_URI = "
> https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz
> \
> +
>  file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
> +
>  file://0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch \
> +           "
> +SRC_URI[md5sum] = "9147c3ee75e58d657b5b8b5a4f3564e0"
> +SRC_URI[sha256sum] =
> "fb0415475e673cb9a6dd816df999e0ab9f86fa3af2b1770944e7288d2bea4ac9"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +# Needed for building with gcc 4.x from centos 7
> +CFLAGS_append_class-native = " -std=c99"
> +
> +S = "${WORKDIR}/numpy-${PV}"
> +
> +CLEANBROKEN = "1"
> +
> +FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
> +
> +# install what is needed for numpy.test()
> +RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
> +                  ${PYTHON_PN}-difflib \
> +                  ${PYTHON_PN}-pprint \
> +                  ${PYTHON_PN}-pickle \
> +                  ${PYTHON_PN}-shell \
> +                  ${PYTHON_PN}-nose \
> +                  ${PYTHON_PN}-doctest \
> +                  ${PYTHON_PN}-datetime \
> +                  ${PYTHON_PN}-distutils \
> +                  ${PYTHON_PN}-misc \
> +                  ${PYTHON_PN}-mmap \
> +                  ${PYTHON_PN}-netclient \
> +                  ${PYTHON_PN}-numbers \
> +                  ${PYTHON_PN}-pydoc \
> +                  ${PYTHON_PN}-pkgutil \
> +                  ${PYTHON_PN}-email \
> +                  ${PYTHON_PN}-compression \
> +                  ${PYTHON_PN}-ctypes \
> +                  ${PYTHON_PN}-threading \
> +                  ${PYTHON_PN}-multiprocessing \
> +"
> +
> +RDEPENDS_${PN}_class-native = ""
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python-numpy/
> python3-numpy_1.17.4.bb b/meta-python/recipes-devtools/python-numpy/
> python3-numpy_1.17.4.bb
> new file mode 100644
> index 000000000..d388e88d2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python-numpy/python3-numpy_1.17.4.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-numpy.inc
> +
> --
> 2.25.1
>
>

