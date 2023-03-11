Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E86EC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 05:59:54 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.40246.1678514388410970281
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 21:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KBRmxKDr;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id da10so29118070edb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 21:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678514386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vq+xL84GFc9Kij+QNl187HTnu4fDwbAFn8qfEXorId8=;
        b=KBRmxKDrCEdWSfAqthKpVZmRj32h+/xO02SVvm13q4VgEZGbSidI9OUJ8hqh34v3SI
         1K5uCz9J4FNy7Vbe5vuwJddTpoyyMGaxw79rKUfrDFEJLBHv0OJiDAQ9WUh6HlkhWQwj
         Pf7YIe810GeetSNrMifwYxVH+oJGGgo4qz4efDLvpxkeZ5CoJeiC0L9boNSImh5J/UJp
         3pd0Qbsg+9tpYnsV1fO5ENo8i7LCJy/nJ6NFgIItI/Xt1xSAvLGs0WSetkS/pMPBbTcF
         Ih9QrMPLQbhSQAl45ezxpi6EZGilpdMCjG/SA35hqGO7bLGuFiMU0SCkz9q8DfbdM3+a
         spVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678514386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vq+xL84GFc9Kij+QNl187HTnu4fDwbAFn8qfEXorId8=;
        b=darYElCxPV6QUE1CAsOuHLvzNiWoGmqWuKn2I/Od0DGpcJnKMINm9mLKFyM45BikhJ
         u2oRgeU0bTu1yJIYjfuHCwb2yU8Y294OEwtomWlSETaz/mueE5DktF6n0FLhwOQCH/zT
         UTdTH8iXHv0eUUZETGvLPpRHpbFoeU4zYnxBKsGNlbZBWkaXQiB8jZg+sUjze7FHtWw6
         0suVAr1PDT9p9toFdjSE6V956kSsTvpz/FcAFW8sRLebfZEWZNXENJmWxXMsJxx0muvm
         pdzsCYA7dV5wFgl/rsT6xyCXl1GPMs2mpCxkv1k1mzxa9yg0C/cUm+TucZeV19XN76L/
         QoOg==
X-Gm-Message-State: AO0yUKVxIJdjlcKNnQSILckPuP0VFN2ppzm3stV1VuS08e+/0s2s46VK
	dG3RVCsEE4803Ds7XkEkSLRuhqCq/rSvkA==
X-Google-Smtp-Source: AK7set+ZOL8LGgpBWpxoKK1oCl80jvx+5v0BY/oK02IZsTg/VlrajCt+F8UICJZYO6A/b19ly4VuWg==
X-Received: by 2002:a17:907:80ca:b0:889:58bd:86f1 with SMTP id io10-20020a17090780ca00b0088958bd86f1mr27887188ejc.14.1678514386311;
        Fri, 10 Mar 2023 21:59:46 -0800 (PST)
Received: from [192.168.1.143] ([188.36.69.113])
        by smtp.gmail.com with ESMTPSA id mb17-20020a170906eb1100b008d9c518a318sm731005ejb.142.2023.03.10.21.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 21:59:45 -0800 (PST)
Message-ID: <49c7d26c-91f1-0873-46b9-112809d2f5d9@gmail.com>
Date: Sat, 11 Mar 2023 06:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-python][PATCH v2 2/3] python3-cmake: New recipe
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20230310134637.108312-1-zboszor@gmail.com>
 <174B12D7752D1CA7.27660@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <174B12D7752D1CA7.27660@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 05:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101504

2023. 03. 10. 14:46 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Some python modules rely on "import cmake".
>
> Only build and ship the python parts, and don't download and
> build cmake from sources. Use the already built cmake instead.
>
> The CMakeLists.txt file is a crippled copy from this cmake
> python module's sources, removing almost everything, and
> adding a dummy install target, so do_install() doesn't fail.
>
> The python code is patched so cmake is used from PATH.
>
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   .../python/python3-cmake/CMakeLists.txt       | 11 ++++++
>   .../python3-cmake/run-cmake-from-path.patch   | 11 ++++++
>   .../python/python3-cmake_3.25.2.bb            | 37 +++++++++++++++++++
>   3 files changed, 59 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cmake/CMakeLists.txt
>   create mode 100644 meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
>
> ...
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb b/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
> new file mode 100644
> index 000000000..d0e11f9a6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "CMake is an open-source, cross-platform family of tools designed to build, test and package software"
> +LICENSE = "BSD-3-Clause & Apache-2.0"
> +LIC_FILES_CHKSUM = " \
> +	file://LICENSE_BSD_3;md5=9134cb61aebbdd79dd826ccb9ae6afcd \
> +	file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5 \
> +"
> +
> +DEPENDS = "ninja-native cmake-native python3-scikit-build-native"
> +
> +PYPI_PACKAGE = "cmake"
> +PYPI_ARCHIVE_NAME_PREFIX = "pypi-"

This line needs the pypi.bbclass change in OE-Core.
As far as I can see it not even reached master-next there,
while this series was merged into meta-openembedded
master-next.

As is, it will cause bad checksum warnings when building
python3-cmake.

