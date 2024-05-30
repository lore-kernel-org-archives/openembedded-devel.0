Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC5C25B76
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 16:27:36 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.766.1717086451474200011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 09:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fp/9X4dh;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a088f80f6so11694777b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717086450; x=1717691250; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x/2vyUiPA+gYHNjzqwCs5BdbYS8eJaPzFmcFIqYX1jI=;
        b=fp/9X4dhKl6M6XM4C9/jKAPDKNoO9VoQ4DTvmYdqrbgQpkxx1NhZ0psmUwa6dULCXm
         TrhvCVulLpuOkS3UHU4mGpbNzKmGyGKZzNZptkT8T7eM6ToyO3c1+avOnOoJUVuiwl8g
         HbFyVF0If3uGwG8khPQbl6TNR5B/dbmq+O7R8oehwc3MRbK1tTqPWt3Wz5+XIqTgUbp0
         81riwYkRKLuRvDRjsXk1hR+eDaxl2mEcK3Lg+KzR57lSMuPJHB14Uds+lsBtwZVh2f7W
         Mc2OIsNyb9UWTIKyio8EmAf8XvPL48yLxsd8E329y9ZBu1Jnov2GL9jSlZk20uqTZs95
         ay5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086450; x=1717691250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/2vyUiPA+gYHNjzqwCs5BdbYS8eJaPzFmcFIqYX1jI=;
        b=cBwTeMLRXZLZ56TL0YKNFxC1T1aXACp6f4N7NBDmEDOytld43eUfIK97/Hwi9cn1XT
         ICNn7F4uaSLOSTBFD127pV9nfEXYMLS3nel4bFv3drPiJaiPHanzoX7AoetelGZWjD36
         4bNpXvkK4RS8vvsRbjxY/JuKpkMwrjwq/Wyp9v4eh75DypEXfo/5DBWu6/5we1FrKEjf
         lSx3w3eNGeUN1EzMUVG2yJy+9wGzUy1CXCGlMMEK8zAp4ShcWqGdosXKmRCmms9uKNW3
         QGW7UZ2FfnOPSD1zwWnTsfrExYvsdCZwe02JfgnQMVm9RJKG4uBzQizeW3g2uXXHLuMW
         VuUg==
X-Forwarded-Encrypted: i=1; AJvYcCVDBc9Y9VKUiAzeRoWlMXdu2ZDAndS9WrLR/CPHH3xeMJGCDhIRgY3gGEIhP3LwWrOZVYuJ/aW/1LKoVo2pZHPUwbToVlFQnYr2TpnbQm4J1mMz/my+39W/MQ==
X-Gm-Message-State: AOJu0YxxYN9PkygzeBCOqLII+AZL9ayHF8u6iHl/azZiqiAMsIAv4T6k
	m07CAfOKWdjOmX7jeEmx/9MYMfku8Pr8nrKwZz79/wlNmiDk4M0y3lHK6w==
X-Google-Smtp-Source: AGHT+IGdz7nLg9QdTD0jfdHRmfo92tf0tf3A7tCjC6xcVmwSOhvP+Y+kBPdLoa+ZizbqHKybyoRpaw==
X-Received: by 2002:a81:6983:0:b0:61b:1792:3ecd with SMTP id 00721157ae682-62c6ccbca32mr18149557b3.6.1717086448947;
        Thu, 30 May 2024 09:27:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:fd30:ccb0:f3d7:336b? ([2600:1700:45dd:7000:fd30:ccb0:f3d7:336b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766c8db1sm31687b3.138.2024.05.30.09.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 09:27:28 -0700 (PDT)
Message-ID: <92f76dd4-1d1d-48bf-ac05-3dce231364b5@gmail.com>
Date: Thu, 30 May 2024 12:27:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] pcapplusplus: Fix build with
 gcc14
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20240530123501.2890879-1-akuster808@gmail.com>
 <CA+chaQdv7zN4uZ8=ROoyajZrUPnLa8avxrQnM9g5=RaCDMJ9sg@mail.gmail.com>
 <7b528b1c-15d9-413f-a101-b3af07f6d878@gmail.com>
 <CAMKF1sp9GGb2jhAnY9NTjSseJ8DN1vggixd014yY2eUaK5m3ag@mail.gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <CAMKF1sp9GGb2jhAnY9NTjSseJ8DN1vggixd014yY2eUaK5m3ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 16:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110632



On 5/30/24 11:58 AM, Khem Raj wrote:
> On Thu, May 30, 2024 at 8:55 AM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 5/30/24 8:40 AM, Martin Jansa wrote:
>>> Why is this needed in scarthgap? GCC upgrade won't be backported there
>>> I believe and it doesn't have native/nativesdk to be useful on hosts
>>> with gcc-14.
>> My scarthgap build fails with the same error:
>>
>>    /builds/stable/build/tmp/work/core2-32-poky-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
>> |    23 |         timespec nsec_time;
>> |       |                  ^~~~~~~~~
>> | cc1plus: all warnings being treated as errors
>>
>> Pkg builds after patch is applied.  Should I add a note to this in the
>> backport?
> I think the preset for this fix was GCC-14 but this fix was general.
> So backport is fine and perhaps adding context is ok too. Upto you.

Context sounds good. thanks,

- armin
>> BR,
>> Armin
>>
>>> On Thu, May 30, 2024 at 2:35 PM Armin Kuster via
>>> lists.openembedded.org <akuster808=gmail.com@lists.openembedded.org>
>>> wrote:
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>    .../0001-initialize-timespec-variable.patch   | 35 +++++++++++++++++++
>>>>    ...e-m_ExternalRawData-in-IDnsResource-.patch | 34 ++++++++++++++++++
>>>>    .../pcapplusplus/pcapplusplus_23.09.bb        |  5 ++-
>>>>    3 files changed, 73 insertions(+), 1 deletion(-)
>>>>    create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
>>>>    create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>>>>
>>>> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
>>>> new file mode 100644
>>>> index 0000000000..f2e210fc67
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
>>>> @@ -0,0 +1,35 @@
>>>> +From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 2001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Mon, 6 May 2024 12:15:30 -0700
>>>> +Subject: [PATCH] initialize timespec variable
>>>> +
>>>> +Fixes build warnings with GCC14
>>>> +
>>>> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacket(const uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
>>>> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
>>>> +   23 |         timespec nsec_time;
>>>> +      |                  ^~~~~~~~~
>>>> +cc1plus: all warnings being treated as errors
>>>> +
>>>> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1389]
>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +---
>>>> + Packet++/src/RawPacket.cpp | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
>>>> +index 8ad52d52..07dbbbe2 100644
>>>> +--- a/Packet++/src/RawPacket.cpp
>>>> ++++ b/Packet++/src/RawPacket.cpp
>>>> +@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor)
>>>> +
>>>> + RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeval timestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
>>>> + {
>>>> +-      timespec nsec_time;
>>>> ++      timespec nsec_time = {};
>>>> +       TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
>>>> +       init(deleteRawDataAtDestructor);
>>>> +       setRawData(pRawData, rawDataLen, nsec_time, layerType);
>>>> +--
>>>> +2.45.0
>>>> +
>>>> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>>>> new file mode 100644
>>>> index 0000000000..b6389e0e3f
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>>>> @@ -0,0 +1,34 @@
>>>> +From 742f564ee80749e9f1f3363092775545e37c0f87 Mon Sep 17 00:00:00 2001
>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>> +Date: Thu, 9 May 2024 17:02:09 -0700
>>>> +Subject: [PATCH] packet++: Initialize m_ExternalRawData in IDnsResource
>>>> + constructor
>>>> +
>>>> +Fixes following warning with GCC-14
>>>> +
>>>> +Packet++/src/DnsResource.cpp:29:24: error: '*this.pcpp::IDnsResource::m_ExternalRawData' may be used uninitialized [-Werror=maybe-uninitialized]
>>>> +   29 |                 return m_ExternalRawData;
>>>> +      |                        ^~~~~~~~~~~~~~~~~
>>>> +
>>>> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1391]
>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +---
>>>> + Packet++/src/DnsResource.cpp | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/Packet++/src/DnsResource.cpp b/Packet++/src/DnsResource.cpp
>>>> +index fec1bf05..c1f97041 100644
>>>> +--- a/Packet++/src/DnsResource.cpp
>>>> ++++ b/Packet++/src/DnsResource.cpp
>>>> +@@ -10,7 +10,7 @@ namespace pcpp
>>>> + {
>>>> +
>>>> + IDnsResource::IDnsResource(DnsLayer* dnsLayer, size_t offsetInLayer)
>>>> +-      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr)
>>>> ++      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr), m_ExternalRawData(nullptr)
>>>> + {
>>>> +       char decodedName[4096];
>>>> +       m_NameLength = decodeName((const char*)getRawData(), decodedName);
>>>> +--
>>>> +2.45.0
>>>> +
>>>> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
>>>> index 39c6942c83..9db0222172 100644
>>>> --- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
>>>> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
>>>> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
>>>>
>>>>    DEPENDS = "libpcap"
>>>>
>>>> -SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
>>>> +SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master \
>>>> +           file://0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch \
>>>> +           file://0001-initialize-timespec-variable.patch"
>>>> +
>>>>    SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
>>>>
>>>>    S = "${WORKDIR}/git"
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#110626): https://lists.openembedded.org/g/openembedded-devel/message/110626
>>>> Mute This Topic: https://lists.openembedded.org/mt/106387290/3617156
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [martin.jansa@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


