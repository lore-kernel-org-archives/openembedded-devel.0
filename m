Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71D6C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 04:03:50 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.2357.1657080230012546776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 21:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1bvynqT;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id r2so16650279qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 21:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9l3onShHFhNsadplI1VswwbNyXi27l8b6XwdRBsl/xQ=;
        b=a1bvynqTvIWrXiPZl3lpKXP59aDCbnG6ico9Yoy65x8K9HXBDsjKf5FKfDw6GFCvIE
         PHtht7Zr12CXFZNjgXoEf8U3C+OMgBDT5E9QRG7IF313IDqt6oyw7aFA6PQ/XxWRcwPr
         BbmcaYZN/IEua4r/B+bvkib/Dm2GYLL5QiDj4NLMxQdED/ncuAtiurj5JEJe+DGH4Vgv
         QS15FcwGni4BX6PRCBjHrJePievj4HvW8FzETRMFM7yaYXQdtevT09EmROXccIkbJbX9
         aMlFRLUGu0ldiYxu/Gba61wFycwH3nY41g93P6YCOpQhOcqPyJf56hlI+9Za5TCEgoRs
         J6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9l3onShHFhNsadplI1VswwbNyXi27l8b6XwdRBsl/xQ=;
        b=DUAXVTaI7LYqNEPSyRHVYaVyhCujU1sfKq7xSIN2BkQ7QRGbdsP00hZ4dDeMEq09W+
         8ZBe6BmtDeWp5P7yc61nGtMTmcA3Xic6WRrFvERUg/BysVw9IPcpovnAWn4p6abwVOI9
         3YPMZU7wdhhGQT4/dGOKpI3NyahubVs57RGWgN/F5LwAEBC0OK5Ck9V5foWOZjtvaQ49
         dQXTF6rGCwBCiPZhlnrqxXBh7Matz2kdqUUMtWPexoBZ3EX3jaOvomneiYWqjW6TVW3l
         WjOyenfd3VPMFeEoBppXpg+jvd20oXW4QPfJjn/t/k9LsLaNsqM75zMJWWPBm6HocUnZ
         pbIg==
X-Gm-Message-State: AJIora9JBVK8QHEJMMd4i7Wwy9E9L6cn1eMTItM6sdnQk8E1ENGiDGtl
	X4tYftqyWBaZG+atbdEzLHuelfBLuk2Y5Db+80c=
X-Google-Smtp-Source: 
 AGRyM1sJJQkM8msTsOejfDVvy9SMxzUMW391kBWlbDFi/FG5lYC5TKPrh9tWTkea0MCtywcyCA+emdddqFpzZkRsudY=
X-Received: by 2002:a05:622a:13ce:b0:31a:b4ce:1679 with SMTP id
 p14-20020a05622a13ce00b0031ab4ce1679mr31362501qtk.330.1657080228937; Tue, 05
 Jul 2022 21:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
 <1656925643-8143-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1656925643-8143-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2022 00:03:22 -0400
Message-ID: 
 <CAMKF1soqr4KgXuYFSzoCNQ0F4efaVqcCgqCO2oWLVGYn89JGuw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] bats: upgrade 1.6.1 -> 1.7.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 04:03:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97720

On Mon, Jul 4, 2022 at 5:07 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Changelog:https://github.com/bats-core/bats-core/releases/tag/v1.7.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-test/bats/{bats_1.6.1.bb => bats_1.7.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-test/bats/{bats_1.6.1.bb => bats_1.7.0.bb} (94%)
>
> diff --git a/meta-oe/recipes-test/bats/bats_1.6.1.bb b/meta-oe/recipes-test/bats/bats_1.7.0.bb
> similarity index 94%
> rename from meta-oe/recipes-test/bats/bats_1.6.1.bb
> rename to meta-oe/recipes-test/bats/bats_1.7.0.bb
> index 7d72a5198..56b47959d 100644
> --- a/meta-oe/recipes-test/bats/bats_1.6.1.bb
> +++ b/meta-oe/recipes-test/bats/bats_1.7.0.bb
> @@ -10,8 +10,8 @@ SRC_URI = "\
>    git://github.com/bats-core/bats-core.git;branch=version/1.6.x;protocol=https \

this would need branch= to be updated as well to perhaps 1.7.x
currently it fails to build

stdio: ERROR: bats-1.7.0-r0 do_fetch: Fetcher failure: Unable to find
revision 410dd229a5ed005c68167cc90ed0712ad2a1c909 in branch
version/1.6.x even from upstream


>    "
>
> -# v1.6.1
> -SRCREV = "1977254c2a7faa2e0af17355856f91dc471d1daa"
> +# v1.7.0
> +SRCREV = "410dd229a5ed005c68167cc90ed0712ad2a1c909"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97683): https://lists.openembedded.org/g/openembedded-devel/message/97683
> Mute This Topic: https://lists.openembedded.org/mt/92161465/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

