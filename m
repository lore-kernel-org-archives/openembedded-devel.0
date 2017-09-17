Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 29DA47826E;
	Sun, 17 Sep 2017 09:35:23 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 189so8784587wmh.1;
	Sun, 17 Sep 2017 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nc8pQr8nkg/5sjD8qSMZOG0pc1/ksZHd64Y8jiCKiv4=;
	b=qOeNhw2xnkDmlS5RBiGveHs2/BPhFPAkEaCcz11o8AAb1p2BEBUvcRNnnw/HFX0jkR
	e9m8CEPVNELr7NWa2S5UEJc5WPInKHgqBBjzoXZDVToFC4491Naj0U0ylv+nIfHyyncU
	MvGqDO62SIJ7yrVld/hl+clWpmqy+rkpHJzP3+a5zHGVBqLxzHMz/XUWN3VvZ/9HvCwc
	RkfPN0oxgUUidRCosnUK18xhK6sHlYyOfMETT5FsVVANkqY8Mntu0NGmSJ4C8LmXhxSw
	ZliKLl9DhtbjoQr+NVb2LgAMotRSjByc/CXFmUhOrnK1mnxvtUJKkAw9qLMoOTE2nHxq
	Nw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nc8pQr8nkg/5sjD8qSMZOG0pc1/ksZHd64Y8jiCKiv4=;
	b=bmP+yuSnw0gHlglSKUgeXcOQ8ymQwtCDjsuHF6KEESglZbB2uS6f/o640Tq/mmTRuW
	GpcRonFw7RjF692CjRCIICV/djfWDlbI9xftQs21y7D3Tr3jLjkKPSfHkK6UzcMwQRnT
	xtrCD4Js8Pl6ik8v9OkDBvJHXJLPNGZGo/r5mkOFQzQYP3RxYekUY5sQ6mOWxd3pPFP0
	4jVaZkmuP+lR8m9zhqAun7mmK0PCalo/OH9RIFGTX7K3U/OGEhsfhd/eVlV2G9lYLW7J
	svFj/Y2soUAwwH4xUL6244L+iuANh0s/tx+5rj8vgjPD4+plp5UVxVLxd+w0JP+W8JR8
	kdMA==
X-Gm-Message-State: AHPjjUhy1I2HDsU03YoQHUnY5BtL2nJqzaVWZoQe/fG/DYmAvMEYxH/b
	qMddanIOL7T2CoYVT9/3cEfuFy8S5PMW3PDcSKU=
X-Google-Smtp-Source: AOwi7QBrZeo/gEUDFSldfGg7d/O7u3voO/EvNLcckJRX053BgsBC+GrUHhdvwM1T1cl1L0ljNJq9p5fJM20MtdcwhSU=
X-Received: by 10.28.73.134 with SMTP id w128mr6151020wma.141.1505640924738;
	Sun, 17 Sep 2017 02:35:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sun, 17 Sep 2017 02:35:24 -0700 (PDT)
In-Reply-To: <20170831124153.DE910236C54@git.openembedded.org>
References: <150418331295.10247.6347273124770785868@git.openembedded.org>
	<20170831124153.DE910236C54@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Sep 2017 11:35:24 +0200
Message-ID: <CA+chaQcpJeMcLs7Scu7rvL8MpCA1fzN8pDqBrKNm__gwG=Jvdw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 20/32: python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Sun, 17 Sep 2017 09:35:25 -0000
Content-Type: text/plain; charset="UTF-8"

There is one more issue with this change. It fails to build on aarch64
(e.g. raspberrypi3-64):

building 'M2Crypto._m2crypto' extension
swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
swig -python -Ipython-m2crypto/0.26.0-r0/recipe-sysroot/usr/include
-Ipython-m2crypto/0.26.0-r0/recipe-sysroot/usr/include/python2.7
-Ipython-m2crypto/0.26.0-r0/recipe-sysroot/usr/include
-Ipython-m2crypto/0.26.0-r0/recipe-sysroot/include/x86_64-linux-gnu
-includeall -modern -builtin -outdir
python-m2crypto/0.26.0-r0/M2Crypto-0.26.0/M2Crypto
-o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
python-m2crypto/0.26.0-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:53:
Error: Unable to find 'openssl/opensslconf-32.h'
error: command 'swig' failed with exit status 1
ERROR: python setup.py build execution failed.

I've reverted this change and confirmed that it built ok with
python-m2crypto_0.25.1.bb

On Thu, Aug 31, 2017 at 2:42 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> martin_jansa pushed a commit to branch master
> in repository meta-openembedded.
>
> commit f50e344cffbf0e1513308f0a2c845e21b272f1b5
> Author: Khem Raj <raj.khem@gmail.com>
> AuthorDate: Mon Aug 28 19:46:06 2017 -0700
>
>     python-m2crypto: Upgrade to 0.26.0
>
>     Use proper LICENCE file for LIC_FILES_CHKSUM
>     Update homepage to point to gitlab
>     Fix cross-build arch
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../python-m2crypto/cross-compile-platform.patch   | 30
> ++++++++++++++++++++++
>  ...2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 21 +++++++--------
>  2 files changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> b/meta-python/recipes-devtools/python/python-m2crypto/cross-
> compile-platform.patch
> new file mode 100644
> index 0000000..c6654e5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-m2crypto/cross-
> compile-platform.patch
> @@ -0,0 +1,30 @@
> +Do not compute platform, this does not work in cross compile environment
> +since it pokes at the system for getting architecture values
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: M2Crypto-0.26.0/setup.py
> +===================================================================
> +--- M2Crypto-0.26.0.orig/setup.py
> ++++ M2Crypto-0.26.0/setup.py
> +@@ -141,19 +141,6 @@ class _M2CryptoBuildExt(build_ext.build_
> +                 self.include_dirs.append(
> +                     os.path.join(self.openssl, 'include', 'openssl'))
> +
> +-            # For RedHat-based distros, the '-D__{arch}__' option for
> +-            # Swig needs to be normalized, particularly on i386.
> +-            mach = platform.machine().lower()
> +-            if mach in ('i386', 'i486', 'i586', 'i686'):
> +-                arch = '__i386__'
> +-            elif mach in ('ppc64', 'powerpc64'):
> +-                arch = '__powerpc64__'
> +-            elif mach in ('ppc', 'powerpc'):
> +-                arch = '__powerpc__'
> +-            else:
> +-                arch = '__%s__' % mach
> +-            self.swig_opts.append('-D%s' % arch)
> +-
> +         self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
> +         self.swig_opts.append('-includeall')
> +         self.swig_opts.append('-modern')
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> index 72523bd..4b4fbbb 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> @@ -1,13 +1,14 @@
>  SUMMARY = "A Python crypto and SSL toolkit"
> -HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
> +HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
>
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>
> -SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
> -SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d8784
> 4d9866ee823b4fdbc52f7e79187c2d9acef"
> -
> -SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> "
> +SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> \
> +            file://cross-compile-platform.patch \
> +           "
> +SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
> +SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f
> 0e05d3611b09ea185f68e1630530ec09ae8"
>
>  PYPI_PACKAGE = "M2Crypto"
>  inherit pypi setuptools siteinfo
> @@ -18,16 +19,16 @@ RDEPENDS_${PN} += "python-typing"
>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
> -I${STAGING_INCDIR}"
>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
>
> -inherit setuptools
> -
> -SWIG_FEATURES_x86-64 = "-D__x86_64__"
> -SWIG_FEATURES ?= ""
> +SWIG_FEATURES_x86 = "-D__i386__"
> +SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
>  export SWIG_FEATURES
>
>  # Get around a problem with swig, but only if the
>  # multilib header file exists.
>  #
>  do_compile_prepend() {
> +    ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v
> __REGISTER_PREFIX__ | grep -v __GNUC__ \
> +       | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' >
> SWIG/gcc_macros.h
>      if [ "${SITEINFO_BITS}" = "64" ];then
>          bit="64"
>      else
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

