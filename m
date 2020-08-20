Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.106777.1597913954446519863
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 01:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qmiHh1nf;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id p25so918098qkp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zep2OrGLSPPdjWShoI0fZ+p6lXzDiKWtFrdvxqDx0AM=;
        b=qmiHh1nfqNMrFpkyx/FOYNfDCBjEcL2ZjTyzeT7DucrVH/Fl0qhTOJMIla6Ieg5xRi
         0Ik+KLG3cpnw/HSSmX0l2YTN4hVBH+ig2IZnwhuNvunv+hzYFp9ETYH4qnZNTKxSJNHH
         7MMyG/RYd2jaXksOji9AlFEdCzhIjzhB0350Wo6py08fg57Nonu5NPRD1OP1CUa1z9z5
         2RzAMWy3q9wD+2cuI/mpvbGsfzz6Zs/9ihv7X/KcW43Qc0uFx9Le8qLnOKuwkx2NrBdu
         qVsSeaqB/tXkw1cAYhgIyb9tscDkk15q9nIiz04yxKtUfFT552JTQJfFQ5yakWSCxF2s
         4dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zep2OrGLSPPdjWShoI0fZ+p6lXzDiKWtFrdvxqDx0AM=;
        b=GVacsZvk4aQ+fY1r7NnHFmwNo54sHcdflVstlpz6f/YQevUvsSD6c24Xv3Y/ilbWMg
         gvTxn/UwyQXq8GkP1YrV3BuuTprTDYlykmOU2w3A+NRLDVKyyaM4uZBpCAwjhwCFxks7
         V5rg9/t1NCDQfZsnI3iYZGs6Pta7Ehl+1d0TpSOink/VrlBbqGDSQ4lNvPrS/p9WEpov
         OzgMxXRxVLYqGioBGEBhAHUzlZnV0WaJtNw+LLRH6DxdyBF/YXHp7fiKTMEFJvp/vKcm
         V4fNNJoNbVFoBliQSO5vfWE3/BG3Jwl9lQFBmpzi1/OOCGpcKeMqxpOE0QRl9GH88rkl
         rDzA==
X-Gm-Message-State: AOAM532q362hiWLswH8rlhVTBkji9nV6w9Co/doH3bq0glbUtDeMnd9V
	EL4qQpeP4oRDC7xB3MqTBz0sxgJGv6ceki6tQPw=
X-Google-Smtp-Source: ABdhPJznrvOlMtjWTVlq8HCrCQWZXrLkrn9Y5jF5XzxUI3RsTWVB8WqQB6pLZNr+PorKU1hCxJXA8upQg3TeYeSoNHk=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr1719078qkt.474.1597913953411;
 Thu, 20 Aug 2020 01:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200726130737.57830-1-open.source@oleksandr-kravchuk.com>
 <CA+chaQfFzhLFHYX0BY9-HwBhnk8kmmv2cRULaONWqXzTtwh=rw@mail.gmail.com>
 <9e1e222e-d467-9fb7-f028-9902315876a7@oleksandr-kravchuk.com> <CA+chaQd4dEhhZm3Z51o0tcOcMaeY88YJPBxWOouTVd_xGyEicg@mail.gmail.com>
In-Reply-To: <CA+chaQd4dEhhZm3Z51o0tcOcMaeY88YJPBxWOouTVd_xGyEicg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 20 Aug 2020 01:58:47 -0700
Message-ID: <CAMKF1spojOC3-H0cURSTO2mTrUCDF03TmWS0m3McX_6pmZu8gw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] valijson: update to 0.3
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 2:24 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Any update on this?
>
> Can we revert the upgrade until you figure it out?
>

For once, I have fixed it myself since reverts are not my best choice,
I would appreciate all patch submitters taking responsibility of
addressing comments and feedback posted to their patches in timely
manner

> On Mon, Aug 3, 2020 at 1:51 PM Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com> wrote:
>>
>> Hi,
>>
>> Oh, I was not aware those layers cannot depend on each other. I'll see what can be done.
>>
>> On 02/08/2020 22:03, Martin Jansa wrote:
>>
>> Hi,
>>
>> new dependency curlpp is only available in meta-networking, so this recipe in meta-oe cannot depend on it, either move it to meta-networking as well, or make it optional with PACKAGECONFIG if possible.
>>
>> Now it causes:
>> ERROR: Nothing PROVIDES 'curlpp' (but meta-openembedded/meta-oe/recipes-devtools/valijson/valijson_0.3.bb DEPENDS on or otherwise requires it). Close matches:
>>
>> Regards,
>>
>> On Sun, Jul 26, 2020 at 3:09 PM Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com> wrote:
>>>
>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>> ---
>>>  .../recipes-devtools/valijson/valijson_0.3.bb | 36 +++++++++++++++++++
>>>  .../recipes-devtools/valijson/valijson_git.bb | 21 -----------
>>>  2 files changed, 36 insertions(+), 21 deletions(-)
>>>  create mode 100644 meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>>>  delete mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb
>>>
>>> diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>>> new file mode 100644
>>> index 0000000000..049cdeffc0
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>>> @@ -0,0 +1,36 @@
>>> +SUMMARY = "Header-only C++ library for JSON Schema validation"
>>> +HOMEPAGE = "https://github.com/tristanpenman/valijson"
>>> +LICENSE = "BSD-2-Clause"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
>>> +
>>> +SRC_URI = "git://github.com/tristanpenman/valijson.git"
>>> +SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit cmake
>>> +
>>> +EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
>>> +
>>> +DEPENDS = "curlpp"
>>> +
>>> +# valijson is a header only C++ library, so the main package will be empty.
>>> +RDEPENDS_${PN}-dev = ""
>>> +
>>> +BBCLASSEXTEND = "native nativesdk"
>>> +
>>> +do_install() {
>>> +    install -d ${D}${includedir}/compat
>>> +    install -d ${D}${includedir}/valijson
>>> +    install -d ${D}${includedir}/valijson/adapters
>>> +    install -d ${D}${includedir}/valijson/constraints
>>> +    install -d ${D}${includedir}/valijson/internal
>>> +    install -d ${D}${includedir}/valijson/utils
>>> +
>>> +    install -m 0644 ${S}/include/compat/* ${D}${includedir}/compat
>>> +    install -D -m 0644 ${S}/include/valijson/*.hpp -t ${D}${includedir}/valijson
>>> +    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t ${D}${includedir}/valijson/adapters
>>> +    install -D -m 0644 ${S}/include/valijson/constraints/*.hpp -t ${D}${includedir}/valijson/constraints
>>> +    install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t ${D}${includedir}/valijson/internal
>>> +    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t ${D}${includedir}/valijson/utils
>>> +}
>>> diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb b/meta-oe/recipes-devtools/valijson/valijson_git.bb
>>> deleted file mode 100644
>>> index c3254d16e7..0000000000
>>> --- a/meta-oe/recipes-devtools/valijson/valijson_git.bb
>>> +++ /dev/null
>>> @@ -1,21 +0,0 @@
>>> -SUMMARY = "Header-only C++ library for JSON Schema validation"
>>> -HOMEPAGE = "https://github.com/tristanpenman/valijson"
>>> -LICENSE = "BSD-2-Clause"
>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
>>> -
>>> -SRC_URI = "git://github.com/tristanpenman/valijson.git"
>>> -PV = "0.1+git${SRCPV}"
>>> -
>>> -SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
>>> -
>>> -S = "${WORKDIR}/git"
>>> -
>>> -inherit cmake
>>> -
>>> -EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
>>> -
>>> -# valijson is a header only C++ library, so the main package will be empty.
>>> -RDEPENDS_${PN}-dev = ""
>>> -
>>> -BBCLASSEXTEND = "native nativesdk"
>>> -
>>> --
>>> 2.25.1
>>>
>>>
> 
