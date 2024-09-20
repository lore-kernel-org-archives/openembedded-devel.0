Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390A9CF58E5
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 07:32:38 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.12663.1726817550560751408
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 00:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CQ2qWhb+;
 spf=pass (domain: linaro.org, ip: 209.85.128.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b747f2e2b7so14120967b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 00:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726817550; x=1727422350; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7s80g02UPFW8D358BwasLzUiCYloycuJRIJZ0oJne/Y=;
        b=CQ2qWhb+0r3txGdwgVWjH17TWkS2AEM26hoB5kt9XErFdZecoejdW5F1/L2+XI4umm
         dUQTkp7+hH686Fcs02spjMBic4rNaVPe7sTZtwWrCDNVSUTFenAuwFglluyZgw7Gu3OC
         aO8CL/N9p0jhHhQPdYPAQpDcST6XHLBjP7YqV+Jku1wWW5RF3GqZgxkvTjkr9DDezGGi
         hMeXIBZzDWqfuLO4EzypMpbi36hLdffkly6gK9rB5vtD5TeU2RDZiTo9O3NMd/PJLZwV
         b7TFPQ/MUrE7q1HZNgDxoVJQaOzLbyw7rA8mQE906084qgj82sjxgEiVWVd4A+cTiDJA
         ZxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817550; x=1727422350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s80g02UPFW8D358BwasLzUiCYloycuJRIJZ0oJne/Y=;
        b=AfKgyt76sEUA8DZMJFUkda8FaPilNHABhLnFGruen7XXGh8N7ogb/fqynCyKJWLAcy
         ls+Ez0oMhOH6LV+Ch6p69tvCjaO98jRhXd+ggXUA2tRX10Gr5abTlMoEhA7fj675PPP0
         MrLtgiGHQeLR2JpwlnVmEm5QhDn4nZ+iE1qBN/KwwYd9ILulTsJMihWwdmbsa0IcbH8R
         dCSF+2E2Mfrfn1g6DfL1gSvCQEzQQteV7i4e27tTNipNQxmI8/xHmRHM2A3QsDfdsfYz
         RDTUyoWhQr3tn5wlpbWf2W9fJH4vi3WXaxDjdMB5dq/zPaIX3H3tq2fe9mkR51E6B5rQ
         ZqBQ==
X-Gm-Message-State: AOJu0YxEFIJqxBy+PkGJt6kqSssC/gyU81Ki62UtRsUt7utocGZL/flf
	wLWOp5VbAgrd8QD4MUvwinMV2F+TUnwA5sRPQ1D1trojGoJM5+G53xWenk6/ekmun1GchrWzoMV
	uCqLeXyCNngX5QjrXdjpqrZimnyOvcih3XSliSw==
X-Google-Smtp-Source: AGHT+IGoQB40lwgIfVfftMYQU4JEchDS4cnjZrClSS/+gmne+9oiLlaFm1Jp/VjlhadZDm0wyFEvWxkDi1VclrfO/nM=
X-Received: by 2002:a05:690c:3344:b0:6db:de99:288a with SMTP id
 00721157ae682-6dfeed8555emr20232967b3.27.1726817549665; Fri, 20 Sep 2024
 00:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240920065823.260243-1-quic_raghuvar@quicinc.com>
In-Reply-To: <20240920065823.260243-1-quic_raghuvar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Sep 2024 09:32:18 +0200
Message-ID: <CAA8EJpoac94U9u=CWqYJ=mrvf7YA0ENVSsKWABOOVLj6GKS2XQ@mail.gmail.com>
Subject: Re: [PATCH] android-tools-adbd.service: Update ConditionPathExists to /etc
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 07:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112395

On Fri, 20 Sept 2024 at 08:58, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
>
> To ensure android-tools-adbd.service starts at boot, the path
> for ConditionPathExists must be present at build time. /etc is
> more suitable for build-time files than /var, which is for
> runtime files. Changed ConditionPathExists from
> /var/usb-debugging-enabled to /etc/usb-debugging-enabled
>
> CC: Khem Raj <raj.khem@gmail.com>
> CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>

NAK. We know that after this one the layer will be inconsistent. And
you know that. So you need to pick up two more. Please send all three
of them as a single series for backport.

> ---
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

