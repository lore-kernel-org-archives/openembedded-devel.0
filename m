Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13FBCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 10:02:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.14881.1759831323810729621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 03:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VwlD/h44;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78ead12so1088549666b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759831322; x=1760436122; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8CjG3BeoiPP5Z0CWJ4SU6T+uRMnT5Ol7W3Amls5dKI=;
        b=VwlD/h442AUdRGxak9n7ZTEPC7mwcPO4WTI/g1xKzXHjfGcAbWv6VChpoRHDGRBCwp
         6AFH0yBnnA0y+UfmsjkdUhX9wk+qutYqcxiD8ll5F0WzsKwX7US6wfKqIqwIU4VcGbHb
         2z95QheH+nlQ1KhbkO4ea52MOu8qpGLhv+hYUhqp0RZBMgo1mEq5qWzYJfJZpmOIDTI8
         mdUI3HtPBnDdrD21GCbEkIKSPQSZtKL6G2HmNcX6BO2IGqNfaxWFR/J/4+roQfpF24WG
         veREEEuDU8Xd8K/2ROmODE6xozRzVV/yKCduObatL/3Z3WWzpEzSVAWMC/IdrgXCYcTt
         5yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831322; x=1760436122;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8CjG3BeoiPP5Z0CWJ4SU6T+uRMnT5Ol7W3Amls5dKI=;
        b=nJXOEVFrpNCPbfMHi+E9RbMblnZJI1tP/DcbvVdfnM9Gr9sXdxTHi3jNmbOd8NorNI
         eBXRztm2uSkqErhTG10C5W04xVLsWjI5mybHBj0PFXvzJZjneZ1tYVtJ5F6dP5dy6OIA
         RnYMznt7C14Zn87GTlhg9uOByAyzyLMVQL32vBgtpYCP5iIKmUCAXwDSKeGM7wgNnB15
         Jh5Qv4OHX8/7mkOgryHGRrc8F3gdhBlUkj6i/tvXty28wL1WQZuyNKx1pGLdnrSKum1M
         +qfxf88deJaTSzAkXJdL3HJJcOSiUmht+1R3vQFTyqVh3lzw9uZIbbJGNzJBz9ooH1i4
         GeTA==
X-Gm-Message-State: AOJu0YzLUgBvVrmIXiKNYgkpUo8bGbp1setiVHXPXbjYIrGxGHpjVsDW
	p3s8BXOhWlTo46pQK/DHPRJNQaKZeDGgtyQiIR8uIAG2UQo8bwq3AklDvAG7gw==
X-Gm-Gg: ASbGncuOlDpJYhM56TNW0HMgckhWHtDPPAw2YrZa0yI6ME8BOetVabgQ1c/J0J/ceYI
	X2EpSsQmLsixVf69KdTlCcAqRLu7i6Rljj+GuzW8pI9PUAoDlSgCjRC471FFYrO4dbmwVnA43dk
	R4F/TdRbwNhr3frAIveMmpmWluTZMyjKPsLL93aCiyqvvEPFPXBGeWrOPPtdlQSAg5EY7W3nxpb
	OSH91P7AC+PWg/oCWumKJ5w0exuKz+BgEsS59KtHUK7F1Bbi7ENQg2cholwTx6h1pY0g6J11YSf
	WSxRr2IRa0DLfs9ubPT3MasAzyoYqQ3pgMFJmzQNHBX/em1sBqzbX6Ca7vcuPoQuOrfnm7J0Ngz
	nrHZaS5mQ+6CtXXdfJRr3tYQNl7ng7NHBU4Gu1s9bxmkmKTYAm8Zy7O8=
X-Google-Smtp-Source: AGHT+IEhqA/SeR6RhA4gv3rOwO4pDY+2ujyOSwgIdw+gvk80IHefP2ISqRzsLe0Nd1aaS9H2KmqO2w==
X-Received: by 2002:a17:907:97d3:b0:b04:67f3:890f with SMTP id a640c23a62f3a-b49c3d753d4mr2139785566b.33.1759831321708;
        Tue, 07 Oct 2025 03:02:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4fd7112dd8sm91819066b.30.2025.10.07.03.02.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:02:01 -0700 (PDT)
Message-ID: <ca6757a1-4ec2-47f4-91ae-40ca5ecf06c3@gmail.com>
Date: Tue, 7 Oct 2025 12:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/2] python3-django: upgrade 4.2.20 -> 4.2.25
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <20251007095900.57445-1-skandigraun@gmail.com>
Content-Language: en-US
In-Reply-To: <20251007095900.57445-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 10:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120331

Ooops, I just noticed that django update was sent by someone else too
just a few hours ago. Feel free to ignore mine.

On 10/7/25 11:58, Gyorgy Sarvari wrote:
> The pypi package was renamed from Django to django, so the custom name
> is not required anymore.
>
> This upgrade contains fix for CVE-2025-32873, CVE-2025-48432 and CVE-2025-59682.
>
> Changelog:
> https://github.com/django/django/blob/main/docs/releases/4.2.21.txt
> https://github.com/django/django/blob/main/docs/releases/4.2.22.txt
> https://github.com/django/django/blob/main/docs/releases/4.2.23.txt
> https://github.com/django/django/blob/main/docs/releases/4.2.24.txt
> https://github.com/django/django/blob/main/docs/releases/4.2.25.txt
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-django.inc        | 3 ---
>  .../{python3-django_4.2.20.bb => python3-django_4.2.25.bb}    | 4 ++--
>  2 files changed, 2 insertions(+), 5 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.20.bb => python3-django_4.2.25.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
> index cde32be477..57756024fe 100644
> --- a/meta-python/recipes-devtools/python/python3-django.inc
> +++ b/meta-python/recipes-devtools/python/python3-django.inc
> @@ -3,9 +3,6 @@ HOMEPAGE = "https://www.djangoproject.com/"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
>  
> -PYPI_PACKAGE = "Django"
> -UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
> -
>  inherit pypi
>  
>  FILES:${PN} += "${datadir}/django"
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> rename to meta-python/recipes-devtools/python/python3-django_4.2.25.bb
> index 8644b282c6..a6bdc26336 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
> @@ -1,7 +1,7 @@
>  require python3-django.inc
>  inherit python_setuptools_build_meta
>  
> -SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
> +SRC_URI[sha256sum] = "2391ab3d78191caaae2c963c19fd70b99e9751008da22a0adcc667c5a4f8d311"
>  
>  RDEPENDS:${PN} += "\
>      python3-sqlparse \
> @@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
>  
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
>  # default. To build the 4.x branch, 
> -# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
> +# PREFERRED_VERSION_python3-django = "4.2.25" can be added to local.conf
>  DEFAULT_PREFERENCE = "-1"


