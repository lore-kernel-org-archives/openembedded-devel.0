Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52E2C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 14:10:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.9975.1634220631867127508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f0dQLLjD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id y1so4252906plk.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=FfLycUIeIZB8TUf8sOWvy7wbDVahs0+kvLPnz5gUpfQ=;
        b=f0dQLLjD5TUB8en8IWhaK7pxbjzxGps2mSZtrJvHgaJRVPQheg5pBpgREejB6z/0qB
         UTbQTHDOM5Jx8PpVeEHcSOlNCguU4IXco1q6AFDvkjwqK1IOK3XspXS0y893jKZZFxQ5
         K9510zHLR0bw2mpJkU5+lwRCy3WtakcdtlyLx5rBtmGv/qhsczHK8tXnGiVERDbEAyKR
         rxR8fsYco89xxvLzZ30S5/nJnIJLC6P5pb6073ITaIihBkZUxLpEGrbmcABtgu4HkChY
         racRcS0K2SmAdxYwqjSaer2mEd15i/NyUWkgRs5yjaoThmoTWEWLfJJrSG2sDSBBBMLP
         eT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=FfLycUIeIZB8TUf8sOWvy7wbDVahs0+kvLPnz5gUpfQ=;
        b=SM/O+jV/DxD/ytEgNhDnb75uE6X0UCZ1d+0jr3PIOHLXAX6j31qwXW/4MjzPFmnX8+
         fLA/au5snCbO7jlyrMMAbQ/E0ReaIIDbWnC7OjR9ZXkUHEOUa8r5TI7UtCncDEU0lnGU
         r0pV5zLtBVOWngm3jxyGnKS0OLwfoAHr13oSjQrZWqn9Nb5pZbERO6zUWUNdlnP2g+kE
         ZMTkgDwOv2ZFe0AC5Vm0bJeS8VzQKmxHzWTty/1tO6wrRWai0stA8/mQh/WX3z8zmPah
         5J4RvvCHLJ++jJ4CUFL3skxN3DDr87I00i8XFzJ8gC+3tSsVm3o+k8+GV7vuB/074rI3
         md7Q==
X-Gm-Message-State: AOAM533CbDHNcpShU/DnmEj3X7GgxZKpyNF52ogFObkZBPy6ParHxuQA
	VckWSZGm0+11ny4sL/3EKE0=
X-Google-Smtp-Source: 
 ABdhPJwLgtE6s6uFn6KGSIij/Uk1U3zQpjquden51V+qyPzdhOPu/DAyFO6MnitovYF/dKQu07O9kg==
X-Received: by 2002:a17:90b:38d0:: with SMTP id
 nn16mr6358733pjb.96.1634220631025;
        Thu, 14 Oct 2021 07:10:31 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f921:a382:258b:3024?
 ([2601:646:9200:a0f0:f921:a382:258b:3024])
        by smtp.gmail.com with ESMTPSA id
 t14sm8882727pjl.10.2021.10.14.07.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 07:10:30 -0700 (PDT)
Message-ID: <fe840207-5737-a9d4-abba-b5eb5ec25360@gmail.com>
Date: Thu, 14 Oct 2021 07:10:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-anyjson: remove recipe
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20211014125903.1348112-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211014125903.1348112-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 14:10:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93297

Hi Oleksandr

I have sent a fix to make it work with latest setuptools I would think 
we can keep it for now. This seems a popular package still looking at 
https://snyk.io/advisor/python/anyjson

On 10/14/21 5:59 AM, Oleksandr Kravchuk wrote:
> The package has not been maintained for almost 10 years now and project
> page is down.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../python/python3-anyjson_0.3.3.bb           | 27 -------------------
>   1 file changed, 27 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
> deleted file mode 100644
> index 07cc99860..000000000
> --- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Wraps the best available JSON implementation available in a common interface"
> -DESCRIPTION = "Anyjson loads whichever is the fastest JSON module installed and  \
> -provides a uniform API regardless of which JSON implementation is used."
> -HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
> -
> -inherit pypi setuptools3 ptest
> -
> -SRC_URI += " \
> -	file://run-ptest \
> -"
> -
> -RDEPENDS:${PN}-ptest += " \
> -	${PYTHON_PN}-pytest \
> -	${PYTHON_PN}-nose \
> -"
> -
> -do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/tests
> -	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> -
> -SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
> -SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> -
> -RDEPENDS:${PN} += "${PYTHON_PN}-simplejson"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93293): https://lists.openembedded.org/g/openembedded-devel/message/93293
> Mute This Topic: https://lists.openembedded.org/mt/86311620/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

