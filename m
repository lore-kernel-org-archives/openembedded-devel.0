Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E5EC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 07:45:19 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.41140.1635752717179748082
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 00:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=buGvIkYW;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id gt5so3299766pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 00:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/KlNPfPlWaOdKmDMt5Neu7Izmk0Yhihq7RZ0gp0qXzM=;
        b=buGvIkYWIFZ9lfNLOkF73PPfngGs6bnHEtd7zI+J6rf1RHg6RMBn81tEIp7oL/Ta0k
         rY5H4k9XV4sk/WqtArMsQ+SpseYqPfZU9BZYl0xkGWvLCPQYHDyO70pNPjoit75RCmTA
         7rWbF+UCofob/eKkvP+k0XuckahZ+NF89gOID/IsyRJp6/PY2rxFiluhgl+dszwTFZfR
         cdM0z1ft3fCD3teB3nXJHW4mp5zYc2Er22C6pwWiMWJc0wtM+ZD2jpFxL1BmkC0JF887
         RUYwDV5GVtH+qksrw7VRq2auyubcisAvNeP20CKn+5LRnLJYI60npbBRv6Bg+bulkFGa
         aYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/KlNPfPlWaOdKmDMt5Neu7Izmk0Yhihq7RZ0gp0qXzM=;
        b=DJNOBRy+feivHHkJHUP375LVMwh9CQIAjAv4O9QkPV/sdD08YEqvo3gET1UmQEoTre
         1V4pmR9oF7NKSVzoFaNyQGOnJkr6//NIgR7kKHmFRYiTi+79xgvabzqUCezTIU7h3uTA
         Fdg487iJEX87MZFQFSznx1PMizg1cdq9r0j3HPP+F7V0Mmt/l+OQSMN1nrTE+ZiS2kua
         wooMMGMCSWa9CkEpGg2/yl/JhHEcnVxGLao35vvswz9CSYsa2ut9jHnnkFVCUiz4/+r2
         Cj/maX/xryUfqa5bqw6CWlmlJP1YwmnHR5CdWZmmSmqkJ9etCnw7ZQiQYXsztz4YYw1B
         kuKg==
X-Gm-Message-State: AOAM531r8d+gboSOEz9tXpWGxUzd7koQsTMYZTuYpYv6LXLgwElxZEC8
	q+Cp3eRJghAltUPqE1ogZp0SObAbWp4dawmqP6D0TEkvtYs=
X-Google-Smtp-Source: 
 ABdhPJxqLkgd5GXqKRGUrAs6o8G6MvdfGrrhnJmqI5xn1lW2e7q/2LD/StCz4YBgOI/TDVU29DMJRyaexSIZ21V6Ii4=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr28004373pjb.232.1635752716704;
 Mon, 01 Nov 2021 00:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211101065228.1430262-1-raj.khem@gmail.com>
 <20211101065228.1430262-4-raj.khem@gmail.com>
In-Reply-To: <20211101065228.1430262-4-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 08:45:05 +0100
Message-ID: 
 <CALbNGRR9Wc5ckuPpCm_iFkos9Xx8P+Q7yJdC_v1bWscvTWer1Q@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 4/4] gjs: Exclude from builds for now
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 07:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93693

Same give me few hours to test...

On Mon, Nov 1, 2021 at 7:52 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> It needs forward porting to mozjs91+ until its done it is not buildable
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
> index d5f10ff3f5..4942bfcbb1 100644
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
> @@ -32,3 +32,5 @@ RDEPENDS:${PN}-valgrind += "valgrind"
>  # Valgrind not yet available on rv32/rv64
>  RDEPENDS:${PN}-valgrind:remove:riscv32 = "valgrind"
>  RDEPENDS:${PN}-valgrind:remove:riscv64 = "valgrind"
> +
> +PNBLACKLIST[gjs] ?= "Needs porting to mozjs91+"
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93691): https://lists.openembedded.org/g/openembedded-devel/message/93691
> Mute This Topic: https://lists.openembedded.org/mt/86734008/3617609
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [schnitzeltony@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

