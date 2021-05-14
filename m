Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.9428.1621002151688416440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fmiay8jo;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id e19so6474338pfv.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P8Z9TG1vZ4Kvck0CzfV5Huk/xyzVne6B3yuQl60+sCI=;
        b=fmiay8jox6xJXeuSa7CUBavKWasr0wPncffzXTNIxMQyI0vNvtMImfnc9gfr9RlCGc
         guKAsobaEriS5ifGyDCOza/sS/6ZwFgyaxeWeW0CYB/CT85DEm2dP23PMy6rySMaiHtx
         eA0K+3avidr7kHwD/UD9nCx5Nwy2BMRhGaUsPWL8UQx2y3PA8sEAcG1Ueu0R3UshSZLP
         QvvpTwofzcKRgaLI8a/rTuaCZEua5C7QnGsnDM9sAB6KFiaPwk9O75bOOZgedy63L1xy
         7fSY5udmObc/K5luYRdlYOQtDL8AnZk0wuog8ie7ryzmRHP/eUNyllqCk/ue5v8/jFeI
         es3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=P8Z9TG1vZ4Kvck0CzfV5Huk/xyzVne6B3yuQl60+sCI=;
        b=ncW4YJ72uEmY9y7OqMgO/rbYaqcULlssnxH6xokeEW1vpN8FrvucjL2uYziWMCtqfx
         dESwtjwA00Gyi8HavLUCvC3FesQw2iacQ1+csoAniH+EhDya5QUlVSB83NU/92xhwsVa
         lqRwjWgXcoauQwbF6D/aoW8z/5GsrqGlJ48Um6k2GNNsXWJeUpsQZHzo9c/HRybF6eJ9
         4d62KKqanA1m+XMCWBOe7HI2Y7miRf/9OH7phhNdQbzpQAqoLbkxtcVm7Ch4a6tfSMkW
         mT7GMDF0wkJJ1zSw8Mabxj11E2sxs0ivhQxtJSGH5OcWh10wwZk767hDFmW/9OmPJ5tu
         KMnQ==
X-Gm-Message-State: AOAM530id7mA0nWDP33KOOWtyBZRpAnrCvVh12o41LbjSFoxJWIQDoqo
	bc2edg+PtvEO54NrhglE8XhkXh4EIWLz5g==
X-Google-Smtp-Source: ABdhPJzWpTH5n5YyZ4YChvDQUPDPT7e+WsRnRKJ+JlM/ci9EKQH/f+MXjlbCEnZbNpyAKjOKfTKbog==
X-Received: by 2002:a65:67c5:: with SMTP id b5mr21356033pgs.225.1621002150933;
        Fri, 14 May 2021 07:22:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::9c7a? ([2601:646:9200:a0f0::9c7a])
        by smtp.gmail.com with ESMTPSA id n26sm4169334pfq.28.2021.05.14.07.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 07:22:30 -0700 (PDT)
Subject: Re: [meta-python][PATCH] python3-pycocotools: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>,
 Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210511171359.4534-1-brgl@bgdev.pl>
 <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
 <CAMRc=MeT7xOkmV2qzs6F1yrbKt3s+MkJ5=ky8j7reop0+rRZhw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e597b092-104a-13f5-c4bc-bd928272bfe7@gmail.com>
Date: Fri, 14 May 2021 07:22:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MeT7xOkmV2qzs6F1yrbKt3s+MkJ5=ky8j7reop0+rRZhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/14/21 12:49 AM, Bartosz Golaszewski wrote:
> On Tue, May 11, 2021 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> add it to test packagegroup as well in a followup please.
>>
>> On 5/11/21 10:13 AM, Bartosz Golaszewski wrote:
>>> Add a recipe for building pycocotools - a Python wrapper for cocapi.
>>>
>>> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>>> ---
>>>    .../python/python3-pycocotools_2.0.2.bb           | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>    create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
>>> new file mode 100644
>>> index 000000000..4821c313e
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
>>> @@ -0,0 +1,15 @@
>>> +SUMMARY = "COCO is a large image dataset designed for object detection, segmentation, \
>>> +           person keypoints detection, stuff segmentation, and caption generation."
>>> +LICENSE = "BSD-2-Clause"
>>> +LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
>>> +
>>> +inherit setuptools3 pypi
>>> +
>>> +SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
>>> +SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
>>> +
>>> +DEPENDS = "python3-cython-native \
>>> +           python3-numpy-native \
>>> +           libxcrypt"
>>> +
>>> +RDEPENDS_${PN} = "python3-matplotlib python3-pillow python3-profile"
>>>
> 
> Hi Khem,
> 
> It looks like only the follow-up patch made its way into the
> master-next branch but not the recipe itself. Could you please check
> it?
> 

thanks for reminding me

> Thanks,
> Bartosz
> 
