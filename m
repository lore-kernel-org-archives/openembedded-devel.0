Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573FBC433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 19:18:24 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.1742.1634239103070049476
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RJvzSlvx;
 spf=pass (domain: konsulko.com, ip: 209.85.222.172,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f172.google.com with SMTP id ay35so6435952qkb.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=y39B3BPgt5ZoJkcq0GtmEDNNWS6EnCQRLge8GM41WYs=;
        b=RJvzSlvxbPTNdqPlRR7Ajx4B8ao60f9qm95aki5UGpdF2s7TvhmG4e3o7monqN9kvh
         fNwnL0yFswkG8o8eUNJNSFYYrmtYWk44oqD6zicNc6yhNzLQnxhR0Pc7kadnmKYbHaL4
         8gjT9SGkQlEL1tzGVSbbuG6+MJWcv/4ualcGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=y39B3BPgt5ZoJkcq0GtmEDNNWS6EnCQRLge8GM41WYs=;
        b=dgD5HHC8Z/V7HtQdMuKfxI/hvvOa8Y7jqPfYN/WUYLZ5GX19EluDZEbAlalUIZeOGK
         4hlEPGl/fCWmSBTxAvHsYVCJR3M91gkCtqQ/kxqkl96JEOesSMRwBXvoVsCFVsT5JQI2
         ZWAbxZzH1EK+E5nn98KrNxAuY4L1eU7nbtruPPEAjTyQ0mU/jcnutOa9Zd4KSBhF9CdC
         QrGvYvXrSZvUs4NkkvOrXXFBiJqIhZPJGXW20aVKGaIT9iUDyrI4NvTOYNF9twNks0IX
         80IpuGqhQdSe9uZDV/IwR9obQA6mgPHFKQGkhGErt9x4ejy/MHyeP5iZSIZlZPNuoP2S
         60tQ==
X-Gm-Message-State: AOAM533HQ1pK9YCcrWgOTaxTP4aRK4QVhyAzqjfEd8d6k4Erj9JXw4Zy
	pkEChDZX/x8SuoXjwvxIyow8+g==
X-Google-Smtp-Source: 
 ABdhPJzC3kiPfu3DQ5fvgCG2nx1BtRjEhYP0MAAKtSf/sVyICotxlQfhmiTNct5cz4mhtVOplmshdQ==
X-Received: by 2002:a37:b981:: with SMTP id
 j123mr6397275qkf.445.1634239102135;
        Thu, 14 Oct 2021 12:18:22 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 l7sm1788380qth.81.2021.10.14.12.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 12:18:21 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:18:21 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH] python3-jsmin: update to 3.0.0
In-Reply-To: <20211014124852.1345370-1-open.source@oleksandr-kravchuk.com>
Message-ID: <5f5fff8b-8666-8327-5a3a-bae35b66598e@spiteful.org>
References: <20211014124852.1345370-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 19:18:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93301

On Thu, 14 Oct 2021, Oleksandr Kravchuk wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

This fixes a 2to3 related failure I saw doing an AGL test build with
latest poky + meta-python, so looks good to me:

Tested-by: Scott Murray <scott.murray@konsulko.com>

> ---
>  .../python/{python3-jsmin_2.2.2.bb => python3-jsmin_3.0.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-jsmin_2.2.2.bb => python3-jsmin_3.0.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb b/meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
> index 1a0578edd..7990bb014 100644
> --- a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
> @@ -5,8 +5,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
>
>  inherit setuptools3 pypi ptest
> -SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
> -SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
> +
> +SRC_URI[sha256sum] = "88fc1bd6033a47c5911dbcada7d279c7a8b7ad0841909590f6a742c20c4d2e08"
>
>  BBCLASSEXTEND = "native nativesdk"
>
>

