Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7A3C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:37:57 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.50012.1674664673432810045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 08:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IO/V9ZaX;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-15fe106c7c7so15929895fac.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zE0gAu6QkEjuIMcTIHDwtvdDETFrUYn/Isd8LFDaxIw=;
        b=IO/V9ZaXWIFOB40LhVzVPTWz8RNJOwGaPFWsADnGr1Gs592p1qJQtIHw/HDp3CACsT
         15AF65pC41KWP2snEhYQW1CekChMIyxmPlgXqeU16ClldG0mnKbDVtUctPWJX5SgywbV
         FA5U3rBANF08kPFO71FWnQm1ykprUyTxV/Fzo4lR1CHBhqPl3HDMnn9viRr5lO6HhkEf
         LNZe+ecF7i4VklHHSg+zWHsLxpFxO32WMEEGntzct6k5bxtLzup1olO3UtWZ15QEcg1k
         eYFv6paLt6y3bbTTx8Dhgzxwqfjv7NNGKdRc1b0f0WgGBmqtQINX24odkQzxMC5fSccO
         TP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE0gAu6QkEjuIMcTIHDwtvdDETFrUYn/Isd8LFDaxIw=;
        b=AA1o/Whe9OOqNQpdHYMCsGwI2eX19ufZDz2VUUMoqeWxCpc/lYzNxIQKuNPMCnbBl+
         b6wDiUZdFNcU9L0eaphbdKoKQmf8AAC9viIkAnYe6hb955hsegOeywOy5O4nzj2Z4BRp
         dwBgOKyAtK5Z6+lDgLJVN/bL9iVbq01l+ohGjQSFl3iuvm/YHuYt5pUQOFVunmBBSbDJ
         UK/lOxSk+br9b9OfGpo/+kUwFMNCYH3dlo2Afvn2RK9nePIX9VE2KoZWKwXkjtVJ2RJD
         d/Ex8Xg73GkBK9NHr7QP/KYzpsJYJq/5Byw2UzXdXcOw7a+FGlnqlfzQnwjdqY/4isqx
         NWpQ==
X-Gm-Message-State: AO0yUKVwEc4kSJYFpNxrQhm32EScmP8Xzd7qCc/RxTxnHTvuxQ1B+wTJ
	XgTC51tjSBEODVENdOBCXm1tOgMCV3Ju5kOnGxc=
X-Google-Smtp-Source: AK7set8CKxvbXbppMYNsKJU7S6Q5TT04T9uNaIGqJ1kIfpU+C9ShrUaoo6J5gJ74ZjTuuzCBKBQ9SXvOn3NCb1/owCU=
X-Received: by 2002:a05:6870:5253:b0:163:35c5:e085 with SMTP id
 o19-20020a056870525300b0016335c5e085mr165091oai.55.1674664672525; Wed, 25 Jan
 2023 08:37:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674653280.git.akuster808@gmail.com> <1d2e7a6b3d36e58ed28bafbb5bdf4536c54b419b.1674653280.git.akuster808@gmail.com>
In-Reply-To: <1d2e7a6b3d36e58ed28bafbb5bdf4536c54b419b.1674653280.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2023 08:37:26 -0800
Message-ID: <CAMKF1so=E6xsjTi2z+88YW37xAdp9Eg-Ed_e9qbKBNfwpWsohA@mail.gmail.com>
Subject: Re: [oe] [langdale 34/41] Revert "waf-samba.bbclass: point
 PYTHON_CONFIG to target python3-config"
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 16:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100777

maybe you can remove 18/34 patch and this revert completely from pull.

On Wed, Jan 25, 2023 at 5:32 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> This reverts commit 4b063f93a731cd6cc486dfcbc2c2f403fd29e7f3.
>
> This is breaking builds.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-networking/classes/waf-samba.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
> index 41909788f7..9c32952f6a 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -95,7 +95,6 @@ do_configure() {
>      export STAGING_LIBDIR=${STAGING_LIBDIR}
>      export STAGING_INCDIR=${STAGING_INCDIR}
>      export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
> -    export PYTHON_CONFIG=${STAGING_EXECPREFIXDIR}/python-target-config/python3-config
>
>      CONFIG_CMD="./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile"
>      if [ "${CROSS_METHOD}" = "answer" ]; then
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100769): https://lists.openembedded.org/g/openembedded-devel/message/100769
> Mute This Topic: https://lists.openembedded.org/mt/96519901/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

