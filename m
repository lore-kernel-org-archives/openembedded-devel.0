Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88FCC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:13:59 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.2650.1642569238833468449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 21:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ma3h1m0q;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id c19so1315600qtx.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 21:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xXIF0bXNxjPghhtfxEVjoJfuWzCAiipcK4MQ3zwyK8Y=;
        b=Ma3h1m0q1mip2hlYyagulIJsUYjNGqrlpfA0n30rY+PXb22S455Ff2UxjBJlOFjUPn
         DlU19N2o6XMDZcSR4mgV48Huj6Bye+xQQs1jJqMn3M9GN+vbIoZSyhAAxXj0GcD9kk1m
         yyGZtU7R/jp1sDUQWACLlB9ETzRb6S/UhKzJvy7glckMqDHxjE+dSBwebNfw29MsvUrI
         XceIr675fEu0Z5F8TXN88QOJjCBaECw1o52KNk77oI0sHT/jQB8+DObsSJbsVyGYD7h9
         /EhGeR5vB4Z+1qCdmFqpnQsJu2przK53psvqxJdgJ6f64Jp/QnaqVKjUdqbVniE4amav
         IvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xXIF0bXNxjPghhtfxEVjoJfuWzCAiipcK4MQ3zwyK8Y=;
        b=6d0d7L843OR7Cb8ro4SXX+/U8AqLOTLOvYnc1rEpzV8jk0pSlbZJtPPH5F4atqpFDc
         IeJEmziG74loHNiXpwnnJGlcq2v+KYR2c3JWktfWnEpbJW03m+5TJI5NjM8T+xD22WEu
         1J2w3WB/Rxz8knEQYm5lP6tAEDpMirPM/36NF+rldETJOoOeWmPCyBbKFyGPyuJoQJtm
         qbkTf6ukkscylMpOf/7gT1scpqGYGuEXDluzE21Bm/CvIswG59akjCPpAyX8HK22KWy3
         1gOsLRu/ixHcPVsuz/RcNmWYUomiUMhdp2mcHGhhXvaiWPAqKtOJMtHY81IN6C2+PIYz
         LGBA==
X-Gm-Message-State: AOAM532eT5491REutTVh1sQFFcc7auXfYVvTvdUnBciMHgu5pzdPNgxC
	v2rEXPCpXtfpiphhM08pSijZ9+NABIiOwSCk9+U=
X-Google-Smtp-Source: 
 ABdhPJzbym91KqNW1okg3VWPAZ6jgZlWZwVuzQ5gWHd43sztq4OT6k59goSzpge9aCcPFffbPASL46lji310fHK1brU=
X-Received: by 2002:a05:622a:1350:: with SMTP id
 w16mr8012452qtk.532.1642569237808;
 Tue, 18 Jan 2022 21:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
 <20220119040759.859566-1-wak@google.com>
In-Reply-To: <20220119040759.859566-1-wak@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2022 21:13:31 -0800
Message-ID: 
 <CAMKF1srM_bJP0vJtXcY9fyzJ5p3jp2FF2FgyBYeLNi3Ay3gJjg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] jq: upgrade 1.6 -> 2021-10-24 git
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 05:13:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94934

needs these warnings to be fixed as well

WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-devtools/jq/jq_git.bb:
URL: git://github.com/stedolan/jq;protocol=https does not set any
branch parameter. The future d
efault branch used by tools and repositories is uncertain and we will
therefore soon require this is set in all git urls.
WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-devtools/jq/jq_git.bb:
URL: git://github.com/stedolan/jq;protocol=https does not set any
branch parameter. The future d
efault branch used by tools and repositories is uncertain and we will
therefore soon require this is set in all git urls.

On Tue, Jan 18, 2022 at 8:08 PM William A. Kennington III via
lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:
>
> JQ has gone through more than 3 years of code changes and has had
> significant performance improvements since the last release. The team is
> still figuring out a new release process. Use the latest git commit to
> pull in these changes.
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  .../recipes-devtools/jq/{jq_1.6.bb => jq_git.bb}    | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-devtools/jq/{jq_1.6.bb => jq_git.bb} (65%)
>
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.6.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
> similarity index 65%
> rename from meta-oe/recipes-devtools/jq/jq_1.6.bb
> rename to meta-oe/recipes-devtools/jq/jq_git.bb
> index bfaeed5fe..ef6fd1db8 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.6.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_git.bb
> @@ -6,15 +6,12 @@ HOMEPAGE = "https://stedolan.github.io/jq/"
>  BUGTRACKER = "https://github.com/stedolan/jq/issues"
>  SECTION = "utils"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=15d03e360fa7399f76d5a4359fc72cbf"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2814b59e00e7918c864fa3b6bbe049b4"
>
> -SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BP}/${BP}.tar.gz"
> -
> -UPSTREAM_CHECK_URI = "https://github.com/stedolan/${BPN}/releases"
> -UPSTREAM_CHECK_REGEX = "jq\-(?P<pver>(\d+\.\d+))(?!_\d+).tar.gz"
> -
> -SRC_URI[md5sum] = "e68fbd6a992e36f1ac48c99bbf825d6b"
> -SRC_URI[sha256sum] = "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
> +PV = "1.16+git${SRCPV}"
> +SRC_URI = "git://github.com/stedolan/jq;protocol=https"
> +SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
> +S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep
>
> --
> 2.34.1.703.g22d0c6ccf7-goog
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94933): https://lists.openembedded.org/g/openembedded-devel/message/94933
> Mute This Topic: https://lists.openembedded.org/mt/88528100/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

