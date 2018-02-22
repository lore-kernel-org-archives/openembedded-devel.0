Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 550CC6007A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 05:03:39 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id i6so2301827plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 21:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G5zkvV4BAhKsEZpzB58hzYt+KueFDUYVGgqG+BozXww=;
	b=mBOw1H5XUjUlA0zw5jiHkGyIRvIPCEZ2iMHXVlSCzSns+NRSAFjYszJeHdvUuJUGbH
	5+Zaig4VH2cDHUJqPZyDjYWbI0GrvaA/kMVnqnCVTeuOQWB38K7/8v0htQh1MO2Q9hmZ
	gJk2XAmRLswx6JIcROE1+zvlDaM1VFQ6dy82wEwyFTYXhQwXha48Fzd84Gp12d1Z/rxt
	tMoVJhLfcajHTT+TC0zk+O5SWd82EH2J9u5JMftshNiOkJR+eWzABfPDpqC3o3ikeg57
	Nn+psUZz50og5n4YjgUjgVMUftqGO2cz+xf6BoXgL3Cm1aHhO1GiojafakhB1xdACK+V
	L/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G5zkvV4BAhKsEZpzB58hzYt+KueFDUYVGgqG+BozXww=;
	b=HToOd3TzaLiVPHgW+oJy41m23ZCkNSWOxCVyBPHtIjU8RhMyImdC+tKhX+g7IRGmtZ
	zO6WikhuscMLBUEEEMI2HSSWRSIpE/83OmhaAoLyUPzNrPeerqurtwcJaq7UhGPfogpj
	CEf2/Hd9YFshQL9M9bnLGXvgrQaoQd++4ktL8ztH8ePCeMwAkp2GhI7LCoO877NbS6Yw
	tXmljLTragNoO+LjX0jB/z1POKbxgPNnhLclqOangB1WE19feLMFSovI+Paj4CB6xCHY
	Ckqt1KRywJhpMWhln5tjVVDuFPyQeQGp+SBkCq+A47kBdJVrheE74Do0fHNvZHMjM2p5
	4+9w==
X-Gm-Message-State: APf1xPCDuKlCyklMxfdvl3aFoCdyMwByoLIGRwIBZhBEWwTXGgpqWIG3
	maOpmfqO2rmP0Id/qUxazx3o7s7hHSEyn4C0Z00=
X-Google-Smtp-Source: AH8x224X5yNe4oLxRdF0Yx4zz7oti+lC7e2A/aY32WshXnCtIJ3YkGNAgzeC8rQt8yGoMNUHkpoViXGuAFMbBs7qLJE=
X-Received: by 2002:a17:902:328:: with SMTP id
	37-v6mr5467494pld.398.1519275820280; 
	Wed, 21 Feb 2018 21:03:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Wed, 21 Feb 2018 21:03:09 -0800 (PST)
In-Reply-To: <20180222042940.3770-1-raj.khem@gmail.com>
References: <20180222042940.3770-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Feb 2018 21:03:09 -0800
Message-ID: <CAMKF1sqKiK3YOJrCL+2jHaXY00j8ZmLsbvH+adQtKf12_8r+nw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Thu, 22 Feb 2018 05:03:39 -0000
Content-Type: text/plain; charset="UTF-8"

this patch is resent because now its rebased on top of master-next

On Wed, Feb 21, 2018 at 8:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes no-x11 builds (eglfs)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
>  ...mon-gcc-base.conf-Use-I-instead-of-isyste.patch | 36 ++++++++++++++++++++++
>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>  3 files changed, 38 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
>
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> index 20e24eb..5fa24d3 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -34,6 +34,7 @@ SRC_URI += "\
>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
>  "
>
>  # common for qtbase-native and nativesdk-qtbase
> diff --git a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> new file mode 100644
> index 0000000..44e9009
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
> @@ -0,0 +1,36 @@
> +From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 14 Feb 2018 17:08:43 -0800
> +Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
> +
> +-isystem fails to build when code uses include_next on certain files e.g.
> +
> +qtbase/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
> + #include_next <stdlib.h>
> +               ^~~~~~~~~~
> +compilation terminated.
> +make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + mkspecs/common/gcc-base.conf | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
> +index 234f71d495..ee3da023e6 100644
> +--- a/mkspecs/common/gcc-base.conf
> ++++ b/mkspecs/common/gcc-base.conf
> +@@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
> + QMAKE_CFLAGS_SHLIB         += $$QMAKE_CFLAGS_PIC
> + QMAKE_CFLAGS_STATIC_LIB    += $$QMAKE_CFLAGS_PIC
> + QMAKE_CFLAGS_APP           += $$QMAKE_CFLAGS_PIC
> +-QMAKE_CFLAGS_ISYSTEM        = -isystem
> ++QMAKE_CFLAGS_ISYSTEM        = -I
> + QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
> + QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
> + QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
> +--
> +2.16.1
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 522e261..e495b8c 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -30,6 +30,7 @@ SRC_URI += "\
>      file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
> +    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
>  "
>
>  # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
> --
> 2.16.2
>

