Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id CFD1E795D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Sep 2018 08:14:20 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id n6-v6so17076867qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Sep 2018 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ukJO6q5YUuv9hcS/jE6jEyORWJK1lnIXYlfUEyqFrg=;
	b=jnnxvgpMcBH6V4a0qZvVPrKxSNjxskJAIWB/n2PxGFmbpZV+7Xqwkv5Ybr4MixPaEH
	hE/ijfiI0jrpPLIvdrh2k2/+t/FCOzSkDorrxl9adE5yQFWYsyH5jByLTc9EtzOpM8mU
	ypvSa2RE+EVPzPAwWFSTZATJ9OerbmRqCzQiP4jX8V76hvrG9powDqNrnWPjH2Im4NY1
	ydFFeYG8U0G+r0dlRwQfAstbZ6BPFQexcFG++pr45qBW+3jS7xvHcLkMUzorlq3sc3Ga
	uGBJj+503cEbKk2TYgy4nNkD6OKWkkvngxlRB7cDp7MW/nEux1b+inYz8qSsEMWo4NUs
	rCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ukJO6q5YUuv9hcS/jE6jEyORWJK1lnIXYlfUEyqFrg=;
	b=ONdiGX9VTQse/ADNIZkL36VtAKBy7+vfxik4ZuHeUU92MOHWmyLsKr8s+cIpW1zLvI
	uFOwZn+jVTqUHRkdQow9LHE+rShh06Tj0Z+Sap9aq/+zs4iTkcxVOYsgi0WQjEF2sAFf
	O+waPhq3j80TXIn+ROS0SGSobRUDk8SgXDuOlWTYXMLG2w+qeQOpsRBJ7IR0L275Uw+t
	9tWs6C+rcIvTgqjg3eHmryPIXImVXro4OM2MGCPoCjvYKI7/3EeEp9GcuPNKIfxcczz4
	PBwHLfLltg69gEFVkjRCZ2spmrJvYkOK19hlcQPWAi50C5H1vEGfHqNtL01rudqypJ08
	5b5g==
X-Gm-Message-State: APzg51DYyHL82IiSO/4MA1Iq3F+Ad8eBkCFJ7LpXlCY72MS3AuDgIUXg
	wEwCgibdbFHJaT7KvN879uhb5gP7fSBNZJZrC3P3v4DS
X-Google-Smtp-Source: ANB0Vdbw9f2/18cmmtZwV+C6LD/apst7dI/cp5y/+5ywLWyXzBknsgrWQFyGJxO8dTCL11bCKY7VlyHsRAIg9ya+PtI=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr19581395qtq.161.1535789661268; 
	Sat, 01 Sep 2018 01:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180828052646.24444-1-raj.khem@gmail.com>
In-Reply-To: <20180828052646.24444-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Sep 2018 01:13:55 -0700
Message-ID: <CAMKF1sqefYXUjCK_wNqDQF6PHz-7bhN=uhGj_spPPyuu0Be-=g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: Re: [meta-python][PATCH V2 1/2] python{, 3}-m2crypto: update from 0.26.4 -> 0.30.1
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
X-List-Received-Date: Sat, 01 Sep 2018 08:14:21 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Jens

Native version of this is failing on ubuntu 14.04 hosts,  it could be
generic issue too,

http://errors.yoctoproject.org/Errors/Details/188936/

Can you check ?

On Mon, Aug 27, 2018 at 10:26 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Jens Rehsack <sno@netbsd.org>
>
> Updating recipe for crypto and SSL toolkit for python and support
> python3 infrastructure of Yocto as well as the already supported
> python2 line.
>
> Refresh patches to fix devtool warnings
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>
> V2: Fix the m2crypto-0.26.4-gcc_macros.patch to not drop %import "gcc_macros.h"
>
>  ...m2crypto_0.26.4.bb => python-m2crypto.inc} | 10 +++--
>  ...k-in-sysroot-not-in-host-directories.patch | 44 +++++++++----------
>  .../cross-compile-platform.patch              | 21 +++++----
>  .../m2crypto-0.26.4-gcc_macros.patch          | 17 ++++---
>  .../python/python-m2crypto_0.30.1.bb          |  2 +
>  .../python/python3-m2crypto_0.30.1.bb         |  2 +
>  6 files changed, 52 insertions(+), 44 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-m2crypto_0.26.4.bb => python-m2crypto.inc} (87%)
>  create mode 100644 meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb b/meta-python/recipes-devtools/python/python-m2crypto.inc
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> rename to meta-python/recipes-devtools/python/python-m2crypto.inc
> index 0da4274d96..d0eaa819b1 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
> @@ -1,18 +1,20 @@
>  SUMMARY = "A Python crypto and SSL toolkit"
>  HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
>
> -LICENSE = "BSD"
> +LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-m2crypto:"
> +
>  SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
>              file://cross-compile-platform.patch \
>              file://m2crypto-0.26.4-gcc_macros.patch \
>             "
> -SRC_URI[md5sum] = "5c74c25ba8b45122318a165a3a2059ad"
> -SRC_URI[sha256sum] = "5cae7acc0b34821f8c0ddf6665e482893fe1f198ad6379e61ffa9d8e65f5c199"
> +SRC_URI[md5sum] = "7fce3cbf85eb84a669682892b935746b"
> +SRC_URI[sha256sum] = "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144bb62d38563062e7cd3fc6"
>
>  PYPI_PACKAGE = "M2Crypto"
> -inherit pypi setuptools siteinfo
> +inherit pypi siteinfo
>
>  DEPENDS += "openssl swig-native"
>  RDEPENDS_${PN} += "python-typing"
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> index c71b16fece..b339d93f75 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> +++ b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> @@ -10,30 +10,26 @@ Upstream-status: Unknown
>   setup.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> -diff --git a/setup.py b/setup.py
> -index 3407c82..15ed7cd 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -127,7 +127,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
> -                 self.openssl = os.path.join(self.openssl, 'OpenSSL')
> -         else:
> -             self.libraries = ['ssl', 'crypto']
> --            self.openssl = '/usr'
> -+            self.openssl = os.environ.get( "STAGING_DIR" )
> +Index: M2Crypto-0.30.1/setup.py
> +===================================================================
> +--- M2Crypto-0.30.1.orig/setup.py
> ++++ M2Crypto-0.30.1/setup.py
> +@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_
> +         self.set_undefined_options('build', ('bundledlls', 'bundledlls'))
>
> -     def finalize_options(self):
> -         '''Overloaded build_ext implementation to append custom openssl
> -@@ -143,8 +143,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
> -         if _openssl and os.path.isdir(_openssl):
> -             self.openssl = _openssl
> +         self.libraries = ['ssl', 'crypto']
> ++        self.openssl = os.environ.get( "STAGING_DIR" )
> +         if sys.platform == 'win32':
> +             self.libraries = ['ssleay32', 'libeay32']
> +             if self.openssl and openssl_version(self.openssl, 0x10100000, True):
> +@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_
>
> --        self.include_dirs.append(os.path.join(self.openssl, 'include'))
> --        openssl_library_dir = os.path.join(self.openssl, 'lib')
> -+        self.include_dirs.append(os.environ.get( "STAGING_INCDIR" ))
> -+        openssl_library_dir = os.environ.get( "STAGING_LIBDIR" )
> +         if self.openssl is not None:
> +             log.debug('self.openssl = %s', self.openssl)
> +-            openssl_library_dir = os.path.join(self.openssl, 'lib')
> +-            openssl_include_dir = os.path.join(self.openssl, 'include')
> ++            openssl_library_dir = os.environ.get( "STAGING_LIBDIR" )
> ++            openssl_include_dir = os.environ.get( "STAGING_INCDIR" )
>
> -         if platform.system() == "Linux":
> -             if _multiarch:  # on Fedora/RHEL it is an empty string
> ---
> -2.7.4
> -
> +             self.library_dirs.append(openssl_library_dir)
> +             self.include_dirs.append(openssl_include_dir)
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> index c6654e5402..4b64f4613c 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> +++ b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> @@ -4,27 +4,30 @@ since it pokes at the system for getting architecture values
>  Upstream-Status: Inappropriate
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: M2Crypto-0.26.0/setup.py
> +Index: M2Crypto-0.30.1/setup.py
>  ===================================================================
> ---- M2Crypto-0.26.0.orig/setup.py
> -+++ M2Crypto-0.26.0/setup.py
> -@@ -141,19 +141,6 @@ class _M2CryptoBuildExt(build_ext.build_
> -                 self.include_dirs.append(
> -                     os.path.join(self.openssl, 'include', 'openssl'))
> +--- M2Crypto-0.30.1.orig/setup.py
> ++++ M2Crypto-0.30.1/setup.py
> +@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_
> +             log.debug('self.include_dirs = %s', self.include_dirs)
> +             log.debug('self.library_dirs = %s', self.library_dirs)
>
> +-        if platform.system() == "Linux":
>  -            # For RedHat-based distros, the '-D__{arch}__' option for
>  -            # Swig needs to be normalized, particularly on i386.
>  -            mach = platform.machine().lower()
>  -            if mach in ('i386', 'i486', 'i586', 'i686'):
>  -                arch = '__i386__'
> --            elif mach in ('ppc64', 'powerpc64'):
> +-            elif mach in ('ppc64', 'powerpc64', 'ppc64le', 'ppc64el'):
>  -                arch = '__powerpc64__'
>  -            elif mach in ('ppc', 'powerpc'):
>  -                arch = '__powerpc__'
>  -            else:
>  -                arch = '__%s__' % mach
>  -            self.swig_opts.append('-D%s' % arch)
> +-            if mach in ('ppc64le', 'ppc64el'):
> +-                self.swig_opts.append('-D_CALL_ELF=2')
>  -
>           self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
> -         self.swig_opts.append('-includeall')
> -         self.swig_opts.append('-modern')
> +
> +         # Some Linux distributor has added the following line in
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> index 2d738cc94e..931c25c8ee 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> +++ b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> @@ -1,16 +1,19 @@
>  Imported from Fedora
>
> ---- M2Crypto/SWIG/_m2crypto.i  2017-09-26 11:26:33.000000000 +0200
> -+++ M2Crypto-0.26.4/SWIG/_m2crypto.i   2017-09-26 21:04:14.080330741 +0200
> -@@ -7,6 +7,7 @@
> +Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
> +===================================================================
> +--- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
> ++++ M2Crypto-0.30.1/SWIG/_m2crypto.i
> +@@ -7,7 +7,7 @@
>    * Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
>    *
>    */
> +-
>  +%import "gcc_macros.h"
> -
>   %module(threads=1) m2crypto
>   /* We really don't need threadblock (PyGILState_Ensure() etc.) anywhere.
> -@@ -15,11 +16,6 @@
> +    Disable threadallow as well, only enable it for operations likely to
> +@@ -15,11 +15,6 @@
>   %nothreadblock;
>   %nothreadallow;
>
> @@ -20,5 +23,5 @@ Imported from Fedora
>  -#endif
>  -
>   %{
> - #if __GNUC__ < 5
> - #pragma GCC diagnostic ignored "-Wunused-label"
> + #ifdef _WIN32
> + #define _WINSOCKAPI_
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
> new file mode 100644
> index 0000000000..c612fcdc58
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-m2crypto.inc
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
> new file mode 100644
> index 0000000000..4d63d4bd3a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-m2crypto.inc
> --
> 2.18.0
>

