Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2984B762AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2015 20:32:13 +0000 (UTC)
Received: by iodd200 with SMTP id d200so168283299iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2015 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LGVJNB1uQ0OX95xxKvXtnVPZr9WjsKpm/a1nv+LYoBs=;
	b=xk7ttuk72tYvKFg1uPPqrKFDZR9pmc+1RkjxzVwKDUMo0DUvA2QIDFmv6VdjTU+5bq
	ToHM745RXbwSzz4RsVf1pwPW2QtS7rQGmfJXnsS7CaOkxldYgp3PJ3WHpALG1cMMLWrY
	Xk1O7Z0w2xdBdj2QCskDhG/ylVaLjGaY/z/FwND4r/uAlQBAbOpOgCzQsSSSsaWwrqRS
	YUfNJYJz2R+t3ii/u5kCvDxhQfd0k79B9fQhxVKCCmywF8ASahdPuhOJ6IXw6hQxcUlu
	L5co3fmJfaksD663DK9LfPRVJdgf4AAwRHhNQj+JKsGRRdd5eMe9fg6PwUinjC2mIDDM
	TV6A==
MIME-Version: 1.0
X-Received: by 10.107.135.30 with SMTP id j30mr11787012iod.148.1447014733660; 
	Sun, 08 Nov 2015 12:32:13 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Sun, 8 Nov 2015 12:32:13 -0800 (PST)
In-Reply-To: <1446980869-13083-1-git-send-email-Martin.Jansa@gmail.com>
References: <1446980869-13083-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 8 Nov 2015 21:32:13 +0100
Message-ID: <CALbNGRQk84xAEK01=RAKK3vsY5X0CTqUUAD6Sb6GXqpMEDRswg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] Revert "luajit: Upgrade to 2.1 beta1"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Nov 2015 20:32:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 8, 2015 at 12:07 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This reverts commit 2ce3086aa859178fb5f7d6db9876229c8ed5a6eb.
>
> Causes sysdig and devilspie2 build failures.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...p-automatically-this-leaves-the-stripping.patch | 33 +++++++++++
>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    | 56 ++++++++++++++++++
>  meta-oe/recipes-devtools/luajit/luajit_2.1.bb      | 67 ----------------------
>  3 files changed, 89 insertions(+), 67 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
>  create mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>  delete mode 100644 meta-oe/recipes-devtools/luajit/luajit_2.1.bb
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
> new file mode 100644
> index 0000000..f123b3f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
> @@ -0,0 +1,33 @@
> +From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 10 May 2013 10:42:45 -0700
> +Subject: [PATCH] Do not strip automatically, this leaves the stripping
> + busines to OE
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/Makefile |    2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 278324a..5ecd6d5 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -665,12 +665,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
> + $(LUAJIT_SO): $(LJVMCORE_O)
> +       $(E) "DYNLINK   $@"
> +       $(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
> +-      $(Q)$(TARGET_STRIP) $@
> +
> + $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
> +       $(E) "LINK      $@"
> +       $(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
> +-      $(Q)$(TARGET_STRIP) $@
> +       $(E) "OK        Successfully built LuaJIT"
> +
> + ##############################################################################
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> new file mode 100644
> index 0000000..4a15a4e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
> @@ -0,0 +1,56 @@
> +SUMMARY = "Just-In-Time Compiler for Lua"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3992f1fbae3b8b061f9056b7fcda8cc6"
> +HOMEPAGE = "http://luajit.org"
> +
> +SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
> +           file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> +"
> +SRC_URI[md5sum] = "dd9c38307f2223a504cbfb96e477eca0"
> +SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746beef1807d"
> +
> +S = "${WORKDIR}/LuaJIT-${PV}"
> +
> +inherit pkgconfig binconfig
> +
> +BBCLASSEXTEND = "native"
> +
> +do_configure_prepend() {
> +    sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
> +    sed -i 's:MULTILIB= lib:MULTILIB= ${baselib}:g' ${S}/Makefile
> +}
> +
> +EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
> +                TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
> +                TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
> +                TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
> +EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
> +EXTRA_OEMAKE_append_x86 = ' HOST_CC="${BUILD_CC} -m32"'
> +EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
> +EXTRA_OEMAKE_append_powerpc64 = ' HOST_CC="${BUILD_CC}"'
> +EXTRA_OEMAKE_append_arm = ' HOST_CC="${BUILD_CC} -m32"'
> +EXTRA_OEMAKE_append_mips64 = ' HOST_CC="${BUILD_CC} -m32"'
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    oe_runmake 'DESTDIR=${D}' install
> +    rmdir ${D}${datadir}/lua/5.* \
> +          ${D}${datadir}/lua \
> +          ${D}${libdir}/lua/5.* \
> +          ${D}${libdir}/lua
> +}
> +
> +PACKAGES += 'luajit-common'
> +
> +FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
> +    ${libdir}/libluajit-5.1.so.${PV} \
> +"
> +FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> +    ${libdir}/libluajit-5.1.so \
> +    ${libdir}/pkgconfig/luajit.pc \
> +"
> +FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> +
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> deleted file mode 100644
> index 5cee532..0000000
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -SUMMARY = "Just-In-Time Compiler for Lua"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3992f1fbae3b8b061f9056b7fcda8cc6"
> -HOMEPAGE = "http://luajit.org"
> -
> -SRCREV = "776c6935ed807fc3b1ee6cd89a0cf682ffb7e9de"
> -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v${PV} \
> -"
> -
> -SPIN = ".0-beta1"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit pkgconfig binconfig
> -
> -BBCLASSEXTEND = "native"
> -
> -do_configure_prepend() {
> -    sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
> -    sed -i 's:MULTILIB= lib:MULTILIB= ${baselib}:g' ${S}/Makefile
> -}
> -
> -EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
> -                TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
> -                TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
> -                TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_STRIP="/bin/echo"'
> -
Would it be a big issue to re-add comment below - I was not aware of
the build host requirements and there could be other users
> -# Important note: On the build machine bit compatible glibc-dev and libgcc must
> -# be installed. E.g if the target architecture has 32 bit (see '-m32' below),
> -# 32 bit versions of glibc-dev/libgcc (e.g glibc-devel.i686 / libgcc.i686 on
> -# fedora) are required.
> -#
> -# Otherwise the following error occurs:
> -# | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or directory
> -# |  # include <gnu/stubs-32.h>
> -
Andreas

