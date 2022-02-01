Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C585FC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 18:11:16 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.52084.1643739076168428833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 10:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f3QUTNzt;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id k9so16721321qvv.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 10:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wLEKXniUzTNch03ocqi26BYbcOkcXxVEnPgh57WfKdU=;
        b=f3QUTNztpgC7jGR/6FLXuzrme8bmtuZjdHjQSgeqOQXf6geEDxmksIAW50fGOVNBjj
         ZsVpvBse89nXg8AdQxbg5X0FU8dcF2d09ylqjAXRcQwEcg6pteoCzR6Oq/AaKjWjOqNl
         oLZ83vIq7Lq9UbkI/eE/SeyCoGPv1F9W/dAXzLHofH+DlhCCTB9G3qvYQOsQZZ64LuNQ
         kbvT4actLNbZyd7MvLH2mF21F6qgHxkdeNsPrDd7gqsxUBBjNNcB7anKCYxJeao2XSEk
         dagkrf25abEB4v4sSp5eNDCsOaHiXmJe0MEc6eZ9fugbzVZYKrOHvl+zkmTIwffIec9M
         w16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wLEKXniUzTNch03ocqi26BYbcOkcXxVEnPgh57WfKdU=;
        b=8CEMhOSKzDLq25nQQZDCF2Iu4iTp72KrwDyKkXYp9NROX1VuVKxnGP8XZwLasNCrt5
         B5H3esaFraSoFnrAeujYSZPPrXzsCvo7SKLmJ4eSP94WXHEFlGfGPbAB+d8Ib2hirARr
         JHf8paqBeaOrHI5TVpb5ClN4aN3UY5hDD8bB9fPg3YE+jKP+yP51VGHnVV6Wa+wtHUPT
         yMqGNQ++hpE0uOxEOqbRlaCG22mteU8XFj/7ZDSEl1oYpMDgekG6ixs3KXTtsBEhR0iU
         bEFE5MPEPNd7sSXKwcfvAoFTBtgJXN60YplS720kAtHZ6yimuLAPh/cwUVxn/6+4DVnJ
         k6KA==
X-Gm-Message-State: AOAM530roeDZkr84q4052jOP+ZqzavgMOJDqFk1WZHwpvLgw6leM6eQ2
	4dxFzZtmcMUl2M5fav8VjbukavpfOXc0s+oXhokfIgCD
X-Google-Smtp-Source: 
 ABdhPJxFr+gBfbZyS2SI9zWmqx14uvEmofwsunG3pN84nplyTuum2MzHwfXMWik2r4UgjRUFQFOyNnqp+20oM+qnX+4=
X-Received: by 2002:a05:6214:2306:: with SMTP id
 gc6mr555593qvb.63.1643739074898;
 Tue, 01 Feb 2022 10:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201165248.1329459-1-ross.burton@arm.com>
In-Reply-To: <20220201165248.1329459-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Feb 2022 10:10:48 -0800
Message-ID: 
 <CAMKF1srakWaXoSHgwziHgRX3MkK_TFZdG5YvMDxUJ1k5weWr+g@mail.gmail.com>
Subject: Re: [oe] [PATCH] fwupd-efi: upgrade to 1.2
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 18:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95203

On Tue, Feb 1, 2022 at 8:52 AM Ross Burton <ross@burtonini.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch           | 10 +++++-----
>  .../fwupd/{fwupd-efi_1.1.bb => fwupd-efi_1.2.bb}       |  3 +--
>  2 files changed, 6 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.1.bb => fwupd-efi_1.2.bb} (91%)
>
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
> index ac345f2752..6fd2eca941 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
> @@ -20,7 +20,7 @@ index e42b365..4831a48 100755
>   import sys
>   import argparse
>  @@ -19,7 +20,7 @@ def _generate_sbat(args):
> -     FWUPD_URL = "https://github.com/fwupd/fwupd"
> +     FWUPD_URL = "https://github.com/fwupd/fwupd-efi"
>
>       subprocess.run(
>  -        [args.cc, "-x", "c", "-c", "-o", args.outfile, "/dev/null"], check=True
> @@ -32,13 +32,13 @@ diff --git a/efi/meson.build b/efi/meson.build
>  index 68ea4aa..dcf0d43 100644
>  --- a/efi/meson.build
>  +++ b/efi/meson.build
> -@@ -184,7 +184,7 @@ o_file5 = custom_target('fwup-sbat.o',
> +@@ -187,7 +187,7 @@ o_file5 = custom_target('fwup-sbat.o',
>                           command : [
> -                           join_paths(meson.current_source_dir(), 'generate_sbat.py'),
> +                           generate_sbat,
>                             '@OUTPUT@',
>  -                          '--cc', efi_cc,
>  +                          '--cc', ' '.join(efi_cc),
> -                           '--objcopy', efi_objcopy,
> +                           '--objcopy', objcopy,
>                             '--project-name', meson.project_name(),
>                             '--project-version', meson.project_version(),
>  diff --git a/meson_options.txt b/meson_options.txt
> @@ -49,5 +49,5 @@ index d869cd2..17ef7fb 100644
>  -option('efi-cc', type : 'string', value : 'gcc', description : 'the compiler to use for EFI modules')
>  +option('efi-cc', type : 'array', value : ['gcc'], description : 'the compiler to use for EFI modules')
>   option('efi-ld', type : 'string', value : 'ld', description : 'the linker to use for EFI modules')
> - option('efi-objcopy', type : 'string', value : 'objcopy', description : 'the objcopy utility to use for EFI modules')

is this dropped upstream as well ?

>   option('efi-libdir', type : 'string', description : 'path to the EFI lib directory')
> + option('efi-ldsdir', type : 'string', description : 'path to the EFI lds directory')
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
> similarity index 91%
> rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
> rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
> index 2165b42293..b88db2e53c 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>  SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
>             file://cc.patch"
> -SRCREV = "fee1b8f6473cb403b8ae7a56961ba0557e3f3efa"
> +SRCREV = "8de5918507dcc797e612aac688d6b60b90053f54"
>  S = "${WORKDIR}/git"
>
>  DEPENDS = "gnu-efi"
> @@ -20,7 +20,6 @@ SBAT_DISTRO_URL ?= ""
>
>  EXTRA_OEMESON += "-Defi-cc="${@meson_array('CC', d)}" \
>                    -Defi-ld='${HOST_PREFIX}ld' \
> -                  -Defi-objcopy='${OBJCOPY}' \
>                    -Defi-includedir=${STAGING_INCDIR}/efi \
>                    -Defi-libdir=${STAGING_LIBDIR} \
>                    -Defi_sbat_distro_id='${SBAT_DISTRO_ID}' \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95200): https://lists.openembedded.org/g/openembedded-devel/message/95200
> Mute This Topic: https://lists.openembedded.org/mt/88837329/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

