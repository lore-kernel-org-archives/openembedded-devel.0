Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.4962.1586029859436855835
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 12:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VE8ZaprO;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id e14so9545880qts.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 12:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HE5KQ4qnwCs63RfO/ddErCHXKJY/q25f9vWydI4W5Go=;
        b=VE8ZaprO+tH08KdOc8Cb9CfCxOtfnWJpLEkRTHCT53XduoIjz2fFpo64jMGdCaS8X2
         5G0+ed7qTmsvd2gsHWNhkr/LzoMsAkD//PwzC8s0KMXPgrwmYVb0KTBUFbN/4CdRXFEr
         FakDDZKXV32vDd5jCqo+W9arHXN6YBzTxvTB+c+oYDS5nqjHOqxqsaqWIVYrSVlfwOpg
         TPYoEtyHqK+Ry0ulaQjoIseh/YQK6rA1rRIwP8RTlPwy6YbqXw49Tjd2JksVqMsNdIQo
         zW00B8vropq4l3d3xD2YAwWlW+V/7X7o66J/5FlODv6RQ8Af9FX44G0ljvJKnhejXvkG
         1odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HE5KQ4qnwCs63RfO/ddErCHXKJY/q25f9vWydI4W5Go=;
        b=Y9a2of6uv3l0OLMyvalHR8lcHBPPyiKoRd3/6ko92a/XLBPdFC/ppUtRqCfyxThGig
         +6VkvSp+xP450iyjvzh1tHLSC3U1Cpwxv3zaYxX/nhVlyEgc7zt/zw/732yQ1tFi6flC
         0jHrjbUxx04xI4j8pWY+5BAKajCAa3fOHsLhOYJM6yyZNwimSkM9jz295NSLs5sVyHbV
         UmtEvjransXJXfpa8DxYEYKrG+v+XFF6D6uZAOuS7wKWE4+DyTjksAVCc1ZyCimGkrGo
         E3Iic3BjV6Sfhk267Mrt/RGYoYZEwv8uvHWXu30I22SwqhhV5gwCM3qLNMKXZmu2gLht
         lTSw==
X-Gm-Message-State: AGi0PuZrZHRzKyjc/lG7970HDc5n4S7wKxzkXSjKHSFwwzSfc1qw2vMp
	rVMdpbnX0EFLdj+wmLv27O2isxi8gUomJV/rbZ7sGtmt
X-Google-Smtp-Source: APiQypLXaLYUy/RUs0HsK9afnZGlBQKm9rp+XiR8x9oq3If2egDsMJMf7aI2WcblxBzJVbF2Rd4oxozA4fhiHAfXhHE=
X-Received: by 2002:ac8:a09:: with SMTP id b9mr14224470qti.190.1586029858359;
 Sat, 04 Apr 2020 12:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200404171251.19823-1-derek@asterius.io> <20200404171251.19823-25-derek@asterius.io>
In-Reply-To: <20200404171251.19823-25-derek@asterius.io>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Apr 2020 12:50:31 -0700
Message-ID: <CAMKF1sqMPjf6rXHfc=G0kvP8qFCugqhqwNV+erS_FTJ87GmYUA@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 25/27] python-semver: consolidate inc and bb files into a single bb file
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

There is another patch on ml for this so dropping this one.

On Sat, Apr 4, 2020 at 10:13 AM Derek Straka <derek@asterius.io> wrote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../recipes-devtools/python/python-semver.inc      | 12 ------------
>  .../python/python3-semver_2.8.1.bb                 | 14 ++++++++++++--
>  2 files changed, 12 insertions(+), 14 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-semver.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-semver.inc b/meta-python/recipes-devtools/python/python-semver.inc
> deleted file mode 100644
> index 3c95c06eaf..0000000000
> --- a/meta-python/recipes-devtools/python/python-semver.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Python module for Semantic Versioning"
> -HOMEPAGE = "https://github.com/k-bx/python-semver"
> -BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
> -
> -SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
> -SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
> -
> -inherit pypi
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
> index 77925ae2b1..a469b23b10 100644
> --- a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
> @@ -1,2 +1,12 @@
> -inherit setuptools3
> -require python-semver.inc
> +DESCRIPTION = "Python module for Semantic Versioning"
> +HOMEPAGE = "https://github.com/k-bx/python-semver"
> +BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
> +
> +SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
> +SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> 
