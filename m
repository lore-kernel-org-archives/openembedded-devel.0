Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.1237.1598379941333346432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 11:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qV4bkZ0j;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id i2so6504264qtb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LBmqqZe9dI/NKBS7Pmom/eRs36ropIZPL+lWzyhGVQs=;
        b=qV4bkZ0jw8aA2/XXLQTAhKB4FjkgDbUi8+WUg0HEf0/fpE+m0GTxQJEBRv1oYnLMGs
         q3q/WEGq8ug8dRlEO3DqqLGySX+bkjQ2DHJaVfKso7rz1z9XiPEFrWD352DTJPPyX1hV
         mJSW+5MOhZpU1pKd4n1n1u38CDXXGr1dhpqbGWFKnrjL+4y/zdo+S/7UDzCQwYNdYeI6
         C6WWMGpAznaOzHo6YBHZREoiyvRgjtssa+k+eBDsc2wqQddh7DPL68RUL8fSYs2xIu8K
         PhPqeEkqW13QxNe6tPqp1HH1Jx8/ry6aolcgXZv799jrZy5kuV5yr8Gj/hOhJsI8KNYk
         iAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LBmqqZe9dI/NKBS7Pmom/eRs36ropIZPL+lWzyhGVQs=;
        b=Iv8RscfjUbyGvOnbCYlknzzlriTDkMACZAcWMUeBweqNzTGa+gVePjU/BV57GdZW8l
         54WaLbXydTL/Ktwsx7zYPxmTm8ilKF54gNNfyj9Nmk//SsFJ5xV6/Wqqr/F4YZ5FRU1E
         TL7210ovWiPSqqfUaO4ik9TAGRG/e8tbDE7Cl9FwcmhrBIoNi8rTschuTgYydYCZRFYb
         R3KBN9STL1Jg/swd9KJrJP82uxSoponK+P0+VmtvxKTnJ4jV/OvM8+y5SOMGozC8gUdx
         LlB7iJt20tEIOSA0Ht54oZY+89VZxNrJogInmpnomewe4JxtQdGDpaMtvpWfF0BHnywt
         kGgw==
X-Gm-Message-State: AOAM531lx4TEe2Lp7pcN2imRWMn5edBmeBaYyTiOteqNNfQrw4mHrs0m
	WZv6xYsceOeMWye+djrYwC/42ApzQU/ZTFFxTzI=
X-Google-Smtp-Source: ABdhPJw2YkSJM52F3S8mZ1nhUYw+iitL653fSy4GF1WuqmswlR/V4NMLrilNkeCLljn76X7ixrxjz2eHrvL07yI310A=
X-Received: by 2002:ac8:70cd:: with SMTP id g13mr10688995qtp.53.1598379940294;
 Tue, 25 Aug 2020 11:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200825095407.18867-1-leon.anavi@konsulko.com>
In-Reply-To: <20200825095407.18867-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 25 Aug 2020 11:25:14 -0700
Message-ID: <CAMKF1soynk8yNEZA5LZL4K-DpY6v2S2sRwQJQgp7dQ8BkqZgSw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] doxygen: Upgrade 1.8.17 -> 1.8.20
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails to patch doxygen-native :(


On Tue, Aug 25, 2020 at 2:54 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 1.8.20:
>
> - Add configuration setting to have docstrings not as preformatted
>   text but as normal documentation
> - Bug fix: void return type reported as not documented
> - Bug fix: Doxywizard 1.8.19 (Windows): Source code directory
>   seems to be ignored
> - Bug fix: The Doxygen uses too much memory (or has probably a
>   memory leak)
> - Bug fix: Doxygen doesn't stop on errors
> - Bug fix: C++ grouped functions in namespace have disappeard
> - Improvement of line count for e.g. warnings
> - Improved layout on the bibliography page
> - Updated the swedish language translation to 1.8.19
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb} (79%)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
> similarity index 79%
> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
> index 45de71826..d4ac3b720 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
> @@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>             file://0001-build-don-t-look-for-Iconv.patch \
>  "
>  SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
> -SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
> -SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
> +SRC_URI[md5sum] = "8729936a843232a66fe970ef65f3c3e4"
> +SRC_URI[sha256sum] = "e0db6979286fd7ccd3a99af9f97397f2bae50532e4ecb312aa18862f8401ddec"
>
>  inherit cmake python3native
>
> --
> 2.17.1
>
> 
