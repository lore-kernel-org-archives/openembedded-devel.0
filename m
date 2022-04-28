Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E551C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:01:21 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.4188.1651104071595806116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 17:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBFHC0vh;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id z126so2539023qkb.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 17:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cWUE8yVGBWRUkrEhxItf80IlMy8i5z7IHdwmxybVnhM=;
        b=kBFHC0vhM603FddPXOuuxgX55aVYJq0zGpy6/m5WNLs9feAJ/v91RRotKhr3Ij7v/C
         CuV6GQ4TTOnNWUA88r788VDiE+ApYs/8oijCOFD9bFRtQ8qs/cyfSv8m2zL1DOfBMwEd
         C7hf9vr9GxW8aU8JxdEpWf4nzqGZBLaKFynuneXZS/aobB+e4BTc8Uybo+BRQiEY1zuc
         xsK1CAHRL1TuhHcDRWbJUj4KvQQk2+2PlabUdfgjQRc5zoBzd/dWLuMVhRcTzOz2i3sy
         phI9fanW+oTW09ApmmZz4j6nsTFYuR6fuRvokNEOVvpZzjU+6oHo9mSHemcjxSQnVfgg
         3k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWUE8yVGBWRUkrEhxItf80IlMy8i5z7IHdwmxybVnhM=;
        b=GFPbAnRsKazeCq9THCnaPcYODj1DDirAH865WloH2Z4sWsTvsvR5yHJfZmgFB+y+UA
         C6N6n3DomkxTRDX5g4H4LKlTnkvm3lAFVCT3a6WC14K36YkZIch0nR6C/U5DdIb/VMCf
         TfFDuWMwwN4vwFMy/Ss5Is59QHGUQReYwpwjpO1C0l1WjIym8fGYFCqp4up77Aq2n2JB
         e0u6qYsv3WlqptghFvBjiiswwo+vIr4wV4myXLVBbIs7jsMmRlntURmsEbophTFn5M0h
         q02lA9hFrVdVM8E8yTTfEGIMitwtUOK/LJeIyWvy8Uxd9j03OoSyKJBAWAd9dAH4lugz
         /Udg==
X-Gm-Message-State: AOAM530aDs3R8I/5lROCodlDMGkEtLUu5Ibs59WS3PYWBi4WHEVS4Qu3
	It+DS8u0uyWw1BfVf5/udBypKjwltPxgQVcXy20=
X-Google-Smtp-Source: 
 ABdhPJyHhnSYe+41vgXLoyUM1FEiJ3Xev+QACqANFdkpc5JUYMqM4Qc8V9dZ7DRluHBBO2OVRZhJ40wgqUuSBCzhBpw=
X-Received: by 2002:a05:620a:46a3:b0:69e:d29d:73d with SMTP id
 bq35-20020a05620a46a300b0069ed29d073dmr17669579qkb.463.1651104070649; Wed, 27
 Apr 2022 17:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220427094948.834984-1-brgl@bgdev.pl>
In-Reply-To: <20220427094948.834984-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2022 17:00:44 -0700
Message-ID: 
 <CAMKF1sr1uLBr-xfiKfMS4Uiu8w0-tQPxdFEf==WruT1aRoat3A@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pyfanotify: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 00:01:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96817

fails on musl [1] due to missing FNM_EXTMATCH define. There are
patches to define it to 0 in oe-core in musl case. Perhaps that can
fix it
[1] https://errors.yoctoproject.org/Errors/Details/655765/

On Wed, Apr 27, 2022 at 2:49 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This adds a recipe for pyfanotify - a python wrapper around linux'
> fanotify interface.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../packagegroups/packagegroup-meta-python.bb   |  1 +
>  .../python/python3-pyfanotify_0.1.3.bb          | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index f7bf36519..d2d9dcd18 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -300,6 +300,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-pydicti \
>      python3-pyephem \
>      python3-pyexpect \
> +    python3-pyfanotify \
>      python3-pyfirmata \
>      python3-pyflakes \
>      python3-pyhamcrest \
> diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
> new file mode 100644
> index 000000000..7458fec43
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Python wrapper for Linux fanotify."
> +HOMEPAGE = "https://github.com/baskiton/pyfanotify"
> +AUTHOR = "Alexander Baskikh"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
> +
> +SRC_URI[sha256sum] = "0efa73922fd705b4e8f8f0b51cb88198ceef66cc309e1de21674ef44c879029d"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} += " \
> +    python3-crypt \
> +    python3-datetime \
> +    python3-logging \
> +    python3-multiprocessing \
> +"
> --
> 2.32.0
>

