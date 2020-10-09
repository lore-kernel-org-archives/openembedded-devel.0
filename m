Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.6370.1602218107465908803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 21:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jDC171Eo;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id c2so9359603qkf.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 21:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+fxpxHH6wW/khBpgz1VIyus3kzt9vR/UNBaPEsNT1A=;
        b=jDC171EoZTRLgPelQAOcnDIkQv3bsLPeYL2mRkSX2nerDDgPJjAv6no/fK+l1PsU/p
         hoh/t3Wj0rUL0g7Pry7NumnoIngLkZhkpd/Ctv7NbbQ4SDntYFTqETmV/NFWykLR0MTS
         er0YfD++OpxWxmGJkGOLoZ385F1tTxCQ+GCa7fvShB6zfyQgz+9p8/gAxK4cKoZBShQF
         Kj+Q5yXGhWW+cAHu1r5+MVMjWwzJUvF2S61lvJaaX2QHm9RXPdwdw9y17SX3bJcw6Da6
         psvzJkuajol9Qq4vhFFciTkYdZnT/MyODM++4mmnhBY17yDup1cXztOlMV3JBZ1AP/GO
         UOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+fxpxHH6wW/khBpgz1VIyus3kzt9vR/UNBaPEsNT1A=;
        b=jzoPFMZaRwPMgd9fMJkGJDPz6TkDUpGbxy18GVt41oLYgUMou32g/JmA1EDYHGcrAi
         bEQHH6n4TRnIkVUkDx5y3rSmrN29AtwABPU+75El8c4jnSe3bmMe8VbzAPTcY71KjyYQ
         u1lgeUrGyhhdqTyR307UiRpY7f0mMmxAMBSqaySddWL4A1eYvGFUTurWcHr9w6bQywfs
         MuZTwwewSAKs1Tl3p1+LLHhcnTp2ILGz/BhhDUsxHj9LuGSRnQsVfHaO0i8F6taxI/og
         FFfLKJHqn/hN6UZ9gsM0pltBMd3vmhBXnyIY3R0CNKDduYSZj3a94oOw5FZWyU7EVIm7
         +6rQ==
X-Gm-Message-State: AOAM530JHF+jm39L4OfrV9oB6nOtK+3aZ1PTsewgtZioZF5L7XEWyoxv
	jL3YSy9naPHxkCTZMZLKOf9XCA0JESnxjepDV5o=
X-Google-Smtp-Source: ABdhPJxY6P9IyqwiGD7HlFY9si2B/G67HpeL4Blf2EuYmCwDJ8ot6Dp+voupXFJwN+aALLDIdIDqKhtF7mwrOYa625Y=
X-Received: by 2002:a37:c408:: with SMTP id d8mr10912061qki.71.1602218106516;
 Thu, 08 Oct 2020 21:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201009031546.17121-1-akuster808@gmail.com>
In-Reply-To: <20201009031546.17121-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 21:34:40 -0700
Message-ID: <CAMKF1spvz8K3LsUb0izu7fAtGW5nSTYOCV0oMaxgZzYwuJXnGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v2][PATCH] musl-nscd: add package
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 8:15 PM akuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> --
> V2]
> Drop INSANE.
> The DEBUG flag is either -g or -s. Remove -s from LDFLAGS_AUTO

can you also add it to packagegroup-meta-oe

> ---
>  .../recipes-devtools/musl/musl-nscd_git.bb    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd_git.bb
>
> diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> new file mode 100644
> index 0000000000..374f944096
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2020 Armin Kuster <akuster808@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "Musl-nscd is an implementation of the NSCD protocol, suitable for use with musl and with standard NSS modules"
> +HOMEPAGE = "https://github.com/pikhq/musl-nscd"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
> +SECTION = "utils"
> +
> +PV = "1.0.2"
> +
> +CFLAGS += "-fcommon"
> +
> +SRCREV = "8f278675e1b6a3a02c8ee1b8ca000f80570dc5d6"
> +SRC_URI = "git://github.com/pikhq/musl-nscd"
> +
> +UPSTREAM_CHECK_COMMITS = "1"
> +
> +inherit autotools-brokensep
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure () {
> +    # no debug set -s flag
> +    sed -i -e 's/LDFLAGS_AUTO=-s/LDFLAGS_AUTO=/' ${S}/configure
> +    ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    make DESTDIR=${D} install
> +}
> +
> +COMPATIBLE_HOST = ".*-musl.*"
> --
> 2.17.1
>
>
> 
>
