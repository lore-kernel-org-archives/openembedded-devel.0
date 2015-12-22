Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D36F56FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 09:35:52 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p187so101194737wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 01:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=qoXZ7sO6I/vuRh6ewUB2coim1B57T25ajaD5Yec5Jys=;
	b=RXG0Kb8n3WDYLQFBKF75/AYNambadf3ayX5VLw3fFD32Q5U7D8a4U2jPMuMseb9lYL
	K7JzeFgXjFnlbXXJTDwXiZHwhLzA7oSI0cD51z4+aouFljmQgtdQSqiCOC2vgvVi6Ldu
	fIhm2umnXj+Z72CuF1zig37wYZ2O4jXjp56hq/bXuOFdpHDR3X69AmAugB4ejw1b6hqv
	Ak0wKh3mrn9DHrEe/b1kfY9HMkPy222stLf72mHK+Zna5FRwSeIbFohQu2iJ5fnnenvg
	WmHoVlYUHwAoTd+90ARYZJ0x72gQs6I/yiLCAvxA3nlXbETcOsH1g1NO54h6e9d9IWiU
	QLGQ==
MIME-Version: 1.0
X-Received: by 10.28.195.138 with SMTP id t132mr5183660wmf.61.1450776952535;
	Tue, 22 Dec 2015 01:35:52 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 22 Dec 2015 01:35:52 -0800 (PST)
In-Reply-To: <1450758431-18974-2-git-send-email-twoerner@gmail.com>
References: <1450758431-18974-1-git-send-email-twoerner@gmail.com>
	<1450758431-18974-2-git-send-email-twoerner@gmail.com>
Date: Tue, 22 Dec 2015 01:35:52 -0800
Message-ID: <CAJ86T=X7-FxDqTZ1fJgx-sQaVUjM+Xe-E_QXe1QfXfgQMptLww@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3 1/1] nodejs: cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 09:35:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi Trevor,

On Mon, Dec 21, 2015 at 8:27 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Remove old nodejs_0.4.12 and update nodejs_0.12.7 to the latest stable
> nodejs_4.2.3.
>
> Nodejs is picky about which architectures it supports. The supported arch
> mapping required some updating to bring it up to date with the current nodejs
> code. Add COMPATIBLE_MACHINE entries so it only builds for the supported
> architectures.
>
> It appears the nodejs project removed support for ARMv5 somewhere around V8
> 3.22 or 3.23. Also, gcc 5 no longer supports -mfpu=vfpv2 (which is what the
> nodejs build thinks it should be using for ARMv5).
> See https://github.com/nodejs/node/issues/3061

Here's the link to the "official" announcement about v8 dropping
support for ARM cores without vfp2 support:

  https://groups.google.com/forum/#!topic/v8-users/aSOFbaAQvMk

"Due the increasing cost of the keeping the "no-VFPv2" port of V8
working on ARM, we are planning on making 3.17 the last V8 release
that that supports ARM chips without VFPv2. Starting with the 3.18
release, the minimal V8 requirements will increase to ARMv6 + VFPv2.
In order to simplify maintenance, we will also remove the "pre-VFP2"
ARM code from the V8 code base."

Maybe worth including that in the commit message.

Also see comments inline below.


> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../nodejs/nodejs/enable-armv5e-build.patch        | 22 ----------
>  .../nodejs/nodejs4/libev-cross-cc_0.4.12.patch     | 13 ------
>  meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  | 49 ----------------------
>  .../nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb}   | 23 ++++++----
>  4 files changed, 16 insertions(+), 91 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb} (81%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch b/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
> deleted file mode 100644
> index cc7c9ab..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Building for qemuarm without thumb enabled is using -march=armv5e which isn't
> -recognized here. Fix it by adding __ARM_ARCH_5E__.
> -
> -v0.12.2 branch of node doesn't seem to be affected, because it's using
> -different version of v8
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -diff -uNr node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h
> ---- node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h        2015-04-01 00:13:01.000000000 +0200
> -+++ node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h    2015-04-28 14:30:43.119509207 +0200
> -@@ -156,7 +156,7 @@
> -
> - // This tests against any known ARMv5 variant.
> - #elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || \
> --      defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> -+      defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> -
> - // The kernel also provides a helper function to perform an atomic
> - // compare-and-swap operation at the hard-wired address 0xffff0fc0.
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
> deleted file mode 100644
> index 2b9838f..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -diff --git a/deps/libev/wscript b/deps/libev/wscript
> -index 4f6c9a8..1796749 100644
> ---- a/deps/libev/wscript
> -+++ b/deps/libev/wscript
> -@@ -58,7 +58,7 @@ def configure(conf):
> -           return 0;
> -       }
> -   """
> --  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
> -+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
> -                 msg="Checking for SYS_clock_gettime")
> -
> -   have_librt = conf.check(lib='rt', uselib_store='RT')
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> deleted file mode 100644
> index c73cefc..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
> -HOMEPAGE = "http://nodejs.org"
> -LICENSE = "MIT & Zlib"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
> -
> -DEPENDS = "openssl"
> -
> -PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
> -
> -SRC_URI = " \
> -    http://nodejs.org/dist/node-v${PV}.tar.gz \
> -    file://libev-cross-cc_${PV}.patch \
> -"
> -SRC_URI[md5sum] = "a6375eaa43db5356bf443e25b828ae16"
> -SRC_URI[sha256sum] = "c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711e42650ccee24fce4"
> -
> -S = "${WORKDIR}/node-v${PV}"
> -
> -# v8 errors out if you have set CCACHE
> -CCACHE = ""
> -
> -do_configure () {
> -    sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
> -    sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
> -    ./configure --prefix=${prefix} --without-snapshot
> -}
> -
> -do_compile () {
> -    make
> -}
> -
> -do_install () {
> -    oe_runmake install DESTDIR=${D}
> -
> -    # fix namespace conflicts with other nodejs recipes
> -    mv ${D}${bindir}/node ${D}${bindir}/node4
> -    mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
> -
> -    mv ${D}${includedir}/node ${D}${includedir}/node4
> -
> -    mv ${D}${libdir}/node ${D}${libdir}/node4
> -    mv ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4.pc
> -    sed -i -e s:include/node:include/node4: ${D}${libdir}/pkgconfig/nodejs4.pc
> -
> -    mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
> -}
> -
> -FILES_${PN} += "${libdir}/node4/wafadmin"
> -BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> similarity index 81%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> index 41eb5ee..5ae5be2 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
> @@ -1,16 +1,24 @@
>  DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE = "http://nodejs.org"
>  LICENSE = "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
>
>  DEPENDS = "openssl"
>
> +COMPATIBLE_MACHINE = "(-)"
> +COMPATIBLE_MACHINE_x86 = "(.*)"
> +COMPATIBLE_MACHINE_x86-64 = "(.*)"
> +COMPATIBLE_MACHINE_armv7a = "(.*)"

Please blacklist armv4 and armv5 instead of whitelisting armv7a (armv6
and potential future arm targets such as armv7ve are still expected to
work. It's only armv4 and armv5 which are not).

> +COMPATIBLE_MACHINE_aarch64 = "(.*)"
> +COMPATIBLE_MACHINE_mips = "(.*)"
> +COMPATIBLE_MACHINE_powerpc = "(.*)"
> +COMPATIBLE_MACHINE_powerpc64 = "(.*)"
> +
>  SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> -    file://enable-armv5e-build.patch \
>      file://no-registry.patch \
>  "
> -SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
> -SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
> +SRC_URI[md5sum] = "529a8abd4ca5a2225636767d3f14c382"
> +SRC_URI[sha256sum] = "5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
>
>  S = "${WORKDIR}/node-v${PV}"
>
> @@ -20,10 +28,11 @@ CCACHE = ""
>  def map_nodejs_arch(a, d):
>      import re
>
> -    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
> -    elif re.match('i.86$', a): return 'ia32'
> +    if   re.match('i.86$', a): return 'ia32'
>      elif re.match('x86_64$', a): return 'x64'
> -    elif re.match('arm64$', a): return 'arm'
> +    elif re.match('aarch64$', a): return 'arm64'
> +    elif re.match('powerpc64$', a): return 'ppc64'
> +    elif re.match('powerpc$', a): return 'ppc'
>      return a
>
>  ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
> --
> 2.6.0.rc3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

