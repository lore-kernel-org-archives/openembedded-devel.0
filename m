Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F29C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:36:20 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.14162.1633372579186703496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YHTmtaA/;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 73so17460134qki.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RhvO8pmYrkbok6HzLUUqcCW1QnIhB2XT5DxOJ161/7g=;
        b=YHTmtaA/s54NFbo6LJUB6Zx0e4/2D468pvLrGBaG4gcD2LFbFEg2NmA9irehLph+F/
         DssbClK8V4oZu7SL+TvjdDppMs7o9szMuRoqghsDbdEfZp6U+EFGXVTvQbWfuD4n6HWg
         D89NWjhVbp4isZvnwcRFPXSPN7oq7b2Y/boRKCO+iV3fmQ7K8/IMp1HAjrxemGUc+7jl
         N2u7oAP2H4TZboJ1urp1g+HCWcX18e/xwfTDoLmOWtm7s0QAmpE5gfIsdPVlDpbofRzD
         kXIZzGIVCS22D7A7va5xT9Nldlos7vHnL19GvqYeqYYxBZEHWfrrCgRCAuZr5dz5xf5a
         ggZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhvO8pmYrkbok6HzLUUqcCW1QnIhB2XT5DxOJ161/7g=;
        b=np1Ae2qbhgVsK0emAAeQ/LEbGbLqolD9LTHg6QZNaytCxOffibC1zFK0d5Rz1skwE4
         7uBqDY3AUQIhDrWAdPp02S0rKtqeyCGVryWj8vWp1YAJAI75lKB9Owld5OzB4N+NwkB0
         XWvNnxv04xRG/VhFhJ6loolsiNI8TB0kJXkJzsbDipATR9nZGjLvABv3Kekfy9sauu4V
         DjsTk4ZPmb5yEK7YTS1YliIJiGHa0gPYs1WOaVq+QdosadDU/kODo7UA83KnZdzbsFME
         QK3AmWjZXIym3EY4zrngoylc7lTvYUXzUNJZBQp8vcftjILrCU5OW4RtANKbtleDnKoh
         Wl7g==
X-Gm-Message-State: AOAM532ev7UfFZ8varE6f0Q1PU2DlLPNFvnIMfDALAR82CYxkJ2pCzRb
	QVh8d1qnuJjxHUg8ypsL3XQGkOw13y6h4I4/eXU=
X-Google-Smtp-Source: 
 ABdhPJwJgKictd2l5Uc2Si4RKLZYOHNuHRdbyqyPJKoyf/CIFbMMYqThgG5zf5rDWWFt5zCeb1r9ZCz5bfbXQ7p7xxA=
X-Received: by 2002:a37:618c:: with SMTP id
 v134mr11610951qkb.231.1633372578205;
 Mon, 04 Oct 2021 11:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <91c42cda-e056-7291-789a-985a95761a5e@gmail.com>
In-Reply-To: <91c42cda-e056-7291-789a-985a95761a5e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Oct 2021 11:35:52 -0700
Message-ID: 
 <CAMKF1sopHKMG_WbDxkf8CwriDVfL2WFuoebXYetawXf43uF-Mg@mail.gmail.com>
Subject: Re: dunfell merge request Oct 4th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Oct 2021 18:36:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93196

merged now thank you

On Mon, Oct 4, 2021 at 8:30 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 2e7e98cd0cb82db214b13224c71134b9335a719b:
>
>   dnsmasq: Security fix CVE-2021-3448 (2021-09-10 15:16:48 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 3cf22d15885cf0e3e16078705e9a20f3d21f12db:
>
>   tcpdump: Update CVE-2020-8037 tag (2021-10-01 14:49:10 -0700)
>
> ----------------------------------------------------------------
> Marek Vasut (1):
>       dstat: Add missing python-six runtime dependency
>
> Neetika Singh (1):
>       c-ares: Add fix for CVE-2021-3672
>
> Purushottam Choudhary (1):
>       tcpdump: Update CVE-2020-8037 tag
>
> wangmy (1):
>       apache2: upgrade 2.4.48 -> 2.4.49
>
>  ...1-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch |   1 +
>  .../ares_expand_name-fix-formatting-and-handling-of-root.patch  | 115
> ++++++++++++++++++++++++++++
>  .../c-ares/ares_expand_name-should-escape-more-characters.patch |  90
> ++++++++++++++++++++++
>  meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb                 |   2 +
>  meta-oe/recipes-support/dstat/dstat_0.7.4.bb                    |   2 +-
>  .../apache2/{apache2_2.4.48.bb => apache2_2.4.49.bb}            |   3 +-
>  6 files changed, 210 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.48.bb =>
> apache2_2.4.49.bb} (98%)
>

