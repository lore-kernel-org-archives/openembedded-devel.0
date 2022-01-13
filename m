Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ACCC433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 03:22:39 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4237.1642044158387881549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S8zc5XaP;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso8897232pjg.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=99h6Tl9M3iBUHXflqu/X+yEVFuAxnt5kbWWDdLIPM/I=;
        b=S8zc5XaP+p7Vwh2FfMoWCUY2FKU3dQQsop/d5+uLc47ZqecOF22exGuml9ioxt7RiR
         gaYwW2aL4TKtDSUvQRCrD2GUg3Ywfk3qwkfOI8ZFyC8hxU9aaTlQdFdJslHLN/8t1Dy+
         xEaWDbJKHDZ6+IAS+FdciyAuo7Pd4aigUmmeKHCkeINsrufPhNm0g4eaXbiglIk5r9BG
         7LyivL32+YEeE4QuiLo9kgVfKx6ryZD3TDcZFywvZ4uvPHoBKbKprjerInVNbhFRfdQC
         f0Ce7K6oFywjEij3LRrmid1Yzg1ags6Yk7CxaqHUxAOlHYR5x1CHqqYHlUmBFvCMRwAH
         QASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=99h6Tl9M3iBUHXflqu/X+yEVFuAxnt5kbWWDdLIPM/I=;
        b=Vzz72pHnxo9uXhaUPCsPxqtDDKgTsh1Xq9fD+Tu++Cnum/+ESV0R9/a65TLHxS4t7n
         nrYE8jQfIjfafQCSKL8TngHUIZwGmmqdhqmXdJnTmZ2Br8YvEl8cWiONDall00RwwO7V
         d787ZjkLUXv9fh/lBNR6/4ltKU3ZcursGfaj9+StUzCkzrhGiwQ0r7pzgNcwZGmcw5Kl
         geL3fEvKO/yuE0Q7jrzcprV+80tRfrrbf/LhhnPJik+/FpYSUs2zFZ2j9neQdcJLV+dh
         SdBE+Bp5/ouBvJTvLGc5nkGEHiBccGLaVXmzaN3QfXcZMyhqNShMQ3geS1YLPBy5fG+d
         wTGA==
X-Gm-Message-State: AOAM531zWEXvtjc0hUukllqxnhm69Vy0Mz2h/4hQIBXMLrCV75D2Dch+
	QdhG6iJPBa9A+nWPo3EGb18=
X-Google-Smtp-Source: 
 ABdhPJyAZ6jQmlqVL685VLxlCLJ2TgxMSSMePilleip9sh4uamTiJL+2LJeK8nSr0OmBa1/ZZjN6Yg==
X-Received: by 2002:a63:3d0e:: with SMTP id k14mr2282572pga.484.1642044157711;
        Wed, 12 Jan 2022 19:22:37 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9456:588:8a0:2a7c?
 ([2601:646:9200:a0f0:9456:588:8a0:2a7c])
        by smtp.gmail.com with ESMTPSA id f4sm981504pfj.25.2022.01.12.19.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 19:22:37 -0800 (PST)
Message-ID: <ff2112bd-a860-6156-a6a6-7f0154e97281@gmail.com>
Date: Wed, 12 Jan 2022 19:22:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [oe] [PATCH] python3-prompt-toolkit1: Add latest 1.0 version
Content-Language: en-US
To: Esben Haabendal <esben@geanix.com>,
 openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Andrei Gherzan <andrei.gherzan@huawei.com>
References: 
 <0e2f97993408ba72440a4fa2677b17719a2b141d.1642019865.git.esben.haabendal@huawei.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <0e2f97993408ba72440a4fa2677b17719a2b141d.1642019865.git.esben.haabendal@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 03:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94799



On 1/12/22 12:39 PM, Esben Haabendal wrote:
> From: Esben Haabendal <esben.haabendal@huawei.com>
> 
> Old major version with different API (than 3.0) for use by recipes that is
> still relying on that.
> 
> Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
> ---
>   .../python/python3-prompt-toolkit1_1.0.15.bb  | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
> new file mode 100644
> index 000000000000..a7a9bcf8c269
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit1_1.0.15.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Library for building powerful interactive command lines in Python (version 1.0)"
> +HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
> +
> +SRC_URI[sha256sum] = "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "prompt_toolkit"
> +
> +RDEPENDS:${PN} += " \
> +    ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-terminal \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-wcwidth \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-shell \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 

I am not sure if we should add a version which has been deprecated 
upstream and moreover we dont have any other recipes needing this old 
version, 1.0.15 was released in 2017. Perhaps its better to promote 
folks to migrate to 3.x version.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94797): https://lists.openembedded.org/g/openembedded-devel/message/94797
> Mute This Topic: https://lists.openembedded.org/mt/88382434/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

