Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.7531.1620828499850783550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 07:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=roQ88Uzx;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id 76so22241087qkn.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 07:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1hA+/nZo+7KUZYqMWaK89rybU5xTNsuuy3zhLzXlQI=;
        b=roQ88Uzxj6JyD2DHL6+UG2aAlwdGsVPWcbddOg2sNrrdkbIPQljJb8777n9VG0MLlt
         tq9mTew1jeBMaj/Ac3n/mUO2bDBJ5IbR1ZVYqg4xlV3qx7ANtBfHMvfjJMOUTUqB4wLD
         ZpGqE9x9DgjmPa17xTRJgdkV3k9TTEmGORjQgj70e7okMRxuL5DlHxkYmK6wnUU5oZpq
         oxY3zVLGkuJT4cYF6BGTGVRm7AcgAg8/KaAk9x/T25yE8KbisBhakUNTPtSkup5q6j12
         EEQHblbhKS8N3Fz7WyXMC5uHHoxYHZuXoKutvAddUt/p5iF5b/iIsmHGW2zHjC2foZuL
         153A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1hA+/nZo+7KUZYqMWaK89rybU5xTNsuuy3zhLzXlQI=;
        b=DtL/x1p4gq3jGAIncFjWGTirPEvAdWwMJWdnZMd4Dguv4Zzlypm7T/NOBVE5IQS1RY
         pd3cIzKmXS+coldj5BU4iMeNKORanQeal9+Gp7vrNI5ecpkC0qH2TAcjDCFuima5J67A
         ViP32/mrc8Cy5W3IRFrXoWVdBfxq/JJV/AQQvoW9oftxXWwNvuG5KyDJN7+/9jhHtm1O
         3htpzcJfZCI3pqBBQClf3USUCRlmggIERSctOG4gQWKljZBrVClnd1YK8Zp/PmtvqCqG
         ZfrVfciX5mjO2mSpz0rxMkLWOGaZPUS2JSG6hv01eofxiSvb65u6slcuRKt6vjJT6XRz
         DxEQ==
X-Gm-Message-State: AOAM532WVEh9EXj/OEPoSBNW5oGRxEYviwS7isooZ85B1Gfx1X+2NNye
	cAU9c2orAogml2nf8/axf56hLvC5yjDhCSlV24M=
X-Google-Smtp-Source: ABdhPJzgwtztvx30jbGQ3QSf+y//N7c6ROfEXDZ0HimuLgiE3dG4gPfa69dsSEMeys4tJgqG4mQBUqmKlXjQoG16EIs=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr33299706qkd.381.1620828498897;
 Wed, 12 May 2021 07:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210512130841.51911-1-stefan.wiehler@missinglinkelectronics.com> <20210512130841.51911-2-stefan.wiehler@missinglinkelectronics.com>
In-Reply-To: <20210512130841.51911-2-stefan.wiehler@missinglinkelectronics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 May 2021 07:07:50 -0700
Message-ID: <CAMKF1sruw_kR1yC1Ceucdwc9hvmtisb=iDFP83dUZqsbCvD_aw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] restinio: add recipe
To: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 12, 2021 at 6:09 AM Stefan Wiehler
<stefan.wiehler@missinglinkelectronics.com> wrote:
>
> Header-only C++14 library that gives you an embedded HTTP server.
>
> Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> ---
>  .../restinio/restinio_0.6.13.bb               | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
>
> diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
> new file mode 100644
> index 000000000..ec9b056e5
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Header-only C++14 library that gives you an embedded HTTP server"
> +DESCRIPTION = "Cross-platform, efficient, customizable, and robust \
> +               asynchronous HTTP/WebSocket server C++14 library with the \
> +               right balance between performance and ease of use"
> +AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
> +HOMEPAGE = "https://stiffstream.com/en/products/restinio.html"
> +SECTION = "libs"
> +LICENSE = "BSD"

it seems to be 3 clause BSD can you check and if so make the change and resend

> +LIC_FILES_CHKSUM = "file://../LICENSE;md5=f399b62ce0a152525d1589a5a40c0ff6"
> +DEPENDS = "asio fmt http-parser"
> +
> +SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/restinio-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "37a4310e98912030a74bdd4ed789f33c"
> +SRC_URI[sha256sum] = "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b5000f5252e0188848e7"
> +
> +S = "${WORKDIR}/${PN}-${PV}/dev"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "\
> +                  -DRESTINIO_TEST=OFF \
> +                  -DRESTINIO_SAMPLE=OFF \
> +                  -DRESTINIO_BENCH=OFF \
> +                  -DRESTINIO_FIND_DEPS=ON \
> +                  -DRESTINIO_ALLOW_SOBJECTIZER=OFF \
> +                  -DRESTINIO_USE_EXTERNAL_HTTP_PARSER=ON \
> +                  "
> +
> +# Header-only library
> +RDEPENDS_${PN}-dev = ""
> +RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> --
> 2.29.2
>
>
> 
>
