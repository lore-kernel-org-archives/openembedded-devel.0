Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.4243.1597350779658737080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 13:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xgE8IErm;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id 185so7625349ljj.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QQYnbkvfNETwNWWTbk3cWtQIVI7w82Ut5gs9o9YG6WQ=;
        b=xgE8IErmY+gYqN7fR2eHbwfjC0ZItwo9Smq15+4YUZtUM8hTDm/1EKiIJPlqCBrS3w
         KXJk9XX6jscYGebsz31O6qWa7EQz6xwqcVfPj3dmNNN95Wd9B0riRBlV8p1yYLKW/bV1
         4Pxcszg/VQ0uinEwVjyKIHowze50NkK4UDJAnCTl8yB2OhDHDhFyuUH2/QKEqwpri8D4
         CnzFLIOXedrE+zGrLgVh8OAZnPcE9ig/EY9do698AI1xu07F9nvmRAQEYQBQLyIJEugi
         flNbnjxWEQTF+dwIRnWCMHt0/jA0t7dfJxyjGADGPzsjE7TvBSyQAXm0lZzorZ01F18s
         7YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QQYnbkvfNETwNWWTbk3cWtQIVI7w82Ut5gs9o9YG6WQ=;
        b=MGyL6CQv2yGxOlv/uRUq9nP+g3dm8re/vsr4L+ZpAXcHmF88rJjSaVM8ZYIE3V9N6B
         R941OADlx9kM54Rbhu6DpMfQElkch3R0nbAwFgdI8okNyP/d33zO7wF6JnH77CP2sIdH
         1V1XEByr8gtsDlDXCzV4DKTq7YBbA83AnX3odbTYtsOaYqBs8POD5nvVW2PtE8SENZNc
         Ndk7Aj5uK8eeYfA/qF0+g5RQt+csRAyn+hn/lEpEwd7Wf7q9pj1TTb7E0TMr02x82mgT
         pTrUdORwlH6oblSZszDoNg4SEys6IaBOrmsO153+UTvZ0kZLcblpFIuo1Dxiizf1yokT
         vP5w==
X-Gm-Message-State: AOAM533eQpnW6aU59VxnzMH9o55PvEAYhakpwHfy0T9MMZE7X8beG10g
	d/FHBwqIuR/YxAQ84Zl8DJEsog==
X-Google-Smtp-Source: ABdhPJzE4m2HowuQlSgOA2MznEtOhii/bedba1hxeUAgo5Oi+QvVO8G+8ixSW9GgS88lI1EkdMMxJg==
X-Received: by 2002:a2e:a49a:: with SMTP id h26mr2643410lji.168.1597350777562;
        Thu, 13 Aug 2020 13:32:57 -0700 (PDT)
Return-Path: <andrey.konovalov@linaro.org>
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id 185sm1305092ljf.82.2020.08.13.13.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 13:32:56 -0700 (PDT)
Subject: Re: [meta-multimedia][PATCH v3] libcamera: fix packaging and installation
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 madhavan.krishnan@linaro.org, Peter Griffin <peter.griffin@linaro.org>,
 libcamera-devel@lists.libcamera.org
References: <20200802190719.9358-1-andrey.konovalov@linaro.org>
 <CAMKF1srLY6B6dtw3EhBJS30w=YNuigUqNUzJMSov+J0YxdW_eQ@mail.gmail.com>
From: "Andrey Konovalov" <andrey.konovalov@linaro.org>
Message-ID: <e774e53c-ed9a-4cd1-7473-812167d7ea64@linaro.org>
Date: Thu, 13 Aug 2020 23:32:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srLY6B6dtw3EhBJS30w=YNuigUqNUzJMSov+J0YxdW_eQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

I wasn't able to reproduce this error on my system even with the same
machine/distro/target system combination as from the error report.

Anyway, it looks like the error is due to bitbake failing to expand
some variables under quotation marks, so I am posting v4 which tries
to address that. (Both v3 and v4 patches work OK at my desk.)

Thanks,
Andrey

On 03.08.2020 20:48, Khem Raj wrote:
> fails with https://errors.yoctoproject.org/Errors/Details/427980/
> 
> On Sun, Aug 2, 2020 at 12:07 PM Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
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
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   Changes in v3:
>>    - As suggested by Laurent Pinchart, use ipa-sign-install.sh script
>>      to recalculate the signatures instead of ipa-sign.sh.
>>
>>   Changes in v2:
>>    - Recalculate the IPA modules signatures after do_package()
>>      instead of disabling stripping and splitting libcamera package
>>
>>   .../recipes-multimedia/libcamera/libcamera.bb | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> index 00a5c480d..b34d673bd 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> @@ -18,13 +18,30 @@ PV = "202006+git${SRCPV}"
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
>> +    local modules
>> +    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
>> +        module="${module%.sign}"
>> +        if [ -f "${module}" ] ; then
>> +            modules="${modules} ${module}"
>> +        fi
>> +    done
>> +
>> +    "${S}/src/ipa/ipa-sign-install.sh" "${B}/src/ipa-priv-key.pem" "${modules}"
>> +}
>> +
>>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>>   FILES_${PN} += " ${libdir}/libcamera.so"
>>
>> --
>> 2.17.1
>>
