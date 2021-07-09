Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.12416.1625843766841267028
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jul 2021 08:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J0efPmMl;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id h18so1626739qkl.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jul 2021 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRIpYZBSHUxhWHGWsznJmXR/KhGahfVRCJ5dXkaw1P4=;
        b=J0efPmMl6ooehOW/+DFe6EsO44tCZsl/lrNsH5s2SUQn9YEDWbww0T1pXYDDcnS7dT
         DdUiCEQdkaypXZPB+QrcMb6nETamYgkvxpyUZPE2HBKgeHW4IRWIIjF4+kCjJMv7OwSV
         aL0Dfxw50nUl53goJT8XxCQIqLib6Cxz23oB+kxYiMbGGDz1qVD/ZN1kZet86/FS1jxd
         DcmMrL8aixgWu0Q3sKwNLUUB64rETrhG7JEkMxeP28MZElRAev4E9eCz3FTXk71u+Rdg
         NAst0RYdoO7QVYzlEjolIbpwGvVF6/wkBL+en1lI0XVgGL8uCFVg7w8YzjDj/vOSVq+T
         auPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRIpYZBSHUxhWHGWsznJmXR/KhGahfVRCJ5dXkaw1P4=;
        b=W1a7rk15a02ZDoQ+m/vETCmim94lPPzFgFY+thDZBVg4BO3FF5MCMDWKojjUlMfeZg
         kbgjbduMhIQ74IQyu5Y0kSmjp2MXwjexPUy9UeIH/81wtTBuKmWqPe8P95QoBXsCSoqt
         Vr8+iAG8TPcMj+X3HGgL6G6eaUDzZQg74KtDSjCEbpKqiiYSEQrlhHQH7oMUfn4wm5oZ
         jbaz9m22arGQHb5A49dQo5BdybexVMq3vOpTn7hbCNGP2q8eLUhp2cdxJ5Iourt2lI/2
         KO7149PIxIGGfSrxLuMvd/1MxoAu3T+F1HUgp4fjUJWQSdHi1vtzivJkjYbZKCenVsCd
         ZVCg==
X-Gm-Message-State: AOAM530HqrJNvqlNC0w16/5VJMHhnigAf0Y4zhbIkUQcVUi7FZK4WviA
	1p2nQ3AO3nggdf6XqpLRylvb7D8BlpjAMmHEPp4=
X-Google-Smtp-Source: ABdhPJymXFAdJ+4JTCjypNhs4JodvVIqRJtvcVYKukQydxuAqOoUlUjhWijg7mCA3PsyOW4VvlyvHoaqM7YWUoBtLcI=
X-Received: by 2002:a05:620a:1e5:: with SMTP id x5mr19651432qkn.125.1625843765921;
 Fri, 09 Jul 2021 08:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210709143957.2758-1-brgl@bgdev.pl>
In-Reply-To: <20210709143957.2758-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 9 Jul 2021 08:15:39 -0700
Message-ID: <CAMKF1sqxroHisqNVdSWnMs4nRt5mtU4dHQ_cqrbQLyAK0i3+Kg@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-joblib: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 7:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Add a recipe for joblib: a set of tools to provide lightweight pipelining
> in Python.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../packagegroups/packagegroup-meta-python.bb   |  1 +
>  .../python/python3-joblib_1.0.1.bb              | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 9c44d38ce..72ca86b04 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -196,6 +196,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-jdcal \
>      python3-jedi \
>      python3-jmespath \
> +    python3-joblib \
>      python3-jsmin \
>      python3-jsonpatch \
>      python3-jsonpath-rw \
> diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
> new file mode 100644
> index 000000000..4e63b056c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Joblib is a set of tools to provide lightweight pipelining in Python."
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b289008fb813a27c9025f02b59d03d"
> +
> +inherit setuptools3 pypi
> +
> +SRC_URI[md5sum] = "9914b330916395c0a1feca54949867a3"

We do not need md5sum

> +SRC_URI[sha256sum] = "9c17567692206d2f3fb9ecf5e991084254fe631665c450b443761c4186a613f7"
> +
> +RDEPENDS_${PN} += " \
> +    python3-asyncio \
> +    python3-distutils \
> +    python3-json \
> +    python3-multiprocessing \
> +    python3-pprint \
> +    python3-pydoc \
> +"
> --
> 2.30.1
>
