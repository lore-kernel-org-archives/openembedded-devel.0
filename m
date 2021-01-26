Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.390.1611701286406625481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 14:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M1U5zRtP;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id k193so10706qke.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KnWJaSrlFu1SHc/kjGXkzhs0cykakwVFPS3qBLpHNj8=;
        b=M1U5zRtP9GK3+BHNF0SF8iEjJOq3cs6rHpOKFJs30SBwj/XFuB2FCvTpR+CQpKbDJQ
         vw9dUcaeI2BLCwT8/TZL0Gx4GirV9HpA0Fq6A6cTH/6u6/TG0uxBjNfkDUy9JCqibdGQ
         FDxyFGknogk7ob9mGxrmN+1215/ohxN2EOeK71kan83j5glGO2AmOZdaibttEkBDnULV
         7sa8eLG4fhFrf/MZS9XKZ6N6YDVneqyVQ8HlDK0qnlkJBHSbX1NsFyTlG9rziMnraQTb
         b001DYDZGoKz1DEMdnUWZmv/RPeSL27RzIyO7pf1ZrCtEjObxhkbpKiISTH1Cwfwox/Q
         ohiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KnWJaSrlFu1SHc/kjGXkzhs0cykakwVFPS3qBLpHNj8=;
        b=K70BLfvOwwsQWoDd2leI/SJtUIj2YOuKkMhMIId3ZeWTc2siyRvN/+fR5oYprmgkYa
         c2SrreV46dNGYrbJ1E1dV+c58n7mGi7NzEPM4cRFqxS7PsOpr8A73BShcoGu0BacGWlg
         BbhoqJ2tJiIvOH/lpsS099AaCR12YXEE8oqIg2vU0VrEnLxrmaDIGhTLUqM8X9gNvDpg
         7sD+FqWHu1mzdfUWtZMAfmfoAWfsbvBH/9cBlBupOF3GfMkh9cPyu50gV8QEbDbYu0VA
         IsptRQwg8z/v3A6Z6myMw+tEBV6fLcVtQrw7nfUGkIBqJBoUnT4kolm9KyocNAqk/2MR
         RB+w==
X-Gm-Message-State: AOAM531riLBwlVk+maTnCBjBtZFCzLZQsdHG23aUg2HdpfFuFVxIbL3D
	vDi4n8kyq/FUrpTIdz5tD6fW8u4iKfzGilsmwlk=
X-Google-Smtp-Source: ABdhPJxM9l6nMLFb29sw3RCAZpgwUUWzlxaVCzE5B2WJMfrZXIQ//pBm6AbCtoF4xwCIR/Id0xKgjVfYLY1JhJk2kPM=
X-Received: by 2002:a37:88c2:: with SMTP id k185mr8126432qkd.474.1611701285483;
 Tue, 26 Jan 2021 14:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20210126125003.27620-1-leon.anavi@konsulko.com> <20210126125003.27620-5-leon.anavi@konsulko.com>
In-Reply-To: <20210126125003.27620-5-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 Jan 2021 14:47:39 -0800
Message-ID: <CAMKF1soz6XeToD_uXVtHYLOyDgBu6Kc1Wim67+O6m_zvyiexrg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-xmlschema: Upgrade 1.4.1 -> 1.4.2
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seeing a build failure
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/885

On Tue, Jan 26, 2021 at 4:50 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 1.4.2:
>
> - Add decoding of binary datatypes (xs:hexBinary and
>   xs:base64Binary)
> - Fix encoding from string values for some builtin datatypes
>   (decimal, binary, duration and datetime)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...python3-xmlschema_1.4.1.bb => python3-xmlschema_1.4.2.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.1.bb => python3-xmlschema_1.4.2.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> index c60993105..055a82d4c 100644
> --- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
> @@ -3,14 +3,13 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
>
> -SRC_URI[md5sum] = "f4c46f8c4415a0ca31dc2f623b668664"
> -SRC_URI[sha256sum] = "ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a"
> +SRC_URI[sha256sum] = "f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82"
>
>  PYPI_PACKAGE = "xmlschema"
>  inherit pypi setuptools3
>
>  DEPENDS += "\
> -    ${PYTHON_PN}-elementpath \
> +    ${PYTHON_PN}-elementpath-native \
>  "
>
>  RDEPENDS_${PN} += "\
> --
> 2.17.1
>
>
> 
>
