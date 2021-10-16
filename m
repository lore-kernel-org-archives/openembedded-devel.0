Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D0EC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:33:48 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.9984.1634387627545280670
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YMtPP1hw;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w2so11304937qtn.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BpmDwD4rDygVTKfCR+gUWtRqR6NNZms6K434kBDZ7yE=;
        b=YMtPP1hw3323/YfAbjAFNvHKm3Oc/f4ZAm5Mm3zQjphXTbQcxqanlCqqVhRKNVT57+
         sEBsId8G3fAEjDM3gHvA0ayQk0u2am54HKwLutCeVd9MhVfem/IqPSyRxT/NpYwDpJkE
         uQDYsX+03BMlbIlqii/o6JC3MWVYaAJ941EFvcLYC/LmxCoGzOfifJknX55uV2M7TNsP
         5TMPsZfWRi1tu3Ek1Tvgr6MptpUmmxkwBD72y89PSYd0S3F9wzSQd3ukcfmzWCjR0r4V
         k+dp2Ji+hUsnK7mI+ndmyKVFZWFhPWRUKQ837IOqi5vr2AaCD7Ycwvh6rXgrsD8ncEtz
         k+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BpmDwD4rDygVTKfCR+gUWtRqR6NNZms6K434kBDZ7yE=;
        b=pReB1vIrmvl/+yBiFb30vB81lgIBISN3qD8Ntu/7sFp4GAdTMmOax3157fiwwjqGRq
         i7LM6BdZ5FF7KippaSN/mOpKmI+9FiuD1TPfIvW3VB8rxQkk7h/qGgrfnsvDnUnum4QW
         ZCNFLpzettuE8+Jao87SE5XfIaOvyB/oCEHZ8kq9ok/lX8q9RELJZyTzdTCZ9YE3B00i
         kmlW/Esjm8ta2TGtL6QkWVfVpSsPezSP4NE2+XqMlrmocBPNfrJ901vMqfPHs56QGCkn
         z3ok3EI28X6deGxzRULpQa9O8WaIfr0BA7hbcZOpGzV4tiRVV1rQfzbqlgefYaD/jHfn
         aiqw==
X-Gm-Message-State: AOAM5301XKxrveLJDLamR58FXBVs5n2azZKXRN0mvN8Trd8GWOcuUFsf
	I0JQQq1KETcFbUGPQHF3kmuJmltnoglS8O4Y3E7OTlRtTMAQBw==
X-Google-Smtp-Source: 
 ABdhPJxaGygxqcsIhD8/+BBi8YQyik98Gqn7vYUTbcPPXVJ3cPUMmuIXEOkh1etgPJK3G9MNIGd3Rv/bqIDnjDnMC0k=
X-Received: by 2002:a05:622a:1114:: with SMTP id
 e20mr16089592qty.225.1634387626543;
 Sat, 16 Oct 2021 05:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211015225621.4162756-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211015225621.4162756-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Oct 2021 05:33:20 -0700
Message-ID: 
 <CAMKF1sq+W11Qs68xWHnHWbo+t_mqJPeXNrBvWnWNYsq2gRixNQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyatspi: update to 2.38.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:33:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93397

this fails to fetch

https://errors.yoctoproject.org/Errors/Details/612598/

On Fri, Oct 15, 2021 at 3:56 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{python3-pyatspi_2.34.0.bb => python3-pyatspi_2.38.1.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pyatspi_2.34.0.bb => python3-pyatspi_2.38.1.bb} (94%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
> index 1368b923d..bfccd73ac 100644
> --- a/meta-python/recipes-devtools/python/python3-pyatspi_2.34.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
>  DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
>
>  SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=mainline"
> -SRCREV = "cc99d68db66174f4499b9b325bc788393b972edd"
> +SRCREV = "6d5f47ee8e8a36140b52bf52fe954a131a0aa5dd"
>  S = "${WORKDIR}/git"
>
>  # Same restriction as gtk+
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93356): https://lists.openembedded.org/g/openembedded-devel/message/93356
> Mute This Topic: https://lists.openembedded.org/mt/86361671/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

