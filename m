Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE94C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 15:55:31 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.77.1636386930636097423
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 07:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qlpmFniB;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e65so15514217pgc.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=UV/os6J5t2vRY+gPIQzirwoyzOtuuOjBTMVDd8+4eGM=;
        b=qlpmFniBp1MqpjTRkqQNf8FT0NF2mi4VUKZOY6J5FB4NJt5tnkdkgk2nCp5xPcoilK
         6wmX+EfyVUV/DtG/DGyZ48OXtTuHpQDvUTDisvxmwDKaIOY13N8F7+wytA0iibfOUxgh
         FOTHWqDN+ZaQC32v7EulZgm7P0LHGOiUJX2EMHx1IodJuW2gMCyIvfV+W4DuC/484jEm
         CONnvNrdXZf4x8/ZQvDrTmNq0+THGQ+QgJ1g+dUrjkamm5Ij6zJqw0ukFx4VrKG//UXP
         vXfZp0N96wLeJasLXH8FzagPTsprSFHMOtF8694FEXfvEwMPaSdwXnuvPVO5Q4GWFltR
         MX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UV/os6J5t2vRY+gPIQzirwoyzOtuuOjBTMVDd8+4eGM=;
        b=IHGsAdLLPO4L1k2WHsV6rFEBTt87wroAXk+n5BpO8NHXpLvlVlEtwH9KpCou1CdJQm
         dUdOZzECsf1NU3E2XvVqaLHPwOP0nt5M2jOejUeE8KBgbXEBvu8U+QGSGxCoI9O73Wf9
         B3Cm2LGDKD/O2joSSNhFH5hh0PCmalJzFdrnxbdRXbAZhqQ/hZNEshoUQnhu+RlZFuqs
         tLP8AnMU+E7PralnQYHnODEirLeGCDmNDmY6BOJ8bJDsnt0pU7BM/quJ5xiu5PR+w480
         yUNcxo33CAbRNGaYGnuXyYAL0iSqiYz3n6deqWsSQuhM3XY7OItTDQWYbdJTwV5vPs/u
         ciOg==
X-Gm-Message-State: AOAM533Qjw3UX7WL5PtqivKoHA5q+QZS5nbAulyCFpvsxKCJ/OUHhnUS
	2SyVsFBL2oJUTezvJxCfxbUOn7CovRw=
X-Google-Smtp-Source: 
 ABdhPJzN/Y4K7jSdGQ5sEPjkL6Q7Zbtnhytuu+2EE0Q7eyP6D8LUIRxIKFTaV6jUDFrFU0lZRLh0Fw==
X-Received: by 2002:aa7:808e:0:b0:493:f071:274f with SMTP id
 v14-20020aa7808e000000b00493f071274fmr266840pff.37.1636386929784;
        Mon, 08 Nov 2021 07:55:29 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:5813:7c32:907a:2002?
 ([2601:202:4180:a5c0:5813:7c32:907a:2002])
        by smtp.gmail.com with ESMTPSA id
 m19sm3019275pgh.75.2021.11.08.07.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:55:29 -0800 (PST)
Subject: Re: [oe] [meta-oe][v2][honister][PATCH] recipes: remove tabs and
 spaces in SRC_URI
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20211107183938.882549-1-akuster808@gmail.com>
 <ec5893d5ab494da1a019ca1662ad055e@axis.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7bfdcf0c-24d8-abf5-019d-296998bfd177@gmail.com>
Date: Mon, 8 Nov 2021 07:55:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ec5893d5ab494da1a019ca1662ad055e@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Nov 2021 15:55:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93878



On 11/8/21 2:49 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Armin Kuster
>> Sent: den 7 november 2021 19:40
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][v2][honister][PATCH] recipes: remove tabs and spaces in SRC_URI
>>
>> Missed tabs and spaces in the SRC_URI during
>> 'Update SRC_URI branch and protocols' translation.
>>
>> [V2]
>> Fix typo in imagemagick, change "gitk" to "git"
> This does not match the change (see below).

it doesn't look like it does it.

thanks for the feedback.

- armin
>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb         | 2 +-
>>  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
>>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb                 | 2 +-
>>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb     | 2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> index 6ba58829e3..37d5d81238 100644
>> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
>>  PV = "20210324.2+git${SRCPV}"
>>  SRCREV = "278e0a071885a22dcd2fd1b5576cc44757299343"
>>  BRANCH = "lts_2021_03_24"
>> -SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH} ;protocol=https \
>> +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
>>             file://0001-absl-always-use-asm-sgidefs.h.patch             \
>>             file://0002-Remove-maes-option-from-cross-compilation.patch \
>>             file://abseil-ppc-fixes.patch \
>> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
>> index cbc7a9a5eb..2c9e45fce7 100644
>> --- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
>> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
>> @@ -3,7 +3,7 @@ LICENSE = "GPLv2"
>>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>
>> -SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master ;protocol=https"
>> +SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
>>  SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
>>  PV = "1.3"
>>
>> diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
>> index 688c63d14a..84f6c3ce24 100644
>> --- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
>> +++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>  COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
>>
>>  SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
>> -SRC_URI = "git://github.com/billfarrow/pcimem.git ;branch=master;protocol=https"
>> +SRC_URI = "git://github.com/billfarrow/pcimem.git;branch=master;protocol=https"
>>
>>  S = "${WORKDIR}/git"
>>
>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
>> index 1b41732ecd..3f2472ba7e 100644
>> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
>> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
>> @@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw
>> freetype libtool"
>>
>>  BASE_PV := "${PV}"
>>  PV .= "_25"
>> -SRC_URI = "git://github.com/ImageMagick/ImageMagick.git ;branch=master;protocol=https"
>> +SRC_URI = "git://github.com/ImageMagick/ImageMagic.git;branch=master;protocol=https"
> The correct URL is "git://github.com/ImageMagick/ImageMagick.git" (as 
> it was).
>
>>  SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.25.1
> //Peter


