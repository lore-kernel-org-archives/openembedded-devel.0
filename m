Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C30CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:33:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.751.1760725993325459072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mHPPNdmP;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1984585f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 11:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760725992; x=1761330792; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3Gwxtt0NueJxiVuMfREAN7cWxXm+bk17hQRY+TdVWo=;
        b=mHPPNdmPt/wT12aMpcjKqhWLA5fJpYWaLYoICfotKT7IQQkb9QcyNujkFWFgWN52/j
         CYf2pjOPlfZYyLtTatiuULiu8N9Bm4E4piMknmrN5n60lBOFbzFh7Shv5rijRt4bm80i
         RvwygEnW05d43TCzJJFE9WEek6eh9m2tqFOW9dS5d31WE3Y0AJ0ZFvGScwWm7WYh325m
         JRiBd2PVWc4GmWjH51iZAZlwi3XC1u81KeGxjgIwXlum/6+ir3jorq630VlXQRMsbMwj
         xbV1e5jQ6ZmqP5yrEJcYTyBSsqTUaUl7XaAzz/spMCRnK6PTyuFwEPFCpMowBdSEDlk6
         zzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725992; x=1761330792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3Gwxtt0NueJxiVuMfREAN7cWxXm+bk17hQRY+TdVWo=;
        b=vlHqMNHNhNB6VyJ27hQcE2tZYtFEHpta7xHhhazRlujp7Mjn1Iebgh4z6Wuim2b7sj
         Z9v+MBKEIbOzqQDgDrFyp8XfabzJn2yB3vHK10TJsuvaXRgc6wPcMQmArFDDggXfGJp5
         rZrPyXe9vtNQhujUcNK2x0dSyIGasaSA+8XaHQFZhxjr4C/tLjGEYnH8GVJ9GsM/CFgb
         S1Fs52n06D36tHfVC5mvO2u97hlmCc5YlDkmmLoi93mJvssSRuGCCUh8LaIPirRk57y0
         lwIRQ38t8eAT4sMV53ITuzBI8X85/mjNADlHhfL64TowW75+onFfV+uevIyrOxkdp9sU
         A+EA==
X-Forwarded-Encrypted: i=1; AJvYcCUYP+IeE+kRVshxVTg21ArEyfVtGvrH/8w3jk9+GLV+pPj4/WIv3+UuQUCIse2fXkq6uwpzLILBA6AaRhG4tXOG4Sk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0HlL3EVVzl2eAnADGNexZRIZZdAQi33J8HCRnZ/N3ppMrp132
	QATfzwziehfmG4pSAQetij1tNGstrNEx1PQqmQDi7J0wr7daWOaWC4mK
X-Gm-Gg: ASbGncvOITtKhX4GzC548osXQDuNq/kq59fgXEj/0pf1pwA7dEqT2luQGYgK+SZnID6
	2YwouvYfVyHFaFAkcaSf07qXh164eIf90+D7zkzriVy0Nh/JAr/XS/1EGhrrJtmtxrFucsF1xs2
	orD1UyBR5OBqgtZCyLI+YCibCaKYIdOVz1vktsmj1HO1XUZ/8PSx2z7tb1jvhs/J+Hk2V8NCvpa
	uIyFhX14bTtG9wW3J/7OCW9mdL/kEqBCXdTqA6YalsnN/So2d95kALV1JUSpSYeyhWn5lzH6xY5
	dsOAU0oZLvSMTyzIhwK+80XnKelfNC4Uc9r4Br5M3aP8i1tNUrKvgABy2xJzcYUqhtB/VoOOMyf
	xtlRXv4hJyiNsDNok/nHCwmqRw8SbEnrwIUHIluvWxEkArr22K89OX8MrtpPuiCXq+1tU1pzjAo
	XPKX4bkaiPTnzah5ct6iY=
X-Google-Smtp-Source: AGHT+IG197eKBdlY7DFaUgnOAwPN6G53Rxo+k3mXJAmDAwljzZycmsG/4ajb4ZZh7WgJ2Q3IH5gDfQ==
X-Received: by 2002:a5d:5888:0:b0:3e0:2a95:dc90 with SMTP id ffacd0b85a97d-42704da9d9cmr3598041f8f.35.1760725991399;
        Fri, 17 Oct 2025 11:33:11 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a797sm589761f8f.27.2025.10.17.11.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 11:33:10 -0700 (PDT)
Message-ID: <e17f32c4-7456-45cd-9bf7-8b66ca5ffe07@gmail.com>
Date: Fri, 17 Oct 2025 20:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] opencv: limit features in native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Corentin Guillevic <corentin.guillevic@smile.fr>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
References: <20251017155047.1122714-2-corentin.guillevic@smile.fr>
 <DB5PR02MB10213155AFF0DDFE39BCF784DEFF6A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DB5PR02MB10213155AFF0DDFE39BCF784DEFF6A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 18:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120773

On 10/17/25 20:29, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Corentin Guillevic <corentin.guillevic@smile.fr>
>> Sent: den 17 oktober 2025 17:51
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Corentin Guillevic <corentin.guillevic@smile.fr>
>> Subject: [PATCH v3] opencv: limit features in native
>>
>> Since commit 91e428d4cd5a ("opencv: Support building for native"),
>> opencv can be built on a native target. However, not all of their
>> PACKAGECONFIG dependencies (ade, libgphoto2, ffmpeg, gstreamer1.0 and
>> gstreamer1.0-plugins-base) can be built in this context due to the
>> missing native BBCLASSEXTEND.
>>
>> These recipes would need to be extended for native build, but specific
>> work is required to ensure they work properly. To make opencv-native work
>> for now, remove the above features for the native build.
>>
>> Effectively, PACKAGECONFIG for native is target minus gapi, gstreamer,
>> gphoto2 and libav.
>>
>> Fixes this warning from AB[0]:
>> WARNING: Nothing PROVIDES 'gstreamer1.0-plugins-base-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
>> WARNING: Nothing PROVIDES 'ffmpeg-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
>> WARNING: Nothing PROVIDES 'libgphoto2-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
>> WARNING: Nothing PROVIDES 'gstreamer1.0-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
>> WARNING: Nothing PROVIDES 'ade-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
>> WARNING: Nothing RPROVIDES 'opencv-dev-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on or otherwise requires it)
>> WARNING: Nothing RPROVIDES 'opencv-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on or otherwise requires it)
>> [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/469/steps/13/logs/warnings
>>
>> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
>> ---
>> changes in v3:
>> - update commit text according to the v2 implementation
>>
>> changes in v2:
>> - change implementation to a more commonly written one
>> ---
>>  meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
>> index 27499caa92..aa11d3da43 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
>> @@ -86,8 +86,9 @@ LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
>>
>>  EXTRA_OECMAKE:append:x86 = " -DX86=ON"
>>
>> -PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
>> -    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
>> +PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l samples tbb \
>> +    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
>> +PACKAGECONFIG:append:class-target = " gapi gstreamer gphoto2 \
>>      ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
>>
>>  # TBB does not build for powerpc so disable that package config
>> --
>> 2.49.0
> Since the change for opencv to allow it to build for native just made it 
> into the walnascar branch, this will need to be backported there too.
>
> //Peter
I'd say Walnascar has taken its final form - all bugs are features there
(unless something very critical happens in the near future, that makes
an emergency release mandatory).

