Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id C6F9C7C631
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 16:17:17 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c20so1058584qkc.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MtsEZ/cfDRhhfdRjX5GFL8VtQinJvW+leGti3o5TTAI=;
	b=npbGrbLF3ejNyoUtfDpsAwtztnkxYIQvEZtAYVDTVpra53pdRhtXAzelTzTs/ZFMHN
	n73k1utKB4cW7lEuSQOWXbvBbdcl/l3OX4nkZVKkoOrIx68pKRte61rFA7KYGfEIJOIq
	am9b6oJ685ORvEOrdyu37nX/iEwzlItM+vd2P4auSdxGN6K9W+9g8Qh4Dep/K0rNs3I6
	RTZkimFhOMK21BfUchZKLGnVLGsZ0W+wtmTrB70ntV2yYiVv3d8EEH2PJMT9S3zQZw7C
	gWJdEzTNQ7/adIuMvR98IZpgfM/5WAIdlQL6QZWB46ARCbr09dPbbtQ8UCqMir8ebC2l
	wecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MtsEZ/cfDRhhfdRjX5GFL8VtQinJvW+leGti3o5TTAI=;
	b=Sw67g9rcjnZX//3d8XvgCCL958V6zw9O8Rx3Yd4HkD0xuQFwceV6yFEcRFlyP7OAPB
	sn5uq+J4ai67uQlwzJcQcfKWc1WhkDy/LZL606HxGv0UiYTOtEliyTQvvMCAgMsaMaww
	GaQIEZcMlHdg5DC6DWIoVz2epmwU4XyrKtjdWlzhJz1U8/4ZRgeDOpP/RMpJDdVzhY9+
	8b8fIb/Kc4mrWy8sjnxF+5dMPlEXAUVI2CGfj3dS+tKRAvQG+Ek38P4TZ9Tf8PqMc5M4
	JUeiiEYp3/7ujlwhGLbValBG1EfAy+SZfxhGP9JNafllEz1RRXTD9wl91Jzi5KG0mRI7
	zMpA==
X-Gm-Message-State: APjAAAUMFjt/9MbnfI98HvC73mIRkLbagOToLwmuCL0/mUs13G1yn6MK
	C0z04OhWPi660C6L5xkHbJc/NDawQqgbDS37rlA=
X-Google-Smtp-Source: APXvYqz8RLjOwPUv7nAzEuHUT/7E1ct+MdGYgiWh9MAZiYZBB/2UCE6e06qRTI89ov0RPFwypSRV4x2elH9+qI3XJus=
X-Received: by 2002:a37:451:: with SMTP id 78mr3449707qke.315.1552666638343;
	Fri, 15 Mar 2019 09:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <1552555551-37865-1-git-send-email-hongxu.jia@windriver.com>
	<1552555551-37865-2-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1552555551-37865-2-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 09:16:52 -0700
Message-ID: <CAMKF1spo7b2DF7LY=nm4hDqC-3i1Zmt0XODVPZqdyZPWGmr-zA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python3-pillow: add 5.4.1
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
X-List-Received-Date: Fri, 15 Mar 2019 16:17:18 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build on rpi3

https://errors.yoctoproject.org/Errors/Details/232969/

On Thu, Mar 14, 2019 at 2:26 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-support-cross-compiling.patch             | 61 ++++++++++++++++++++++
>  .../python/python3-pillow_5.4.1.bb                 | 44 ++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
> new file mode 100644
> index 0000000..e862934
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
> @@ -0,0 +1,61 @@
> +From a78411402c824668283beb94db4bf7e206a4cf60 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 14 Mar 2019 03:48:10 -0400
> +Subject: [PATCH] support cross compiling
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + setup.py | 13 +++----------
> + 1 file changed, 3 insertions(+), 10 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 79f912b..37e5827 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -50,7 +50,7 @@ _LIB_IMAGING = (
> +     "ZipEncode", "TiffDecode", "Jpeg2KDecode", "Jpeg2KEncode", "BoxBlur",
> +     "QuantPngQuant", "codec_fd")
> +
> +-DEBUG = False
> ++DEBUG = True
> +
> +
> + class DependencyException(Exception):
> +@@ -345,21 +345,16 @@ class pil_build_ext(build_ext):
> +                     _add_directory(library_dirs, match.group(1))
> +
> +         # include, rpath, if set as environment variables:
> +-        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE'):
> ++        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
> +             if k in os.environ:
> +                 for d in os.environ[k].split(os.path.pathsep):
> +                     _add_directory(include_dirs, d)
> +
> +-        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB'):
> ++        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
> +             if k in os.environ:
> +                 for d in os.environ[k].split(os.path.pathsep):
> +                     _add_directory(library_dirs, d)
> +
> +-        prefix = sysconfig.get_config_var("prefix")
> +-        if prefix:
> +-            _add_directory(library_dirs, os.path.join(prefix, "lib"))
> +-            _add_directory(include_dirs, os.path.join(prefix, "include"))
> +-
> +         #
> +         # add platform directories
> +
> +@@ -413,8 +408,6 @@ class pil_build_ext(build_ext):
> +         elif sys.platform.startswith("linux") or \
> +                 sys.platform.startswith("gnu") or \
> +                 sys.platform.startswith("freebsd"):
> +-            for dirname in _find_library_dirs_ldconfig():
> +-                _add_directory(library_dirs, dirname)
> +             if sys.platform.startswith("linux") and \
> +                     os.environ.get('ANDROID_ROOT', None):
> +                 # termux support for android.
> +--
> +2.8.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
> new file mode 100644
> index 0000000..db656e0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "Python Imaging Library (Fork). Pillow is the friendly PIL fork by Alex \
> +Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
> +Contributors."
> +HOMEPAGE = "https://pillow.readthedocs.io"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c6379001ecb47e2a0420c40177fc1125"
> +
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=5.4.x \
> +           file://0001-support-cross-compiling.patch \
> +"
> +SRCREV ?= "f38f01bbe3a0a9f49ce592c86ff20c01c9655133"
> +
> +
> +inherit setuptools3
> +do_compile() {
> +        NO_FETCH_BUILD=1 \
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
> +        build_ext --disable-platform-guessing \
> +                  --enable-zlib \
> +                  --enable-jpeg \
> +                  --enable-tiff \
> +                  --enable-freetype \
> +                  --enable-lcms \
> +                  --enable-jpeg2000 \
> +                  --disable-webp \
> +                  --disable-webpmux \
> +                  --disable-imagequant || \
> +        bbfatal_log "'${PYTHON_PN} setup.py build_ext' execution failed."
> +}
> +
> +DEPENDS += " \
> +    zlib \
> +    jpeg \
> +    tiff \
> +    freetype \
> +    lcms \
> +    openjpeg \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.7.4
>

