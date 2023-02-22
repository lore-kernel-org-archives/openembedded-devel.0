Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBEEC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:16:38 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.13146.1677082589338805293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=euigCnIr;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id e21so8541360oie.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 08:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrhDx/oHg9Zc4MPbxXiHs837hqmc2xpf8W1QaYV5R78=;
        b=euigCnIrMt80sqIBbOow9rAQ8aSm2an2HxJcXz4VoP8YNCpPPb7xjEKnc78NIzTYz6
         /8S5hIympBtEstqjYwvbb3ARmEVc803L1+rqmDLKA/y1QosDQ1lQ2hdXeQGCAboczvW5
         +I+oABjzE3eAIJrM/I/jTg1b+0uwqZaGmaxdhMIXYq7Z0/sVV/RBzV9WYBrRjKBMggIt
         iQAgHqDKprcr8g2Au9VAwn+kbTgOqiUm1Kw41O2klfBvPEM3JKRfz0WOQ2Ah53/UHxwv
         lh6zIey8KeySFZWCJ0sX9OjF35ZdiNNkzMYLUrRrtQrDGymk04udDkLHiA6UMrJglgpx
         w4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrhDx/oHg9Zc4MPbxXiHs837hqmc2xpf8W1QaYV5R78=;
        b=CAtOiSaBOAqU91o1cS7pHBrmRduEQqeQFnfziUIC+32/53H6WJAqK6cg1uYwjeWWtx
         5M0632GhWgweVBJarY3CbXvBJTmTqR88KM+J9/fc1dUFBNqcyse1K3ATe8sJI8fUGb6X
         ijrRhYks9GoKWOTkG/+5NSjRgu5KiQpkDZfZ8Mxj5YLb8UBaF7T+IJoTLU5GluZjzH2D
         WZE6H37kupNtc/dIi8Z4i0IAJK7gpnCTkxUmHFyAGor+8jthgqoHfll1Y+2792bhWFcI
         7JTK7Jx90T1kn3zSuEUVGciF9VXM+0+YqzTODngW7JlrJGvll84FDUymY65oOk4fU2zn
         8DDQ==
X-Gm-Message-State: AO0yUKW+0re24sIZsddJD7epHoErS+ZAinxHUpq1X9MSzTPtzdIEBk6a
	MQNBcV2TzScqJ9yehWgg8tg=
X-Google-Smtp-Source: AK7set89IgIaEzUDWmktyeH+10AKB+uI+L313I2DP0x7csIwCsiMAWuof4r1GEdsEPiQFO85ZP8WcA==
X-Received: by 2002:a05:6808:983:b0:37f:89cf:f35d with SMTP id a3-20020a056808098300b0037f89cff35dmr2397732oic.40.1677082588495;
        Wed, 22 Feb 2023 08:16:28 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:8384:964c:970c:db9? ([2600:1700:9190:ba10:8384:964c:970c:db9])
        by smtp.gmail.com with ESMTPSA id 103-20020a9d0870000000b0068bc48c61a5sm1397945oty.19.2023.02.22.08.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:16:28 -0800 (PST)
Message-ID: <ba6fe3c1-a855-5d80-338e-ba220414e02d@gmail.com>
Date: Wed, 22 Feb 2023 11:16:27 -0500
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
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 16:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101210

Hugo,

Is this a bug fix only update?

- armin

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


