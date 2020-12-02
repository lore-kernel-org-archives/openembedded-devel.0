Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web09.117.1606935595301809013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 10:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tpi0qAsY;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id d9so2283275qke.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Dec 2020 10:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QpihYY9Ck7YDNf4c1AQtCJrM3PohIkYgQrf94yN20Tc=;
        b=Tpi0qAsYVaQuFYwUGuZlfM710fOB4sD7GB/eSBo/QKo5mU7jjMgzSMtmH5ElSgDyK6
         Czuv6bznv0CKgY3xl48zpAkQAMzN6+bNJSZ6hvBO/9W6Eb45ci5dsCpJTJuPC+VPeN4v
         esfktBj9ezq0/F2IaY9OBYvKj4LSH0sP0GXaHu9QhciyGrBk/dRSA1yu91h78Cb1ijGn
         1lz6Zfr4c+mu4Pakdx9Hln1ob4rBxLUgalfzd6E6tsPM32iPAX5+WehaBebdzZ4o8hw0
         yd2GHhT33Wmgya3kGfWAuQLEbg4vna4q6/iw1DREsBehPWAPxCFlaGULgP+JnTzwYnma
         M9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QpihYY9Ck7YDNf4c1AQtCJrM3PohIkYgQrf94yN20Tc=;
        b=P3LFmUozjACKh2aWt5R/AVBrDhD2ZeryjuafJ3xjdVxWP1jHk9Sxi2/iQ7+dP8dls5
         UwFL8P5zry/4KLQkJ8XRb1+nWjci8cmgex/Asc1gARQtMcopC9TTXzFxtLxgN6fSV8qg
         QLdRWkSolI7z+a9EyuqCq/8OzE3+0g2M0QGoRCPYDp2mP61roWBh7AnYnCQH5aJ262xI
         n73nI/y5LibBkycu4vJaIr8sZ4VnFeDNBIjvIkE93ZqaxA6VVsbzn87W8+uUdNCRdZMy
         qUBkRIQLgNBL/uGX5cXQC4VVg1Xh653HufeYx3RXDgr/6pzv3xv2yokfGps2OTF2co/G
         lTbA==
X-Gm-Message-State: AOAM531Fm+Y6nCosu6BTo+ycBkLhrLZ8+XeqaIuJmATBiNkFvJVQCf38
	G88o7Ck+xDhhWRoY9kvtMUMLhnEACDu2k6//dp0=
X-Google-Smtp-Source: ABdhPJytk1LMf9LrGVVhoelIrZ4XUzUJrRxKFwyVB2z+vT4puVEUMEOnP52thFnIKipzrU8qofw1NETWOjPqIzHqKTo=
X-Received: by 2002:a05:620a:1531:: with SMTP id n17mr4067632qkk.474.1606935594307;
 Wed, 02 Dec 2020 10:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20201202152841.27649-1-Martin.Jansa@gmail.com>
In-Reply-To: <20201202152841.27649-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Dec 2020 10:59:28 -0800
Message-ID: <CAMKF1srpBQcyUwJWX7M_sieZWrSjN9z1E=OoJJMLuPiR+mOzXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nanopb: move to dynamic-layers
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

perhaps python3-protobuf should be in oe-core rather.

On Wed, Dec 2, 2020 at 7:28 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * depends on python3-protobuf from meta-python:
> * fixes:
>   ERROR: Nothing RPROVIDES 'python3-protobuf' (but meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb RDEPENDS on or otherwise requires it)
>   NOTE: Runtime target 'python3-protobuf' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['python3-protobuf']
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'nanopb', 'python3-protobuf']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb          | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/{ => dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)
>
> diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
> rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
> --
> 2.27.0
>
>
> 
>
