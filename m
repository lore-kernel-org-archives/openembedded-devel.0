Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0867C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:39:26 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.8569.1658500761318862768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VeIzg0pb;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id l3so3736888qkl.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=G+wTRFoB3nWYhcKyVRJKFAtD2K1Sjp/+vJDdsrqudNQ=;
        b=VeIzg0pbrPZ2X21KQCgPR720qzwqxsO9BerVkLo72MkpFQQhzvFCcsjjXEInEPEsMI
         CgsiZBTaLKDRAdAWQ98EPKWI64S1zGNW+Ixoschr/F0K9CMvRNWp8nN4A38gSA/Vfufj
         8KzHLd9icY+T8t0NsIrB9LTsy+qHd4iX8fhrnh8ebOMCwtP/QCqVNMEzjxGMLaY6+aFu
         2Nbv7XTO/CcmkX9emUAsZMyPkJ8ffEX7O135qUomHr8+Z5WMl+geTQ3Y0tHuSpqEuY8J
         bg0lpOKhZpx4M7y5Dyjj3zbAindtrVT2aX4Jp0L5PfzKtzru3lrDl6VXnT4f1v9NkeM9
         WRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=G+wTRFoB3nWYhcKyVRJKFAtD2K1Sjp/+vJDdsrqudNQ=;
        b=P80IVH15R9+qOAyJMWJNT6gmmlCngFqgAolSk/6h2XXWZifeOPRazqkF/UxoMhETX6
         urY3kh70bYfQzZWp90LQ08BVBHZYgbudWy+oyL03gwAZvIf7batmdEUD8rf+etWenI0W
         bA8UCIF3GNMWBfjk/1BrhMWEtmGQJWfTuObFucCgBwV1vKuoLJBKtCIupOGp0uAAfFWN
         taKZU8gpTUj6NzLsE0WzhHhirBlTLfktpJo3UeGwpXnX0I706OE5mvNjQ2tvD2elWCjZ
         JnVkXbdd/9w8IdDqu14rXVrAsThR5otLkLKBksbNCcOYADhDlviSR9k0ENcfSCJ8I5bt
         9FWA==
X-Gm-Message-State: AJIora+FlHem1551mXkF/oPH4Pch+O2vVW6/IWIJYocCjS+XKAsDBLnd
	61YxG5aJNIrsOeEnabKNrKsyOg0r4nWDJQ==
X-Google-Smtp-Source: 
 AGRyM1s+b1FxD97R8k22hCkZs0cfyzuHO9+jfi+tkuBarlHHEQuiJ1OIOrTJJNBQrwKv57F6DW6wDQ==
X-Received: by 2002:ae9:f307:0:b0:6b5:bf6c:bd23 with SMTP id
 p7-20020ae9f307000000b006b5bf6cbd23mr181321qkg.168.1658500760295;
        Fri, 22 Jul 2022 07:39:20 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e?
 ([2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e])
        by smtp.gmail.com with ESMTPSA id
 x7-20020ac87007000000b0031636caa40bsm3107084qtm.65.2022.07.22.07.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 07:39:19 -0700 (PDT)
Message-ID: <2518130a-41e8-529c-13ef-341a58c7f8d3@gmail.com>
Date: Fri, 22 Jul 2022 10:39:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [oe] [meta-oe][PATCH] libwebsockets: update to version 4.3.2
To: Radovan Scasny <radovan.scasny@siemens.com>,
 openembedded-devel@lists.openembedded.org
References: <20220722134305.3700-1-radovan.scasny@siemens.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220722134305.3700-1-radovan.scasny@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 14:39:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97952



On 7/22/22 9:43 AM, Radovan Scasny wrote:
> Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
> ---
>   .../{libwebsockets_4.2.2.bb => libwebsockets_4.3.2.bb}      | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.2.2.bb => libwebsockets_4.3.2.bb} (93%)
> 
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
> rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
> index 2a3a4ebd06..21297f2c4e 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
> @@ -1,13 +1,13 @@
>   SUMMARY = "Canonical libwebsockets.org websocket library"
>   HOMEPAGE = "https://libwebsockets.org/"
>   LICENSE = "MIT & Zlib & BSD-3-Clause & Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c8bea43a2eb5d713c338819a0be07797"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=382bfdf329e774859fd401eaf850d29b"

what enforced the checksum change ? Can you add this information to 
commit message as well ?

>   
>   DEPENDS = "zlib"
>   
>   S = "${WORKDIR}/git"
> -SRCREV = "8d605f0649ed1ab6d27a443c7688598ea21fdb75"
> -SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable"
> +SRCREV = "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
> +SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97947): https://lists.openembedded.org/g/openembedded-devel/message/97947
> Mute This Topic: https://lists.openembedded.org/mt/92547660/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

