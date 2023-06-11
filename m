Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5550C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:33:07 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.39615.1686501179502469757
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eWnlkuzL;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6b28fc460bcso1830646a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686501179; x=1689093179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsC8EaLyK/1Oa5fGoFFAnVJNQl7gaCGNHAUB7s4Q7Tw=;
        b=eWnlkuzLh9HsB7TY80CohoIeS2xPgHO/9aaC3wV/EQBV3op8lAxqSgUi6YgJdvDsIo
         VLNBMEkB5imAKAMeR325Su691Tbovczuv3Va0MibqOGi+IDKG6H+Vcy38eBiPVYbiamJ
         In2xXv4joz+ECLg7h85rAOU+aAHM9+X6dZnrfLWisWWLizJL9TBtm+KcSWXEco6wPrbf
         6bYQmZ8n1xOrGHXtuEKR7rMBbj5kyfZGVtei59NvBUxuiSrIZIkghNYp0hZfkmMh8C0k
         HWPsC5+v+lnQLj06f9HRq+w0g7NZdekJcHQkZ/r5hQOVVwTl/JI853Mn0XRNkN7jPfvV
         XMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686501179; x=1689093179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsC8EaLyK/1Oa5fGoFFAnVJNQl7gaCGNHAUB7s4Q7Tw=;
        b=BvIqQYWpLtBAiQXwEZNE8oCUCN/BVOuu6oYyIP975pJw29HFFBhsxkUXRekmV55mmI
         mwa5Zg1qqL6t72DnqAPnYtcop7RWVp5u9yYYkXgTiubc3+D878eRvT/8Z01lslQrAUpk
         wQC1NyR0DX5ZjEtwhTWdzCqZMxvhyHm2X1GZu2AFFBVN3eJDQOoz9nIFR9UGEY0EBkho
         Y0o/U4hczsiRh69UAPIw/uFROpClSRjYQNRHQGY7mDIp8PPxjZHC1unG5LcSWAX4/En0
         w1Lo8QbpZBq5+40oMxJ6YQc4YG+P5qAFev0EoLMaDfmkOC7bOH4V7G3Nrv00scQ29jGE
         reVg==
X-Gm-Message-State: AC+VfDyEM8Ny4nll2dNQGk/sud7wNIbKag37G2YVX/SrKBidCtiH8gH5
	8y6BqGN88U36IdaJaaEB4txz0TsuIx/a/QqfUElOo9AeqQ8=
X-Google-Smtp-Source: ACHHUZ4BC7xAK2v+SvUaFNZNqoJxKfNgtItKQBmsFv5IbfU4SMVWAGP68nys86LoBmrdELaM0hAPXpWn2D/sg/bC32A=
X-Received: by 2002:a05:6808:49a:b0:39b:e5fe:abe8 with SMTP id
 z26-20020a056808049a00b0039be5feabe8mr2496008oid.50.1686501177144; Sun, 11
 Jun 2023 09:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230611160530.392975-1-mhei@heimpold.de>
In-Reply-To: <20230611160530.392975-1-mhei@heimpold.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2023 09:32:31 -0700
Message-ID: <CAMKF1srQwuXQV8QLTCfYmDKfm-iTDXNjLTJKFxN+umTrq3tOPw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
To: Michael Heimpold <mhei@heimpold.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 16:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103207

On Sun, Jun 11, 2023 at 9:05=E2=80=AFAM Michael Heimpold <mhei@heimpold.de>=
 wrote:
>
> If my git skills don't trick me, forcing ARM mode for PHP
> dates back to year 2015 with commit e836f8f93.
>
> I wondered whether the compile problem still persists and just
> tested that it compiles fine for qemuarm nowaydays.
>
> I also tested the binaries on a physical device, a
> NXP iMX6ULL based one, and did not notice any problems
> so far.
>
> Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> ---
>  meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb b/meta-oe/recipes-=
devtools/php/php_8.2.6.bb
> index dad955452..404ff393b 100644
> --- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> @@ -284,12 +284,3 @@ do_install:append:class-native() {
>      create_wrapper ${D}${bindir}/php \
>          PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
>  }
> -
> -# Fails to build with thumb-1 (qemuarm)
> -# | {standard input}: Assembler messages:
> -# | {standard input}:3719: Error: selected processor does not support Th=
umb mode `smull r0,r2,r9,r3'
> -# | {standard input}:3720: Error: unshifted register required -- `sub r2=
,r2,r0,asr#31'
> -# | {standard input}:3796: Error: selected processor does not support Th=
umb mode `smull r0,r2,r3,r3'
> -# | {standard input}:3797: Error: unshifted register required -- `sub r2=
,r2,r0,asr#31'
> -# | make: *** [ext/standard/math.lo] Error 1
> -ARM_INSTRUCTION_SET =3D "arm"

Martin explained it well, it was seen with thumb1 ISA some armv6 and
all armv7+ uses thumb2 ISA along with standard ARM ISA
Testing this will need armv4/armv5 perhaps you can limit this to
armv5/arm4 arches

ARM_INSTRUCTION_SET:armv5 =3D "arm"
ARM_INSTRUCTION_SET:armv4 =3D "arm"

If you can test it on armv5 and ensure that it works there too now a
days then we can remove it completely

> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103205): https://lists.openembedded.org/g/openembedde=
d-devel/message/103205
> Mute This Topic: https://lists.openembedded.org/mt/99465975/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

