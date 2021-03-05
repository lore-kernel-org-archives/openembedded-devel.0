Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.1608.1614976184202198242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 12:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BROyMmFL;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id z128so3281743qkc.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 12:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AaP+pmrKye5xXnJ11k1ckeTE0uI1/4sU9wa621ulfxw=;
        b=BROyMmFLclmNrnQ8iGvG/KLhGR5ozc9ssnHF2jMvvGCP6pxWzaC0NzACd1HJX90U6j
         4ZJZ6SSLh6FCULZnveI7TFW7ZXc4vVvJNuEhyDmmHI7bm+9KGQvcbti0zbvR3IJr73ou
         luMxs8ej/U+lmDHwoh8vqeRQeKEJh1W2FYuRvycKz+jUgfBy4U11MnXGF3KvX49HJapt
         PostZ/1APBN1GYH3xspTStgGtEcB2BsrlFCW0BmTm8qUdKdYWbUawx4sYP+tslz2FDCP
         NTbJP570e06DxN0gkgzlcr1/5bi/Wva3a13GcnLZ1BeZtyKRk8jeFuK5XBv1j4dmF/rD
         63+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AaP+pmrKye5xXnJ11k1ckeTE0uI1/4sU9wa621ulfxw=;
        b=sWC/c6S+Yl8Am17sHJnoHqC5YBepfmGfQhpgn+VxE5OUbrh58gKgGb1OAz2c3R+N2F
         tQgGDUTmNX2rGgRFKHJjBB+M4NtimQS7ORYfbUUbGqiusMCKzWxjX9f58EQ/4qO/HYBp
         Pfwb+7AzYsjXYBIvHMOfyXxDys1B9XTbHfEG8ibaVnFHVWu0R0Pp1z/lQFVCVn4cTYiw
         opOjONxx2iaVc4pafBMFhKO8X7KaYQEZayO6cbJaruTLSIzXJJbAFx2K0Cpifj7F1qZ+
         3ZrFjZ9yxNBy7gIgaf6yf4Qr25aG+ifY67nrBKNug/+pCGewnPEN6wCwE+4mhXRuDY16
         hVZQ==
X-Gm-Message-State: AOAM530k3WZ3+XMhdx8HXXyCk0p5LUIFLSHiUji2MhkaAm+N4wCT5WJG
	KtGMopTWgHB/gefy4SxJJvkqyUyuSt6MfLPxY3U=
X-Google-Smtp-Source: ABdhPJwrWe71uWan2MIVllt9RES5CBv8gFPQA3Ou+e76TUSr/n+ds6cfHLrAixBEYfgkNlXL7jCfDTfCt0/nuYefbkk=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr10716151qkl.125.1614976183234;
 Fri, 05 Mar 2021 12:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20210305160256.3333334-1-andrei@gherzan.com>
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 5 Mar 2021 12:29:17 -0800
Message-ID: <CAMKF1srsrFhBwXVAwtrR=MUajm2zeHbS77f8ZyG8n5dNAtS5bw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v3 1/6] python3-ifaddr: Integrate a dependency of pysonos
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"

I am seeing fetch checksum mismatched on AB see
https://errors.yoctoproject.org/Errors/Details/573554/

then I manually downloaded the file and checksummed it,

% sha256sum ifaddr-0.1.7.tar.gz
1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94
ifaddr-0.1.7.tar.gz

so builder on AB seems to be right, perhaps we need a v4

On Fri, Mar 5, 2021 at 8:03 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../recipes-devtools/python/python3-ifaddr_0.1.7.bb    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
> new file mode 100644
> index 000000000..cd7cd2803
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Cross-platform network interface and IP address enumeration \
> +library"
> +HOMEPAGE = "https://pypi.org/project/ifaddr/"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f9ad926"
> +
> +inherit pypi setuptools3
> --
> 2.30.1
>
>
> 
>
