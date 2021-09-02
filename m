Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.3875.1630568424088438550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 00:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DJ5z6Xid;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id a10so1074002qka.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TlRDDg5CTp8vpCkqxThgeMK097t0GbPLIbU8Jy8/Ewg=;
        b=DJ5z6XidvCtgFeHSIkHMTXLbmjpLq7aHUz2f4GbVunwgppO2lGpWSf58EloX6LpctP
         4OK2uYTmO2RFIuB1cAn7CKqkCuGyUAwWB8cxg/wRL6W1CngLjMpBQGeZGH3MyJkjRB9n
         LVWAA4zKW5GjlnIlQ22wslvMYMMmLWubes5wHqKrAN9dOqd7tEXCMA3haY7sbQVH926Q
         NaEke651jum/poxcNbAOsV3JQULVO7gyGUiabaLhA9NRuSS9OE0AhqUNBaP/9Pw0tRdk
         S2WGAe086dk5eMALvENaNNXip10w+Z08CQ7YWcd2qx8wodjwmKyACtwwIqJOY0x69rQp
         G6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlRDDg5CTp8vpCkqxThgeMK097t0GbPLIbU8Jy8/Ewg=;
        b=inXnmVKVwNgt4NtwHP9Rso5n6guwR5u2Zifnt55d7qOZNt1EW7Dyo/V84klGzFZyKS
         oWkql4+FikxM1sxz6Wn2kviM1V8vF/3U78i8ZbqatkSIOCADgxr5Rwp2+9M2r5Wk+moy
         kagFWuJ7puZg87v0mXyY10ENYlUhGKG+0ft52NvtWLs0aKLwpnyER89Twpo0Yt+Isrfq
         Ijg6O8UtmelfERQ4s8BsnXuacRKRQTqpWj2sqjP5LSTFOfDiIKc3vP0T3KJy3wEnX0UV
         Aj/xzJsyiN5k6vKuDXY3kkFbo6JyG921kVDHuuQ1t6UICL2ZjjC4xgFIMWu8SA0BLP/h
         gkXA==
X-Gm-Message-State: AOAM532h7envbd01r+mUbIRTGsKQ2Cn+IpZYFgI3M7nOAsxWeSJOlRZd
	0Iu32ruWULLXIaXU5lmAVr9bVkInhtVNqg/w6WA=
X-Google-Smtp-Source: ABdhPJwCLQ5FCOPeryNSw8o/anryX2XrHwxejy9j08hGAw27KxUN9lxZaugg/bC1gr4SoDzZle6G1GAYvvWDclzchFU=
X-Received: by 2002:a05:620a:799:: with SMTP id 25mr1895490qka.119.1630568423047;
 Thu, 02 Sep 2021 00:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210901120005.775345-1-trevor.gamblin@windriver.com>
In-Reply-To: <20210901120005.775345-1-trevor.gamblin@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 2 Sep 2021 00:39:56 -0700
Message-ID: <CAMKF1src+XLKjNYQ2QWq4p1K=k-PJij3nmCupOMn8weTYEP7BA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-subtests: add recipe
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

it failed with sha256 checksums errors in fetcher which I fixed and
then it failed again in compile with

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1499

also you forgot to add it to test package group.


On Wed, Sep 1, 2021 at 5:00 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> Newer versions of python3-cryptography will rely on the subtests fixture
> for their ptests. Add this recipe so that cryptography can be given the
> necessary RDEPENDS when it is upgraded.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../python/python3-pytest-subtests_0.5.0.bb        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
> new file mode 100644
> index 000000000..c2bf47203
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "unittest subTest() support and subtests fixture."
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
> +
> +SRC_URI[sha256sum] = "c62d68a84f94f8bc49bbb01b39392953e26a52570ad380581a3b2cc8d7eaa037"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} += " \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.31.1
>
>
> 
>
