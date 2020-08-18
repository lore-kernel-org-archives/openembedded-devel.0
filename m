Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.70951.1597770707257102792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 10:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ikG9S1wC;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id j10so9871438qvo.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2020 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=evHCgzaM3GjCU11y11FSqaCJL2l+1N8st0FntQOjINY=;
        b=ikG9S1wCcUM8td2sjfZX5Sa7qlRHUf9gn96p3A9Lcl2vj9eczR8B4xIhX5QLQfcAw6
         guEJwLky7Qk+2jenvmiqA6RLgYoFNgFtfW+T56iN24PWrG6odX//z/kJBNmfE98W1g+A
         FOLuFVyd5rtKVRcg1Amf6ENCNH06Nhb8hvOQPPszlg940mbY4DVBn/JORlOmLq+vKVNh
         3uAKL9HO8DusBQmoIwrFAfm9g/XHKTx4RuLiwWALnDGENuy6BHo+vhAsOhmIp3yKUmbq
         2QbkgtXW2n8sYxZcS29l5BoWIMcSvD9zRBYYV4B3qwHUDxIdzqoOH9DFZNSkVmffOqSL
         OjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=evHCgzaM3GjCU11y11FSqaCJL2l+1N8st0FntQOjINY=;
        b=Mxsy6z8CUettS1Hvt+SpmcgCxOZsCXlZUXhIsGLbX2hQ3Y/Rk+ZyA2l6j3GdqAWogB
         rSrWj/NJXs7RbSXxYHQpJkA79yldBtOUo/U+uMa31V+7Dju9FVcrpWNHS+tRO4Xz+tlv
         CHuV8YHkL57JOJfjXbOrZNb1dUCbzSHAeudDtwS3v81OIjph7fUoWMeUtlYp8vOjWK5o
         3WEGiLGL7UuZU/ZT1iS35FFXiupuCKYCNjeYWrP6vJcxkoOjYIDQrdqvq2iuIp1/Avxi
         ToJmHON1gghM3LR17TKn8SUZTKr9SXLZSMuMGmsfoECMb3cTH+J2iMVQB+ZW/sd5D54M
         /CNA==
X-Gm-Message-State: AOAM532Inbn8ORhln7wUQbZd+sG4rlktgrHeApdpZpiNt1CWKNa9xJGS
	yJhL7cX8NVyA76ScLZfRW0SsiAAZMnu9VufATVk=
X-Google-Smtp-Source: ABdhPJzh2sNGK0KWAzc7XrJbfsa/qFpjjb4jve5UOEN/oi5PKlylg+/V5iDvIFyInTfkLZ3K5gVUJ9AQmevgPZdgSck=
X-Received: by 2002:a0c:fbd1:: with SMTP id n17mr20273679qvp.4.1597770706273;
 Tue, 18 Aug 2020 10:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200818153444.15728-1-leon.anavi@konsulko.com> <20200818153444.15728-3-leon.anavi@konsulko.com>
In-Reply-To: <20200818153444.15728-3-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 10:11:20 -0700
Message-ID: <CAMKF1sra2kUHd7tOiBZUsJCE7iaX86YgG4or-3O8qVN4Qxaakg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-python-vlc: Upgrade 3.0.10114 -> 3.0.11115
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 8:35 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 3.0.11115:
>
> - Position is now an enum
> - Add Media.get_meta tests
> - Fix typo in play_buffer example
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...ython-vlc_3.0.10114.bb => python3-python-vlc_3.0.11115.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.10114.bb => python3-python-vlc_3.0.11115.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
> index 7f8affb4f..014509d55 100644
> --- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> +++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.11115.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
>  LICENSE = "LGPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -SRC_URI[md5sum] = "17dba9a55903cdcae10814080fcadb8f"
> -SRC_URI[sha256sum] = "c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b"
> +SRC_URI[md5sum] = "422fd025294af2e55dfdcf9bc7d7dbac"

I think bitbake does not generate md5sums anymore, so perhaps its good
to drop them

> +SRC_URI[sha256sum] = "a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b"
>
>  inherit pypi setuptools3
> --
> 2.17.1
>
> 
