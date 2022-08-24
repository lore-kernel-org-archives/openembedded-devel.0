Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB887C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 00:00:15 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.18185.1661385609238053405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBf4m8r9;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-33dba2693d0so7913637b3.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ilElvC5ds+WLia5J+JL1pccX8BigXMI/uLiNRWgTutg=;
        b=RBf4m8r9vAMQNmLd5tHlymHHcrAAjB3+jbRlbx+dUVkY6LRyO3Uqxt9pwT6Je6gvuJ
         7UtrNUqDU2g7OyanVfzkSNxZTnMhBmEabVpsOR6LSLSX7hI2mrTujrDPNq7RmDqnVtYP
         wdnSgT9Qm1ll42/fdSm1vb75Hs0/P7NJdI2hErieDR8WBAdxsnIGAgA78Rs01fQiGZ95
         W9HmCgZMoivFgjOz17O3RRjxZUmTr5r5M3nMUZkRSenvEiXiZgeVRlA2EQCwcGKgKi3D
         TlDsu3/Nqp7NbhNZKn+iW6jYMvMoYH+D6+0QGFZnH2X7SG0hNlphZuuy1iZHtlx5STEt
         lQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ilElvC5ds+WLia5J+JL1pccX8BigXMI/uLiNRWgTutg=;
        b=Blbg9MiVCirNoBq4aLtpgQoheDSC6QAWxYeVfBHXAU8jJu7h14YsxUbfFkBTG9f+7P
         puNPYgdhJ82Z8d2y90FgKI/56xdGz8w+dRiXvEDCvVSVw7Da0Yz5L2M/AogwqnHrKEAH
         eHBx7ik/w+7FyatWjFl60EbvwkaAZ6mBXW7KxyiLmYdo7qenPxy8C7w91Wr7cqpA1dg+
         Q0zEBQ+/oJHdstu+fzyfXXUpyup8OcZKAPuSJo1ScoMLIOSyiIxz3A4WVp+7g1T6avGO
         uMISkDsBkQKKIW3WqyyTrt2c0qwW4qaLgrWG1mqR6gSF0PbNSlNusxZG9uwhvoOx9lIU
         cANg==
X-Gm-Message-State: ACgBeo3cV8bzeMjwBuWhfW/FqctZDaZD2cFHvIYicc1l4rgvLrzf7JCd
	WsQXyIrauCmorQBXiQasJ3xv6S9T7QmF5bXOIDo=
X-Google-Smtp-Source: 
 AA6agR5V3hletq0PT6nwfs4UF5LOC61R0rOwHoNES3TPVcSGsSW5Sruz3NliBeYgNxBeDL4V42Sr165vJyPXfrk3UXY=
X-Received: by 2002:a5b:98b:0:b0:695:8398:9f1e with SMTP id
 c11-20020a5b098b000000b0069583989f1emr1456758ybq.620.1661385607347; Wed, 24
 Aug 2022 17:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220824151157.3599-1-jlu@pengutronix.de>
In-Reply-To: <20220824151157.3599-1-jlu@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 16:59:40 -0700
Message-ID: 
 <CAMKF1sq0mctEAdw=vb2hbsp9feiNt_-SbTTjj5A=8Mkt=rckhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gensio: upgrade 2.3.1 -> 2.5.2
To: Jan Luebbe <jlu@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 00:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98424

Hi Jan

Here it fails to build for musl

https://errors.yoctoproject.org/Errors/Details/669544/

../../git/tools/gensiotool.c:47:10: fatal error: 'sys/unistd.h' file not found
#include <sys/unistd.h>

perhaps it should be just #include <unistd.h>

On Wed, Aug 24, 2022 at 8:12 AM Jan Luebbe <jlu@pengutronix.de> wrote:
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  .../gensio/{gensio_2.3.1.bb => gensio_2.5.2.bb}                 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/gensio/{gensio_2.3.1.bb => gensio_2.5.2.bb} (93%)
>
> diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
> rename to meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
> index a6e0075538c3..9e8af18e258b 100644
> --- a/meta-oe/recipes-connectivity/gensio/gensio_2.3.1.bb
> +++ b/meta-oe/recipes-connectivity/gensio/gensio_2.5.2.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
>                      file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
>                      "
>
> -SRCREV = "c500d8705c517f96e591c060105a789f053d2b7a"
> +SRCREV = "b6cd354afe6d5f63bc859c94fd3a455a3cdf0449"
>
>  SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
>
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98417): https://lists.openembedded.org/g/openembedded-devel/message/98417
> Mute This Topic: https://lists.openembedded.org/mt/93228653/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

