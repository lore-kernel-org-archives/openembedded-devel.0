Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9277EC433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 09:05:41 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.8377.1645261540948417192
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Feb 2022 01:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TZRezm1P;
 spf=pass (domain: gmail.com, ip: 209.85.161.52,
 mailfrom: peron.clem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so6565457ooi.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Feb 2022 01:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkNQHGgJBh++ySAQrwGCOiagOR/kLJGzrofKTI0XLZ8=;
        b=TZRezm1PpBgeGUhY4W3rDQzQFLjCf3H0eGupS746C4e0JtC6Jau/d/HAsXYGzZCs26
         u4+r+qwfVIB8wMHYePzpvkdKTpGOAj3w6fsy20VxJ39mJfJEF4k23gGvnjD5R9JFfS9R
         Ncu6PO2LIiKkRx6up3VRUijdfiXXmF0K/20Or1UD26+a5TOzIx9fPY7prGdMHYrOP2oL
         Bt2RUyYzJhyO9rrYWVypSearCQB+rpwlHFN7+2MkCz3XdM/IH1k6avLLgh0F4tFT0yHI
         688uYOoonYifaJc/Qhk8x5kqlqoI7sZrpknduKjdSFPkbOw9FIyKM6Wb7xX0yKV1vrsk
         5zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkNQHGgJBh++ySAQrwGCOiagOR/kLJGzrofKTI0XLZ8=;
        b=3SJUBFDuxcfl5/VTrQkuYy9pEptwqP3YzTPiCUtiSaDr5kx+e+oAjZ2QDbciBJVlBC
         eoOPeIf7FoNfPPhpJhAZke+fIaQZlwVh724t5Nes24x8mEO5pySAt4Oy+NqapCjB6yAu
         pOcIdFGsp0bIi6hb2GmwEIN26ShIT4yqT3JZ6IrnOqwMI2G/QmZzM+Ki5p6mc0h0ECS5
         Tx40tqaKElKvjwXKtkliJJHdEqQBheC9DVaD07rdvNqTWxxLdqpBnxkHrjmNp2GfJlst
         EIIblyhKV3cnBt1KJceTnezmAvogyo0MsccY5N5fKskW+L+Wsd4XnfPcKxYQtg6TA1x5
         9t9w==
X-Gm-Message-State: AOAM532z6E6zPbjXP9EsIt4nbOhBx8yyqzgGhwEY5GcaQmAwAUghfgXZ
	UnEFrZpM9gSoekr7OYjMqDRiq0ZA/RjEN8jwJMo=
X-Google-Smtp-Source: 
 ABdhPJzxUiVicyFnH5u0C4NIs+71wIqgq/eYZDm/RcudAzf80qiJcO+picV/FRrRO6dsFhCRcZnp2SP3aCyFRQtGd1I=
X-Received: by 2002:a05:6870:3126:b0:d3:d283:e111 with SMTP id
 v38-20020a056870312600b000d3d283e111mr3520314oaa.82.1645261540006; Sat, 19
 Feb 2022 01:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20220217144533.23247-1-ceggers@arri.de>
In-Reply-To: <20220217144533.23247-1-ceggers@arri.de>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 19 Feb 2022 10:05:29 +0100
Message-ID: 
 <CAJiuCcccjYudzAPyM0RYzkGj1pmD9Nj3Kt+cKcpbU=zRFuggBw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pcapplusplus: add new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Feb 2022 09:05:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95390

Hi Christian,

On Thu, 17 Feb 2022 at 15:45, Christian Eggers <ceggers@arri.de> wrote:
>
> "A multiplatform C++ library for capturing, parsing and crafting of
> network packets"
>
> PcapPlusPlus uses as custom build system (shell script + Makefile).
> There were attempts for using cmake but this work has never been
> finished.

Work is still ongoing by me
(https://github.com/seladb/PcapPlusPlus/pull/652), Review and help is
welcome :)

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
I think there is one fix required to build musl
https://github.com/seladb/PcapPlusPlus/commit/0607f5ccb7a26bc1567908507e46603e7c16b1ac

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

Why not use ALLOW_EMPTY here ?

> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95358): https://lists.openembedded.org/g/openembedded-devel/message/95358
> Mute This Topic: https://lists.openembedded.org/mt/89210336/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

