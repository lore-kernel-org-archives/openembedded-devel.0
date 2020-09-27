Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.7600.1601186897618297443
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2020 23:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sj+EwFOq;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id di5so3758058qvb.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2020 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Umbf+pkae8uNVJGAK3688+Es0jW7AlxBAOunhFjETFo=;
        b=sj+EwFOqzF5PiMYjZIxSKwfh6v5s+pmoeibXQvSgMndREELVQqbwhuT3+SD+UTA3GE
         BdLbr3k5/bx6eN4AWPUwkEEwwIAdyAFVKmMRa2AL/guwKyU8m9RJUsrMDmiXW06Upqzb
         l7WLUZnOSKTvTrrGaUmZNOUIMaK7+He6YSlud2rPFF2kN48h4vhCfL+RKhBUZc4ZV3kT
         baXzr4nyhlnsaCvlUxXacDVIA9/vgly8SEg1szsbFCNjXQWzRCMBNOAM6nfXgcd6xpnF
         wE6AeUrOmRlbIIJDB+I+LGQnIuBH/0n6jugWMCAjMHXuLBZdmRgBhW99otNq6A45XInV
         Hi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Umbf+pkae8uNVJGAK3688+Es0jW7AlxBAOunhFjETFo=;
        b=hLRSg0yBTJXb44jPYxSYlJV+SD/UDEIdYjFVjjHY504RqurSGlatMFCRcQZXvmJEI6
         yTvy+c1B8a9aWzYLI7gVVP7h+ON19Aki85hHryrSgneeGxEhQKkggZz2b16KAp4vXFtY
         CW//eR1CskB9WCLBZNQQZeqSWyavQ/4dXOlxKUcsgA1F2ZdArDD2SQ+2XIuJ77DZT978
         pZ00HJsrxBe4MafK7GtXu89nBTiETClmXtkBwSH11UB30I/y9X1lEn05KAAsIezk2ByE
         uTao89KYvwsxAbL6t4FK8UmhxOVHyu+1RIyFZTsxO5dDMoYhZtVN/ih/1z8q4/ch/N0E
         ubdg==
X-Gm-Message-State: AOAM530btGexlJKnhh+ES3XW4mh8hvYGR5sPKOhw5OCJkLacy/b/BJBY
	zrM4EiqQhEoy2pIwUwSpiA1wtIs9OfXMkFzYUvkYQoM7WkQ=
X-Google-Smtp-Source: ABdhPJzYDAi0TYGhsC3Kl4io5cYiBJVoi7VKXtKwt3t2RnlbC082lZy1keOr/+GL0FXH/z+zFlBHPeXAZyxfELczB8M=
X-Received: by 2002:a05:6214:7a1:: with SMTP id v1mr6444993qvz.19.1601186896613;
 Sat, 26 Sep 2020 23:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200927054741.11210-1-kai.kang@windriver.com> <20200927054741.11210-2-kai.kang@windriver.com>
In-Reply-To: <20200927054741.11210-2-kai.kang@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Sep 2020 23:07:50 -0700
Message-ID: <CAMKF1sqy_CDdQgaaunBm=JDcqyEBk8eaXjyNnwtgv9UAfaSh_w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-iniconfig: add recipe
To: kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please add it to packagegroup-meta-python as well.

On Sat, Sep 26, 2020 at 10:48 PM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> python3-iniconfig is required by pytest 6.1.0.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-devtools/python/python3-iniconfig_1.0.1.bb    | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
> new file mode 100644
> index 000000000..9ed0e033b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A small and simple INI-file parser module"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
> +
> +SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
> +
> +inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>
