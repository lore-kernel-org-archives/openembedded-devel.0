Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.782.1622051629626629407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 10:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4BBXpoe;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso790935pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UAA2KQq7XbKJDJUKbcIYKIQnMcqlRHI/apDSc3eR+8I=;
        b=L4BBXpoeHJMCUti529fLT9i3ccEvC77hTqlO5Zt8d5d12pWNuqTANAC1Q7B1D01wX1
         dRYxHauk0kGoHhHr81PWDB+CGtPIJmfbTOAXUoVvnazQB7eEvBdBayDMMjS2jlQfNrXI
         c5gJo2wMaPKBQbgB0iDogK3PLNbQfFBAOsDvEWOSpGqElEiuh0ne9HwVTeWtubMY0M/0
         iq6a8QsWb/dxzahOMHOIN4KPBj6qJWCIchZ+cg/Q8zpepYttqxdyXwVdNHkvDFu6jr3W
         rM6OVwsAriQj5NVhOkMO1qUW2ztDpEt/Tny1e5lE+9/Ssh+Oxdzx9J3+fe+gyyrNw4wI
         QBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UAA2KQq7XbKJDJUKbcIYKIQnMcqlRHI/apDSc3eR+8I=;
        b=pSJcrOhuKQtF8eUB1bF3De2J443aLV1to03HEbqrr0SOQHqrXTXEzaBo1M4Ps+wqFC
         39dy0tTt7q4+a1JlnVO6bM3pO9Hd2FDQhWi8RwTq/qoajYIccTN4NvI5zMLCyKHT6mW6
         uQH76FiM3+Mw8JRSL9eeP80lZQ9pHd14uhot/cwhatqA1zNtW1kjFEoISjJHGT2mY91P
         FmYS9lIVQYiqI9gpogVlXYkvNtVo3H0YCo3L4XjikMH3VjBE698F0S9EURAdaNez54U4
         kL9beJvoY5xVdAoe9p2HRbVQ5GG0YPnSy2twiBziKKS5xH5FZpm6Cu0kBQvGRyOHhENS
         qMiA==
X-Gm-Message-State: AOAM53345l+7ab9oh2J46d1VgSKl2Ra3pGPyO+cH4TcypGlUzRB7LoKi
	2aNQRnb9txI22+T4KClAR0r6j1lSkf+ayQ==
X-Google-Smtp-Source: ABdhPJycBdIkpnUa8mYAzBmkuQYxk/D2qeBs0qmKmyoEK4+xW6v5gJRzNw331ll1a+VbG72Qa8YYCQ==
X-Received: by 2002:a17:90a:7896:: with SMTP id x22mr5180970pjk.11.1622051628501;
        Wed, 26 May 2021 10:53:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:1d7:355f:d5bb:1bea? ([2601:646:9200:a0f0:1d7:355f:d5bb:1bea])
        by smtp.gmail.com with ESMTPSA id z23sm14735400pjh.44.2021.05.26.10.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 10:53:48 -0700 (PDT)
Subject: Re: [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
To: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
 openembedded-devel@lists.openembedded.org
References: <20210526173229.553-1-Nisha.Parrakat@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
Date: Wed, 26 May 2021 10:53:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526173229.553-1-Nisha.Parrakat@kpit.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

please rebase these patches on top of master or master-next and resend.

On 5/26/21 10:32 AM, Nisha Parrakat wrote:
> From: Nisha Parrakat <nisha.parrakat@kpit.com>
> 
> a) use option 7z to build the lib7z.so library
> This is needed for android-tools for building fastboot
> from android-tools
> 
> b) Packaged the lib7z.so and codec libraries as a part of this recipe
> Fastboot RDepends on it lib7z.so
> 
> c) Fixed a C++17 forbidden error when lib7z.so is built
> 
> fixes the below error
> 
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> |   308 |           numMethods++;
> |       |           ^~~~~~~~~~
> | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> |   318 |         numMethods++;
> 
> Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> ---
>   ...nge_numMethods_from_bool_to_unsigned.patch | 25 +++++++++++++++++++
>   meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++--
>   2 files changed, 44 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> 
> diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> new file mode 100644
> index 000000000..edde52593
> --- /dev/null
> +++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
> @@ -0,0 +1,25 @@
> +fixes the below error
> +
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> +|   308 |           numMethods++;
> +|       |           ^~~~~~~~~~
> +| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
> +|   318 |         numMethods++;
> +
> +
> +use unsigned instead of bool
> +Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
> +
> +Upstream-Status: Pending
> +--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402701 +0000
> ++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604125 +0000
> +@@ -298,7 +298,7 @@
> +
> +       AString res;
> +
> +-      bool numMethods = 0;
> ++      unsigned numMethods = 0;
> +       for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
> +       {
> +         if (methodMask & ((UInt32)1 << i
> diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> index 13479a90f..ada49114c 100644
> --- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> +++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
> @@ -9,6 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
>              file://do_not_override_compiler_and_do_not_strip.patch \
>              file://CVE-2017-17969.patch \
>              file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
> +           file://change_numMethods_from_bool_to_unsigned.patch \
>              "
> 
>   SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
> @@ -16,10 +17,26 @@ SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
> 
>   S = "${WORKDIR}/${BPN}_${PV}"
> 
> +do_compile_append() {
> +    oe_runmake 7z
> +}
> +FILES_${PN} += "${libdir}/* ${bindir}/7z"
> +
> +FILES_SOLIBSDEV = ""
> +INSANE_SKIP_${PN} += "dev-so"
> +
>   do_install() {
>          install -d ${D}${bindir}
> -       install -m 0755 ${S}/bin/* ${D}${bindir}
> +       install -d ${D}${bindir}/Codecs
> +       install -d ${D}${libdir}
> +       install -d ${D}${libdir}/Codecs
> +       install -m 0755 ${S}/bin/7za ${D}${bindir}
>          ln -s 7za ${D}${bindir}/7z
> +       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
> +       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
>   }
> 
> -BBCLASSEXTEND = "native"
> +RPROVIDES_${PN} += "lib7z.so()(64bit) 7z lib7z.so"
> +RPROVIDES_${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
