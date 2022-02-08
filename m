Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6926BC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:59:11 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.13996.1644339550568598942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+dGNci1;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id c189so14181741qkg.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kgOn+13zSXfrqBKsEw6LLT4GYk2JZTAPcfRWq0g2fPs=;
        b=M+dGNci1YzdykRmNsm84URthSMTYYfaFtKM+S6fFkhl7g/qDad+sy7YKYiE+CqV0Hx
         Li4gNNISQZaNNqT4W12sLJzETKifZUSEPGNNEzkEYTTQqu7Ub1QkbVnUpfg5gPu4eCVR
         OEWZnx9Og3y9rXcz2S4Lu6HdaQ56tpA4tjOeFDliYS0FJO0hgDeYWFc0b2FfpF3GaMf3
         F8Vh3jBULhMH8cV6nZWpb5ycYI/nBz/SA/iLA1SIz5el32hWudoRFl27m/0JSuUwwwC+
         1NOkExPbGEo8OFcp/pg4GJzlQLy/ypdMBzpaQCcVtBk+U4bkzyzlJEZ4vW2+hJdneNfB
         GmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kgOn+13zSXfrqBKsEw6LLT4GYk2JZTAPcfRWq0g2fPs=;
        b=zX7uq0B2R7mmDiYRCFQd6tQmaD83nCW8voxjE6uZUSnSYCGGN8IJE1lMow66Lm0F2A
         rG0BIm2TddTj6VhNEFTvnp9PVPVV8okNDJIcvbQy4ZG+3SCPQbzJM5SyvYbTC616uBRX
         IJL+nHzLV8mXVTZbwN+bgewDABmLoqm7rqpEPXHoCLH+kYSv+lIrw0LU2Bt3IP6Ik/hM
         U19NiQF9VdoEp5Bbfp5/BlwNzaApuiIAmMh+T2pP1y/92ai2Ao+1IMJAX74Qnk37gH9u
         jxNKXQz8rvReT4uha9KGMtPFh02mXIdGF/09SFLKt715rNNgakYzsxeaSKvXqvgyWs+q
         KiZA==
X-Gm-Message-State: AOAM531HyPn1f4TO8iKrHwxZCmqxqfJZDfWUrKUWN6YxodkNmRDsFt65
	Rwy7dyJwtVX1MSERZYO1UtzDVra9XbhivFFQT6s=
X-Google-Smtp-Source: 
 ABdhPJxKJGaGkKdqch/nnpwCQmz7DXVA+628cEEoUTd6S/0dGDeYr60KTN8BxXAMZtZFmk6Nv4j6OyORoTuGceWVRfo=
X-Received: by 2002:a05:620a:152b:: with SMTP id
 n11mr3081159qkk.463.1644339549587;
 Tue, 08 Feb 2022 08:59:09 -0800 (PST)
MIME-Version: 1.0
References: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
 <1644279908-4266-4-git-send-email-wangmy@fujitsu.com>
 <48a2f8fb-9ef6-81ab-57d6-6fc9e8eec471@windriver.com>
In-Reply-To: <48a2f8fb-9ef6-81ab-57d6-6fc9e8eec471@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 08:58:43 -0800
Message-ID: 
 <CAMKF1spUqUjWF1OC+kGSDay==968VSUgUM2Z6TieTuSH20t=qQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.4 -> 5.9.5
To: Yi Zhao <yi.zhao@windriver.com>
Cc: wangmy <wangmy@fujitsu.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 16:59:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95271

On Mon, Feb 7, 2022 at 11:57 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> It failed to startup on my qemux86-64.
>
> I got a segfault with swanctl:
> $ /usr/sbin/charon-systemd &
> $ /usr/sbin/swanctl --load-all --noprompt
> no files found matching '/etc/swanctl/conf.d/*.conf'
> no authorities found, 0 unloaded
> no pools found, 0 unloaded
> no connections found, 0 unloaded
> Segmentation fault

Thanks for report. I will drop it from master-next

>
>
> //Yi
>
>
> On 2/8/22 08:25, wangmy wrote:
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >   .../strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb}     | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename meta-networking/recipes-support/strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb} (99%)
> >
> > diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
> > similarity index 99%
> > rename from meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> > rename to meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
> > index 2b7a7a2410..dab2fd1497 100644
> > --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> > +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
> > @@ -13,7 +13,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
> >              file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
> >              "
> >
> > -SRC_URI[sha256sum] = "45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518"
> > +SRC_URI[sha256sum] = "983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd"
> >
> >   UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95260): https://lists.openembedded.org/g/openembedded-devel/message/95260
> Mute This Topic: https://lists.openembedded.org/mt/88986556/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

