Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web12.16656.1585155556188332810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 09:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ak1z15zd;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id a24so2372891iol.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 09:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=M7962wU6/XLf1qIQ2uQFN71se3+ePtrVTWCgWjx/6vo=;
        b=ak1z15zd6yjs7/BwpIQ1/w0ZEkYuPi2dw4nNNnnVgAdp8M+vwp8QqvhvHMKn3X5TJd
         ylF9cXnNMbs5RUKJUrNEaUBeZn8L/1T9llVOF8U8mjsyGFGL58dYemmJEZAHjNMerU+N
         LJ+CaE6eN8HAHUmtnxmLTxZKBERSwVvFhwBOBQX6ubx1REii7GUDeWc1CGQDdYxUL/6q
         7SABo+SWsK91ZCMx0cO4yGc1sjAYf+SRz8Hwx4nXRuiJ0EqNNx0Hi/2kviI5B0fWbJUz
         IP2UHBJjGGFZka8DOh0tQxzLeWrH4FJzs+SyZXEoKHx7MC03AsjC63D9+KKDo6hEGZbB
         eHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M7962wU6/XLf1qIQ2uQFN71se3+ePtrVTWCgWjx/6vo=;
        b=jziWgWxZYF5h+T6gmZTLXSIm644+EaxNhw8pO+BGyz75DsQVmz3E1oX+mgxHkvfQR3
         W1f8vXuaFPZweCMD5FWeyJx4J4vAhZ/7BkmA1BiCH8JoKNRb6K/AbkKPCtvx1Mwajb7P
         iywf+6f0WEbo8VJMVzR7JaifqbuCSXFOyqwOK36AMEpOkWZngv6nIdKxO558TIdnx8Pl
         fRLnY9T7d6TizJgPXwa6PrbsZ625GKQUTMwjB16ZiMI7bydgAlbiBUVzp5NBGY91tfDy
         Tfl7lnFcIrgzuNcEUWCRzcs+4V+HLu2Mzh3435Cq6oI+6u64f5WvMjePSFQSzv1bSqC4
         I+0g==
X-Gm-Message-State: ANhLgQ0O/jbZV4U67KK4e4PfITzeOxIIvK7WjiWTGddufGhvUzxF9wfX
	0EN6P3GVHzjcPBk7GA0zJj95esrKipQ=
X-Google-Smtp-Source: ADFU+vvF7C9JH+A2AmFdJpgchLQFaPBfeoCrm/mVB0CjeZGXFsMgkVJUhSl29cUjyzEZIf02hYNu7Q==
X-Received: by 2002:a02:b70a:: with SMTP id g10mr3695389jam.45.1585155554440;
        Wed, 25 Mar 2020 09:59:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:6dff:af6f:760e:3a23? ([2601:646:9200:4e0:6dff:af6f:760e:3a23])
        by smtp.gmail.com with ESMTPSA id d70sm7590754ill.57.2020.03.25.09.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 09:59:13 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH v2] python3-pint: upgrade 0.9 -> 0.11
To: Martin Kelly <mkelly@xevo.com>, openembedded-devel@lists.openembedded.org
References: <20200325164838.977493-1-mkelly@xevo.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <a2bc1b96-73b0-8caf-7d3a-e49c1ddd5436@gmail.com>
Date: Wed, 25 Mar 2020 09:59:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325164838.977493-1-mkelly@xevo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/25/20 9:48 AM, Martin Kelly wrote:
> Also add a dependency on python3-setuptools-scm-native to make this
> build with the newer version.
> 

Can you rebase it on master-next please ?

> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>   meta-python/recipes-devtools/python/python-pint.inc         | 6 ++++--
>   .../python/{python3-pint_0.9.bb => python3-pint_0.11.bb}    | 0
>   2 files changed, 4 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb => python3-pint_0.11.bb} (100%)
> 
> diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
> index 0900d91d7..4a9300900 100644
> --- a/meta-python/recipes-devtools/python/python-pint.inc
> +++ b/meta-python/recipes-devtools/python/python-pint.inc
> @@ -9,7 +9,9 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi
>   
> -SRC_URI[md5sum] = "d0681cb7cfaca9fc68ce7edab0d08d88"
> -SRC_URI[sha256sum] = "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
> +SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
> +SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
> +
> +DEPENDS += "python3-setuptools-scm-native"
>   
>   BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
> 
> 
> 
> 
