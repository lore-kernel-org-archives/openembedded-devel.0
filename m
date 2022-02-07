Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57527C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 17:23:40 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.1982.1644254617147125712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oE70aV2M;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id d3so6231306qvb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+V0kATkomYkfBNeLYp1OWnqxIKZZdcq/llG3B06UNXA=;
        b=oE70aV2MKLfv5bEI5srSKh+rPdBFHcHataOqyWjuMsmLUX0k4WbqgnqMt9rvRt1B3k
         nzOqSv6wd/f20dd8jdnMaWNJSXzqSPaCxmBJ9U3UoT9cTDWAmhlrjn0GgT7XMXpO2GzY
         uLEOgJ7GANIXzeNE/neO3VwK0BEQ3SVFoy5Fqm7U7LF3jDQB4Y7tJF34u96nCkwR0Gvu
         W6ygJcf0DPclx9SxCZ8hH0Zuss9p4NALJzjcUmb167J+K2fHGEkWu/RNrzVlmC70hy/A
         UlCCy5HN94tCwvPuCncrPQh7IZZkW0tEXP/fOtsybDNe4v97+gmuV7TPz2xqEPNeHeBg
         Q1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+V0kATkomYkfBNeLYp1OWnqxIKZZdcq/llG3B06UNXA=;
        b=UkSMN5FASC93ezG/SSSktixiHpD4aIyeimTSjOO3NSoQLHaenOWU6OmMGfvdsgmvU3
         c+ejxJkxnPoAldBA12rZIQUWJXSbXd1a6eMvUf2877CRu0lE0l2n3bPVdVYRsSc0gmAA
         AQurMPMzIUjCc6+XK0Lz7ZyjSI01U+nD42wzfyhvLVwmlOMqtFv5TtK/+XVLoF8Q3NnG
         XeR+ceO9rX+wzwHIFqfpZ76UivPNFvNZO1hXzYl9M4BSfEM5vJEw+orVjekTTI9mY1X7
         SABrRQIxBWvTqVke3RT6CWvhPTTIOEodzIDc5d8DLvaw6U7yMhHXv21di+6Te/GU2US7
         KH5w==
X-Gm-Message-State: AOAM532WuHDwpvrMZYZ3eXS4hpxxdqyZKjO887bEjhHIH6K6BBmu41G7
	udYsSeEJ/O1j0BIClnPkBGJ4yGbzxNdJWz0CKpk=
X-Google-Smtp-Source: 
 ABdhPJz9pKAUrh1ggzYHIvla8Dnnxpcu7A1/jdGYacxwfwM9rT0egcnDaKSxlWGsunEUCHRt+6NNoUB7e+t0a3BV36E=
X-Received: by 2002:a05:6214:2306:: with SMTP id
 gc6mr513329qvb.63.1644254616118;
 Mon, 07 Feb 2022 09:23:36 -0800 (PST)
MIME-Version: 1.0
References: <6169bc81-eb1e-6b40-720d-da36dbcd3595@gmail.com>
In-Reply-To: <6169bc81-eb1e-6b40-720d-da36dbcd3595@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2022 09:23:10 -0800
Message-ID: 
 <CAMKF1sqRAzFvkh6OjpnaX9ctZVkmQWS2JqsPujLyRd4wrvdvgA@mail.gmail.com>
Subject: Re: honister merge request: Feb 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 17:23:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95245

On Sun, Feb 6, 2022 at 10:38 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 4647e3ea3708d30eeb0149f6d5626c9576bff520:
>
>    udisks2: upgrade 2.9.3 -> 2.9.4 (2022-01-05 08:50:39 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to c05ae80ba680887ac924c21536091be7a1173427:
>
>    tiptop: update download URL and HOMEPAGE (2022-01-29 06:44:29 -0800)
>
> ----------------------------------------------------------------
> Jan Luebbe (1):
>        snappy: use main branch to fix fetch failure
>
> Khem Raj (1):
>        python3-prctl: Use https protocol for git fetcher
>
> Leif Middelschulte (1):
>        dbus-daemon-proxy: add missing `return` statement
>
> Mingli Yu (1):
>        plymouth: switch to KillMode=mixed
>
> Tim Orling (2):
>        cmocka: use https protocol for fetching
>        tiptop: update download URL and HOMEPAGE
>
>   ...1-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch | 2 +-
>   .../plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch  | 43
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb                 | 1 +
>   meta-oe/recipes-extended/snappy/snappy_1.1.9.bb                 | 2 +-
>   meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb                 | 6 ++--
>   meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb                     | 2 +-
>   meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb      | 2 +-
>   7 files changed, 52 insertions(+), 6 deletions(-)
>   create mode 100644
> meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch
>

merged, thanks.

