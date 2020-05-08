Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.448.1588955854637711060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 09:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sZRBAziX;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id i14so1060357qka.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EuXlTOT6aU6M6xNxiBpBodEnN3bQfIpRmPtKBe6p0j8=;
        b=sZRBAziXBoGCzgv/B11NVFdbR65DfVjP1XCDNpngrF0ebjyManXzhH02FYFNh8uCYT
         1wqwd2sSq1PQVJ64y0GKxODtYVyed/EXL/s2/e8ZDKPQ43VHzxVysp2JQS0uQeFOXfO8
         IlCxMQlX4L47BAaRtuJAkqANew45gXZx3v42eM8uI+EkdfoyqwERZ40pdwOtyjnWVUGr
         e49sd7ACIcrLXwcuH/R2lKg+hylz8JKUaDWX/NIVa5Wxjua/U32O4Ainxza6a9y2GAfR
         9vQEz58eDokJTrOQ8M/c7vwSFmAsqiVPeXGS2jQJieWMse6sbrTFB9/cNRx5GWGLbyPY
         aG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EuXlTOT6aU6M6xNxiBpBodEnN3bQfIpRmPtKBe6p0j8=;
        b=JCe4oddhiMTwMfNir5GEmwodFTi19euiSKBsmvJF+bgl5FqnnVMOTTCXpuIzL17USy
         N6064yLtlqRnSIJntLAYRicWIAu5NgMN1X4xLXSTxhtrg4OS/3CC4yq4FYKeIZLp9Qim
         T5qu2RJBNtYVNozEHV8SjJbE3rNg1LMDLifVZmYlN55HsT5sWW5Ots7hkeRNNb5PGpCO
         adsUQ1ECh4sQigU9r1JOvuZ1wCTFhFyNZiXiZf+9SzLWtdG/V5S2OEepF8BnfVWvQH4T
         ZVzx1ZS4A2aa9ZPE+DcgD8O1M+Lb7rfomi2jpVRzEPkvDJCp0GqXwffAdEZe+cQ5/09j
         sSdA==
X-Gm-Message-State: AGi0PuaVLfrM4oCu2XDD6vXX1wdkqUQ3QB8Uxlnsrd7BC4vNWaL6QZjq
	AeOiXYKZakOzHxiDI+gq0V1JDc9PJ/dtNnSNpyPjF390
X-Google-Smtp-Source: APiQypJagvviyBRMlFOjSg0V6TteZs6f0LSSfePy1EtMc/1/DCkpX8m31lOIldTK96ePQLi+5B+7hJl4Q7Bd+x9or4Q=
X-Received: by 2002:a37:52c6:: with SMTP id g189mr3411576qkb.17.1588955853422;
 Fri, 08 May 2020 09:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <1588832553-58023-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1588832553-58023-1-git-send-email-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 8 May 2020 09:37:07 -0700
Message-ID: <CAMKF1soM_GdprSjPuOoyN2PNxufsP1qJsE=k2RwaXB6G8mc89g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-ntplib: add missing python3-io RDEPENDS
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I merged V1, so if v2 has differences please send a rebased patch on master.

On Wed, May 6, 2020 at 11:22 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add the missing python3-io RDEPENDS to fix
> below error:
>  # python3
> Python 3.8.2 (default, Apr 27 2020, 08:51:00)
> [GCC 9.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
>  >>> import ntplib
> Traceback (most recent call last):
> File "<stdin>", line 1, in <module>
> File "/usr/lib64/python3.8/site-packages/ntplib.py", line 32, in <module>
> import socket
> ModuleNotFoundError: No module named 'socket'
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
> index 93df83a..ce2618b 100644
> --- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
> @@ -11,4 +11,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools3 python3native pypi
>
> -RDEPENDS_${PN} += "${PYTHON_PN}-datetime"
> +RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
> --
> 2.7.4
>
> 
