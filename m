Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53AFCF3968
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 10:12:38 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.14685.1726827154515609129
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 03:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T/XAKnRZ;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1d22ecf2a6so1631461276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726827153; x=1727431953; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjjCvjxN5SzWNbasoX2Ab1+XaW/VA3ESEc0AI4bj5WA=;
        b=T/XAKnRZMcZG79iNEPX2/GayB++1Ch4uC5ufwKrhze3J4AdK9cq9VMqTwJDa2G0DoD
         YEVHKpoqJYnw/WRTZWY6QBsBEx48Axmx5FFeTeW0BmQV9lHd0Ehc+jT/Jf9BoB2A7eAC
         lTlBo+SLZ04defEaVOi6ANF3Yl4DTgdef3wXRTlYo1jCr4jJMIVOJvQWoaBNLvXk+Kwi
         kF4B6VMhnOF7QCEa/B2K666HKR/pfwAGRML1nzepmmjHx49eDe5qn+jK7jfRSxuZ1ODe
         hbJ7n5UmkTrfH/FH3u6EqLDKIe6RzzG+T6saaFu2Wls8wsPsP0P/wGeFmPbHfHB1teBS
         mFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827153; x=1727431953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjjCvjxN5SzWNbasoX2Ab1+XaW/VA3ESEc0AI4bj5WA=;
        b=U2FbYc8Pp6sekndk3eQLYyfpkjWI1zsOddXLoqlnd2x1tDVqGFJzOWGDlmx5hTCDWu
         Jz0ru9yRFiyQyq7pGqmny8Yvqd02mYErHiW+1k7Y4FxwZtGIxcZK7y7QNAjxgJo4zhQP
         vrHp1L+mYcV0f/iYdeMu6Q3JHbWFe9QTHgiiowZAGw2D8x6DHqztQ7tKlGWd8OKMdTCa
         ZwzDtDp+QszX4yBXq8oS/N3ikCjp6cSttHYJ/1inIsrUuYrWgFI1alQwjcp0OYRysJjr
         BGptLVWBN9utG60mo3tfrfYZMp5EpN1t0QVWYux0pJMjQpDouybtTkSx2qLXKpAs7srG
         IlqA==
X-Gm-Message-State: AOJu0YyBw7id3yWPnK1tJ/jYfEqag4DMXm4hJbnHUossyxpAEGg+tJwE
	i3BsYF2RZO36VdGhK3FDvxjicahzr28VzMEVToboyzlibhYDQFkbScZxaIYyGcjMJRLvmAXInAE
	yBBa2QpqjHATxFHqq+YRy0kB5GVLiP1el4pb/qP3tuQYd/WtsGco=
X-Google-Smtp-Source: AGHT+IEz547k3R5dIUxooAGyhL/SdB0Ksv84ynLHZJhexrdhCsACC4ANE2B3uGYdKY5EZL6O20WPUSnP7Mjzje3qCXw=
X-Received: by 2002:a05:690c:7305:b0:6db:e280:a3ae with SMTP id
 00721157ae682-6dfeed59ab9mr22019247b3.23.1726827153642; Fri, 20 Sep 2024
 03:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240920093750.4000239-1-quic_raghuvar@quicinc.com>
In-Reply-To: <20240920093750.4000239-1-quic_raghuvar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Sep 2024 12:12:22 +0200
Message-ID: <CAA8EJprF8g43uAqdzu_KM5o-2MekEE_M_JPFmtHiD+6wxJaQ0g@mail.gmail.com>
Subject: Re: [PATCH 1/3] android-tools-adbd.service: Update
 ConditionPathExists to /etc
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 10:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112400

On Fri, 20 Sept 2024 at 11:38, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
>
> To ensure android-tools-adbd.service starts at boot, the path
> for ConditionPathExists must be present at build time. /etc is
> more suitable for build-time files than /var, which is for
> runtime files. Changed ConditionPathExists from
> /var/usb-debugging-enabled to /etc/usb-debugging-enabled

openembedded-devel ML is a home for several different layers.
README.md describes how to send patches properly (hint:
subject-prefix).

>
> Backport-of: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> CC: Khem Raj <raj.khem@gmail.com>
> CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> ---
> This is a backport of 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> from master to scarthgap.
>
>  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> index ddf8d7f74..b6661f2e3 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> @@ -1,6 +1,6 @@
>  [Unit]
>  Description=Android Debug Bridge
> -ConditionPathExists=/var/usb-debugging-enabled
> +ConditionPathExists=/etc/usb-debugging-enabled
>  Before=android-system.service
>
>  [Service]
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

