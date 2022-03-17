Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD7BC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 22:43:31 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.3071.1647557010611782058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 15:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vl431EFb;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id jq9so5386315qvb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 15:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NiFN2dE0KFvzahF/3sRU3Uy6SelIVmNuujAtsEPYJWc=;
        b=Vl431EFbS36fhjQJX60I3uVHIiZgt6FIQQPrupt9RaJQbVdMesQdGLZPz7S5rDTYao
         n8DJ96uvwxjj5hD1TxjKvB32JPpBaiAxubzLbPuZ7Y00whZICI5k0Hd+0QhJofkYWkjj
         u5K716NR1CuVY/9GTTZ38ETn91TIjUsaL1t3flXoojd/w+s/hQDe0Wo/NYHbpOpppIlB
         hvVOY/TD+ZgsdwYhQkUFAb5L0BZV6RIXddxSyVdVU3BeFfEq+zHNe2xx7tWyX1eZRdCY
         ntghpro7xTz+eYbgADmkTC3yi655rmREfzfpuZOtaHeraU27Mk6UjxRhDfLqKxGlnN6K
         sLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NiFN2dE0KFvzahF/3sRU3Uy6SelIVmNuujAtsEPYJWc=;
        b=OL5WsT3quh43XjBTy18WuXN9c3RLb8L6UvZNOn8E2+CNpRM7E+tXhO4+7LswvJeRhi
         1iFIZCiA1itvlgpy+dsn7Yq8Qnmn9XLrTEunjgRgbeC7qVoVoepMt1DtloCdw0Tp3B7w
         zrhRxNzTAnWt7M0YlSjM6QQyatIH1qlUsM7+hboNXKaDwXak90xnMmkuWI+pULy1RcxR
         SD8RERLuNp5xZjORlGztM4/cgD9Y0Ty2FAgfXS7vCjulVfuMpxXnTH1MRN+6DchNi5Lo
         zXDVfZ4yaJv2LP/a7V6Ii0YJ2ZrEBsmStRkuxJSapt5zDu14H8RKxHCZj4Gi1SiQmUtI
         S7/g==
X-Gm-Message-State: AOAM533odH9m6Di0HvV7q3kmcwQm6NQ8OXsvLkETyny7NuyfrKpCHAjT
	K3SMAwC+SbhRi0eUo48vjCLuuRnn2DZyyFMTEkMabHSIJ4M=
X-Google-Smtp-Source: 
 ABdhPJy0SzL1IEH5Vc9wL5/49XugFQIDVSJFmDO3o5BB02/vZbr7XP0uTdQ9vJ16pcbYIq4xYC9H/DArdmCxYI6UbYk=
X-Received: by 2002:a05:6214:248b:b0:435:d123:d05e with SMTP id
 gi11-20020a056214248b00b00435d123d05emr5335225qvb.36.1647557009566; Thu, 17
 Mar 2022 15:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <0d9e4784-b18a-d99c-f3ef-79f1a40cf1db@mvista.com>
In-Reply-To: <0d9e4784-b18a-d99c-f3ef-79f1a40cf1db@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 15:43:03 -0700
Message-ID: 
 <CAMKF1sq6RP5SSFP0w-jWpZUth5GuAvpThVx=3KVGmQfve_pMoA@mail.gmail.com>
Subject: Re: honister merge request March 17th
To: akuster <akuster@mvista.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 22:43:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96048

Done, Thanks Armin.

On Thu, Mar 17, 2022 at 7:49 AM akuster <akuster@mvista.com> wrote:
>
> The following changes since commit 0fb490a08ce30b47a5ccd2fdc3448b08e0d9e4e9:
>
>    syslog-ng: adjust control socket location (2022-02-20 12:32:26 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to 061b7fc74f887454251307ef119b808a90654d3f:
>
>    imagemagick: update SRC_URI branch to main (2022-03-15 07:38:00 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        pw-am.sh: update to new patcwork system
>
> Jeremy A. Puhlman (1):
>        cdrkit: remove ${PN} from ${PN}-dev RDEPENDS
>
> Kartikey Rameshbhai Parmar (1):
>        imagemagick: update SRC_URI branch to main
>
>   contrib/pw-am.sh                                          | 2 +-
>   meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb        | 2 ++
>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 2 +-
>   3 files changed, 4 insertions(+), 2 deletions(-)

