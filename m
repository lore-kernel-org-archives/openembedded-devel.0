Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56865C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 23:16:55 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.10359.1647127014059125982
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 15:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wr7WTmar;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id eq14so9912158qvb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 15:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IWNJ9gQy2/WQ2XAZqEG/bX6Z6UF/TeH8usmzU4DqcX4=;
        b=Wr7WTmarG/d1+Pxrxoc6m38zQ2ckek6qPNqI6j9sT3DThPd9GacN03jALB59f9rprr
         nayceLnb4Bkzs4BHIC3GTro6NqXfZPWFp79zM7uPaNqrw3OzgXbByIVzdPGrcCJFZC4S
         loBHC7cusDEtYobiKGNL1ZF5I8E+RA2gk36oXYiLvJ929aj/P/oxfHLymx4r6K4Xzleg
         Fyit/5rGwV5H6koWsZak6jM4IjY8mWf0nci+nOU0iph45zcAjsToTdgd060bcxC9STJP
         tpRf1nafVwX9Q1OQPXob4IY0JCINIa6XyIGNTl/QYTFw2IFYIQrtA5iVB1W46j0cHlAU
         CGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IWNJ9gQy2/WQ2XAZqEG/bX6Z6UF/TeH8usmzU4DqcX4=;
        b=wmMqwOozUzgGEvY/P1tmN7oW1PpxiED93tEAukDgzshQRQdotNJakmeL1LIjCbRFwh
         84x8u6Oh49e4bSLtwlM0K0aDwvl8gFriSgam42bwkq+kvLOAVJJ3nIh4+Og1bRGmUWRB
         PKKG7HWHBlKtzPbLudV0odIAxHyPX0DKqcyvj3/x5pgu/Ui6+lg0LiBl0VImPfwHylNV
         T5QgxSFN2/AuLQGRJutqZ390e1q3i2QVal+Y/hh6w4bAh5ma86kKzPLbbQWZjjFvDSHX
         Xy/o+YYD+4uw79woAB97l/btZi6U2N45h9qi+LZU5kHLW1LoZ2rJJIqN3q1zGRnvCAj4
         dAsQ==
X-Gm-Message-State: AOAM533g62qyP1ZI+kGGA1w0VzLokWXpLQON7BcOj7ajVYCbqDUQvhor
	OlDODPQ1Yhd2tjJEZHiCOYb67dOAH29HhM5X5fs=
X-Google-Smtp-Source: 
 ABdhPJwWcNse5ppXxTbUeHDBgs11z+Upuc0ml2vipuDjKq3Wnw1uSb9y4RynoxM7cpzbQ9HmWyPgpNM7OjgD9aZ95AI=
X-Received: by 2002:a05:6214:248b:b0:435:d123:d05e with SMTP id
 gi11-20020a056214248b00b00435d123d05emr12303404qvb.36.1647127013055; Sat, 12
 Mar 2022 15:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20220312200609.382925-1-ross.burton@arm.com>
In-Reply-To: <20220312200609.382925-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Mar 2022 15:16:27 -0800
Message-ID: 
 <CAMKF1soaoBRh1PuF2+ixAAkRTpX7GzOkf5TheQYMq2KgZ2JmHg@mail.gmail.com>
Subject: Re: [oe] [PATCH] poetry_core: update for renamed class
 pip_install_wheel to python_pep517
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 23:16:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95966

thanks, I also came to same patch huffing and puffing, I have taken
this one now.

On Sat, Mar 12, 2022 at 12:06 PM Ross Burton <ross@burtonini.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-python/classes/poetry_core.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classes/poetry_core.bbclass
> index fb37c78c78..b2b80efa4f 100644
> --- a/meta-python/classes/poetry_core.bbclass
> +++ b/meta-python/classes/poetry_core.bbclass
> @@ -1,4 +1,4 @@
> -inherit pip_install_wheel python3native setuptools3-base
> +inherit python_pep517 python3native setuptools3-base
>
>  DEPENDS += "python3-poetry-core-native"
>
> @@ -8,8 +8,8 @@ poetry_core_do_configure () {
>
>  # TODO: ideally this uses pypa/build
>  poetry_core_do_compile () {
> -    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
> +    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PEP517_WHEEL_PATH}')"
>  }
> -do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
> +do_compile[cleandirs] += "${PEP517_WHEEL_PATH}"
>
>  EXPORT_FUNCTIONS do_configure do_compile
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95963): https://lists.openembedded.org/g/openembedded-devel/message/95963
> Mute This Topic: https://lists.openembedded.org/mt/89739125/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

