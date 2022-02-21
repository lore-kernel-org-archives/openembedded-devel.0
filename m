Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86FFC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:00:16 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.7286.1645419615427351920
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I3zKeFMl;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id c14so29122164qvl.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1QJyVKmMTOGs6UXx/N5i/zmhckyxKDQxjrrDEsGW3J0=;
        b=I3zKeFMlgy3M6DYQbib0dvb6RFb5Nvnh9yEHxkjCGP8T4oGRh3bcY5qgpOCt6pBCBY
         lDUmLJoqOqrnONIGAu29RvOwviIkJ6uKqLDzb5X/cs9xpMug1sYXL/+VtKdupf06QMBG
         JpN897TzGGA0DmO1oFJtonyqpGAx4EREtMr40Mh6CnOTvzu1RihRRgpUqibQJcAkPacN
         BgbkLPRCtMU7x3vGjHktqIYgJoAxsUXAmHItt9HqEQwu+BtKbqAgYOiTqompbNIEPyTo
         vp58xEkHKPju1vct8liehvR8/kzoSHUdKZa0WKzCcaQ8X855QHBw7YEQx/RetxnCzu6p
         Hfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1QJyVKmMTOGs6UXx/N5i/zmhckyxKDQxjrrDEsGW3J0=;
        b=ANImCEBgB3b1coFlse7h51rVFdK7hhzhB92B/yu7wk8DSctDV+ayaRbPW507YChiC4
         3ixbCgsLwxYPCV/hL41pM6Rh1isZ0E0Qc1nTv+8ZoMo6odeXmyUJeNmETMCEwQF8xrbv
         apQc3g9WIJPj85zHUJlbpvaBiygzJJccNt2MgN0IA6Hj1In5PDhrU4R4vOxboS6g3X6R
         ecyrLPU+uv1s4ecMsJhTut30lcbSHWe9I5g/TuBWGByFdC95W9csc05tRBe9HxI2NeD+
         j5eP/BvUn0h0GP6fHyFr2AklSxNWzbfqllOioHTs5wQOJD2dbrxY/7+8uLjpnap9IXxJ
         DyvQ==
X-Gm-Message-State: AOAM5303zYhTKp1MrB/sGTvD+G9L9sNnAGoQPsYmhpVwHvPNBr9YEh9C
	FEwIuk3XDFMu9DTZbd0aINDcQ/S7ToQlIoB7Ors=
X-Google-Smtp-Source: 
 ABdhPJwcDjRjUwj5c1egvtVj2NNRoZ5DK3TM4ecNZk9UlqGB42gNZqXm5t+6GYjDhQHThsa4CIg9i4WjwcEqXXcEb2c=
X-Received: by 2002:ad4:5d4e:0:b0:429:d6fc:168b with SMTP id
 jk14-20020ad45d4e000000b00429d6fc168bmr14136694qvb.36.1645419614351; Sun, 20
 Feb 2022 21:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20220217144533.23247-1-ceggers@arri.de>
In-Reply-To: <20220217144533.23247-1-ceggers@arri.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Feb 2022 20:59:48 -0800
Message-ID: 
 <CAMKF1spNFGcvB0A=OoCu1upUSQmyEvPxXrNwrLX32tdwuHGj_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pcapplusplus: add new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95398

it seems to suffer from build race as well see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1447

 DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52 libs
| ==== Building target: Common++ ====
| Building file: src/MacAddress.cpp
| Assembler messages:
| Fatal error: can't create Obj/MacAddress.o: No such file or
directory
| make[1]: *** [Makefile:51: Obj/MacAddress.o] Error 2
| make: *** [Makefile:91: libs] Error 2
| ERROR: oe_runmake failed

On Thu, Feb 17, 2022 at 6:45 AM Christian Eggers <ceggers@arri.de> wrote:
>
> "A multiplatform C++ library for capturing, parsing and crafting of
> network packets"
>
> PcapPlusPlus uses as custom build system (shell script + Makefile).
> There were attempts for using cmake but this work has never been
> finished.
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  .../pcapplusplus/pcapplusplus_21.11.bb        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
>
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> new file mode 100644
> index 000000000000..0d2f83cf4af7
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A multiplatform C++ library for capturing, parsing and crafting of network packets"
> +HOMEPAGE = "https://pcapplusplus.github.io/"
> +BUGTRACKER = "https://github.com/seladb/PcapPlusPlus/issues"
> +SECTION = "libs/network"
> +LICENSE = "Unlicense"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
> +
> +DEPENDS = "libpcap"
> +
> +SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
> +SRCREV = "ddce58723a4ef7ab19bf1507e6323990b4d2d15e"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_CONF:libc-musl += "--musl"
> +# PcapPlusPlus uses a custom shell script for configuration
> +do_configure () {
> +    # must use the --default switch only if no other switches are set
> +    mkdir -p "${D}${prefix}"
> +    ./configure-linux.sh --install-dir "${D}${prefix}" ${EXTRA_CONF}
> +}
> +
> +do_compile () {
> +    # build only libs
> +    oe_runmake libs
> +}
> +
> +do_install () {
> +    # install script uses PKG_CONFIG_PATH as destination path for .pc files
> +    export PKG_CONFIG_PATH="${D}${libdir}/pkgconfig"
> +    oe_runmake install
> +    # remove example makefile
> +    rm -rf "${D}${prefix}/etc"
> +    # remove ${D} in .pc file
> +    sed -i "s@${D}@@g" ${D}${libdir}/pkgconfig/*.pc
> +    chown -R root:root ${D}${libdir}/pkgconfig/*.pc
> +}
> +
> +# main package is empty
> +RDEPENDS:${PN}-dev = ""
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95358): https://lists.openembedded.org/g/openembedded-devel/message/95358
> Mute This Topic: https://lists.openembedded.org/mt/89210336/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

