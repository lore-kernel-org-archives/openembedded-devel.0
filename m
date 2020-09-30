Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.19114.1601481554474341943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 08:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gM0LGzif;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id b2so1580629qtp.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9JVjMJFc0IyXUojTk6bmbbFLfRyHqGHfM2a8C26f8yM=;
        b=gM0LGzifYvqcHG6wwCcPTlc7GNoHRYEWNRe9x+3PAXosiXGqLNbXikDdGLZ0c5Opn4
         ExSwl6GcT/qQ4MI3Kp2geWgyZBiIaL0rCoBYUJ4i72Wy6vT1SZgrZXrsr9Okfl0r0ijj
         iVZ6k32HKQeMWCN1McHs2yYe3L2nnqqj98oTSnH97tMaqGHxvu8yfeM1o/5nD9Oh4ECu
         5y7s8FYHKikNcreWLypMsvO+94nNZTaNSoI1E8RICgo0oWYqr0IXMqn52tSR68uhZPsY
         NqJj04roVDylSOtIh0YxflMy8Pjj1yY/zdQPNsCg93XlAoDXHbBJmqmiTvpIXrMfqRDa
         Wwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9JVjMJFc0IyXUojTk6bmbbFLfRyHqGHfM2a8C26f8yM=;
        b=PA0qHq0U6KN2hDMrv9V99tZJmMLS3x7y68Aw7NGkcT3MwxEY10fzOP1r9d7KbQBm2T
         Dbmdbz4obqaZri29shXFPzxu9vRTEs17MMJWJgwoAHxDr5MdEEZ81KbIQrVk98YZ0HCC
         VtsybrR2EmYMxm2lmCoXh7E6DZ0/dvlAPtCHZKsdHS2DDXjyF+J3ovkvNqQbOKiT0gzC
         G1w6jdX4wdH1qEVtc1QP8ZtJpj4qZJbsrSew0YuQbPWOrDiBAV2habno6HOFRR/IOohd
         bqWy/xY/c59DvFdDxwBwEslLz8mvSd9cIbG27w4XjNF2rUlR0oa0kO0AABDlRC0QOYVQ
         QjKw==
X-Gm-Message-State: AOAM532o+JAbpwDWZvu4dfDXPIqn9ZoPyYaxEUQzcQDgovcfcVo+0KAK
	521GrumrbCkX/v+6M/7G5vTkTc6I59/NQWlh6mQ=
X-Google-Smtp-Source: ABdhPJys7NmvL8tyIDMizOlIoGFgbzC2oRH2FzC7M8HgshCIW6VLQzPXQlBaA6O6vwVEOQXd8NW1AGDZKrAbKZVKqHs=
X-Received: by 2002:ac8:120a:: with SMTP id x10mr2942191qti.88.1601481553490;
 Wed, 30 Sep 2020 08:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com>
In-Reply-To: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Sep 2020 08:58:47 -0700
Message-ID: <CAMKF1sq2M7kOAmdTBz6q-DPxLzZV--RVYPrAXFBDfdp9uOUhHw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pybind11: extend to nativesdk and consolidate inc with bb
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"

its already done in master
https://git.openembedded.org/meta-openembedded/commit/?id=c855e5be160d24c80303a30b99b34e45c6af1038

On Wed, Sep 30, 2020 at 7:27 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Extend this recipe with native and nativesdk classes to be able to
> provide a package in SDK.
>
> Consolidate inc and bb files into one single recipe.
>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  .../recipes-devtools/python/python-pybind11.inc       |  7 -------
>  .../recipes-devtools/python/python3-pybind11_2.4.3.bb | 11 ++++++++++-
>  2 files changed, 10 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
> deleted file mode 100644
> index d1d53e125..000000000
> --- a/meta-python/recipes-devtools/python/python-pybind11.inc
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -SUMMARY = "Seamless operability between C++11 and Python"
> -HOMEPAGE = "https://github.com/wjakob/pybind11"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> -
> -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> -SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> index 355e28460..2c456aaad 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> @@ -1,2 +1,11 @@
> +SUMMARY = "Seamless operability between C++11 and Python"
> +HOMEPAGE = "https://github.com/wjakob/pybind11"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> +
>  inherit pypi setuptools3
> -require python-pybind11.inc
> +
> +SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> +SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>
