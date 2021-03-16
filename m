Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.3518.1615864164258153730
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F8huEXEe;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso601258pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 20:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D9EClihc2Yy+W4gjzODUzgcjMS/sz1PPfSAzZAJkVcM=;
        b=F8huEXEehWszOp1aYbbnZY6ss0QSPAwDpier6JDs+oE3lF5GJmQetDnsCJ7oNivOGO
         5z1mo4+yzhYzfcePJJv0IleeOjS23F/151DWbBZZw1aa7ngCJ/NxdexliDqpt9m/xgbQ
         GP1VF7rrnOZws926BEmVA35PjnfSrTka2z+3ncprfg9KkYEF1DYlEMkwkZ8AEjr1p1QQ
         OenTEXAJAR4EvwOWAxX7esZGcbzl5WTlR5hexRZID+WYNXJ1rlmJp/vYOY4NBjhYbr9L
         LK0d25Mf2gFUUyW9VhWvjKLFYK+l9zL/5ACosa/WU1w5LnUx3M3xNlIIQSQQtNKgR/rN
         cH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D9EClihc2Yy+W4gjzODUzgcjMS/sz1PPfSAzZAJkVcM=;
        b=fkGr+wIYZ5ITkg6/2lIE+1+EtNA91aujpzHqaqSkHAPRCzco20um3Qsee8wtnb5frW
         2mao3sPPq+9XFqmvITh3dwxYKZHFv+7G85z913DKXRKkuQOolDV3yH8iVOHxNhHr2KIQ
         fjQBcTu3T9rLxeKRGBHZefkygGHPDIESaEvF+DHbU5a0GNcnqTe8kq+b6/pyRLvMMSca
         3ipSsn1Mo7hlo9D23sj3idy12rf4+qt7PPy2Y+eQ6i7qdEoZHC1Bes2cpg50V20D5zb+
         7L9/c0VOb01+KPAzgba+sMsm1dp/lRMLIj4qmzkKG4zkz8LffEwNPJLxHe9ggGV3IfDi
         ngJQ==
X-Gm-Message-State: AOAM530AEwRHCX7H83kyUSIpDRnujqZ2nPA9d/qYZp+eTJ9tEkWHSfP7
	Z/GqPwxOz44a0acImoDyA8vqlfKoT1ehhA==
X-Google-Smtp-Source: ABdhPJwoxSW8UzPU2JQC6NuOBavK9TF0dn6UD+t3uzjq2ENCsD2+8g1MaTkFUPlRdbyAS/Gckai4WA==
X-Received: by 2002:a17:90b:120f:: with SMTP id gl15mr2403407pjb.77.1615864163730;
        Mon, 15 Mar 2021 20:09:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2062:74c9:d9c8:4e75? ([2601:646:9200:a0f0:2062:74c9:d9c8:4e75])
        by smtp.gmail.com with ESMTPSA id gz12sm948227pjb.33.2021.03.15.20.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 20:09:23 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-pastedeploy: Add recipe
To: DPringle@digi.com, openembedded-devel@lists.openembedded.org
Cc: Devon Pringle <devon.pringle@digi.com>
References: <20210316015826.1941336-1-DPringle@digi.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8ddd144d-8805-ddea-dc2c-6a4d0024544c@gmail.com>
Date: Mon, 15 Mar 2021 20:09:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316015826.1941336-1-DPringle@digi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks Devon

Could you also add it to packagegroup-meta-python.bb as well ?

On 3/15/21 6:58 PM, Devon Pringle via lists.openembedded.org wrote:
> From: Devon Pringle <devon.pringle@digi.com>
> 
> ---
>   .../python/python3-pastedeploy_2.0.1.bb       | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> new file mode 100644
> index 000000000..b7c8c61d2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Load, configure, and compose WSGI applications and servers"
> +HOMEPAGE = "https://pylonsproject.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
> +
> +inherit pypi
> +PYPI_PACKAGE = "PasteDeploy"
> +SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
> +SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
> +SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
> +
> +S = "${WORKDIR}/PasteDeploy-${PV}"
> +
> +inherit setuptools3
> +
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?= "paste docs"
> +PACKAGECONFIG[paste] = ",,,python3-paste"
> +PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
> +
> +DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
> +RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
> +
> +# PyPI tarball is missing license.txt
> +# We will need to keep retrieving this from the online repository until version 2.1.0
> +SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
> \ No newline at end of file
> 
> 
> 
> 
> 
