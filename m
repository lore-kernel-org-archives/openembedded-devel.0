Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.152.1615907005219570432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 08:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FKNzEGq2;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1589568pjv.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VFm2PH1/xx+kiMa7UT56e56Ic9ms5pTq/dc3SjGeJfc=;
        b=FKNzEGq2j/+56LK0q6TKaD7iYQrWIs4ESmjQnrU/3X3G7K7zF5LvWpb/q+j4B97CrB
         4rcGRN90CwMJxsu+OxwvQ2iiiJ7JQEg0cUid7haSZZgKh0XU/ckZp26/Lcl7nYON7l5q
         Fynvi2ZUhzz9R0Pj81XBpMbn711vfTZ6TLlVHQTQvYJ30RDqgtjxnZSTmftDhe+nD3JW
         sjjQeQ9ChOJILW6e6zvfvzHdg4YHhW7V2eLfToEiNhATj4hZazbIum5oHubrQFTbC8cM
         OaNX0wnVjCmLE9owVNLEY2iOoBOAQMKJvp8OupZZ+hDfB/V9Asy7fqFgaikRc3WPHiPL
         ontA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VFm2PH1/xx+kiMa7UT56e56Ic9ms5pTq/dc3SjGeJfc=;
        b=Z0K/Z5pU9XSMPgikSlXxGDilW0UQ2Whyk9vB26hHSV8d6wlBLZWvHJdwcH3+s9rWIy
         luj8cZGj2Tx8Clsjwm2fkmkuFIj1hYmvHDAmVmEQVLXds6qhJwiGbAPV6xEDpB17kqkW
         PLDHfcKQ7iyCp06VOoNTUq6lULBjNRiSC5yDY+h4AxOWDxXcv93aD0kFZ2VnVscy6iks
         FwfpsYBWJ7sKRT64GlLnBvNxESeSFVRCidbPuEE8lfla7md+IESDZSF+2oxSJJeiEPLm
         UP8JNj4Z7L4e2e7gCcosWKR4lUdq3Vi2JdE9FN09bxlUOV8YziEBSp6HLyF8jM9JJgxo
         CgAA==
X-Gm-Message-State: AOAM530bhswAQ0sYOtEUhnqJquFArAifSb6j8PT5A/JiLNOsn8KnE1Ny
	NPfpsBQ7Ld7Kd8yNiICAIxOcpaAT+Ee5XQ==
X-Google-Smtp-Source: ABdhPJyPzbEnyPOjjm0revarjCY/CN0mfwb82NBlOHDg0f4g2P5huymXRva6zw0Ve8IqHLuG8YG3cw==
X-Received: by 2002:a17:90a:cb12:: with SMTP id z18mr112217pjt.132.1615907004390;
        Tue, 16 Mar 2021 08:03:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::f7ac? ([2601:646:9200:a0f0::f7ac])
        by smtp.gmail.com with ESMTPSA id w191sm4165709pfd.25.2021.03.16.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 08:03:24 -0700 (PDT)
Subject: Re: [meta-python][PATCH] python3-pythonping: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>, Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20210316144242.5951-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4eead083-0413-1905-e77e-af261cf981bd@gmail.com>
Date: Tue, 16 Mar 2021 08:03:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316144242.5951-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

please add it to packagegroup-meta-python as well in a followup

On 3/16/21 7:42 AM, Bartosz Golaszewski wrote:
> Add a new recipe for pythonping - a python module allowing to send
> ICMP probes.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>   .../python/python3-pythonping_1.0.16.bb              | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
> new file mode 100644
> index 000000000..5affb934c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "PythonPing is simple way to ping in Python."
> +HOMEPAGE = "https://pypi.org/project/pythonping/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
> +
> +SRC_URI[md5sum] = "9b505ad8a5b8a6a8e57ccf75098ea364"
> +SRC_URI[sha256sum] = "d025c8b25952580dea47bc241421e17a5a97f97f50098e1096dd10d845d0f156"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "python3-io"
> 
