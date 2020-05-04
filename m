Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.13679.1588619862357107470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 12:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEhiCv6J;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id p25so6004310pfn.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yDr6VhissDgpLHt6DPMoHnUGQafamisAUVAtkHzVoxo=;
        b=NEhiCv6JhHaWmH8Zf5Nl6OrUVtNOfQHeuZmjpaAX9yRSoAtvwojJFOPbcYcdzSI44R
         UG3myFHpppLOj80+r75H9YgtPhc2GUlhGniSc8imSW6OUgo+gPxHRGE45uHUoSHRb6Uh
         T04L+MCaNdNQioHCMaaGYOkwFc00PQdIUhzZ8K4gMuKfumyvFk8G3DVkwNJ2QpVvE/yQ
         AzcOPXEUYncVI5HNyvl5M8EIXeTe592Lggk8LbKl1Uw6WqHTp+8GI9o0XyijmeBabb7A
         /gJlLM32rL2QIjvHyntiES1699Na8tcE4+PxqnPx1TQ/wsWLmJ44bFZ2SPfCXlTONwpp
         CmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yDr6VhissDgpLHt6DPMoHnUGQafamisAUVAtkHzVoxo=;
        b=D1SUfcSyvvEKXGpnIhoMR285ItVo2WkP4QHsJEKvvxEGIae7Wyf1R8Y2MA3PmWEM1r
         NbPjBtHraxy80ykeP1L1/vo1AfubaHWi2MOF2/B6NDZ+HK2qw/itI8dD3vPG8zeGEG5i
         +daUJleBBmncScqWs67LynMwwZjX13ma8ciikgkd+xD9aR2WF9C4+0iOzxYL/6j3k+Zw
         OkqBk4fSQZ0YqewjBgsecC9wccfbOYogc8IzKGPTu8mnex6Iz1KeiymxnaMfoIlHQEuZ
         jHAKLRyLcVtL+63wE4Svgmsd6XWNfH9S5plSOHghqWAYXFUE+k9rWT8TBJlnqB/S7aaY
         QVWQ==
X-Gm-Message-State: AGi0PubqWTjDkun5AEXO2a1o8lZ7sFNqzUry+v9hS+YOovm15SgLYRi6
	EPsNy4ktcCCyKV+NNF2IdL0=
X-Google-Smtp-Source: APiQypILayHaUIiSwaeW+kKTPROsy1LTCtp8ry5cIOC/7oh7T4PbYjptkqYeEDoHcz/9GiV+HZNFYA==
X-Received: by 2002:a63:e547:: with SMTP id z7mr409403pgj.177.1588619861620;
        Mon, 04 May 2020 12:17:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::b3aa? ([2601:646:9200:4e0::b3aa])
        by smtp.gmail.com with ESMTPSA id g14sm9442926pfh.49.2020.05.04.12.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 12:17:41 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] cpprest: update to 2.10.16 and refresh patches
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
 Gianfranco Costamagna <locutusofborg@debian.org>
References: <20200503094842.16403-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <fe9d3fca-4aec-4cf1-e231-3f9ed7d98994@gmail.com>
Date: Mon, 4 May 2020 12:17:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503094842.16403-1-costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/3/20 2:48 AM, Gianfranco wrote:
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../cpprest/cpprest_2.10.15.bb                | 19 -------------------

this just deletes 2.10.15 but does not add 2.10.16 recipe, perhaps
missing git add, please update and send v2

>  1 file changed, 19 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
> 
> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
> deleted file mode 100644
> index dee5ae256..000000000
> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
> -SECTION = "libs/network"
> -HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
> -DEPENDS = "openssl websocketpp zlib boost brotli"
> -
> -EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
> -
> -SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
> -           file://disable-float-tests.patch \
> -           file://disable-outside-tests.patch "
> -
> -# tag 2.10.15
> -SRCREV= "b94bc32ff84e815ba44c567f6fe4af5f5f6b3048"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit cmake pkgconfig
> 
> 
> 
> 
