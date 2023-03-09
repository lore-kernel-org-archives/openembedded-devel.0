Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02786C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 06:39:09 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7441.1678343943763846486
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 22:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FxXGphDs;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id a25so3115035edb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 22:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678343942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrz5Qe1DNIDt272iN1cWghnfWN1LD1e4N3ZgsnGM5DE=;
        b=FxXGphDsQ8p9aXmqpC1OeOAw9RyV+QVGAGzdEktUq7m2jGfqC/caxW5NxBUWj1/aDd
         Xb88kr/DvluJuhFjVebxa1oZw1u932jl8UpbBR+qdZFjcajP49ZXb+eiid9x3nl/1++7
         djaUKJ0HVe1to7L1xjCMemjxMLNzXYeRuR4FFFDNfI7n8OxROzJZWTZvSiGl11TH0PGa
         tG2bm4pjJZ6hPk0p4GUaoAfyScJ3SmtBpiOwN0l+zrIJZcJMwEw4/DIOLjxoishe1RcT
         X4YTe7mhSC9Of+s3QHemsqyrPUeRG9hj46rcKP4nSyBtDcKIMfNRbnZML2jI3fDC2jqY
         b3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678343942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrz5Qe1DNIDt272iN1cWghnfWN1LD1e4N3ZgsnGM5DE=;
        b=rsNlwk6BtHuMTtPGcLfaEP8zGD0taT3Bem//2sGmsPBq8PG2TDkYuxPmKyMmRwan2M
         9OW3fjheC+sOkTDUX4kfQ9g1G0TzR9yY7KUIcC+DLIP3LGCToRfPf6VJwwxhuBR+dw/P
         thBc+UR0UCV9bNC97T9Qq0QCIH0rAdki6y/9gfuEiHAicrY51x5zgXCYLTXpKsDnGCs6
         wykehyErSVLYOolSW5PIHbkTN7TBKLg3KivYE2qm+PEqkH6cfifqrQtMZ5PtYsms5Qxv
         wRK4jv80ELwinmnzCeS8N6xlJHC9GUgsouROf6qY1Q95nm7Kxig021ab8wjpPGt8WUre
         iKRQ==
X-Gm-Message-State: AO0yUKX2YZsRO6xZO4GgNq1ERy4pWYUSETtDKC1iQGwxM5159lHxxsnY
	aPX7j905VBiIMx3KL5qwMrY=
X-Google-Smtp-Source: AK7set9X5ytvRNciv4myZipdNdQfwKfYoKJeRGGCMBNfkd/Upx8sNtPOni8OpsAAPAhQ7BKY3UmDUA==
X-Received: by 2002:a17:907:9713:b0:8b1:a3c7:a9c9 with SMTP id jg19-20020a170907971300b008b1a3c7a9c9mr25447864ejc.70.1678343942099;
        Wed, 08 Mar 2023 22:39:02 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906771200b008cc920469b5sm8540522ejm.18.2023.03.08.22.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:39:01 -0800 (PST)
Message-ID: <d718385d-7e4e-5750-99fd-5d4984efb025@gmail.com>
Date: Thu, 9 Mar 2023 07:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-oe][PATCH] opencv: 4.7.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230308105719.1360985-1-zboszor@gmail.com>
 <CAMKF1spdVSO46cCcP6vhtkZ3qQu0+Grj=Q1Oqi16oxSvXw_oJw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1spdVSO46cCcP6vhtkZ3qQu0+Grj=Q1Oqi16oxSvXw_oJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 06:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101433

I have seen the previously sent patch only after I sent mine.
Both are identical changes, so just ignore my patch.
Thanks.

2023. 03. 08. 22:58 keltezéssel, Khem Raj írta:
> I have a version already staged in master-next
>
> On Wed, Mar 8, 2023 at 2:57 AM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> Removed an upstream patch.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...ng-header-for-LIBAVCODEC_VERSION_INT.patch | 26 -------------------
>>   .../{opencv_4.6.0.bb => opencv_4.7.0.bb}      |  5 ++--
>>   2 files changed, 2 insertions(+), 29 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
>>   rename meta-oe/recipes-support/opencv/{opencv_4.6.0.bb => opencv_4.7.0.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
>> deleted file mode 100644
>> index 59da6ab32..000000000
>> --- a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From d6bdd0a91eb0ed57688c0af5ba5088cf0afdc0a0 Mon Sep 17 00:00:00 2001
>> -From: Jochen Sprickerhof <jspricke@debian.org>
>> -Date: Mon, 8 Aug 2022 21:10:13 +0200
>> -Subject: [PATCH] Add missing header for LIBAVCODEC_VERSION_INT
>> -
>> -Upstream-Status: Backport [https://github.com/opencv/opencv/pull/22357]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - modules/videoio/src/ffmpeg_codecs.hpp | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/modules/videoio/src/ffmpeg_codecs.hpp b/modules/videoio/src/ffmpeg_codecs.hpp
>> -index 61788e0345..faad2596ed 100644
>> ---- a/modules/videoio/src/ffmpeg_codecs.hpp
>> -+++ b/modules/videoio/src/ffmpeg_codecs.hpp
>> -@@ -60,6 +60,7 @@ extern "C" {
>> - #include <errno.h>
>> - #endif
>> -
>> -+#include <libavcodec/version.h>
>> - #include <libavformat/avformat.h>
>> -
>> - #ifdef __cplusplus
>> ---
>> -2.38.1
>> -
>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> similarity index 98%
>> rename from meta-oe/recipes-support/opencv/opencv_4.6.0.bb
>> rename to meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> index 1e4c3545b..eef2e66ca 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
>> @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
>>
>>   DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>>
>> -SRCREV_opencv = "b0dc474160e389b9c9045da5db49d03ae17c6a6b"
>> -SRCREV_contrib = "7b77c355a8fdc97667b3fa1e7a0d37e4973fc868"
>> +SRCREV_opencv = "725e440d278aca07d35a5e8963ef990572b07316"
>> +SRCREV_contrib = "e247b680a6bd396f110274b6c214406a93171350"
>>   SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>>   SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>>   SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
>> @@ -30,7 +30,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
>>              file://0001-Dont-use-isystem.patch \
>>              file://download.patch \
>>              file://0001-Make-ts-module-external.patch \
>> -           file://0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch \
>>              file://0008-Do-not-embed-build-directory-in-binaries.patch \
>>              "
>>   SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101410): https://lists.openembedded.org/g/openembedded-devel/message/101410
>> Mute This Topic: https://lists.openembedded.org/mt/97469941/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


