Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD3ECAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 17:12:46 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.657.1758906762695558853
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 10:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KAxJXfIW;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-425635acc4dso23441435ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758906762; x=1759511562; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/duAol0872xNtpwZyxeTzdHhAzMrWtOksW97SMWohHo=;
        b=KAxJXfIWtY2KBmh0o5QIzhBKZSXX9TILjuQyB78hN9xC5/AAqnw0hO6TEqR5aOW0KB
         tUOeYi0zcHpNNR5LbtminndoYFPsx30+JBN5Iy+8mi6HyK7comjJaUmpOo4NhDe75NAx
         2GHWU/nYJl+LesoNM2lqPYkyc9qoTPQyAV8fDrGi8NCZMMXpAF79zds4LKOZqLtb/kqw
         2tfmNEI0AG+qGdrccV1+uldsbKu4+n65AhjnWBdfoFc8E4kEl5T09kFqKPZgJjqP1Yzt
         9llfwKdgC580k1g6ERlnjq/lPGrlbyeL7zX8GT9XdWlezEyPne+4fJh+zVdoSKNIBTnt
         XDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758906762; x=1759511562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/duAol0872xNtpwZyxeTzdHhAzMrWtOksW97SMWohHo=;
        b=FGZC8PAaB8mMDvg8tg32womoP2QhCRyv2Dryjly82cQwmUS5vCuupL9gq8PwlO8jii
         cn3B7MUKEIoTi9Nt8TpBy9Mr+N7BqaeZJnuQFD9tteZBYm5xl+dH7TgHBvHdvNDXeTFZ
         mpGB3ecaoRsVRgHzSH0VJIKK/AJjytgK/ZhkEtQ30hUY/AiGYZYjxwjWx3ZIoDBuZ+Nz
         hdWNQT+KM+cVxgyN7+Zm43m0yoErDusncdJPkOVz+zfCdGovceduXY1RyAoJ3r0biWVp
         CAtFxEa7HUMzz8m2Qda09/PrZsgd5G/3Q4dthxMAiwOYmsFCUDfrByZvon+PCa92zPSC
         HB0A==
X-Forwarded-Encrypted: i=1; AJvYcCWdytBLX4od2/Yh3fjyXf7qiW2S27yy3QVBC85+iqMLINZroxDlVUflPtuY5x/i04n6CFpzToxLo608xa7YyrNqito=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyp2l5wOp7FRqyev8mxM6NCzvpz9rUbhkgP7l6/vfLoB0r+7cvT
	39bxi2bUHX89hnMKhBoXzBi/EonhKvHR+sabJuJq4D0vpYBEG1RpDIfIrHeJGLb9
X-Gm-Gg: ASbGncsfidi08S1RN9UId8iVls+mArs1vbb+WNtFLjrGIm9pNQwPORr99EIvbFRwQCA
	fEBhPuJY1s3hI9+pUjvOodo2Yvw9lLgaa80im6/RYLpJZsdM0XzhqkMaTAvPR8gFi13CdiH7Z8a
	UfCIHbcWODJGICS12Svgg2dzkqzT5AN6+am22Pd41zBMEt9W8T7/ZcOPB+sTPTW5Pa07rTYob/W
	1KIrTvyuaU78ULXJ4uFAy9rVONZedLi9KIshqACB1EdKr5wmpfvHg2QgsGUsfnaqgwBLlFwDFvS
	95j7oOhmDpJD9dWYtqF1aMyJaY78bgQWWUhaNjG4vhbj8FzxBXGGSFyV6h1nVly6qfpA8NXSIar
	SUQqiRcSYXjZf6NTfWUlRUn8Z3Flqzn+nXjkNMk5/IXpfUaQG+5lBFeNb5CHDlF5EYbf36yIPUD
	hdyDbfAyeC5qENE7gkdl5928XRK6ocySMUuGKj4zeNJnRItR2M81EYujr5tSUcUlCVRItEBcndG
	KLWBkswJD4xU0XmZYZAM/+djW5IbcbUEulZDDNx3A==
X-Google-Smtp-Source: AGHT+IGTtuDZ7S18doVOPymuDTrgcWmRvgBA1Nsm3Dw1UahXoOYNdwUJ6HgOhH2dG5y00tetg/L+ig==
X-Received: by 2002:a05:6e02:1d9a:b0:427:6e7f:89f8 with SMTP id e9e14a558f8ab-4276e7f8a4emr50538265ab.10.1758906761814;
        Fri, 26 Sep 2025 10:12:41 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:8d7c:fa44:7948:cb52? ([2601:646:8201:fd20:8d7c:fa44:7948:cb52])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab1dbfsm23618685ab.23.2025.09.26.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 10:12:41 -0700 (PDT)
Message-ID: <daffd0b4-b729-4db7-b120-f79a832789d7@gmail.com>
Date: Fri, 26 Sep 2025 10:12:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v4 3/6] python3-yarl: support
 reproducibility
To: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
 <20250926081914.3127272-3-hongxu.jia@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250926081914.3127272-3-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 17:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119936



On 9/26/25 1:19 AM, hongxu via lists.openembedded.org wrote:
> In order to make the generated library be reproducible, build wheel
> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> option -fdebug-prefix-map could work as expected
> 
> Note: To support reproducible, it also requires oe-core commit [1] to be merged
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=61d98d12eca1c7bdf3b7387a820c83d3b8fad965
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../0001-build-wheel-in-place.patch           | 31 +++++++++++++++++++
>   .../python/python3-yarl_1.20.1.bb             |  4 +++
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch
> 
> diff --git a/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch
> new file mode 100644
> index 0000000000..84f81da775
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-yarl/0001-build-wheel-in-place.patch
> @@ -0,0 +1,31 @@
> +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Sep 2025 15:41:09 +0800
> +Subject: [PATCH] build wheel in place
> +
> +In order to make the generated library be reproducible, build wheel
> +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> +option -fdebug-prefix-map could work as expected
> +
> +Upstream-Status: Pending

same here, please submit it upstream

> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + packaging/pep517_backend/_backend.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
> +index 61cad34..d5d839e 100644
> +--- a/packaging/pep517_backend/_backend.py
> ++++ b/packaging/pep517_backend/_backend.py
> +@@ -316,7 +316,7 @@ def build_wheel(
> +     """
> +     with maybe_prebuild_c_extensions(
> +             line_trace_cython_when_unset=False,
> +-            build_inplace=False,
> ++            build_inplace=True,
> +             config_settings=config_settings,
> +     ):
> +         return _setuptools_build_wheel(
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> index bbf9e3d782..6eedcf0f82 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.20.1.bb
> @@ -9,6 +9,10 @@ PYPI_PACKAGE = "yarl"
>   
>   inherit pypi ptest-python-pytest python_setuptools_build_meta cython
>   
> +SRC_URI += " \
> +    file://0001-build-wheel-in-place.patch \
> +"
> +
>   DEPENDS += " \
>       python3-expandvars-native \
>   "
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119901): https://lists.openembedded.org/g/openembedded-devel/message/119901
> Mute This Topic: https://lists.openembedded.org/mt/115445262/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


