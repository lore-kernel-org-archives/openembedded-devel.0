Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.16680.1608947200691209082
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hnesLcTo;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id n7so3805787pgg.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GKqzTBeo7B6V9bUtu/y6Dsca9JaNbw467+0v4n+8lFw=;
        b=hnesLcToT1ZNdXzxQId25D978KujfG7WUoYwd9Mc3meSnU/Jn3iX0VudhDj7qEEpGB
         1CzBV1cjiOmqNZUeZNTwX1Dd2GBm8c1LN5SII65f3DhUFeOHQxsDZsMvJkVqNYB5vWEf
         cFT2OnMAnafOMN5sMeM7Pd0BgY2KxXTy1aMKeHnRgZWSYF4HckK04HmKwbBdOo6mowIh
         eulmE2at0DiY1CSF2UDoBwxLeTdNB5gpod4PtR5buDSc2vC8XZYXB1TJ3uHzKaogleKA
         RJjZJF2EGAc3BG5/DH+9lUbFeaP2FbaZ+NQp9qo1Dah78kO0jRGUzXrV9Wx7Bql8+V92
         sHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GKqzTBeo7B6V9bUtu/y6Dsca9JaNbw467+0v4n+8lFw=;
        b=li8pBa/qFP+ETvafFICmUNgy1dSD7MaU9PhgeHyGPdiyHya2V6Rk4fUj0tPnPawvd4
         FBUo01Cip2RdVw8J2qY25ydF/ZXcjiag+dlrFRGekaX+RiMikVZlUiBXG4+UeEp6KthV
         ir1MzLmpKSy5s7ixOu7cmTJvbaTs/kJ8fIihGHon/kT8C3diMQAc0gtL96O8LMmNCd//
         Yz9yEukcz1VG6yhWqDNFfer2MZ/kI/VgFHotsEP05BUX/FYwr/6eQc4k721L5N7gebgK
         e74VQQgn6bolgPme9URVp4qVypMq3yS+eS8kPpJ3h/HuV35kTZ4MbINsmZI3AeJWhGit
         9qYQ==
X-Gm-Message-State: AOAM530AXJUfJPYjJtfVsNYvu6/0OU3dPIz2HU/VP8xdoiz//pMXmVMc
	dCfNnSYs/Wg3W8TitSbPskkUQGytq3/Dpw==
X-Google-Smtp-Source: ABdhPJzcHBnRStxY6vCBBl53lc278DKGaiznZFO7xHhRjRxr/8SahSxBR51ty86IfLMnRQA7HGqsCQ==
X-Received: by 2002:a63:e049:: with SMTP id n9mr34438117pgj.339.1608947199983;
        Fri, 25 Dec 2020 17:46:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b0c9:252c:272f:4617? ([2601:646:9200:a0f0:b0c9:252c:272f:4617])
        by smtp.gmail.com with ESMTPSA id u6sm31108534pgj.37.2020.12.25.17.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 17:46:39 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH 1/7] imlib2: add image manipulation libray from englightenment project
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
 <d66d930a-63ca-8f57-9e4d-d3d107cf8d4b@gmail.com>
 <CALT56yOWTnf+A4HS6Mg+cDGz2UbAm89vXTh0Hi3P7OXw=SdknQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c3c31cc3-9afa-7037-463c-1faa3726755d@gmail.com>
Date: Fri, 25 Dec 2020 17:46:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CALT56yOWTnf+A4HS6Mg+cDGz2UbAm89vXTh0Hi3P7OXw=SdknQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 12/25/20 5:43 PM, Dmitry Baryshkov wrote:
> сб, 26 дек. 2020 г. в 04:41, Khem Raj <raj.khem@gmail.com>:
>>
>> Please add new recipes to test packagegroups in
>> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> 
> OK, I will send a followup patch, if you don't mind.
> 

That works too.

>>
>> On 12/25/20 5:20 PM, Dmitry Baryshkov wrote:
>>> Restore and update old imlib2 recipe from meta-efl.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 39 +++++++++++++++++++
>>>    1 file changed, 39 insertions(+)
>>>    create mode 100644 meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>>
>>> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>> new file mode 100644
>>> index 000000000000..b44b03ce8e78
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
>>> @@ -0,0 +1,39 @@
>>> +SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
>>> +
>>> +HOMEPAGE = "https://sourceforge.net/projects/enlightenment/"
>>> +SECTION = "libs"
>>> +LICENSE = "MIT & BSD"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
>>> +
>>> +DEPENDS = "freetype "
>>> +PROVIDES = "virtual/imlib2"
>>> +PV = "1.7.1"
>>> +SRCREV = "v1.7.1"
>>> +
>>> +inherit autotools pkgconfig lib_package
>>> +
>>> +AUTO_LIBNAME_PKGS = ""
>>> +
>>> +SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https"
>>> +S = "${WORKDIR}/git"
>>> +
>>> +PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>>> +
>>> +X11_DEPS = "virtual/libx11 libxext libice"
>>> +PACKAGECONFIG[x11] = "--with-x,--without-x,${X11_DEPS}"
>>> +
>>> +PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
>>> +PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
>>> +PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
>>> +PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
>>> +PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
>>> +
>>> +PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
>>> +PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
>>> +
>>> +PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
>>> +
>>> +PACKAGES =+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
>>> +FILES_${PN}-data = "${datadir}"
>>> +FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
>>> +FILES_imlib2-filters = "${libdir}/imlib2/filters/*.so"
>>>
>>>
>>>
>>> 
>>>
> 
> 
> 
