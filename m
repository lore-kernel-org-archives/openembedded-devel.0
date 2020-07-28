Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.14726.1595950268496658525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 08:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QSt/ZsPt;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id u64so18977925qka.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sFc7YHvejznAsDTy1DtxUZZedigGmZtI4ia63BWxImc=;
        b=QSt/ZsPtkiTrwGnfW/7uCyakJ3JFejhJZojWTxDs/3UJp0cQxW2XvrrxifmdXJt3vv
         KbM7JESFJEN4TvBHq8pwFoRPLq7nZEDaDQrOmGJhA0lu/70GANqXF5lmOj0B9+1hsjrY
         oWEV1MpJee8VzXcGCjVj0HCI6yuANTdLzdei481ZWKRGmtjbVonm9DNcrx7GB7Qx8RbH
         3Lq0lKVednRC+dzXtoisMemvAD6ltbNtChiRvebwBPXEy+71T0RD/P2Ew1XQH2rlwtgC
         Vds7I/EkuhEqu3qG8X6fvkGoCHD8cr0D9vP4wUm+tL7xDxhSWmRpMJxELxDwgKf43xgr
         5FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFc7YHvejznAsDTy1DtxUZZedigGmZtI4ia63BWxImc=;
        b=NGen07QrDacxKiEpo9Jec/uy1ps+SXCvDg8/4v0YzcDXCqGpRHPaLD8CKdZEX3N1Kz
         wrf9l9hzIDnpkSs7AJ2dJj+MQwy670paGe+WWpppeu0TvmNv1J9eTV5izIF49FB1Dmcx
         5Z7ZjtuC9EI6zjADx3zfx3QGu3Mws4cnM1gz2/OBAYpURT8Es9lEtPeyPvHsBCPzafAq
         PCPhWtYGM4ZpDJg7V35c/IhsFCaq7+qsc1tcSd9MpXTKsPgRLSNRII3nxaGdS+Iq1ISM
         uhVEE9RJUCbzbioS4CecI+fhx6EQyq85Gw/Yq2e8M3F6i2HK1ofI5We0b65gCRKe4+Gq
         vvNg==
X-Gm-Message-State: AOAM5336hkj2WUjVG/MY5B/hO3T5XlaUoDRgOfNgQ4j46GROAfFF4T/7
	6aUOdAB7gnGfC1P70WXJLx6MPNFpOAqw3Ylelj42Y4W3h7I=
X-Google-Smtp-Source: ABdhPJxqhyytru0fPthZChm9HPklWUxGbLFVBSUpoplTJ3SlDHP/MxmNTgYchyXdylELvFUeCAhMEVQ1pmlW5NAgkVg=
X-Received: by 2002:a37:9d53:: with SMTP id g80mr27619344qke.17.1595950267451;
 Tue, 28 Jul 2020 08:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200726123646.34005-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200726123646.34005-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 28 Jul 2020 08:30:40 -0700
Message-ID: <CAMKF1sqjMO=mGzxxWO61SkZ_oVtHAqvbpL6LegEigNL6gPLN1Q@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] doxygen: update to 1.8.18
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

native recipe fails

https://errors.yoctoproject.org/Errors/Details/425409/

On Sun, Jul 26, 2020 at 5:36 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.18.bb} (79%)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
> similarity index 79%
> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
> index 45de718265..f3562b54fc 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.18.bb
> @@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>             file://0001-build-don-t-look-for-Iconv.patch \
>  "
>  SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
> -SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
> -SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
> +SRC_URI[md5sum] = "eda8e82fcc58970894029b0399776cb5"
> +SRC_URI[sha256sum] = "18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656"
>
>  inherit cmake python3native
>
> --
> 2.25.1
>
> 
