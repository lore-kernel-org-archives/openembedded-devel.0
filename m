Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDF1C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:27:18 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.13463.1677083229313678157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BNC90pub;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id s12so8130192qtq.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 08:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0GHl0vSBcPdGQJ0IRA/KwZObXDaXjFih4GHCFtzVQ8=;
        b=BNC90pubRIfS4CBDkbHP7s7uUQ32WNwqCCVcPp0T59H6O7Xa3RWQzGCOuLfrS8nJP3
         lj8aQMEbt+KYYsok2N650R01CHY5QYs49r9vTbln/xq51YxQ5++OQFJ5jTxWB3DdAJGQ
         sV+jnHGdTlBFPH4YGWpqbVoNK53a6yyua9u1QWTI1Xz1Ls1StN+VIu70YC5oaRCsbt1J
         pmCkFRZYwa+2LI6F9eiImj0FuSjxXXhWQbDlGBvYhNpPlQhBQqwQGpL+6YO8wGndjGpu
         f9fTPvFqRaeIlQeJzmaiotNCcPqQmFbUbZQoWOxdZW4VNvq3UI8VZkNUT6jycAuee78w
         RZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0GHl0vSBcPdGQJ0IRA/KwZObXDaXjFih4GHCFtzVQ8=;
        b=GJydwxhclg5XVQ97akMyjByA3UBkslx5uhg8DI00+j/cqWD1mrliyouHDtvQapBhUu
         tbPFFrLhohEYwkFaYDP58yunwWh17h0jqzTOisFGOLpmxSDSya4xJ+f/TCBex0ThI2i7
         ktHgkqW+Jww3txRDv8RnVurclTRgGKQhmxVYvJnCPJMdq9MT0hVEV0Z9v3R0uiSldOMA
         GtU5oww1W7sLZACSGGYspz88L1ZnnE0CXbn1T56UsU+4OqPqTjDeynCvnW+dc8EHudB3
         XFOPPk20iakbdTlkKYSuB58Brd1qEQPda81AF43aqtrBCU+rjzF8RuzxrNasELpN63ws
         pKqA==
X-Gm-Message-State: AO0yUKXhYNnJ3P3jVCQKBtQqFaBl3zsjLUUVfUqHk/CM0zCwwkIAE9AD
	qa24Ns9kj7A89qTlGfLhOs17cAeoosQ=
X-Google-Smtp-Source: AK7set9/zDXjgmgTmPjnDimVOUfElqlPIRZRfa2/7JfD5ONMrzmU77uaayodPFcM+MY8MO0z1e7caA==
X-Received: by 2002:ac8:5b44:0:b0:3b8:118d:83d9 with SMTP id n4-20020ac85b44000000b003b8118d83d9mr480190qtw.4.1677083228323;
        Wed, 22 Feb 2023 08:27:08 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:8384:964c:970c:db9? ([2600:1700:9190:ba10:8384:964c:970c:db9])
        by smtp.gmail.com with ESMTPSA id a24-20020ac87218000000b003bfa66b7484sm2318594qtp.35.2023.02.22.08.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:27:08 -0800 (PST)
Message-ID: <5940a51c-3d65-727a-9bfd-689b4d466f6f@gmail.com>
Date: Wed, 22 Feb 2023 11:27:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Content-Language: en-US
To: hsimeliere.opensource@witekio.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <PR3P192MB07147F5AED87B5910212E896DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
 <PR3P192MB0714EDE5FDDFCA103DD8151DDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
 <PR3P192MB0714EF98477EEC643F6472BCDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <PR3P192MB0714EF98477EEC643F6472BCDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 16:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101212

Hugo,

I didn't catch this but this update was already posted 5 days ago.

-armin

On 2/21/23 12:47 PM, Hugo Simeliere via lists.openembedded.org wrote:
>
> Refresh the following patch:
>
> 0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> (cherry picked from commit 117b3f95507b464aafe6a1948cf4a79f26194acb)
>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>
> ---
>
> ...void-host-specific-path-to-libsodium.patch | 19 +++++++++++++------
>
> .../{zeromq_4.3.2.bb => zeromq_4.3.3.bb}      |  4 ++--
>
> 2 files changed, 15 insertions(+), 8 deletions(-)
>
> rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb => 
> zeromq_4.3.3.bb} (87%)
>
> diff --git 
> a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch 
> b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
>
> index eb3dee4d3..3b0300c8a 100644
>
> --- 
> a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
>
> +++ 
> b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch
>
> @@ -1,6 +1,7 @@
>
> +From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon Sep 17 00:00:00 2001
>
> From: Niko Mauno <niko.mauno@vaisala.com>
>
> -Date: Wed Apr 22 09:00:00 2020 +0300
>
> -Subject: CMakeLists.txt: Avoid host-specific path to libsodium
>
> +Date: Wed, 22 Apr 2020 09:00:00 +0300
>
> +Subject: [PATCH] CMakeLists.txt: Avoid host-specific path to libsodium
>
>  Avoid propagating full build host specific path to generated
>
> ZeroMQTargets.cmake when building with libsodium, which changes the
>
> @@ -17,10 +18,16 @@ Upstream-Status: Pending
>
>  Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>
> +---
>
> + CMakeLists.txt | 4 ++--
>
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
> +
>
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>
> +index e92141d..d0775c1 100644
>
> --- a/CMakeLists.txt
>
> +++ b/CMakeLists.txt
>
> -@@ -1210,7 +1210,7 @@
>
> -   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} 
> ${CMAKE_THREAD_LIBS_INIT})
>
> +@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)
>
> +   endif()
>
>     if(SODIUM_FOUND)
>
> -    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
>
> @@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>
>       # On Solaris, libsodium depends on libssp
>
>       if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
>
>         target_link_libraries(libzmq ssp)
>
> -@@ -1240,7 +1240,7 @@
>
> -   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} 
> ${CMAKE_THREAD_LIBS_INIT})
>
> +@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)
>
> +   endif()
>
>     if(SODIUM_FOUND)
>
> -    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb 
> b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
>
> similarity index 87%
>
> rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
>
> rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
>
> index 02a4c04fd..a10500475 100644
>
> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
>
> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
>
> @@ -10,8 +10,8 @@ SRC_URI = 
> "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}
>
> file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch 
> <file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch> \
>
> file://run-ptest <file://run-ptest> \
>
> "
>
> -SRC_URI[md5sum] = "2047e917c2cc93505e2579bcba67a573"
>
> -SRC_URI[sha256sum] = 
> "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763"
>
> +SRC_URI[md5sum] = "78acc277d95e10812d71b2b3c3c3c9a9"
>
> +SRC_URI[sha256sum] = 
> "9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2"
>
>  UPSTREAM_CHECK_URI = "https://github.com/${BPN}/libzmq/releases 
> <https://github.com/$%7bBPN%7d/libzmq/releases>"
>
> -- 
>
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101194): https://lists.openembedded.org/g/openembedded-devel/message/101194
> Mute This Topic: https://lists.openembedded.org/mt/97114479/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


