Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.15153.1596395061450045337
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 12:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GKx7MN5n;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id q7so37409493ljm.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2020 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3tyrwuKK/8A1qW0k2LZvPsg7v418yhVOo7+0Z7Fm0I0=;
        b=GKx7MN5ni5rRm22/pnFMxzm5p2B17RRG68zV0LjJWSeRahsvtUK+wtu7nvHPtbGMVV
         q3wqwFjm/cHQSheod7yFqmBPKsy/vdS5Ot4FZkjlk4js7UBmV0p3Bam/tB/3RmptDpf3
         kycfgn6drCuDC/TRQoFkMNWM7v8JuaiqcU3zoYLQwFM06e7NOEmzUxfr4DFNV/7j+7U2
         OB24m4JauBEKyLGZ+BIaicrC8akx1fi+4LUxsIPISmrRAPxM2JUpuRmzCslJqVt4iMZ1
         qHVE+tzaIWo3Yx47TgUn/sAdPJo2K5MNOgTtmFnCJTQosRxfZfaAFrUqulJDaNxgWP/K
         NBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3tyrwuKK/8A1qW0k2LZvPsg7v418yhVOo7+0Z7Fm0I0=;
        b=kjadJ1+Gdfl3V0UEbc2u5NTm3tN4F8c1fF5k3G02tUu6cl58qEZ3Qi7hpEsGgW+8Xw
         vl7XLPkIE7Uswv5Ntg+9GYNbSxjM08lHIUenXX7dRDLFwrqf6PJYnP6kpzj1nrxhc1WZ
         x+d+SNzuDzffFteIGeVH+W6cjukXIEWMAPmHG0qc/RKwaWdIqwKwndZXZcoU10wD7twP
         lrD/Z0ksBBRSkQEw54h2AUNZnhT7rx6XZuM8emBSxtUw627tgWL0Z3k7Fcgds+URdfu4
         qn6e2kxn1/ZBjpXFTW4pTJxFqu7F0A0+fedPxXtoTWNlK8q8pQHFUJiz8bsDf2t9hH+8
         qGwQ==
X-Gm-Message-State: AOAM5301yO/dWTwB9bcNLOK8sLakJa5tLUMLlNn9OQ1eg6PxsW9pYJIX
	E+Jr9mR5joXhmHTQ0eTk0ASHEA==
X-Google-Smtp-Source: ABdhPJxDhLc8u05gBkS/T1Okv00RYn8Cmcx+V1cb6EzFJoTrG9VWzm1aCTNWT+FEoiipRxcEPt8IJQ==
X-Received: by 2002:a05:651c:155:: with SMTP id c21mr6525892ljd.453.1596395059584;
        Sun, 02 Aug 2020 12:04:19 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id 15sm2880634ljw.92.2020.08.02.12.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 12:04:18 -0700 (PDT)
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH v2] libcamera: fix packaging and installation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: openembedded-devel@lists.openembedded.org,
 libcamera-devel@lists.libcamera.org, raj.khem@gmail.com,
 madhavan.krishnan@linaro.org
References: <20200731143919.25825-1-andrey.konovalov@linaro.org>
 <20200801130137.GE11820@pendragon.ideasonboard.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <5e874810-2a9b-260a-f8c5-2563b4e32489@linaro.org>
Date: Sun, 2 Aug 2020 22:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801130137.GE11820@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 01.08.2020 16:01, Laurent Pinchart wrote:
> Hi Andrey,
> 
> Thank you for the patch.
> 
> On Fri, Jul 31, 2020 at 05:39:19PM +0300, Andrey Konovalov wrote:
>> libcamera checks if RPATH or RUNPATH dynamic tag is present in
>> libcamera.so. If it does, it assumes that libcamera binaries are
>> run directly from the build directory without installing them, and
>> tries to use resorces like IPA modules from the build directory.
>> Mainline meson strips RPATH/RUNPATH out from libcamera.so file
>> at install time. But openembedded-core patches meson to disable
>> RPATH/RUNPATH removal. That's why  we need to remove this tag manually
>> in do_install_append().
>>
>> IPA module is signed (with openssl dgst) after it is built. But
>> during packaging the OE build system 1) splits out debugging info,
>> and 2) strips the binaries. So the IPA module so file installed
>> isn't the one which the signature was calculated against. Then
>> the signature check fails, and libcamera tries to run the IPA
>> module isolated (in a sandbox), which doesn't work if the IPA
>> module wasn't designed to run isolated. The solution is to
>> recalculate the IPA modules signatures in ${PKGD} after do_package().
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   Changes in v2:
>>    - Recalculate the IPA modules signatures after do_package()
>>      instead of disabling stripping and splitting libcamera package
>>
>>   .../recipes-multimedia/libcamera/libcamera.bb     | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> index 00a5c480d..30c6600e5 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> @@ -18,13 +18,26 @@ PV = "202006+git${SRCPV}"
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
>> +    chrpath -d ${D}${libdir}/libcamera.so
>> +}
>> +
>> +addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
>> +do_recalculate_ipa_signatures_package() {
>> +    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
>> +        if [ -f "${module%.sign}" ] ; then
>> +            "${S}/src/ipa/ipa-sign.sh" "${B}/src/ipa-priv-key.pem" "${module%.sign}" "${module}"
>> +        fi
>> +    done
> 
> Note that you could also use the src/ipa/ipa-sign-install.sh script,
> which takes the key as the first argument followed by the list of .so
> files to sign. Something along the lines of (not tested)
> 
>      local modules
>      for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
>          module="${module%.sign}"
>          if [ -f "${module}" ] ; then
> 	    modules="${modules} ${module}"
>          fi
>      done
> 
>      "${S}/src/ipa/ipa-sign-install.sh" "${B}/src/ipa-priv-key.pem" ${modules}
> 
> I think this will lower the risk of breakage in the future, as
> ipa-sign.sh will have a higher chance of being refactored than
> ipa-sign-install.sh

OK, makes sense. Thanks for the suggestion!

When creating v2 I've got the impression of ipa-sign-install.sh relying
on running in meson environment - when run as part of 'meson install'
it prefixes each module with ${MESON_INSTALL_DESTDIR_PREFIX}/.
But ipa-sign-install.sh also works OK when used in do_recalculate_ipa_signatures_package() -
"${MESON_INSTALL_DESTDIR_PREFIX}" resolves to "", and the ${modules}
use full path names.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,
Andrey

>> +}
>> +
>>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>   FILES_${PN} += " ${libdir}/libcamera.so"
> 
