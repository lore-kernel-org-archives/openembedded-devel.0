Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73449C27C43
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 15:55:37 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.13588.1717084535219735123
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 08:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVu1DRKu;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627eb38eb1bso8348067b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717084534; x=1717689334; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r2EhhqJLsysCkTNoK/XNRi2UbLyec0XdEncVCNee7t8=;
        b=iVu1DRKuGLz039UHedZtCWpvZ/N2HSw8EtU+DRLrd3Bu2TRRdIAM8ZZEPrixDv9yzP
         m9YVRygT7wqSwIrg0X4FUxslKWbyptX0I0YgROlAvjJzbnda4jhGRJMQN7znxOBXTUIG
         MgGWCLYDKPQVA3CkGJtB37EYy0gn/lEQIqwXagr/MajX6v8lTOPUMaP3enUXAi/vKV1/
         JHSaABADDCOz2h7nGAZ3xCaZyRhxIIw/lTrmZjQzBgEfDfONypIOJRxP7GIyaqKQnOwE
         xNaCW5azmUlp7+SE4HlufARMUUqeYpFB+BtjvRENXHejPUw35cm2Izb8AtN5JoiYEF9k
         RDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084534; x=1717689334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2EhhqJLsysCkTNoK/XNRi2UbLyec0XdEncVCNee7t8=;
        b=pmeIX5w72Bz44SFzBcu2GV2rcVjKoIO0uhYokyrY/FQ72AuxjorsE3NLyO3tb/ejZY
         BmnrTKOmwB5ILCXJzCT7Y5LIJevvHPqfg60S6xUtePCJVxurOz4nNuzWzNyzSX78SBv2
         +ufzAv7Jq/2qSz2pVonaBnTzoLrIB1/HC2hzoBGDy3DRfpaGPFblF1ANfkgR2DRiqKpk
         dTu9U5QKJ5YgPM3w/2u3/WJQy3kypUacMBJRcCPUi5IO6tDHH4IE5UO92tNoNHBGBLQB
         e4/yLRFyl/+jAbU9WEmpkN4GFK/JVIlSnPAMkvhfODL/QqVHgf5RUBI00/rfHDERSc7h
         Xn7w==
X-Gm-Message-State: AOJu0Yz1mHWyIYQti7+kBs1N74EB5bUNN8IbzsMwW+8e13AMatXdUJyL
	829FvFYXihXKFbc4Qco8zrS924m16SIsexaEEbF9tevkBVMGaXiwsyJKtA==
X-Google-Smtp-Source: AGHT+IFL5/XUX8yoS7JcVM7DJGwesz0xh0ZjvKkoTpaGkKsDOtRDv0dLCufGcv7Oo4mtOnuYpgDrIQ==
X-Received: by 2002:a0d:cc05:0:b0:61b:3304:d29d with SMTP id 00721157ae682-62c6bbca63bmr31051137b3.7.1717084534011;
        Thu, 30 May 2024 08:55:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:fd30:ccb0:f3d7:336b? ([2600:1700:45dd:7000:fd30:ccb0:f3d7:336b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4ee244sm28361267b3.77.2024.05.30.08.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 08:55:33 -0700 (PDT)
Message-ID: <7b528b1c-15d9-413f-a101-b3af07f6d878@gmail.com>
Date: Thu, 30 May 2024 11:55:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] pcapplusplus: Fix build with
 gcc14
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20240530123501.2890879-1-akuster808@gmail.com>
 <CA+chaQdv7zN4uZ8=ROoyajZrUPnLa8avxrQnM9g5=RaCDMJ9sg@mail.gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <CA+chaQdv7zN4uZ8=ROoyajZrUPnLa8avxrQnM9g5=RaCDMJ9sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 15:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110630



On 5/30/24 8:40 AM, Martin Jansa wrote:
> Why is this needed in scarthgap? GCC upgrade won't be backported there
> I believe and it doesn't have native/nativesdk to be useful on hosts
> with gcc-14.

My scarthgap build fails with the same error:

  /builds/stable/build/tmp/work/core2-32-poky-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
|    23 |         timespec nsec_time;
|       |                  ^~~~~~~~~
| cc1plus: all warnings being treated as errors

Pkg builds after patch is applied.  Should I add a note to this in the 
backport?

BR,
Armin

>
> On Thu, May 30, 2024 at 2:35 PM Armin Kuster via
> lists.openembedded.org <akuster808=gmail.com@lists.openembedded.org>
> wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../0001-initialize-timespec-variable.patch   | 35 +++++++++++++++++++
>>   ...e-m_ExternalRawData-in-IDnsResource-.patch | 34 ++++++++++++++++++
>>   .../pcapplusplus/pcapplusplus_23.09.bb        |  5 ++-
>>   3 files changed, 73 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
>>   create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>>
>> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
>> new file mode 100644
>> index 0000000000..f2e210fc67
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-initialize-timespec-variable.patch
>> @@ -0,0 +1,35 @@
>> +From 298dec6f87061914c85049faca3d0ff3310d1794 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 6 May 2024 12:15:30 -0700
>> +Subject: [PATCH] initialize timespec variable
>> +
>> +Fixes build warnings with GCC14
>> +
>> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp: In constructor 'pcpp::RawPacket::RawPacket(const uint8_t*, int, timeval, bool, pcpp::LinkLayerType)':
>> +/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/pcapplusplus/23.09/git/Packet++/src/RawPacket.cpp:23:18: error: 'nsec_time.timespec::<anonymous>' is used uninitialized [-Werror=uninitialized]
>> +   23 |         timespec nsec_time;
>> +      |                  ^~~~~~~~~
>> +cc1plus: all warnings being treated as errors
>> +
>> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1389]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Packet++/src/RawPacket.cpp | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Packet++/src/RawPacket.cpp b/Packet++/src/RawPacket.cpp
>> +index 8ad52d52..07dbbbe2 100644
>> +--- a/Packet++/src/RawPacket.cpp
>> ++++ b/Packet++/src/RawPacket.cpp
>> +@@ -20,7 +20,7 @@ void RawPacket::init(bool deleteRawDataAtDestructor)
>> +
>> + RawPacket::RawPacket(const uint8_t* pRawData, int rawDataLen, timeval timestamp, bool deleteRawDataAtDestructor, LinkLayerType layerType)
>> + {
>> +-      timespec nsec_time;
>> ++      timespec nsec_time = {};
>> +       TIMEVAL_TO_TIMESPEC(&timestamp, &nsec_time);
>> +       init(deleteRawDataAtDestructor);
>> +       setRawData(pRawData, rawDataLen, nsec_time, layerType);
>> +--
>> +2.45.0
>> +
>> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>> new file mode 100644
>> index 0000000000..b6389e0e3f
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch
>> @@ -0,0 +1,34 @@
>> +From 742f564ee80749e9f1f3363092775545e37c0f87 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 9 May 2024 17:02:09 -0700
>> +Subject: [PATCH] packet++: Initialize m_ExternalRawData in IDnsResource
>> + constructor
>> +
>> +Fixes following warning with GCC-14
>> +
>> +Packet++/src/DnsResource.cpp:29:24: error: '*this.pcpp::IDnsResource::m_ExternalRawData' may be used uninitialized [-Werror=maybe-uninitialized]
>> +   29 |                 return m_ExternalRawData;
>> +      |                        ^~~~~~~~~~~~~~~~~
>> +
>> +Upstream-Status: Submitted [https://github.com/seladb/PcapPlusPlus/pull/1391]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Packet++/src/DnsResource.cpp | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Packet++/src/DnsResource.cpp b/Packet++/src/DnsResource.cpp
>> +index fec1bf05..c1f97041 100644
>> +--- a/Packet++/src/DnsResource.cpp
>> ++++ b/Packet++/src/DnsResource.cpp
>> +@@ -10,7 +10,7 @@ namespace pcpp
>> + {
>> +
>> + IDnsResource::IDnsResource(DnsLayer* dnsLayer, size_t offsetInLayer)
>> +-      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr)
>> ++      : m_DnsLayer(dnsLayer), m_OffsetInLayer(offsetInLayer), m_NextResource(nullptr), m_ExternalRawData(nullptr)
>> + {
>> +       char decodedName[4096];
>> +       m_NameLength = decodeName((const char*)getRawData(), decodedName);
>> +--
>> +2.45.0
>> +
>> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
>> index 39c6942c83..9db0222172 100644
>> --- a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
>> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
>> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
>>
>>   DEPENDS = "libpcap"
>>
>> -SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
>> +SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master \
>> +           file://0001-packet-Initialize-m_ExternalRawData-in-IDnsResource-.patch \
>> +           file://0001-initialize-timespec-variable.patch"
>> +
>>   SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
>>
>>   S = "${WORKDIR}/git"
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110626): https://lists.openembedded.org/g/openembedded-devel/message/110626
>> Mute This Topic: https://lists.openembedded.org/mt/106387290/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [martin.jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


