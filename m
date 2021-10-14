Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8E4C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 19:37:58 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.2058.1634240277277114085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hgdNIGFi;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id l7so6557710qkk.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S5Huy6rsvbYiJGbTGP9BJcY5vFCR3gpuMZjZg516wVw=;
        b=hgdNIGFieEvpLpdyfPWihqDne2X88knWm9JKM6WGbQlLlnEEkLqSByaHIoXHjGpupB
         TuJznVbHqA4/NOpQEWMh6zerSUQrsKZkYIxDTViiTwFuwce91oDhUG4Y9imie9OVez4B
         0PxfZNOWl6xvvNy0rXbo1qdjr0UQ1pQtEYppKuKtS0avYtKfxgdwzjthPe7iF49MsS93
         sZemKAX7Lu+w/BRtiOM4XSgrSq6dmG/6n0OHeVuKB60UNxOO6ETuhOA5+dMtExjMxuE9
         4A7fNJLQjW21ZQl+Hz9EJvXH4Va4wxxV67mK1D+Fk7EF0q3kD+Xq705pWgtml8q2QlJ8
         S42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5Huy6rsvbYiJGbTGP9BJcY5vFCR3gpuMZjZg516wVw=;
        b=PXkd7gS70ZOdGSLkiIxrTdXv0GRKpbzWFA5tnLdC+/cSLN1KbHwlWVzhDraa0H/1MG
         54uE7QZX3tAjoBHpuMsl0QaB6SjqF6g/G5h8ork4rJzsAOtIOnyRognGHlIpDskB9Lkg
         3I03u9vjszHx6qsjXAnjIJofW7Ub4TpO5aZM5J/4uObmsbnRtBvdIOuKqJ132pm7nbuw
         Q6dpJMPCrKMlyJFst2rAgU1UgUiEdD/f6+qNB1Mu50O0K9CQHGcf8RUG7FE/Bs9pbhpP
         L20TV8c2v65ODgs3p2a2SON+lRHRF7iGcsvjkLGYR94jF4XcKdefZbVrNkufdpWH2zXB
         IPlg==
X-Gm-Message-State: AOAM531rR+dHvmQfaW69UJ0rTzJHYUIEzfgy3mUXTb6TfaBDc08Zaxbt
	wy0HMiZ8GHRtUj9m7EKNig+f0Oclaa0iBvbunYc=
X-Google-Smtp-Source: 
 ABdhPJx/Qq/vfj8ASGPK0wO5uwgIEXMgIFOQXbpt0mNd1+BxVCapbJV9mGDkAvBQIww8+OS7yHFeeISy6IvH0Whe2+I=
X-Received: by 2002:a37:8401:: with SMTP id g1mr6552663qkd.231.1634240276311;
 Thu, 14 Oct 2021 12:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211014192945.3563892-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211014192945.3563892-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Oct 2021 12:37:30 -0700
Message-ID: 
 <CAMKF1sr0g1UnS_wQPED9U=Lq=Or2BbJNq00Amcw4-ywLAQ-ESA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: add -fpermissive also to
 BUILD_CXXFLAGS to fix build with openssl-native-3
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 19:37:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93303

On Thu, Oct 14, 2021 at 12:29 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> index a64288d8ab..d468f2518e 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
> @@ -131,6 +131,7 @@ addtask create_v8_qemu_wrapper after do_configure before do_compile
>
>  # Keep until openssl 3.x compatibility is fixed
>  CXXFLAGS += "-fpermissive"
> +BUILD_CXXFLAGS += "-fpermissive"

Thanks, I had similar local change

>
>  LDFLAGS:append:x86 = " -latomic"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93302): https://lists.openembedded.org/g/openembedded-devel/message/93302
> Mute This Topic: https://lists.openembedded.org/mt/86323011/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

