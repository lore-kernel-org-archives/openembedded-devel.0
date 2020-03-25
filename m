Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.6456.1585118495900416070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 23:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DlklWE5Y;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id p19so541558qve.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2020 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMyB0NoIjJzYpKlz+2yEO83ImDkG36kzV5uthDcitso=;
        b=DlklWE5Y65BKKm+VD7k3r9jtUScSyJLOtlncCbG+hjX9hj2ut2h3tL+YaFefRkKzZl
         Qqxo+3XHqUMkjb0MlLdWasWmv9oXYCLdqgYDxlxTav/423eBFWRgCefyJ3Ggb5bkPdPo
         HBYG98lRlU5mvpp/2S7ZYvMEygircBJpkOBXkIOBb9rzRBWp7u8PT59pmYOywUlIjlvW
         LiyDFu18P835PhbK+2wWaSbytrdlHMGl0HgPtwopy1yWnD5QloFST0XqWQ5wqXhJIt1/
         JaGGKbCvr9Yf00Xm2OXe1ECySyWjikStEfQu2f80qNCE1IPhqbKMt0UsaesPR272MSKs
         hsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMyB0NoIjJzYpKlz+2yEO83ImDkG36kzV5uthDcitso=;
        b=Kwmx8hWwTvVotopq9k9RncXq5WwtUfzOR/30A3LKuVsp5a9q95L3xwHFAB5Uo0QVNf
         uEYqLuKk2v4NoZK1Mv8ycDsT8DdGg1ioPeyETM4y1kZL0O/B7w8PkM7J+40WXME/JRBC
         ZKzesvDg3SWZc2iNpsngAF3HRO093J0CY3e+0+lfKLofxAacMd96dzLSgsqhg4gP6PPC
         cp1FHQUvZwoKZhdhCO1MuvHtsHKGAbcDlMZLS0Kb7sFJ8JQS9pVt54KbyRfCV2opl0O1
         74B2YYR5MCyoorjGytFf4Im7u5cF3LK2KTmpHWCkIOFE2Rxu2VBgUQH86nW6izEmleQo
         N0Gg==
X-Gm-Message-State: ANhLgQ2bmEBgzs0fA5mJZ5Lo3NfKDjngNaNsy0h7UUqOxWkSlG0u2Nv5
	nvo9XwdT1V66H/gCqRnOZXgWDU4pS2iAr6r+T9A=
X-Google-Smtp-Source: ADFU+vvzJI2wJERpNtAAtLBfKvqXKEAnx1VyP/ArYU+yvFg2dgzbr02wAvKLZa/pkQNjSRiEjTcw6axApdoNtzKxgrY=
X-Received: by 2002:a0c:edca:: with SMTP id i10mr1777738qvr.130.1585118494791;
 Tue, 24 Mar 2020 23:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200324234539.956527-1-mkelly@xevo.com>
In-Reply-To: <20200324234539.956527-1-mkelly@xevo.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Mar 2020 23:41:08 -0700
Message-ID: <CAMKF1sr+POBH5FSxmqiLPzTsc6viUT9Wk4pXtur-oxCG7+9sgA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pint: upgrade 0.9 -> 0.11
To: Martin Kelly <mkelly@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I seeing this

https://errors.yoctoproject.org/Errors/Details/398554/
https://errors.yoctoproject.org/Errors/Details/398552/

On Tue, Mar 24, 2020 at 4:46 PM Martin Kelly <mkelly@xevo.com> wrote:
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta-python/recipes-devtools/python/python-pint.inc           | 4 ++--
>  .../python/{python3-pint_0.9.bb => python3-pint_0.11.bb}      | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb => python3-pint_0.11.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
> index 0900d91d7..41b3e2262 100644
> --- a/meta-python/recipes-devtools/python/python-pint.inc
> +++ b/meta-python/recipes-devtools/python/python-pint.inc
> @@ -9,7 +9,7 @@ PYPI_PACKAGE := "Pint"
>
>  inherit pypi
>
> -SRC_URI[md5sum] = "d0681cb7cfaca9fc68ce7edab0d08d88"
> -SRC_URI[sha256sum] = "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
> +SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
> +SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
> --
> 2.25.1
>
> 
