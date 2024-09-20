Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D16CF3974
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 10:16:08 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.14965.1726827365969892136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 03:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hB74LNS5;
 spf=pass (domain: linaro.org, ip: 209.85.219.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1d74e6c8d8so1513242276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 03:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726827365; x=1727432165; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y6rarfHUWMqOjFeWr7GCyc69O5bxXBsfLkEV+rpUMfI=;
        b=hB74LNS5EZ2Qc5mjx8TbUlmC5DgdYsfJEci3QT5B4FFD+TOvR6Q3Aa1cxIQrnDH+jI
         BGsHlAVWBmanDmKfMVv9XM5qmAASv1q0XeWqpWuLXn0PJsc8CvCUVbGKMvK/NReSfLue
         EogLuYiVrvOpA16Vw1TeYTFGd651ilQT8hFPplCFbroz6h1FlfZTwle4L3uN+egxHodD
         L9FiCIFFidH0JkBA3DiOhbGqu2da23xIF/WZgadOWpjGXD/H1ycv4hLFYoEnW81/FCXj
         OcUjb3JWBPUca4PFUFHE6Bx6StikYx+OTWIiZ0/5ym/6fvmjxZA1/IhNpFL+qKoknOnc
         juMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827365; x=1727432165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6rarfHUWMqOjFeWr7GCyc69O5bxXBsfLkEV+rpUMfI=;
        b=nX4E4ora2S/CFkKfuh8wdMLFaqEu4VkpLRDX4hXlchp5fIQGX0Sz4rUQtz3NGuKbmc
         JyMjPDukWwz5zJdofR9L8cj28aUMFof42QJ/oZW9uf2gvWQwK48FrBWld6qiGLzFrR1x
         oZ2+ZMfyP6xoHXZxog1ew7tCVNDYXE0DT2bnts8ksGMGvePwlaw460FPDwBC3uBcJVCB
         ibkdu11Uk9KbTZU6hkIvCwsiuEgk5oNkVNOE+AgULxwIAORLnd8Z0qBn1WlQGBNCPLdL
         rHgCKT+m2qhX7gpdwWtLlFSk34eNYp3C5MLyjtmGKfAqDktcPBQ8XexrRUThLVtdl8Gn
         cLVw==
X-Gm-Message-State: AOJu0Yxg7Uv9Dwq1eggDjFIe64zs+gdYakjtH4u9TVnqUnHXSJrhEQbo
	Udgo8t+Pp7JsRfeTVLJQKVOY5SbbUNKsrm4IMfb3UVj77bBqQZNtVERhtuBSRt8iSe/u1BVdQr3
	AlkDlV8Wp8UUUyaDPC9gzkOq8oDd/nuOPZc4sXw==
X-Google-Smtp-Source: AGHT+IF7/FSXCTRjb4dYN0me8Pa+zWYfR+Q+BtqxXuBPIAYfp8EhE3Pk+N3/QHH2osahsq+bIv/bfoIgYjZTAzACu2I=
X-Received: by 2002:a05:690c:470f:b0:6db:c8e1:20a1 with SMTP id
 00721157ae682-6dfeed55262mr16099977b3.12.1726827365063; Fri, 20 Sep 2024
 03:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240920093750.4000239-1-quic_raghuvar@quicinc.com> <CAA8EJprF8g43uAqdzu_KM5o-2MekEE_M_JPFmtHiD+6wxJaQ0g@mail.gmail.com>
In-Reply-To: <CAA8EJprF8g43uAqdzu_KM5o-2MekEE_M_JPFmtHiD+6wxJaQ0g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Sep 2024 12:15:54 +0200
Message-ID: <CAA8EJpr5SumnwVbb62Voh8Df1wkGUnoLDcr5v6pXQqMYkxOHsQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] android-tools-adbd.service: Update
 ConditionPathExists to /etc
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 10:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112401

On Fri, 20 Sept 2024 at 12:12, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 20 Sept 2024 at 11:38, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
> >
> > To ensure android-tools-adbd.service starts at boot, the path
> > for ConditionPathExists must be present at build time. /etc is
> > more suitable for build-time files than /var, which is for
> > runtime files. Changed ConditionPathExists from
> > /var/usb-debugging-enabled to /etc/usb-debugging-enabled
>
> openembedded-devel ML is a home for several different layers.
> README.md describes how to send patches properly (hint:
> subject-prefix).

Also please take a look at the generic documentation, "Submitting
Changes to Stable Release Branches" [1] . It describes how to mark
backported patches.

[1] https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches

>
> >
> > Backport-of: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> > CC: Khem Raj <raj.khem@gmail.com>
> > CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> > ---
> > This is a backport of 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> > from master to scarthgap.
> >
> >  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> > index ddf8d7f74..b6661f2e3 100644
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> > +++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
> > @@ -1,6 +1,6 @@
> >  [Unit]
> >  Description=Android Debug Bridge
> > -ConditionPathExists=/var/usb-debugging-enabled
> > +ConditionPathExists=/etc/usb-debugging-enabled
> >  Before=android-system.service
> >
> >  [Service]
> > --
> > 2.25.1
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry

