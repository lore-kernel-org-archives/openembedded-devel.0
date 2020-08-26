Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.8316.1598430871085709054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 01:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AygK9naC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id x9so885749wmi.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IcWDXU1lHMyatpFod0p2lFpsDdgRqyyeNo9i66bUfSs=;
        b=AygK9naCdgiaiWHK/dS3A3of1lhH+gA9/r4cEdUZkYqyA6jCuMeTUgqR3AJYrqVMSd
         dfRX5keOy2AJ15mTjUFfaNvG7y0Y+NN7uaxxrx/npOwAVR9tOEN7nRTius/m4Gpgjuwu
         f4NYTFLOQWhQpCNuUzcxCC1oyttLGENrkLeaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IcWDXU1lHMyatpFod0p2lFpsDdgRqyyeNo9i66bUfSs=;
        b=m4vtiT26+Lh0whqxY/a01fYr4M0DHKL3FZzz1vAER+HEO1AEKSWH9sqhJEgV+A3kXy
         rdAwGRCv6lhEOY28XJmj8s/jgtug5ROjWnAtL58PW9oimriXiLXdXJF7zs3T9h/m3TeR
         0VQrTHWXQMjn1Y77sKoqbvsmIeZr/GPdvT+6Xb5ijSGzpunWHatcvr2MtAxrUKwEhaRq
         DvcCeDl0hXGR+IdMW6N27Lao7U3xjxrIQCJssqeiw26/p1Zfav/iPxzVr61L8XGiYaSB
         GCVGkSGsyV+jY4b8rAfeDgyjEzfyVYDXvvSavlX7yw2vWi4g5pH3Yu2GBfURGWhjcszB
         +2Kw==
X-Gm-Message-State: AOAM531FPun9dxFGVolQDLhAHiU+KnMHOKf8T0seGArhhkk4fbpiw9HU
	DfFMdByzP+RmQIYNckpKcJGlnJSGEEqLFw==
X-Google-Smtp-Source: ABdhPJxRC/0ymBMOdUOgOfcnsf1v14Roa6tVI6P3edc7zmwWzeedeA8tyaDtNk/EaHq6W49vyAphdg==
X-Received: by 2002:a1c:a385:: with SMTP id m127mr6266401wme.189.1598430868978;
        Wed, 26 Aug 2020 01:34:28 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id c9sm4071189wmf.3.2020.08.26.01.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 01:34:28 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/3] doxygen: Upgrade 1.8.17 -> 1.8.20
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200825095407.18867-1-leon.anavi@konsulko.com>
 <CAMKF1soynk8yNEZA5LZL4K-DpY6v2S2sRwQJQgp7dQ8BkqZgSw@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <713966e3-8576-7782-17b3-966713f48b99@konsulko.com>
Date: Wed, 26 Aug 2020 11:34:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soynk8yNEZA5LZL4K-DpY6v2S2sRwQJQgp7dQ8BkqZgSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 25.08.20 г. 21:25 ч., Khem Raj wrote:
> Fails to patch doxygen-native :(

Thank you for reporting this issue. I fixed it and I've just submitted 
v2 of this patch.

Thanks,
Leon
>
>
> On Tue, Aug 25, 2020 at 2:54 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Upgrade to release 1.8.20:
>>
>> - Add configuration setting to have docstrings not as preformatted
>>    text but as normal documentation
>> - Bug fix: void return type reported as not documented
>> - Bug fix: Doxywizard 1.8.19 (Windows): Source code directory
>>    seems to be ignored
>> - Bug fix: The Doxygen uses too much memory (or has probably a
>>    memory leak)
>> - Bug fix: Doxygen doesn't stop on errors
>> - Bug fix: C++ grouped functions in namespace have disappeard
>> - Improvement of line count for e.g. warnings
>> - Improved layout on the bibliography page
>> - Updated the swedish language translation to 1.8.19
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb}          | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb} (79%)
>>
>> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
>> similarity index 79%
>> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
>> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
>> index 45de71826..d4ac3b720 100644
>> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
>> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
>> @@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>>              file://0001-build-don-t-look-for-Iconv.patch \
>>   "
>>   SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
>> -SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
>> -SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
>> +SRC_URI[md5sum] = "8729936a843232a66fe970ef65f3c3e4"
>> +SRC_URI[sha256sum] = "e0db6979286fd7ccd3a99af9f97397f2bae50532e4ecb312aa18862f8401ddec"
>>
>>   inherit cmake python3native
>>
>> --
>> 2.17.1
>>
>> 

-- 
Leon Anavi
Software Engineer
konsulko.com

