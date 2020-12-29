Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.110.1609285856261180947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Dec 2020 15:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hMKyjk9c;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id h16so7078592qvu.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Dec 2020 15:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rqgc05jwuKkWw+ZdHorWMWGxWqvvQVqWKiGK7REwUH0=;
        b=hMKyjk9cwlTd8zaCV4xVWvkY+53uVNkwX/L2fWMwGT7vvwMI4reMHeAOSHbMKQahW1
         P2HFv3g5c69v6RCyqwWF7YRn4BBBCQonrREonc9KgjAMD1z9FNPhks8gEJjONmP9N/yB
         2yf8k+zxoVF1uu3geIrq4ujBn9SC6vl2MsWv04VNdESEAn6Akl2B35MD71fRQS8Yxf6V
         h08MdCJWoLvfkawrPd3FUVwGjl4UrcmSzr8WK6DudRQwpMi/tTMMZKnLMjyecqmen9Lt
         Bg8riZd9gQkXA0UuSls8l2XBNjahmJnsFnUJnFZsYet+I12diQWS69MicbZAz2pqkFoG
         a+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rqgc05jwuKkWw+ZdHorWMWGxWqvvQVqWKiGK7REwUH0=;
        b=Tjy8pvVoViPtiPdoAHlBbTbto6v0e1cFiQeRGDXmQAnuW+kNG5G9h9rpeMR3V2mFiK
         jzIsBytrMrkoWeqelvbpBMRDxtZEYIm0I4b+rJELeAGYZDKH/Yhe2XckEWxg9fYdGJgD
         PQZcQ8BNq/uq2dkAyiLSspIIdd4u5P15Ao3vu4QslLzi/sq8Oftdc6ObC5c/rGfJgDw+
         afiHtKPEqSD5WWlyzzip032yQfAouX4vspRUAfqG1O+FQ698pwHdu5kpPGx0yFDoulpt
         PfltEhXUED6MLWE3O+ORn1BLXzORC7TCBJURwKEEmEG004C+nUtgA8AOAqiz5Polx3OM
         toYg==
X-Gm-Message-State: AOAM530fdVcuHBWyDczeBYEHsyf0CfU00gJ2U4GmqLTWPzL0spOhz1en
	nj9UnEeMm37vA95Ezh+ISqUHo/a6kNBc1lhAvrGv3a6S2O3XgA==
X-Google-Smtp-Source: ABdhPJyakbd3GBmB630iERMplxQfXX415NU9eEo6mIRoNkHtZgNMLkvQ5V8BPtyjRvViNh0+i7iVl+IumekYxk7iMpw=
X-Received: by 2002:a05:6214:28f:: with SMTP id l15mr53619404qvv.38.1609285855321;
 Tue, 29 Dec 2020 15:50:55 -0800 (PST)
MIME-Version: 1.0
References: <1609134891-90011-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1609134891-90011-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 29 Dec 2020 15:50:29 -0800
Message-ID: <CAMKF1soLyHNXsN41=6fRB5dRVVWhaxDtiHZT85vOivHOBs3=vA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] giflib: upgrade 5.1.4 -> 5.2.1
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think this is failing leptonica see

https://errors.yoctoproject.org/Errors/Details/540373/
https://errors.yoctoproject.org/Errors/Details/540378/

On Sun, Dec 27, 2020 at 9:55 PM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb}          | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb} (58%)
>
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> similarity index 58%
> rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> index 21fa352cd..8d3f3f1c9 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> @@ -3,9 +3,7 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
> -
> -inherit autotools
> +SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
>
>  PACKAGES += "${PN}-utils"
>  FILES_${PN} = "${libdir}/libgif.so.*"
> @@ -13,7 +11,8 @@ FILES_${PN}-utils = "${bindir}"
>
>  BBCLASSEXTEND = "native"
>
> +DEPENDS = "xmlto-native"
>  RDEPENDS_${PN}-utils = "perl"
>
> -SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
> -SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
> +SRC_URI[md5sum] = "6f03aee4ebe54ac2cc1ab3e4b0a049e5"
> +SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
> --
> 2.25.1
>
>
>
>
> 
>
