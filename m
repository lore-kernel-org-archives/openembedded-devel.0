Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38CBC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 20:16:42 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.879.1643833001949128582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Feb 2022 12:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KU9dBjOt;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id r14so301191qtt.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Feb 2022 12:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yQxV3YxFNHTww+YxEvF9X2xO5F/3qnir/Ia70NMhWLw=;
        b=KU9dBjOtmGiY+XqAXFt44j3BZgYt+Qh64sD0D7CCoBBjF9MiV1TCdJeUK2feKLhXF5
         N5QqG21IxtRW5POVRscYPx/7+VVtrA8De5tHVoYTDWocyUbx6TRAZNWLLOCOjnjfDutE
         0mYdGkK9q4L5jvKxCbPd46v9RmSAot2iKHz4gpcM8r/mb199GYHsXsLUUNFrvLxRFoeZ
         nqd5rbgCGbBvtd8di8AKu6NNbVUuj4Q/SuoZxErZg/l00KyN38e0RZXbQVHvAwg5bMt/
         DiUWEghMLP7vcN3J4cNwQczmKFp8TpzIuzingrJ2KMlYLNnz0ZgNREIr2CkpmfXVPofR
         myPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQxV3YxFNHTww+YxEvF9X2xO5F/3qnir/Ia70NMhWLw=;
        b=joU3GFkFWLy+gYwN1oIeKEmMiBuEIojswHypt9bCOpPWgd9TYsC0yL5tfl4turd5kI
         d0pFbioEzi/MpPjOXnKGs64NCdMrdFMO1MRngu+Fkmd4r4Ri4M088zaCgjAJbuVvVLQR
         avcYeHsEbo0AEHr6iSIJVFPGCVusxLd2Ubol/hKnIj1fVw/yD8btt1GzyzqCdno7lnyj
         8PWtwUxpGa0E4P3i41IA9RsUN/ekgV7PCN3eYlIFfCaTvCjSLX6JHeuXBZ6Ed3PTbtJF
         nJZ/Dc4VPZrCZ+z/lQslTjyjJrsImDyJxhOFu9wu5KcQc4z4W9wZof2HzAfD6+wK+I/0
         Rs1A==
X-Gm-Message-State: AOAM531fVmF3UbbspjAmot8nuFNKMEbjZI5WawAOzwyKx3PpSxHwgv9e
	s2UcaOJ0+9jtgx4M79vf/8BQvRLIgu3YDTn+DCQGjd0o8247qg==
X-Google-Smtp-Source: 
 ABdhPJy6+UQrlyq6bRb9CQxoTdlEpky/Li04S5cPHCzITsvy1pJQLvCm8NhzFgRDcWE2/rCVo4IiLp9ubWXrDGniY7g=
X-Received: by 2002:a05:622a:d:: with SMTP id
 x13mr24550580qtw.54.1643833000793;
 Wed, 02 Feb 2022 12:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20220201163507.1320861-1-ross.burton@arm.com>
 <20220201163507.1320861-3-ross.burton@arm.com>
In-Reply-To: <20220201163507.1320861-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Feb 2022 12:16:15 -0800
Message-ID: 
 <CAMKF1srRuUc033=PpkfiK3AQWRrLch6KTSKYXo7Ar4HiWnmCuA@mail.gmail.com>
Subject: Re: [oe] [PATCH 03/14] concurrencykit: enable 32- and 64-bit Arm
 targets
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Feb 2022 20:16:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95213

On Tue, Feb 1, 2022 at 8:35 AM Ross Burton <ross@burtonini.com> wrote:
>
> As per upstream, 32- and 64-bit Arm targets are supported.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> index 8d04507b09..0018064119 100644
> --- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
>
>  S = "${WORKDIR}/git"
>
> -COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64).*-linux*"
> +COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64).*-linux*"
>

this perhaps is fine with gcc but its failing on arm/clang see
https://errors.yoctoproject.org/Errors/Details/623894/

>  inherit autotools-brokensep
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95188): https://lists.openembedded.org/g/openembedded-devel/message/95188
> Mute This Topic: https://lists.openembedded.org/mt/88836819/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

