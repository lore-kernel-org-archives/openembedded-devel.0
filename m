Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053B3C4743F
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.6444.1649857956039566093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 06:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ncXrsA0c;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id bo5so2075622pfb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ElEZyMKAr5OZBxk7rj5USEb72eEFZa8laB0TO2t78oE=;
        b=ncXrsA0c1k2ftINaU8juY5/UTwkNsSyVUcmx0/37CJjdyg/OJoeZisuObnof6hmu3/
         sbrRw4MzNO7qZxbxzJESQJABMkyeepZlv53m3oWSKRiX9VKa+jeMWD6/nBYNNQy1wVDK
         i3CbRurQfIocrppjLHxjx1MMN7byP8HK+s4odTfTSZE/2IGpN1Gj/ZZ4HLSD3IQ0T34Y
         QNb5eS81ro0pNuu3BkZrSMUqz+0ajfFjnynJZBe1CysgKYNXatPmGKNHgoxAoYeFroAr
         dI1tx3ffBRkl2XeZM30/3AavAAyBTYDc79Hg+ilhc0nvIDrgIreBugN80itNxJXQnuDt
         MSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ElEZyMKAr5OZBxk7rj5USEb72eEFZa8laB0TO2t78oE=;
        b=MdbDQPD/JXVdj9DQ+JyQQuH/PhR8DuNu8Hrv5aDnywD1lepWdXe03O/vMlZ+kMGYHG
         75a23IVwywTOWzI/B4X2sabvw1+fTeEz8/6b++n/laNWmXy3E43VWx607MIDPotk6U2/
         m0v2gCj9BqYOMFbn1rNpeTJ9pAnMBAmxMzfZrJxQU3BBjZxXhKxC2Z9wix0A4PrnzqRU
         TlE5h/+Te0WdgcZxGzhH7ID2UHi7WaHj7imuwX272R9fC1SRh+x202ndmkA4lEui0Bc9
         65ZY7so2b7A9hE4QuwWfBksf9y+lCj0oJdNV/EuF4kUYemCyJPCBlDTDImD8ZDPj54s2
         mtqg==
X-Gm-Message-State: AOAM531SEOIjk6/bk5PcD1gx6iU/04pt7WqLLyXubUplCaFiLZHzaST5
	zzUGG6QXHMtjvHxJjpjPMsI=
X-Google-Smtp-Source: 
 ABdhPJxmAPtI0MeMWSyBNFjyzax2/u+TArdqw0neqFV4Hzo4qLC01/VVbYknph1ZMDXSLeGwwR/JGw==
X-Received: by 2002:a05:6a00:8c9:b0:4fe:ecc:9bcd with SMTP id
 s9-20020a056a0008c900b004fe0ecc9bcdmr9892844pfu.34.1649857955325;
        Wed, 13 Apr 2022 06:52:35 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:12f3:d31d:e1ab:445c?
 ([2601:202:4180:a5c0:12f3:d31d:e1ab:445c])
        by smtp.gmail.com with ESMTPSA id
 nh11-20020a17090b364b00b001cb65949c66sm3251629pjb.37.2022.04.13.06.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 06:52:35 -0700 (PDT)
Message-ID: <b6dcec9c-c20b-645d-645a-1816d1a4eb6c@gmail.com>
Date: Wed, 13 Apr 2022 06:52:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [hardknott][meta-webserver][PATCH] apache2: upgrade 2.4.52
 -> 2.4.53
Content-Language: en-US
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20220413060112.66500-1-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220413060112.66500-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96615



On 4/12/22 23:01, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> This upgarde fix sereval CVEs:
> CVE-2022-22719
> CVE-2022-22720
> CVE-2022-22721
> CVE-2022-23943
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

Thanks, I have this already sitting the testing branch from yesterday.

-armin
> ---
>   ...re-use-pkg-config-for-PCRE-detection.patch | 35 +++++++++----------
>   .../{apache2_2.4.52.bb => apache2_2.4.53.bb}  |  2 +-
>   2 files changed, 18 insertions(+), 19 deletions(-)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.52.bb => apache2_2.4.53.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
> index 6c0286457..60154f029 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
> @@ -1,4 +1,4 @@
> -From d2cedfa3394365689a3f7c8cfe8e0dd56b29bed9 Mon Sep 17 00:00:00 2001
> +From f30e98867031ce0b01a35607af1ac7a2ff9c4925 Mon Sep 17 00:00:00 2001
>   From: Koen Kooi <koen.kooi@linaro.org>
>   Date: Tue, 17 Jun 2014 09:10:57 +0200
>   Subject: [PATCH] configure: use pkg-config for PCRE detection
> @@ -7,38 +7,37 @@ Upstream-Status: Pending
>   
>   Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>   ---
> - configure.in | 27 +++++----------------------
> - 1 file changed, 5 insertions(+), 22 deletions(-)
> + configure.in | 26 +++++---------------------
> + 1 file changed, 5 insertions(+), 21 deletions(-)
>   
>   diff --git a/configure.in b/configure.in
> -index 9feaceb..dc6ea15 100644
> +index 38c1d0a..c799aec 100644
>   --- a/configure.in
>   +++ b/configure.in
> -@@ -215,28 +215,11 @@ fi
> - AC_ARG_WITH(pcre,
> - APACHE_HELP_STRING(--with-pcre=PATH,Use external PCRE library))
> +@@ -221,27 +221,11 @@ else if which $with_pcre 2>/dev/null; then :; else
> + fi
> + fi
>    
> --AC_PATH_PROG(PCRE_CONFIG, pcre-config, false)
> --if test -d "$with_pcre" && test -x "$with_pcre/bin/pcre-config"; then
> --   PCRE_CONFIG=$with_pcre/bin/pcre-config
> --elif test -x "$with_pcre"; then
> --   PCRE_CONFIG=$with_pcre
> --fi
> +-AC_CHECK_TARGET_TOOLS(PCRE_CONFIG, [pcre2-config pcre-config],
> +-                      [`which $with_pcre 2>/dev/null`], $with_pcre)
>   -
> --if test "$PCRE_CONFIG" != "false"; then
> +-if test "x$PCRE_CONFIG" != "x"; then
>   -  if $PCRE_CONFIG --version >/dev/null 2>&1; then :; else
> --    AC_MSG_ERROR([Did not find pcre-config script at $PCRE_CONFIG])
> +-    AC_MSG_ERROR([Did not find working script at $PCRE_CONFIG])
>   -  fi
>   -  case `$PCRE_CONFIG --version` in
> +-  [1[0-9].*])
> +-    AC_DEFINE(HAVE_PCRE2, 1, [Detected PCRE2])
> +-    ;;
>   -  [[1-5].*])
>   -    AC_MSG_ERROR([Need at least pcre version 6.0])
>   -    ;;
>   -  esac
>   -  AC_MSG_NOTICE([Using external PCRE library from $PCRE_CONFIG])
>   -  APR_ADDTO(PCRE_INCLUDES, [`$PCRE_CONFIG --cflags`])
> --  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs`])
> +-  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs8 2>/dev/null || $PCRE_CONFIG --libs`])
>   -else
> --  AC_MSG_ERROR([pcre-config for libpcre not found. PCRE is required and available from http://pcre.org/])
> +-  AC_MSG_ERROR([pcre(2)-config for libpcre not found. PCRE is required and available from http://pcre.org/])
>   -fi
>   +PKG_CHECK_MODULES([PCRE], [libpcre], [
>   +  AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
> @@ -49,5 +48,5 @@ index 9feaceb..dc6ea15 100644
>    
>    AC_MSG_NOTICE([])
>   --
> -2.7.4
> +2.25.1
>   
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
> index 10123aa2b..719185150 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
> @@ -26,7 +26,7 @@ SRC_URI_append_class-target = " \
>              "
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9"
> +SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
>   
>   S = "${WORKDIR}/httpd-${PV}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96608): https://lists.openembedded.org/g/openembedded-devel/message/96608
> Mute This Topic: https://lists.openembedded.org/mt/90435249/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


