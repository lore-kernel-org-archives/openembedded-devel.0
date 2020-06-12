Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.13801.1591940458546292827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hIGYGBl5;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id d12so1054185qvn.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 22:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FlpQDpgfzYO8bkfh4cMszg0/T78Fhsl1RltJ87TAlRU=;
        b=hIGYGBl5P9tA/BzmcW2Tq81o++4w+nnZVX1iVGqjP9OFW+InKgAFNgDgk1cIJV79B9
         +vWaGViwr5MJmkxImak/HXMa8OOowY5FZ8uYoFTGJb2HLi7cfvCxEQMRgQVF1tQcI1ao
         ZJb8IprG7OjDwI4zoMzlL5tHSJq3VnSohJkiSqZZyxen+ib+IwLdbCJY2yCF+P96qGiN
         LC0Uer4vt+VJgM6NrZcH6hNqugwzH+9RWmzRSm8h4Cnb3fSHiMR7jpTRNDCiIrj0nfFl
         gKbPpfZxGrPhCnwG8IOg0H63uFNH3zrWkNqugA7V7yWmu64o1rAAFOjw+sDnLJ2hWADQ
         736g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FlpQDpgfzYO8bkfh4cMszg0/T78Fhsl1RltJ87TAlRU=;
        b=Jpu+Ff8cA9HIj6u54owcWjGocNr27n7PlkFPI9UldTJLqIo8fY+OkID5QSsN8+pzIt
         Ss70wLfj+6WWpASP5/rQz8H8FvEVWpUJhWT+JPsMCY2C1q3xOaUFp0N2L0fyiHFzkcJ0
         9inqT74icxigOjL3HTAmeqUeBvAKoRm4Zgcs9UPmZ4qIkc5Uqexcr4x2bnA76INqap0Z
         7h/ZnuOyZjHSn0getGFeKrhnNbrRWJkydRNY8Se4ZVC+pgQkOJaxpvPjOC22aNeXTESv
         m8zci59NLF2mAkjm6geMwBGcGbu0xmkhEtwWJ3GrzrwhfIGrRK1clVorB6Ej12Q70p7S
         JLaQ==
X-Gm-Message-State: AOAM530AIBOila4Kku/fH0oiPrJ6Y7lTBm1TG75Kn8/UZ5q1QvbqCvvF
	0kfW8b3+NJCeFn2+DedqaipW4g+v7Jx70Cel/QI=
X-Google-Smtp-Source: ABdhPJwDMebJlAtKUHDZCHSo+ws2+YUxxqQ7XbPLrbLq6kPNgWiQRshMWFU3IZuz1ZqVVHTXQ5dZm5+HnWb6NnRygRw=
X-Received: by 2002:a0c:ba0c:: with SMTP id w12mr11447891qvf.4.1591940457439;
 Thu, 11 Jun 2020 22:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200611090904.29772-1-leon.anavi@konsulko.com> <20200611090904.29772-7-leon.anavi@konsulko.com>
In-Reply-To: <20200611090904.29772-7-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Jun 2020 22:40:31 -0700
Message-ID: <CAMKF1soGT84aAF9Swywx7XQ+cUpfK44GvnEM+C0xNYcJJjQstQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-pocketsphinx: 0.1.0 -> 0.1.15
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 11, 2020 at 2:10 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Add pulseaudio as a dependency and required distro feature because
> libsphinxad requires it. Upgrade to release 0.1.15:
>
> - Add all travis osx
> - Remove bdist_egg and bdist_msi
> - Bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...ocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> index cb22040df..5aa0eb6bc 100644
> --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> @@ -5,9 +5,10 @@ SECTION = "devel/python"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
>
> -SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
> -SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
> +SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
> +SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
>
>  inherit pypi setuptools3
>
> -DEPENDS += "swig-native"
> +DEPENDS += "swig-native pulseaudio"
> +REQUIRED_DISTRO_FEATURES += "pulseaudio"

this also needs to inherit feature_check
please send a followup since I have applied the original patch.

> --
> 2.17.1
>
> 
