Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.58274.1595864192830020777
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AQFXh6Py;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id v15so4705969lfg.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7lejTIqCLz085px/SxOF3xjPAS2PdkxRi8NaRsLbmCA=;
        b=AQFXh6PyNmNVWVHMt7+xyj1Vk28CrvZbFU8xDOZd8L1QTYD2adFwH9SbRk+jUpT4Gw
         Dfi3+h4j4RIzO3ScV65uZmfwkp8wUa0OdoSkL3FkGdPxbQ6xTKQt+8wc2Y6VgsxHfPY7
         plcH8tTCZO93v+C02Yh6IdnIkshVi5aJ2mo33Ncxf2Lm/cY/WgD+Xfauu8DsucVZApw/
         pQCDeXOD7evrohoK5ZVR1wv2pc0rLyoIcILYk2noaPDpsaQAwmZtmIuIORA9wPNi72Ig
         zAv6e1aQV0jz+5M3a9U4w6e4qWD+CG3+U035cbNSCwKWfGyAyoed4qmbmEy0g5Y0wK8r
         Bnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7lejTIqCLz085px/SxOF3xjPAS2PdkxRi8NaRsLbmCA=;
        b=a+F5YefREedmowq4Qr25PzCYv10MaCtFyq/27Zq2pWb2oMw5K2rIUuSJtSupB7e9jD
         AlfR5G390IyciKjwme/AGYv3T+hUUyN7b/iIHHMFewCi+U6AskA5JltyTIdqabgNe5Yb
         iTlCB876MLm4wPnla/b/Cxj3bcbiVf8lx+zJ0X5f2ps1NA0PDL04bIbcIy1ozqIMJg75
         dVSaVEyC83sb9/Xs60B2QhrADeRENftzkAbdP36fx+QNPbokQWwxXMwS0usD+REtNSIG
         21FrTWGS6KhXs6Y1QJ+qn7CXLZIgZi2ReqnooIINfp1WLHR2dVPJytpqCVK0hdirnV5b
         1Fyg==
X-Gm-Message-State: AOAM533m9oAZCFkGVY8buHqPajKJq5l4yybb8/gbZcp+HTve9JeliIyv
	mLpx97Qj3xrETH/auJVOaePeIQ==
X-Google-Smtp-Source: ABdhPJz4BrN/vxu5LHD5KV+Izth4K3o2LyrTRzi5MsAKjBd4iEafbrJXVVDJoMbjuTexLX+PwK6ULw==
X-Received: by 2002:a19:ac03:: with SMTP id g3mr11870500lfc.164.1595864190865;
        Mon, 27 Jul 2020 08:36:30 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id t205sm3102628lff.8.2020.07.27.08.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 08:36:29 -0700 (PDT)
Subject: Re: [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 madhavan.krishnan@linaro.org, Peter Griffin <peter.griffin@linaro.org>,
 libcamera-devel@lists.libcamera.org
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
Date: Mon, 27 Jul 2020 18:36:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

On 27.07.2020 18:28, Khem Raj wrote:
> On Mon, Jul 27, 2020 at 2:21 AM Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> libcamera checks if RPATH or RUNPATH dynamic tag is present in
>> libcamera.so. If it does, it assumes that libcamera binaries are
>> run directly from the build directory without installing them, and
>> tries to use resorces like IPA modules from the build directory.
>> Mainline meson strips RPATH/RUNPATH out at install time (for
>> meson versions up to 0.54; the things are somewhat changed in 0.55).
>> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
>> That's why we need to remove this tag manually in do_install_append().
>>
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
>>
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
>> +}
>> +
>>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>   FILES_${PN} += " ${libdir}/libcamera.so"
>>
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +INHIBIT_PACKAGE_STRIP = "1"
> 
> I think this is sub-optimal, it means we can not have stripped
> binaries and it will increase the size unnecessarily

Indeed.

But the alternative is to recalculate the signature on the stripped binary in do_install_append(),
and the drawback of this is moving part of the module signature implementation into the recipe.

Or the libcamera implementation is to be changed to handle stripped binaries.

Thanks,
Andrey

>> +
>> --
>> 2.17.1
>>
