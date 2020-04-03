Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.1090.1585934962040292441
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I/bwTjaE;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id c16so8349858iod.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=iLPlR4XSXdMcPkPodwFvGnm+9QNDtrsZp7Y9xSunex0=;
        b=I/bwTjaEr4AQsKvZWGr8vo3zYjsbm4LpbmRNZaa7MNPKjcAv55HTCqdrPw23VdAeL9
         oYipYUAwfbmpkPtzXMyaxxoRsdJw+cmvdUBCJPgHQZp5L7g3/OKqi+a5rSRYev8/z2GM
         JHAv/ZmDbqpArsDRnAvwoA+17zPa9VYyE9Lnku6PWXc7XhshzuSFdqLiSp5TbwCf3jsC
         IuB2Dez4nLy2GOn2BSz5YiFuqJZ3fytrvVZjJngLcxdtMUp9OLXtdSs269QLfS7/fJxK
         4p/akc7a9tTElw4jQjk7ggAcLPPMiwfdaEvkJM2Nane8KHMJDnv6+A12dEXtpCH5Sfyu
         FCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iLPlR4XSXdMcPkPodwFvGnm+9QNDtrsZp7Y9xSunex0=;
        b=O6qNhGbVjioFHv9KwLGRfzldKK65fatcshKMNOTbsHd4YF4aFWjpKRljI8Sdsxdb9q
         jOUh0zFYicBT/yrqqSk7BzmnxZtjGEZnCMQG/uTIJNd25JNXVq0WBAa8OA8wUPOOJpDT
         b1ZhqLTjg1MjHq7yVq87AR0P7glrv4ghe+WabqwwkDQ5zf8ckw9kY5n4nXbCLObKm0/L
         vjw8fFuOENIwuxV9yRyb9kkAGPDhzozysHjqqDAN+iNrf9/yjW05dk7vQrAZaPMZYZTr
         OHeB60Cw8brhx3GqaZLya65G322rFtkOClXZNKdgbDauuw70SYve/na8+bhakEH0tqWn
         yxgw==
X-Gm-Message-State: AGi0PubqG61oP9PDd0MeFBZTpi2qffIeowuUy/y7ux6E/BQczjBZ4vD9
	yBlTZRNqK2vExWa5YkxEFKLMyIX1O3Q=
X-Google-Smtp-Source: APiQypKt+b6P051qi8k2Gl4MZgPfmz5uSAJjlLvKJL6OToYbisfWp/7GBAtPdtqSQI70RzwIcjmLJQ==
X-Received: by 2002:a5e:8d19:: with SMTP id m25mr8725469ioj.118.1585934960934;
        Fri, 03 Apr 2020 10:29:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5d80:f4ba:ee3c:9546? ([2601:646:9200:4e0:5d80:f4ba:ee3c:9546])
        by smtp.gmail.com with ESMTPSA id f20sm3022354ilf.64.2020.04.03.10.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:29:20 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 1/3] python-smbus2: Add new recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <d24275c5-a8e3-d8ac-d112-b763e8dd4d7c@gmail.com>
Date: Fri, 3 Apr 2020 10:29:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/3/20 1:15 AM, Leon Anavi wrote:
> Drop-in replacement for smbus-cffi/smbus-python in pure Python.
> It is another implementation of the python-smbus package.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   meta-python/recipes-devtools/python/python-smbus2.inc | 19 +++++++++++++++++++

inc file seems needless here, please add all code to .bb itself.

>   .../recipes-devtools/python/python3-smbus2_0.3.0.bb   |  2 ++
>   2 files changed, 21 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-smbus2.inc
>   create mode 100644 meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-smbus2.inc b/meta-python/recipes-devtools/python/python-smbus2.inc
> new file mode 100644
> index 0000000..0bab1a4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-smbus2.inc
> @@ -0,0 +1,19 @@
> +SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
> +DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
> +HOMEPAGE = "https://github.com/kplindegaard/smbus2"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
> +SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
> +
> +CLEANBROKEN = "1"
> +
> +PYPI_PACKAGE = "smbus2"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
> +
> +RDEPENDS_${PN} += "\
> +	${PYTHON_PN}-ctypes \
> +	${PYTHON_PN}-fcntl \
> +"
> diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> new file mode 100644
> index 0000000..6149e35
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools3
> +require python-smbus2.inc
> 
> 
> 
> 
