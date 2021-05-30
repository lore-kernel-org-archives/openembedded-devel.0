Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.33931.1622393768027025146
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eecVKA/f;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d20so3993654pls.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L/ClhbdZZi4Zpr+ph6ZBSJbxJenv8G1p5MxfExxHg94=;
        b=eecVKA/fG0YW6xeEH1MexuGYCU54hMKIksOir6EqBI9bFc0O3Y1fvroemElPMzhxgJ
         rA715QHWiePI3zL+D4zMNY3hlkNxsehyIvyiiQk2HnBGzqo9493pNN75lscbm7Kisb/f
         BZsEypsn048eEcGIBYHsvgzqS5WgTfykR2Iq2VFvGEaBrMRDgRhYDMXxfFkQjbdKncZ5
         SRqs3jLfUbszBExKkgViVm6eRndKKZBBwpPxGF7EsCj8ImTRp1b9bkTlkRrPNS//y0+q
         Y41kB7UKp0w/WxWB7rJw3Cvgz0vva4ouFxOy1afNpbXg9WFtUOsJLxCX/UXiMXhoEz4A
         XnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=L/ClhbdZZi4Zpr+ph6ZBSJbxJenv8G1p5MxfExxHg94=;
        b=UXliqgRuCEMzlwMXqJIS4uGe78e9E8CH0dyx8XVw73+mEQLm/tvQ/+n5JWK36PI1/g
         ZTZmuTjGohmKW82sExdVwZr1i8q/DP3PKx64OWFlendzwqStI/MLS/YYwHVs4gZfVVL8
         VLPhMg9h/3ETOeN7LjsPv5fT/FJG83FheQ7kuLMnWojQVtA/9iE3aA3rPTepRUaFivWa
         Pk5EIbc2/dog+9yPjm8ctL1TPc6FqIwjlRAmpgFy2erT3csHMyd+7kUk3ioWvLSt04vU
         w4Nx4WlgcUyzYJNFcAg/doX5yXryOsso2p2nz28RHWjAiFgzcc/abMYMJ354IDDUn8vt
         tb4Q==
X-Gm-Message-State: AOAM5305oqXU8Pt5Tp1tIsgEF7XlVnIySLPyIiCOVvhV0LmIcz/ji6gp
	/7MNHm1KYxxq3d58QVpjJAEAPSQNhX5aMg==
X-Google-Smtp-Source: ABdhPJzG+ztRyrfZv4xYzKE6kSKC2theyhvd4eui6Eb0DFU1fdsn/SXNe2D2uCld6RQk8yiw7UkKvQ==
X-Received: by 2002:a17:90a:4308:: with SMTP id q8mr14698812pjg.78.1622393767391;
        Sun, 30 May 2021 09:56:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::6bc9? ([2601:646:9200:a0f0::6bc9])
        by smtp.gmail.com with ESMTPSA id f3sm8625216pfd.21.2021.05.30.09.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 09:56:07 -0700 (PDT)
Subject: Re: [oe] [meta-python][v2][PATCH] python3-scapy: drop this recipe
To: Armin Kuster <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210530165040.547348-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <061d412b-55cf-07d8-5be7-9e150fc3aa98@gmail.com>
Date: Sun, 30 May 2021 09:56:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210530165040.547348-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

needs to be removed from 
meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb as well.

On 5/30/21 9:50 AM, Armin Kuster wrote:
> This recipe points to an unmaintained uri
> Switch to the official project.
> Moved package to meta-networking
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../recipes-devtools/python/python3-scapy_0.26.bb   | 13 -------------
>   1 file changed, 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> deleted file mode 100644
> index 31c88942d..000000000
> --- a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "Packet crafting/sending/sniffing, PCAP processing tool,\
> -based on scapy with python3 compatibility"
> -SECTION = "devel/python"
> -HOMEPAGE = "https://github.com/phaethon/scapy"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE = "scapy-python3"
> -
> -SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
> -SRC_URI[sha256sum] = "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
> 
> 
> 
> 
> 
