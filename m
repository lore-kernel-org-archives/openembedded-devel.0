Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1C108783AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 11:08:09 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id k12so2076348uag.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B1dqxMDydTZcF2GN1/b1xylxv29lxSeu1HfaLMkD4oE=;
	b=RpXeO5+0ADyzscOEDSO1MXOgqy82V+0UzDpjR0un41buw2sI4s9L6CDA1Gt96VUUBv
	aohwQuO091h2Zt23ovApnLeN5v3ArWMnN+ZdyoF4d79H/NS1yqV5d6cnLw66ZX1ktSnG
	ssq6p/F6HlX1lCdPegYUXJEWT189IxBEIcGT+f+SKQy/kxLm+TNzMFV2lQ6fYLwvxSl6
	z2Ak50IYi7wIZ+aGzTrZA6Cpa4bAaDd6l3SOyxwdSH6I8U6pKjq9SCmPBKELai203PM/
	mYtNtGF0j69FrofcmxAji8SitGm1CYV35qr3AjyoOwIkcA+IyNxSZeb4kH0AYgAKOGOW
	k9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B1dqxMDydTZcF2GN1/b1xylxv29lxSeu1HfaLMkD4oE=;
	b=PauS4jKgwSzuQLiQ4feSB1ddk9Qsz//2N4RTF54dHpvEf1hvfDlqCKsnAd8FvKNtli
	0RJsAspKprVP/EjxJe3u85ctlVT1ckb4Ebo7MQNmpejwCKZ1TlmYW6R+KNI+oYD3QtpH
	v+oinefuRiX5nfxUOiHuOFekfufjbb/uzLOpePpHKOaq8qpDvlTXGGJa9Ow1hv5Sruvd
	63+dLvb3/hWxR7YUvwIxxH9drYVVaF4br2ALBOpew5unvJ8pe9IFRqINuAAh447gFsFv
	2g61XeilYKIl5i+o0crL2Ee47fY76R2hTfqLsvCuQNsLt/63G3zwgWZdBk/FeOa+iu/Q
	9MwA==
X-Gm-Message-State: AHYfb5hDcP1Ozj3LGVP2G7x+QU/OcZVp/QdmRVGk5BeGYBKl6Ovhpcb4
	INcJ45zJAGNc9dhVGxi3TxTc4G9eTccT
X-Received: by 10.176.8.194 with SMTP id o2mr8478460uaf.191.1503227290758;
	Sun, 20 Aug 2017 04:08:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sun, 20 Aug 2017 04:08:10 -0700 (PDT)
In-Reply-To: <20170819142843.4722-1-Martin.Jansa@gmail.com>
References: <20170819142843.4722-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 20 Aug 2017 13:08:10 +0200
Message-ID: <CA+chaQfmkWH4FK-XHK8c-DLLYdTK+d4OV3Oj9gm-vgnbHCSPow@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCHv2] qtbase: disable gold to work around binutils bug
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
X-List-Received-Date: Sun, 20 Aug 2017 11:08:10 -0000
Content-Type: text/plain; charset="UTF-8"

Combination of v1 and v2 is actually needed, because without -fuse-ld=bfd
it will still use gold by default even when -no-use-gold-linker is used.

I'll resend after finishing build of all qt,
because meta-qt5/recipes-qt/qt5/qtgraphicaleffects_git.bb seems to have the
same issue with security_flags.inc.

On Sat, Aug 19, 2017 at 4:28 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 8cd23a0..804a604 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -41,6 +41,27 @@ SRC_URI += "\
>  # for syncqt
>  RDEPENDS_${PN}-tools += "perl"
>
> +# workaround for gold bug:
> +# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=842304
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=21712
> +# it's triggered only in combination of gold and security_flags.inc,
> +# because security_flags.inc now enable pie by default.
> +# Adding -no-pie or changing -fuse-ld=gold to -fuse-ld=bfd
> +# works around this issue, will use -fuse-ld=bfd as it's considered
> +# binutils bug.
> +# OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/build/tests/auto/corelib/kernel/qmetatype $
> i586-oe-linux-g++  -m32 -march=i586 --sysroot=/OE/build/oe-core/
> tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/OE/build/oe-core/
> tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot
> -Wl,-O1 -fuse-ld=gold -Wl,--enable-new-dtags -o tst_qmetatype
> .obj/tst_qmetatype.o   -L/OE/build/oe-core/tmp-glibc/
> work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/lib
> -lQt5Test -lQt5Core -lpthread
> +# .obj/tst_qmetatype.o(.qtversion+0x0): error: unexpected reloc 3
> against global symbol qt_version_tag without base register in object file
> when generating a position-independent output file
> +# collect2: error: ld returned 1 exit status
> +#
> +# with -no-pie:
> +# OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/build/tests/auto/corelib/kernel/qmetatype $
> i586-oe-linux-g++ -no-pie -m32 -march=i586 --sysroot=/OE/build/oe-core/
> tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/OE/build/oe-core/
> tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot
> -Wl,-O1 -fuse-ld=gold -Wl,--enable-new-dtags -o tst_qmetatype
> .obj/tst_qmetatype.o   -L/OE/build/oe-core/tmp-glibc/
> work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/lib
> -lQt5Test -lQt5Core -lpthread
> +#
> +# with -fuse-ld=gold replaced with -fuse-ld=bfd:
> +# OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.9.
> 0+gitAUTOINC+f6b36eaafe-r0/build/tests/auto/corelib/kernel/qmetatype $
> i586-oe-linux-g++  -m32 -march=i586 --sysroot=/OE/build/oe-core/
> tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed --sysroot=/OE/build/oe-core/
> tmp-glibc/work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/recipe-sysroot
> -Wl,-O1 -fuse-ld=bfd -Wl,--enable-new-dtags -o tst_qmetatype
> .obj/tst_qmetatype.o   -L/OE/build/oe-core/tmp-glibc/
> work/i586-oe-linux/qtbase/5.9.0+gitAUTOINC+f6b36eaafe-r0/build/lib
> -lQt5Test -lQt5Core -lpthread
> +#
> +# http://errors.yoctoproject.org/Errors/Details/150329/
> +QT_CONFIG_FLAGS_GOLD_x86 = "-no-use-gold-linker"
> +
>  # separate some parts of PACKAGECONFIG which are often changed
>  PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'gl', '', d)}"
>  PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
> 'directfb', '', d)}"
> @@ -129,8 +150,9 @@ PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,
> libproxy"
>  PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
>  PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
>
> +QT_CONFIG_FLAGS_GOLD = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
>  QT_CONFIG_FLAGS += " \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> '-use-gold-linker', '-no-use-gold-linker', d)} \
> +    ${QT_CONFIG_FLAGS_GOLD} \
>      -shared \
>      -silent \
>      -no-pch \
> --
> 2.14.0
>
>

