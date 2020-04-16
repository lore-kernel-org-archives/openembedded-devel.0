Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.13441.1587062332042884130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 11:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjKO/Z/e;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id b10so17274125qtt.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gUuqKGuXwmUeOBmIaC1inQPbi6bXJqT5pSNu2bAFFLM=;
        b=tjKO/Z/e7+0Bh+nmvzydJ1s29zjruFfQLQVbkXXqLt49Q89dD1YKe0gK72UthLpOt7
         2YBSMzzE1T3r5MnvaYhtDMsIrBz0EF/e2WojA0Yf8t4oZDyyZl8ZnVle0xvKMEFYK5mQ
         6z9sMuuhs6Y5NhYYTleNXn8YdEThKHvvDgCkTsMiY3O6x4+xWFEDt78otbq6PddiJ4T+
         feQN7MLHTOC4qommvzfdNgbIXSIetZ+IGHNWbLNjU9yqNfmOnLWjcJ93VeZf22Gf2cl4
         M4i3PJQkGW213ZVrayaZTyqKlpco68XdAQcYgFsmlOwsC3Uk2v+qaqVeY9e4OvmUwU4D
         j6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gUuqKGuXwmUeOBmIaC1inQPbi6bXJqT5pSNu2bAFFLM=;
        b=elZWyZzoZSsracctmPoi1QWEa4Lgu3itZnbX0AIALsafNkqp8GiQ8Om69weop8LWjV
         43Hh/8lxhkNT9z5d+yaOGdzHmync/GrhLY8mb34Zrt/aH1PWefE1FqYSDWMGj+WlTA3Y
         BQomTlQMXBtwpMcyoxchan6h+U6q2DFfRbTTy47IIwmlUzOMeieOgbmUr8PGZ6QjNgIp
         B44wFrZWwi6RkQcgcEN+uRWVwOXFgaku0Z9q7R8iik2o6+ybJCn6tGOywA/nuRSSuWSr
         pzkwFO1GaPnHZjC6dBCMMB50D/wYNv+fdvV6qTahba0AbHfRD2eQZIgMX0MDazyIZLeI
         zuXw==
X-Gm-Message-State: AGi0PuZS9Bni0ueQ34pC3SYZV8ookCxQCBRcmIu7eKEWl+T04kFOx1wE
	DhjQteIMPACEE44jhh+PRpT4aEM19SKlYPmz7+1UpyzeODo=
X-Google-Smtp-Source: APiQypI/DxLBO2ZJYPdfNORcLciC2BkeoWf87VwlEcUP/k8Bbd+OxsmQMwoTrteYlN8ViZK006ods3idrRSZQFAStQI=
X-Received: by 2002:ac8:a09:: with SMTP id b9mr21718051qti.190.1587062330954;
 Thu, 16 Apr 2020 11:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
In-Reply-To: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Apr 2020 11:38:24 -0700
Message-ID: <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
To: Gregory Vimont <gregory.vimont@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gregory Vimont <gregory.vimont@softbankrobotics.com>
Content-Type: text/plain; charset="UTF-8"

This fails on mips/glibc

https://errors.yoctoproject.org/Errors/Details/404685/


On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont <gregory.vimont@gmail.com> wrote:
>
> Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
> ---
>  .../opencv/{opencv_4.1.0.bb => opencv_4.1.1.bb}             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb => opencv_4.1.1.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> similarity index 98%
> rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> index d781da600..5074eb2fa 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
>
>  DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>
> -SRCREV_opencv = "371bba8f54560b374fbcd47e7e02f015ac4969ad"
> -SRCREV_contrib = "2c32791a9c500343568a21ea34bf2daeac2adae7"
> +SRCREV_opencv = "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
> +SRCREV_contrib = "0915b7eaddba3c06d83e201c9a7595e73801f417"
>  SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
>  SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
> @@ -51,7 +51,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
>             file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
>             file://download.patch \
>             "
> -PV = "4.1.0"
> +PV = "4.1.1"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
> 
