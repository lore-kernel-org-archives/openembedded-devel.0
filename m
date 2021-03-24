Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.697.1616602192761223219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFMvuhQi;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so1419105pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+lBzf+2UMoiK9uUQbSlpeZYZxmA2bTgo6L4b9G7y0uY=;
        b=UFMvuhQiZoD75T22QEUlX8nAIxO1IVR9MpYxaoaCs80d2eHcPOG0no9vuS/MPoIO22
         eHwd/T8r72W1FbPb4rpRiVEQxaltSBN9iDfcqF+f/sv9dHodUwEP40yoIgF9colLnK3F
         R0UczlNOW8fSfi54jSOskpqYkvhXfNiQ/xsa1LjjGAHLgwZHU1aSlfYucKdQFrJup5BG
         JsXE294nBFyQMiktRbDRyPprZFHoyucK6VxI8unWIUIQK7AlpMCTdeLrKVsB2+WEv20W
         VZRZfHL8UZX8vNJIqCMV18XUyNaD3GUVSu+aDk7NEzw79EDJjrHvl0rn6iFT2w0uZ/p3
         6xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=+lBzf+2UMoiK9uUQbSlpeZYZxmA2bTgo6L4b9G7y0uY=;
        b=hMEYgxq3S+hTn/DTT5F0ZrRQjNN74AUbpQSsod3Il/0EcUpqmEJrOydyhOPCu6JbeX
         fLTdPEr8QYFN602mB8Imc3puzNNuJbcJuD92Wua+g+qkignNVOAcn2bhNL+dEpNEqED1
         s6SfoAOsKM+zJ9ZG3uLL9sPmM9rZozcKLRZP10ymKAlkf8BaiwpjHHu9Aj6+llbT7QHb
         0DjUNJjFG0kwM+Sk4I8WwwWhtumNqhbLYc2grdx8RR+sCFnSNb1UCF24CEDbFW6NVGx9
         tMO/JGuMAquCPLNjfZZeDn8C/KXrzg8fZStwwJYGvZySmn/O1s1woDgjAaAyZs6mt+Nu
         1FCA==
X-Gm-Message-State: AOAM532Xq80y39hQy0VXIhxiluNOhxS0xgQTOvEjlexG28vkoBZFy5+8
	q83WnCAFbmdc7TDAxvRWZmE=
X-Google-Smtp-Source: ABdhPJyb/mxPVZWrG4k7/rdmJIwJ1fvA4sjkOUp2b0JdMd/5NnfSnQ0eh1nIC6WRHZBpKO0PMNU+CQ==
X-Received: by 2002:a17:902:d78a:b029:e6:e1f:f695 with SMTP id z10-20020a170902d78ab02900e60e1ff695mr4397341ply.82.1616602192122;
        Wed, 24 Mar 2021 09:09:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:dc08:9c62:7698:5e41? ([2601:202:4180:a5c0:dc08:9c62:7698:5e41])
        by smtp.gmail.com with ESMTPSA id p17sm2997478pfn.62.2021.03.24.09.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 09:09:51 -0700 (PDT)
Subject: Re: [oe] [dunfell][PATCH] guider: Upgrade to 3.9.7
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Peace Lee <iipeace5@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d762d887-e606-85bb-b8b4-81b795874d50@gmail.com>
Date: Wed, 24 Mar 2021 09:09:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/24/21 3:46 AM, Martin Jansa wrote:
> From: Peace Lee <iipeace5@gmail.com>
>
> Signed-off-by: Peace Lee <iipeace5@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
What is in this update? What about Gategarth?

-armin
> ---
>  .../recipes-devtools/guider/guider_3.9.6.bb   | 39 -------------------
>  .../recipes-devtools/guider/guider_3.9.7.bb   | 19 +++++++++
>  2 files changed, 19 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
>  create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> deleted file mode 100644
> index f059002161..0000000000
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "runtime performance analyzer"
> -HOMEPAGE = "https://github.com/iipeace/guider"
> -BUGTRACKER = "https://github.com/iipeace/guider/issues"
> -AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> -
> -PV = "3.9.6+git${SRCPV}"
> -PR = "r0"
> -
> -SRC_URI = "git://github.com/iipeace/${BPN}"
> -#SRCREV = "${AUTOREV}"
> -SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
> -
> -S = "${WORKDIR}/git"
> -R = "${RECIPE_SYSROOT}"
> -
> -inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
> -
> -GUIDER_OBJ = "guider.pyc"
> -GUIDER_SCRIPT = "guider"
> -
> -do_install() {
> -    python ${S}/setup.py install
> -
> -    install -d ${D}${bindir}
> -    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
> -
> -    install -d ${D}${datadir}/${BPN}
> -    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
> -}
> -
> -RDEPENDS_${PN} = "python-ctypes python-shell \
> -                  python-json python-subprocess"
> -python() {
> -    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
> -}
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> new file mode 100644
> index 0000000000..2b799fd5e4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "runtime performance analyzer"
> +HOMEPAGE = "https://github.com/iipeace/guider"
> +BUGTRACKER = "https://github.com/iipeace/guider/issues"
> +AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> +
> +PV = "3.9.7+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/iipeace/${BPN}"
> +SRCREV = "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "python3 python3-core \
> +        python3-ctypes python3-shell python3-json"
>
> 
>

