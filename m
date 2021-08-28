Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.3928.1630160035314632873
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 07:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qZtgJfNy;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id g184so8730010pgc.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Aug 2021 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=1nIN9w83tkurhdLbj5XrEyJDA9sDvUgEvrW5Ttdl0Sg=;
        b=qZtgJfNyTV7hsl0dPfmlmFEBKaiOZEM+9Xz3jD0uMhP8rD6jApoURY6IZBRoG2E86C
         tODod43H6/G6hvF40EF+sihn7457EwfVLXkCjsegc8U3ykPg91nzJs41eV4SqrU/ZBoc
         OZlGQC2rBgz5FCxv0PFtADOqg0RVI3HetfEYSOJ8Hx1xDy1ZTX2WLQwtvNNyo6zu/eIm
         ryXSxRSZjMD58GurjncOZQm34BxRk1agAU3+e9DIgIAMROv+vY5kQ2G7RMRU/LngX9+8
         Bqg5MebqldUlBb/ydqeVhxT/TFKXIDtQxLVksurCuChbrG+LLSNvfEUTF9QHRBCh81lx
         kQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=1nIN9w83tkurhdLbj5XrEyJDA9sDvUgEvrW5Ttdl0Sg=;
        b=qqAc0EVLRpvD4B5MQ31uzGFkMTgENvWWrTPlzBvOizNxusRHhFz13zwvdB1NLxwp2o
         kLswfnJ7kGa5gYcCMuhNoRmeEsckUsBWmzh95F1NT52XhMiEN0UZGrQ/DfBUcrjDDy2z
         xH6EStTqF+oA5o+G0INY3auAQUz/OBuO3lSr955cNqcmxMVpCoLkcTL3dd8liJnmCmXL
         yUgrw/tSF19vDyQ6WfcA1GvXU9WmfJDEtBhjC1HBXuZuw5TViF5cHOCrd2yrEI3yiLYr
         fPZ2RS5nL5TCy0Y4RJ9dMZz3v3Bq9pw9J/8r6pIDrPpaE+B0GWSK4QiY/FJE6eoKLT90
         +7rQ==
X-Gm-Message-State: AOAM532NQPh5734KOBDQI9jhiKBCAboeRl97LeI2smDYHQtB7Nzggbec
	v2ZEDXQToEnqnZ3HW/j6i3j6HoSWdbnmyQ==
X-Google-Smtp-Source: ABdhPJykaLc0OWDdHWOgFICLGZ+NxjYgqxzgUQ7lpFwWZdYKQXWMOrsmvC7ndQfMIwPSnwDlWvN9jA==
X-Received: by 2002:a05:6a00:796:b0:3ed:989b:f0c3 with SMTP id g22-20020a056a00079600b003ed989bf0c3mr14582622pfu.9.1630160034741;
        Sat, 28 Aug 2021 07:13:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id x129sm9830281pfx.198.2021.08.28.07.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 07:13:54 -0700 (PDT)
Message-ID: <841b8c92-8246-b1ca-3b24-10216128ed60@gmail.com>
Date: Sat, 28 Aug 2021 07:13:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pkcs11: Add recipe for version 0.7.0
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>,
 openembedded-devel@lists.openembedded.org
References: <20210828134727.277771-1-vesa.jaaskelainen@vaisala.com>
 <20210828134727.277771-3-vesa.jaaskelainen@vaisala.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210828134727.277771-3-vesa.jaaskelainen@vaisala.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/28/21 6:47 AM, Vesa Jääskeläinen wrote:
> "A high level, “more Pythonic” interface to the PKCS#11 (Cryptoki)
> standard to support HSM and Smartcard devices in Python."
> 

since these are new recipes please add them to packagegroup-meta-python 
as well.

> Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
> ---
>   .../python/python3-pkcs11_0.7.0.bb            | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
> new file mode 100644
> index 000000000..8fe31c9f1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "PKCS#11 (Cryptoki) support for Python"
> +DESCRIPTION = "A high level, “more Pythonic” interface to the PKCS#11 (Cryptoki) standard to support HSM and Smartcard devices in Python."
> +HOMEPAGE = "https://pypi.org/project/python-pkcs11/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://README.rst;beginline=337;endline=358;md5=f68bda54505b4002e6ec86e08125ef79"
> +
> +SRC_URI[md5sum] = "4998d6f038d2997958f2004f482580da"
> +SRC_URI[sha256sum] = "9737e0c24cabb8bc9d48bf8c57c3df2a70f8cdd96b70c50290803286f9e46bf7"
> +
> +PYPI_PACKAGE = "python-pkcs11"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"
> +
> +DEPENDS += " \
> +    python3-cython-native \
> +    python3-setuptools-scm-native \
> +    python3 \
> +"
> +
> +RDEPENDS:${PN} += " \
> +    python3-asn1crypto \
> +    python3-cached-property \
> +"
> 
> 
> 
> 
> 
