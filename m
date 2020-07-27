Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.58824.1595865066253123509
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LgdRiT+f;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id q4so17823268lji.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BxnaWYpqH+TZSEPPchJigI0vXWd0qDsUviHuDeau2xE=;
        b=LgdRiT+fWZXsqXNbaKQfIY0PZNXMoGPPgFftvDoUxnFx9gtpLSjY+cM+yGLb0iW+Jj
         zSRW5TWnv9KZKe6zXhGR19kPl3jUBIfQB+GmPPQQRRAWbWOyzveY5HA4ioz8dz+YW0F+
         hzjLfY53Ny/YWntmjgfpqclhMmONiM1y+aZcJQK7CuuRUltD5qIJx8RtqDVusS61DpGz
         2haVGtGwylglqvvf8wcYqKTTnUHn6RxgNyQsjoNgIkzlmYo9FJ2RHAGM/x2ROUYf4kgI
         FPUVqLxUDb8gaZpjMMvQgITeBuynGx7wb3UnXtJOUarXHBN5qTS1Au4UxZGWzc01KxgA
         3FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BxnaWYpqH+TZSEPPchJigI0vXWd0qDsUviHuDeau2xE=;
        b=ZGZxYOX1xGznfPzpyYkdQEd6qvC4j/Z64KS1TJBF+ufWUa6KlU9rgb6KrCJteS1/wa
         7lxnkpuuvTW1FbHFG2PAlL/OkodHvivs86d5wkjTljpsVBwEtfFE7r6KmxpAhGRrwIhl
         m+ycdej1xdxME28mrjFs04OoMSAQb3tHY6HxKplGapKfakf1WVygJ0DzDt7NK8ui1pru
         b/nC03Pp5B+L9HJaYd9NsofHkDbEniYeK21EDttyTJxa5FMfvpK3mluGSEVFqo3EHqO7
         3edtYSW0FE48hSGXxBDBHy/dDlgR925QDvtXqVtEgCrsKAs4bYK+Bpf8Ko3QTIXiKHPh
         Fp4w==
X-Gm-Message-State: AOAM530DPORd7K6sja6jZDT55ZZmDZrOHorCsA7DzIeoBM0PjbCPPp0u
	IXNem8z/nHgS+ckas360CMQ4kw==
X-Google-Smtp-Source: ABdhPJzF7R/Bg1yZa/Cr8UBiK/lhyaOVIeNTz955JsPdIM9tvYsdciMGdZ0wnJLlo2iLdmCqkq8b+w==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr10808346lji.75.1595865064543;
        Mon, 27 Jul 2020 08:51:04 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id y21sm1955806ljg.111.2020.07.27.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 08:51:03 -0700 (PDT)
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Khem Raj <raj.khem@gmail.com>, libcamera-devel@lists.libcamera.org,
 openembeded-devel <openembedded-devel@lists.openembedded.org>,
 madhavan.krishnan@linaro.org
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com>
 <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
 <20200727154503.GB17521@pendragon.ideasonboard.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <3831a2ac-eb6e-6b96-01b0-c6db1623f5b7@linaro.org>
Date: Mon, 27 Jul 2020 18:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727154503.GB17521@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 27.07.2020 18:45, Laurent Pinchart wrote:
> Hi Andrey,
> 
> On Mon, Jul 27, 2020 at 06:36:28PM +0300, Andrey Konovalov wrote:
>> On 27.07.2020 18:28, Khem Raj wrote:
>>> On Mon, Jul 27, 2020 at 2:21 AM Andrey Konovalov wrote:
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
> 
> We could calculate the signature on selected sections only, but that
> would make the implementation much more complex. Could the
> src/ipa/ipa-sign-install.sh resign script could be used by the recipe ?

Yes, it could.
I'll try this.

> We can also improve the script to facilitate its usage.

OK.

Thanks,
Andrey

>>>> +
> 
