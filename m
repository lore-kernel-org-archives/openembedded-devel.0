Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07B4C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:02:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.2366.1646251366530606053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AyQ1KRie;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id b13so2212824qkj.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUnkIULFp+KocWWqjJZ1Pb57Dfog0rdXUgr3OlDZ5g0=;
        b=AyQ1KRie6VDknU35e0Fs84tKlHqTfZQfsKjFMly8kKJI94CkBml/X6AVBGZpvvwtXR
         PUYGgq+DzDcurj2vqJ4NIIs97T/SbptN2wwzDp3lnXwmK+5HW9OfDcugYfNER9a99XKl
         9gsY0/KOh7EY6FK9vZMNefUOWcukMUtOpMToajFlB6MTNo0AmIZKeRxUtFwxmr1USuVX
         IXjIut9lzRhZpojgpI08GfN4S5VTEB3hv9CdnzP4l23BlwYGsZn9F90B4nuVRlQFTm/R
         BMWrUhyHeWWTZB5J1r9m3J+HqMR1IgP/esbPPXnCMaqhRseAtiWcuYD5o8CeKqZOfqEt
         D6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUnkIULFp+KocWWqjJZ1Pb57Dfog0rdXUgr3OlDZ5g0=;
        b=OJ8kMrejzPhHrYTebkbSWJ9SmVY7Cwr3uk/6HPPdjL2760usr3GLWVS+3jzyAcq8SP
         DYmElpGjNV4hlBHb14H+ZCZ1gPckyFTMC4+95C1xwNM3zHjKzi6YyC7CSTn2q50LFMSL
         IXH2HJwJO2uSK+tdnYQ7vlQXPW6HC+ux5/tiitZplO+fjqbK+zVRA0pR8Alsn/yeB1O2
         /AQigLEOKoKa7fN7FxQNHXo/Dh+sMk5GuKoYjNcRdXPnFwslK4vwW8l9o6VkbG+DLwCt
         TFPK8pAIf6fnO55nHRkODz4Zyrduw4iHhEVjHR2ONFdpT21XHddjFo7xbhaJKW78WWfs
         U7lA==
X-Gm-Message-State: AOAM533rAbG2aLSRo3L2blF1+nRpfmDboA9TmlrJ7G5fn1aBRrrGM6LU
	L1NjGdZyLTX+92kAUh5SXSG6XBQ4jndRgEsvGp4=
X-Google-Smtp-Source: 
 ABdhPJwYNQB8FE9DveoYjC/BVHJh2MdgyNNWN3RG6+KvzrV6SDXxbNS/R9B9ecU6Gcroz2LVt5gxUOWgzhNZ1Dyc2F8=
X-Received: by 2002:a37:b541:0:b0:475:4524:bb4b with SMTP id
 e62-20020a37b541000000b004754524bb4bmr17575556qkf.149.1646251365616; Wed, 02
 Mar 2022 12:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20220302195945.3818037-1-adrian.freihofer@siemens.com>
 <20220302195945.3818037-2-adrian.freihofer@siemens.com>
In-Reply-To: <20220302195945.3818037-2-adrian.freihofer@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 12:02:19 -0800
Message-ID: 
 <CAMKF1so6xS6MgDAep0K9-5ROu0jpx_QJM7H5H6L4mvOS6U6y1A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH V3 1/2] feat(meta-openembedded):
 refer to nm-1.36 branch
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:02:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95708

I think this belongs to your distro project I guess.

On Wed, Mar 2, 2022 at 12:00 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> ---
>  meta-openembedded | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openembedded b/meta-openembedded
> index cf0ed42..36019b4 160000
> --- a/meta-openembedded
> +++ b/meta-openembedded
> @@ -1 +1 @@
> -Subproject commit cf0ed4239196a76800f8c2facb5a285409b8147a
> +Subproject commit 36019b487d7854d09cdb4d39d5ba7a42725f2372
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95706): https://lists.openembedded.org/g/openembedded-devel/message/95706
> Mute This Topic: https://lists.openembedded.org/mt/89510131/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

