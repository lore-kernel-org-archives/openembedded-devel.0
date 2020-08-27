Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.9950.1598493323916130313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 18:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DISRJZI0;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id g1so2190066pgm.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZuJIXxgGangf/ENsU00scH9ZGsY2VOoFUkB130Cf8UM=;
        b=DISRJZI0QTT9GgixPtiqcT+GElHFTQcAbiWjcg8sYAsLLnh4K4kl5ij4Masr0YSIqS
         m+a1mmjQsxgCdmv7jZ4f+zRaHKmF+pjfi6p1OMKBLSlCLnUSDSfWYpvEiw6DXkeRGthy
         y6DJX1KWQoL9K3wBydkLwh8A4weI65bWQB/OpBcKgFDu+ggWm32nz8RK30IJsG7Oldp1
         lhx3e16VKp1Bj755DpogEapQUC15te38bb2klTT21PU5BDJI2q3PhxtIxK4F/Z1Pm3LW
         xJNQS8M1+txYN3ZFQJHtKA/DhTkOXLWs5V+JnLKkemeCpMhPkL85ayYNMDvSOVw1fAwm
         GxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZuJIXxgGangf/ENsU00scH9ZGsY2VOoFUkB130Cf8UM=;
        b=E2Y4QdAHLxOK97qWiuw3s4NEwlb55Or119YPqxKIJOF578bVAMVsyVdLWeHDP1EChu
         W8d/q7kQ+jsd+4vVCKouzPZMdt3GqudyD4gy4KCa8mHrkVT3FFtGzHywzFdLeN9TVn43
         Xpz84fxIlyHgWgslZmm58o4fmp26NCvQ547PQs0e7ISIoXf3BwbtBTA0nlDM/wweG27L
         5WiI8Xo+wmi+ComC9IwJojPvuI04qLlznGshoXh67VHEL6LGJX7l3+RnxCbgo/evGvtw
         xyrVf8jPByUQWppuIHGGy92YtkZhcM5i76u2ikB/ne2cP3oQ+QJAVQ67k/+AshhmP3mI
         z2gQ==
X-Gm-Message-State: AOAM532bMBAwz5F+yOxFGwlUOY1uMzapXUSm09QRM6Y2RPpcXaBfGysW
	RCxPRk7qLMhO3PYaXAKv6JbOsBYo7s82Rw==
X-Google-Smtp-Source: ABdhPJzBWQP+r+90807t8KXjHCNg9hyhPgoNLECPPCRMGwcf7pUtiIKxR7AOWRl6sPDVKR9s3Se8Vw==
X-Received: by 2002:a17:902:8e8a:: with SMTP id bg10mr14443103plb.281.1598493322884;
        Wed, 26 Aug 2020 18:55:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e8b6:ed97:4b5a:9e46? ([2601:646:9200:4e0:e8b6:ed97:4b5a:9e46])
        by smtp.gmail.com with ESMTPSA id o30sm310558pgc.45.2020.08.26.18.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 18:55:22 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/3] doxygen: Upgrade 1.8.17 -> 1.8.20
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200825095407.18867-1-leon.anavi@konsulko.com>
 <CAMKF1soynk8yNEZA5LZL4K-DpY6v2S2sRwQJQgp7dQ8BkqZgSw@mail.gmail.com>
 <713966e3-8576-7782-17b3-966713f48b99@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b50d5ec0-e5da-cf5d-ccf1-acd09e4291c5@gmail.com>
Date: Wed, 26 Aug 2020 18:55:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <713966e3-8576-7782-17b3-966713f48b99@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 8/26/20 1:34 AM, Leon Anavi wrote:
> Hi Khem,
> 
> On 25.08.20 г. 21:25 ч., Khem Raj wrote:
>> Fails to patch doxygen-native :(
> 
> Thank you for reporting this issue. I fixed it and I've just submitted 
> v2 of this patch.

Thanks this now fails on riscv64 as well. but I think thats a binutils 
problem which is rv64 specific.

see
http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuriscv64/407/console
http://errors.yoctoproject.org/Errors/Build/109092/

> 
> Thanks,
> Leon
>>
>>
>> On Tue, Aug 25, 2020 at 2:54 AM Leon Anavi <leon.anavi@konsulko.com> 
>> wrote:
>>> Upgrade to release 1.8.20:
>>>
>>> - Add configuration setting to have docstrings not as preformatted
>>>    text but as normal documentation
>>> - Bug fix: void return type reported as not documented
>>> - Bug fix: Doxywizard 1.8.19 (Windows): Source code directory
>>>    seems to be ignored
>>> - Bug fix: The Doxygen uses too much memory (or has probably a
>>>    memory leak)
>>> - Bug fix: Doxygen doesn't stop on errors
>>> - Bug fix: C++ grouped functions in namespace have disappeard
>>> - Improvement of line count for e.g. warnings
>>> - Improved layout on the bibliography page
>>> - Updated the swedish language translation to 1.8.19
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>   .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb}          | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>   rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => 
>>> doxygen_1.8.20.bb} (79%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb 
>>> b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
>>> similarity index 79%
>>> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
>>> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
>>> index 45de71826..d4ac3b720 100644
>>> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
>>> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
>>> @@ -10,8 +10,8 @@ SRC_URI = 
>>> "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>>>              file://0001-build-don-t-look-for-Iconv.patch \
>>>   "
>>>   SRC_URI_append_class-native = " 
>>> file://doxygen-native-only-check-python3.patch"
>>> -SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
>>> -SRC_URI[sha256sum] = 
>>> "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
>>> +SRC_URI[md5sum] = "8729936a843232a66fe970ef65f3c3e4"
>>> +SRC_URI[sha256sum] = 
>>> "e0db6979286fd7ccd3a99af9f97397f2bae50532e4ecb312aa18862f8401ddec"
>>>
>>>   inherit cmake python3native
>>>
>>> -- 
>>> 2.17.1
>>>
>>> 
> 
