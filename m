Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web10.2533.1600371480454893966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 12:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eSSnBCik;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: george.mccollister@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id n2so3865449oij.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r/sGnfmS7V1QDg9xXOQuUXOFDInQtbidF8b7/HTTFbs=;
        b=eSSnBCikiIj3fU5Z6p/9Wpzz9VaZo7A2+/dt81HPdiA99dOTgpkvdRjJYWOSf383sc
         bkqADCt8c5Sw2zrkrKfTyk3OU5wRCTr1SoORKndX2NfLNwKGdpLZcz5HdK+7W9Rtl8UV
         7BZyrSoUk1UgNS1qj/nm2zejOf8C0BRhj8eaiu0Dk3BpRAiEY0YLEeHXeGs+5vkSANO5
         VeuW3Cgx4G7s3Mnf8JIDk8bjK4SJTwUyQIUuV1dvWI2Gv5EO3xghVe31krrO4PWiEYjB
         ydKsI61p+0upM36+uz4B1BfRTSrGLTTErA2FqG76WEUOwH+HOsQ8ImI3J7Mb8kbtIksO
         FQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/sGnfmS7V1QDg9xXOQuUXOFDInQtbidF8b7/HTTFbs=;
        b=U/cOQkFfi7EMYfqc0WNhFCc9zyQtNZBjzxTaIRr9LUDReeZRf6X5OqRdmT/L90mZmB
         WP6FuxmVFOz4DA7yhdThEM26YOyYSzXpKMsh+BK4Qts5y0bJNEWbmNLGaHAo+3eEQobP
         0Yebgprm3Sa+HRMKbwtv3DcZJXONp1ggaF8NiqrHij5kgwrFULfUv5i2EPLCwt7fTwnr
         jSPSqgPYThBZHpaYfc5S4TaplJu52/0sehlstl5gH+m+EQxOgDG5RQmdhfNjOnQdWFkQ
         /gbYKruOSkGky6F0c+rxeLUOPGzNFRc70lqXnmnGJ+1CSvCNsAC2EaEpPRAuJT8RDFtF
         /PZg==
X-Gm-Message-State: AOAM530RGHhwj510XM2i+TjZIdyrPWoHrJq6IMifxhSyrtNVyY655thR
	QupGekwKYrWKgRL7r/eaG6svwa40T200YdyRiw==
X-Google-Smtp-Source: ABdhPJyt8WFthuPfTZku8UBd68sHZTrwdoymT7IfJZpKhOrYV0uYeAZl8vAHCkemzZ6QtCwPtNV+S6Iq3DfR20NzoT0=
X-Received: by 2002:aca:cf88:: with SMTP id f130mr6770828oig.122.1600371479712;
 Thu, 17 Sep 2020 12:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200915171003.30632-1-leon.anavi@konsulko.com>
In-Reply-To: <20200915171003.30632-1-leon.anavi@konsulko.com>
From: "George McCollister" <george.mccollister@gmail.com>
Date: Thu, 17 Sep 2020 14:37:47 -0500
Message-ID: <CAFSKS=PkM5Ki1ettwe+jsw3rp9oJAQ1p71PWucsthNnuJTD9Fg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][dunfell][PATCH] libldb: upgrade 1.5.7 -> 1.5.8
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Yi Zhao <yi.zhao@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 12:10 PM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> From: Yi Zhao <yi.zhao@windriver.com>
>
> Samba version 4.10.17 which has been already available in Dunfell
> depends on version 1.5.8 of libldb.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.7.bb b/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
> similarity index 95%
> rename from meta-networking/recipes-support/libldb/libldb_1.5.7.bb
> rename to meta-networking/recipes-support/libldb/libldb_1.5.8.bb
> index da77a2389..199db797a 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
> @@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>                      file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
>                      file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>
> -SRC_URI[md5sum] = "4d72bbfe7c7fcdf592482a98c853d222"
> -SRC_URI[sha256sum] = "b9eeb77ecb94f3b53caeff7cbc1850b6294fa937be4364c53a92a62c6548c001"
> +SRC_URI[md5sum] = "d9b4bea8b48cd4c4d0c492e65881164b"
> +SRC_URI[sha256sum] = "ddf7f770643e0a0dda60f2818913f883caeed37fa1e8d6eda0dfe9588c1e3a83"
>
>  inherit waf-samba
>
> --
> 2.17.1
>
> 
