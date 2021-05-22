Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.2574.1621652364470613291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 19:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s+kqflJh;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t193so15696641pgb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 19:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O8jtbN0W86scYimJndffnBEtGyFnu6amu5WylxngtmI=;
        b=s+kqflJhMvrNvoBKBFT6p4Q7OtF3E4pWWJxH8FNcY7sNZnEUOKCLAtMy1IXjYofWTZ
         HwqsIbEcNvAwnSz49IBnA88SvdikAdcEd8k6N4IxLPrpkPROzxDSKNvGWV4MMqp7ee04
         Xm3cwI+J9hSH8FhU7zCQSCZmnlW9GyaxhqkG5bFovbfbGv48GVLT6QOG5XnM13wyha4M
         Z9XlYewNseVqGcWjhS/8RgmnkWU6tT1wGTVjwHgGqtUfunUFA3BQg2BqfMNUn/TdkhE/
         9hgdymHyw2p5B4X52p2pzMJODn1bY++M7WdqIR9/Yj+QySEBGOfcfUr9SpzEC3MJKwrQ
         2zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=O8jtbN0W86scYimJndffnBEtGyFnu6amu5WylxngtmI=;
        b=h6N0thxXZTr65aBLxU/aP/pDO1ZytF5WyuImnFQcj8PpdykPaHvK60+39mFFEFGu9d
         IgvYJyVcr7ewqCZ0cTIlP6V2riNUaXCcJg+4Fo1q2bXms4C7Y/0LOlW3DZI3KMSymGWx
         B0SjF7THKVpyZzNEkVa3YaJeSmB0ADy69Cjb008l/2uKyYvsqeVZOIFcyBvqhtJC0b3k
         +EY/vn/kog88/iLTIg2wE6s3aCOD8eJKEAoFcHFTCZwjsezBEgA4eRLxzIEr17MicABj
         mqcVVmBh87SJVxWyQf0nEuzTd2NlOK7fgq+0iZlHNFIB/7vw//1102N+TUVwubvCW+gj
         0F9Q==
X-Gm-Message-State: AOAM531NYuxwk1mnmMem5S4HUgTMlXuaazHQyA7jzDNMj2ksjoslHZsQ
	3h2gSZ4eqd+dlYXEiITTadjBGgk1yL9O3A==
X-Google-Smtp-Source: ABdhPJzYKwWkkMxbyzzJVjXhI2fSg5FcfTxqKb6uBs8VjkWJLRySNVT5Rxy4LjYgELuL5DctnVonuQ==
X-Received: by 2002:a63:fc20:: with SMTP id j32mr1886329pgi.8.1621652363516;
        Fri, 21 May 2021 19:59:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c4b7:9807:d29b:dff? ([2601:646:9200:a0f0:c4b7:9807:d29b:dff])
        by smtp.gmail.com with ESMTPSA id g202sm5539757pfb.54.2021.05.21.19.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 19:59:23 -0700 (PDT)
Subject: Re: [oe] [PATCH 01/17] giflib: upgrade 5.1.4 -> 5.2.1
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <49c18c1b-9c00-a1c0-c2f5-c8070195dfc0@gmail.com>
Date: Fri, 21 May 2021 19:59:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 5/21/21 6:35 PM, Andreas Müller wrote:
> Checked sources: Back ported CVE-patch can go
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   .../giflib/files/CVE-2019-15133.patch         | 23 -------------------
>   .../{giflib_5.1.4.bb => giflib_5.2.1.bb}      | 19 ++++++++-------
>   2 files changed, 11 insertions(+), 31 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
>   rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb} (54%)
> 
> diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
> deleted file mode 100644
> index 9957be82f..000000000
> --- a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
> -From: "Eric S. Raymond" <esr@thyrsus.com>
> -Date: Sun, 17 Mar 2019 12:37:21 -0400
> -Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
> -
> ----
> - dgif_lib.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Upstream-status: Backport [https://sourceforge.net/p/giflib/code/ci/799eb6a3af8a3dd81e2429bf11a72a57e541f908/]
> -CVE: CVE-2019-15133
> -
> ---- a/lib/dgif_lib.c	2021-01-13 19:28:18.923493586 +0100
> -+++ b/lib/dgif_lib.c	2021-01-13 19:28:55.245863085 +0100
> -@@ -1099,7 +1099,7 @@ DGifSlurp(GifFileType *GifFile)
> -
> -               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
> -               /* Allocate memory for the image */
> --              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
> -+              if (sp->ImageDesc.Width <= 0 && sp->ImageDesc.Height <= 0 &&
> -                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
> -                   return GIF_ERROR;
> -               }
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> similarity index 54%
> rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> index 1871bab46..cbb57782b 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> @@ -3,14 +3,18 @@ SECTION = "libs"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
>   
> -SRC_URI = " \
> -    ${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2 \
> -    file://CVE-2019-15133.patch \
> -"
> -
>   CVE_PRODUCT = "giflib_project:giflib"
>   
> -inherit autotools
> +DEPENDS = "xmlto-native"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
> +SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
> +
> +inherit autotools-brokensep
> +

do you know what broke out of tree builds ?

> +do_install() {
> +    oe_runmake DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir} install
> +}
>   
>   PACKAGES += "${PN}-utils"
>   FILES_${PN} = "${libdir}/libgif.so.*"
> @@ -20,5 +24,4 @@ BBCLASSEXTEND = "native"
>   
>   RDEPENDS_${PN}-utils = "perl"
>   
> -SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
> -SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
> +
> 
> 
> 
> 
> 
