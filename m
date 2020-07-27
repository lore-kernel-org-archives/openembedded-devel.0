Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.58811.1595865365222454111
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zkaJJYvV;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id x9so17817369ljc.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kkWxCQ9j53wQUvJl9/qJLUdu52u5aAE113JOx3lV9mU=;
        b=zkaJJYvVJCqvCj+7XISwmJS1qvhH7HoywibgHVAxJSy2ZM6RKt8qNUB2VlnxKH0Vp1
         BrMN1TaAH557JxUSpdThFB0jqYmtbBWv50bZRLfrzcL2DFCP496M2ykBbgTcyhrc891/
         nHmDFImYo0ZMZLP6QeZTE7h8dHQxvXE/OKwA3aDO1WDVwvTi/nmuoLUodigYVfTsrtTo
         cTyFwudLfXv0fca51yoV8uoIN1UyAdiRpnaXYI0tfXZ00RjGWPo95Z5FIZUZynzkJZmy
         pfpAWOfyExc2ivRpITQ2OzTR9nGJh1WHyOH10XQ9JnoSoNoTCBIOt8mNB4LeTRm8IukU
         zsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kkWxCQ9j53wQUvJl9/qJLUdu52u5aAE113JOx3lV9mU=;
        b=B9Bumf+fKSAXnVWUcovPdydL/gGyWTJgmDHjYCu6kXoofD7JfHlNvMlCxf15RPBqAE
         wamL729uy88UbrBphesGODO8eIMACo75teZMYg5JR2QVDo0mBpyVlxs/r06bCBN44liO
         9Txri+TT8ZX372fez3Zj/qk3eLGho2YwbDP87RG69tEbNfCWwWclQ7jPGiLOZqeGlu0u
         jv+zJH9ZF4gXcyMi6RP78OFu1Kgsabbue40DWKAE3s8hEb9r3QiDfxyOFj9uhhmRWOAy
         yMSPiZi0s/0ia3Zcn3QItKYrO0AIiiH8E+SLX+vWzcrHIqhheRb452QwhyOOLahW4g5z
         NagQ==
X-Gm-Message-State: AOAM532MWAbYkjOkR3uJ4RLggOg/8wuwtreJZZ8d/yMaF7X+aw+CugYI
	pwLXq2ON+3PggX6cj2PilebmXA==
X-Google-Smtp-Source: ABdhPJyYpn6zEM80idRnqTq/8a2pWsUb2IJr7WMAF3SXWMIYA7Rm/CiIFmy8eYeQ57GCIea+eHRMSA==
X-Received: by 2002:a05:651c:1182:: with SMTP id w2mr4910848ljo.197.1595865363290;
        Mon, 27 Jul 2020 08:56:03 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id l12sm2427326ljj.43.2020.07.27.08.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 08:56:02 -0700 (PDT)
Subject: Re: [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 madhavan.krishnan@linaro.org, Peter Griffin <peter.griffin@linaro.org>,
 libcamera-devel@lists.libcamera.org
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com>
 <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
 <CAMKF1socZsM2zmAdNjRLsN2Ny3SpRbB=3P2tXsBZciHOVsJ09A@mail.gmail.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <b1894dad-7838-1c36-84d0-539138ad7590@linaro.org>
Date: Mon, 27 Jul 2020 18:56:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1socZsM2zmAdNjRLsN2Ny3SpRbB=3P2tXsBZciHOVsJ09A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

On 27.07.2020 18:38, Khem Raj wrote:
> On Mon, Jul 27, 2020 at 8:36 AM Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> Hi Khem,
>>
>> On 27.07.2020 18:28, Khem Raj wrote:
>>> On Mon, Jul 27, 2020 at 2:21 AM Andrey Konovalov
>>> <andrey.konovalov@linaro.org> wrote:
>>>>
>>>> libcamera checks if RPATH or RUNPATH dynamic tag is present in
>>>> libcamera.so. If it does, it assumes that libcamera binaries are
>>>> run directly from the build directory without installing them, and
>>>> tries to use resorces like IPA modules from the build directory.
>>>> Mainline meson strips RPATH/RUNPATH out at install time (for
>>>> meson versions up to 0.54; the things are somewhat changed in 0.55).
>>>> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
>>>> That's why we need to remove this tag manually in do_install_append().
>>>>
>>>> IPA module is signed (with openssl dgst) after it is built. But
>>>> during packaging the OE build system 1) splits out debugging info,
>>>> and 2) strips the binaries. So the IPA module *.so file installed
>>>> isn't the one which the signature was calculated against. Then
>>>> the signature check fails, and libcamera tries to run the IPA
>>>> module isolated (in a sandbox), which doesn't work if the IPA
>>>> module wasn't designed to run isolated. The easiest way to fix that
>>>> is to disable splitting out debug information and stripping the binaries
>>>> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
>>>> INHIBIT_PACKAGE_STRIP.
>>>>
>>>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>> ---
>>>>    .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>>> index 00a5c480d..573366f08 100644
>>>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>>>> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
>>>>
>>>>    S = "${WORKDIR}/git"
>>>>
>>>> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
>>>> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
>>>>    DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
>>>>
>>>>    RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
>>>>
>>>>    inherit meson pkgconfig python3native
>>>>
>>>> +do_install_append() {
>>>> +        chrpath -d ${D}${libdir}/libcamera.so
>>>> +}
>>>> +
>>>>    FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>>>    FILES_${PN} += " ${libdir}/libcamera.so"
>>>>
>>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>>> +INHIBIT_PACKAGE_STRIP = "1"
>>>
>>> I think this is sub-optimal, it means we can not have stripped
>>> binaries and it will increase the size unnecessarily
>>
>> Indeed.
>>
>> But the alternative is to recalculate the signature on the stripped binary in do_install_append(),
>> and the drawback of this is moving part of the module signature implementation into the recipe.
>>
>> Or the libcamera implementation is to be changed to handle stripped binaries.
>>
> 
> either of these solutions will be better perhaps.

Sound good. I'll try recalculating the signature and post v2 of the patch.

Thanks,
Andrey
