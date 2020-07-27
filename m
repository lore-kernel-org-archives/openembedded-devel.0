Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.52302.1595843908111385103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 02:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FbJXliCy;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id t6so3587821ljk.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jjqtMnaNo5h3W9gD2YyliEChhFmlOdlJOCyxaj4lTMo=;
        b=FbJXliCyVNOGVOusi5Z7azszsFvDHeDJqY3Pm4s7mEqUoyAja8dn8ccdgY+aLLQMbf
         VTbh88XI4tgYV9TD7vKjGwpspGXA1Yvo2wi2hLurhVpj3wFuMEIjdouVcUCDJEAjZCik
         p/29EN3S7ZgzDIitRqcnz8uimfK5Z2GI0N9dOAqH07TiKQL6jeR7KiN93NWEcvAYnEic
         qsoJ4eODIMuRbJe0fWKMU7TFk6C96z+gpEQsm7OHjA4/pOdLRgd52Vs3iRT2xcXqQnOL
         WWaWPrOKXO49HaAG2puHD48C+cjwAJzaf92yzkoOp8Ql6K6qp+rkHRynKOktBtBQbRDm
         xUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jjqtMnaNo5h3W9gD2YyliEChhFmlOdlJOCyxaj4lTMo=;
        b=WI5gjhZj2iEAZTIPJj3VH+03cSe99/Gu585bniuy9wwM+x19sVlreBfiIk4WZZbImO
         YOdvZtmuZX2DFXgeeQgGcH7PY7d5xBfTqmB6FlW2Rk+aYsj0skzr2naikeUzbKalhp2x
         +4jDh001+AJPzLECgea92oc+T944GFAiZVKXNmsB5a6sad4lRO8eOVluW8G+TegtEf1F
         psSb/Px5usP/6IwAgshTINITaCCOLPIkCZfyt8AG3Zx9y3ptQWCfYZiyca5etV+Jt0y9
         kDVwCWvX+9rgdGHFhLcVJqedmdPKC5UBUNN9m5VJzPyfIFC1vs6QfCPO6N3W0Qqo95lx
         HgvA==
X-Gm-Message-State: AOAM5328B6eWskGBln/O9M8bN8YpPQOvy1/+/Er62xuYeyGF7reBue7b
	hF5F8xrTlijqtCNo14mjgHe/hQ==
X-Google-Smtp-Source: ABdhPJwoDo5qYsjDGbMUYtxk4DsDW5wJxp5YQ2vZVI6NkikoOjdXJMq7ous2MmklTty473KwKanLBg==
X-Received: by 2002:a2e:9cd6:: with SMTP id g22mr9953358ljj.429.1595843905627;
        Mon, 27 Jul 2020 02:58:25 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id j17sm2930232lfr.32.2020.07.27.02.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 02:58:25 -0700 (PDT)
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: kieran.bingham@ideasonboard.com, openembedded-devel@lists.openembedded.org
Cc: libcamera-devel@lists.libcamera.org, raj.khem@gmail.com,
 madhavan.krishnan@linaro.org
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
Date: Mon, 27 Jul 2020 12:58:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Kieran,

On 27.07.2020 12:42, Kieran Bingham wrote:
> Hi Andrey,
> 
> On 27/07/2020 10:21, Andrey Konovalov wrote:
>> libcamera checks if RPATH or RUNPATH dynamic tag is present in
>> libcamera.so. If it does, it assumes that libcamera binaries are
>> run directly from the build directory without installing them, and
>> tries to use resorces like IPA modules from the build directory.
>> Mainline meson strips RPATH/RUNPATH out at install time (for
>> meson versions up to 0.54; the things are somewhat changed in 0.55).
>> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
>> That's why we need to remove this tag manually in do_install_append().
> 
> Uh oh, what's changed... (I'll have to go take a look).
> 
>   -
> https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-now-more-careful
> 
> If we're reliant upon meson behaviour which is no longer consistent,
> then we are going to have to do something else in libcamera.

I haven't tried meson 0.55 yet, but my impression was that 0.55 should work
just as before for "usual" (as per libcamera's README) libcamera build. And
starting from 0.55 the patch in openembedded-core to disable RPATH/RUNPATH removal
*might* be dropped - if all the packages would be able to set RUNPATH to
what they need, and meson would detect that OK in all those cases.

Thanks,
Andrey

> /me sighs ...
> 
>> IPA module is signed (with openssl dgst) after it is built. But
>> during packaging the OE build system 1) splits out debugging info,
>> and 2) strips the binaries. So the IPA module *.so file installed
>> isn't the one which the signature was calculated against. Then
>> the signature check fails, and libcamera tries to run the IPA
>> module isolated (in a sandbox), which doesn't work if the IPA
>> module wasn't designed to run isolated. The easiest way to fix that
>> is to disable splitting out debug information and stripping the binaries
>> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
>> INHIBIT_PACKAGE_STRIP.
> 
> 
> This sounds like an effective solution for openembedded, but it needs to
> be fixed in libcamera all the same.
> 
> 
> I'll try to follow up with the meson guys to see what we can do,.
> 
> 
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> index 00a5c480d..573366f08 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
>> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
>>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
>>   
>>   RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
>>   
>>   inherit meson pkgconfig python3native
>>   
>> +do_install_append() {
>> +        chrpath -d ${D}${libdir}/libcamera.so
> 
> Aha, I didn't know about chrpath, that looks helpful. Perhaps part of
> the solution will be handling our own strip/install actions to do this
> explicitly in the build.
> 
> It will be a pain to have to pull in another external dependency though...
> 
>> +}
>> +
>>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>   FILES_${PN} += " ${libdir}/libcamera.so"
>>   
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +INHIBIT_PACKAGE_STRIP = "1"
>> +
>>
> 
