Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.14777.1595950346758611479
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 08:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YfMS/9E1;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id e5so1105433qth.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BaHQy9JN8Hg4bgTKClkuFjmmb8b0p/jPt4otAZ8F/tU=;
        b=YfMS/9E1iRM4m1yqSXcS2pwWIF1HhhgQ6wEOsJ7vKC06mu2ZyL3U88TfN/eX2lHFiE
         j7i6jO+eLSbpxhIf97ucN9mpjVd2xDJmwTZQ2J2EkGXm3KUSXVjZIjZebCfHMKXXB8mM
         wCBdSp7sggspQO14soaA9SjARBhi1OsIXfI1j4PV3O4LOhz9LX4ce3SatT8PU6XgK1Qz
         EMiYTwOmsiTXnKiBbXckpt4UmPX2ay239xTClbNp8paPZ/gDDaLV/1qIICFA/p9rc8fp
         XZSFsT9m2XRJ+a3n11GtnqJGdmme3OxDtcwecsjHZJp2c92R49bA0dV74WP83C+sVHyg
         J1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BaHQy9JN8Hg4bgTKClkuFjmmb8b0p/jPt4otAZ8F/tU=;
        b=t3Hm1FULX36DLYVemOropG5OS0cZu1RHTjWGMsplMglmBv9COg/KSYYZYpxHjqc+RY
         LUgTjx3ESo9IJsc/mOaTB+g9BGi9tY0URt3Nyu73o0wY60dsOChKGtEkJq5B+n8jYzqi
         4dz3XYiLhldtEnvpBP+bFIKPLkc8ktaBFs77VudRQbUW/fbqfvaCMqroGUyTSC7ma4Ci
         oepc4Jx6yxiscx+4CKoPSK4k61CTGUjOrLHerVgjyVplqAOc4T6pq4980OhTlJGKt2M2
         hT9crE58l01hOsmxfa//4j4bgkJBCLBYT1RLhmUJuer+FRXPj41Hna8Y6kSjCK9FieL8
         8HXA==
X-Gm-Message-State: AOAM531KOIuxPigO2A1Jik4lZsuqOOD2nXu5mTR1ajqEzsVLMBySjkJ8
	Ovc25YIRVqTP9aH9oQsiq8/c//l5ar0iDTBGH7Y=
X-Google-Smtp-Source: ABdhPJwoHncHtfyUERQHbj0kwzTccoLFo+1UXdkig65mOoZwQ39s0Gq56QxabUM38Hxv3giEY0jXaXOYYGxKbb9c7dg=
X-Received: by 2002:ac8:1344:: with SMTP id f4mr6780745qtj.285.1595950345747;
 Tue, 28 Jul 2020 08:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200726091513.3923634-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200726091513.3923634-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 28 Jul 2020 08:31:59 -0700
Message-ID: <CAMKF1sojYvaHcBTiPvkMWp7Fq7x3c9OzBua8vx0pErb36CCVDw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] libyui: update to 3.10.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to build

https://errors.yoctoproject.org/Errors/Details/425410/

On Sun, Jul 26, 2020 at 2:15 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libyui/{libyui_3.6.0.bb => libyui_3.10.0.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/libyui/{libyui_3.6.0.bb => libyui_3.10.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
> similarity index 95%
> rename from meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
> rename to meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
> index 7c6f4c13d2..d7f529e313 100644
> --- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
> +++ b/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/libyui/libyui.git \
>             file://0001-Use-relative-install-paths-for-CMake.patch \
>             "
>
> -SRCREV = "8459235919f592b1bc099ecf9a947cb6344b6fa5"
> +SRCREV = "de9134007d2d029fe5809ce48f57fe218e6ffe16"
>  SRCREV_FORMAT = "default"
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
> 
