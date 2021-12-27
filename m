Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE1EC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 20:14:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.30535.1640636087041763296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 12:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fAp9XaeX;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id u16so12067659plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 12:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sTu62KdakH6fLwzvLarF8kr5k2vfXvVErIW/NX0Cawg=;
        b=fAp9XaeXuPDjuUOHxlCIc6I3mlFNFd6PFEIDpM1xkjPTbxEZqUlOuR89uUs5ZrOKfw
         0jdYTREnmz0KTzSwstXT8SHOC5qj33dFhRyociSKrA9RtGBfMoGZ+dIcSLBH0O2qJ+og
         a4uRS+w2fvmf6D16tV50HhmViwjWIBuEViHgAJ9mVMMSU3zMQj1X8cuH2kQg44CRgLJ3
         86V1KQR6kEnXJKsvy/Uu8yVPBIcg/ri79lXu3l1c6kvxTX/xD8f+kBRB/M4wWf8vgVlU
         2CXNoRWjAbP2MOgIDpWD3k2BtqVhXhvtkqVqvarq3ZAlYmS3kk3BIZ5YeSk9qlOSt6sz
         NsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sTu62KdakH6fLwzvLarF8kr5k2vfXvVErIW/NX0Cawg=;
        b=CVJKhUpK27VZUa5mxYnnWhI2St3IhPDWzVrWYhB+5JmbqXGm8IJycdi9dg45RP2JM7
         l91t6/Dhkxf2mIyjWleV9NU26YV/zOtJxpnksAs5BbxcxNVP5gkye2ehCfRZ+z/uuE6S
         J6t6b3trp41Cf8xJK/tFQA3MFnXs9N2/i1ZDLN1kOdpuzP8yqG5MDj20UoQP4kMqWBe7
         UECz3zYd90sECIQl63HtHioiJBVXm/GK2KvOuM8z2mq86P3833yi4xverYql5uKFl/b2
         k0LJ+5rC1AVJqIYPaKo8Ph7e9MnDTXLaIBEbwlsHQEe3ftM1d0jT6cqpSdQ0YSgUJoOz
         HKSA==
X-Gm-Message-State: AOAM530YPSV+neC1KCNRedoBOjwQQy7az3QB50w94ZrZqqWo6TOnyTFP
	8glaiIZTJ9DniLdYEWR+WKCZPSnAvK0=
X-Google-Smtp-Source: 
 ABdhPJz+96ssUwxknrBzkB5Ac0dXILQdNxzPCTD3KXl43gM1LT/CW3IweixxNEIoyhHCP1UNAjVkkA==
X-Received: by 2002:a17:90b:1e08:: with SMTP id
 pg8mr23012905pjb.53.1640636086289;
        Mon, 27 Dec 2021 12:14:46 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:67e3:bc71:b585:c820?
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 t25sm7220344pgv.9.2021.12.27.12.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 12:14:45 -0800 (PST)
Subject: Re: [oe] [meta-networking][PATCH 1/4] strongswan: provide
 PACKAGECONFIG for cureve25519
To: Anders Montonen <Anders.Montonen@iki.fi>
Cc: openembedded-devel@lists.openembedded.org
References: <20211227025025.1211176-1-akuster808@gmail.com>
 <AD07CF53-4F41-48B0-BE6A-2BCAAF3CD96F@iki.fi>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1e8c0e35-20ac-7e3e-8cb3-4027debae4dd@gmail.com>
Date: Mon, 27 Dec 2021 12:14:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <AD07CF53-4F41-48B0-BE6A-2BCAAF3CD96F@iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 20:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94516



On 12/27/21 12:39 AM, Anders Montonen wrote:
> Hi,
>
> s/cureve25519/curve25519/g
thanks for the review.

V2 out shortly.

- armin
> -a
>
>> On 27 Dec 2021, at 4:50, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> Not everyone wants this to be installed by default. Enable to remove
>> cureve25519 is someone wants to.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>> .../recipes-support/strongswan/strongswan_5.9.4.bb            | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
>> index 45500df01..a031c54f5 100644
>> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
>> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
>> @@ -23,7 +23,7 @@ EXTRA_OECONF = " \
>>
>> EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>>
>> -PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
>> +PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl cureve25519\
>>         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
>> "
>> PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
>> @@ -41,6 +41,7 @@ PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-sou
>> PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
>> PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
>> PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
>> +PACKAGECONFIG[cureve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-plugin-curve25519"
>>
>> # requires swanctl
>> PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
>> @@ -130,7 +131,6 @@ RDEPENDS:${PN} += "\
>>     ${PN}-plugin-x509 \
>>     ${PN}-plugin-xauth-generic \
>>     ${PN}-plugin-xcbc \
>> -    ${PN}-plugin-curve25519 \
>>     "
>>
>> RPROVIDES:${PN} += "${PN}-systemd"
>> -- 
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94500): https://lists.openembedded.org/g/openembedded-devel/message/94500
>> Mute This Topic: https://lists.openembedded.org/mt/87972450/3618057
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Anders.Montonen@iki.fi]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


