Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68086C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 13:40:39 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.40742.1658238033170075100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 06:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NjtnnBfg;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id r2so11024072qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=sBnB1DeumkuKi4VD71Pg097oEsVWIaSKXzB78kXdtDc=;
        b=NjtnnBfg+K5ca1gBuhxCILNAd4qm6c3KmWEep3NDMw08aK7Lzo3Sh0/QnHT9V8RKxN
         4fdjdhrIUWZXicoDAW7SazE02h5Uwnf2189bwYUUWrfK1LWFzXeqMAiayLPB6gsT2Uka
         SwfsVz4SjJPwkl4za7adpn5Xw3+ucMlYJ8TaMM9+kVAZmgtm8Um/YZjA0M+nj+6lUXXW
         CXKKusBWPZOB3poxgTqFHxRMj9LXzsv0Dj9oPtrsT0rR/QAnrWc+TkKUrSNvbO5O9gxL
         iEbCJD7eaIBvraV7GAJoSR//50J4td5v64HTUywQ4JNNX+T2zHmercOgbVYyVy4eeaVp
         PCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sBnB1DeumkuKi4VD71Pg097oEsVWIaSKXzB78kXdtDc=;
        b=zQrSe+rDspIGj7CSwQaOQ7u7BHN0Ge0OvuK24E044V1n++NFwnLHGRX2dwLCDor9QB
         1HlUmokEN3Z8Vgbwcm65lbkV9vV47V/5SVncRMcxMzs/dbWzbuWfPCe4C8ZlCuZwG8ET
         VSPFPJ4HEBd0b8FMWVjt40dzFIgn+PSl0aTDIRctwemqCtfZea+r+Jesa9mDC0QdJFri
         Xem+QFNZvCeabKaESBgcBuA81ZGCeouZRBEcnnam1vhlwVeeBronYVVjWpuCOCruonKr
         BEVEm6+6E44BqA2Om28WsKCKXWbFpLMnj0zIQ6brQR/GS2QrabCSMVMwowncOQmofx5p
         4JPg==
X-Gm-Message-State: AJIora+7jmk5jBcKfLAZvyhmBw0cn+1tTe2IbskRQBzOUSfGCw7q+qnj
	hSCTOk7rkHhjd5ioHQ/yfJuBLiqUvMlM8g==
X-Google-Smtp-Source: 
 AGRyM1uOOCirCy7TCRVeyyMVzyyE6Tfgzly9ZR+ejbzzTgZVp9bWZeK4aQbWvJ/WY2eq0NKN5PVzSA==
X-Received: by 2002:ac8:4e49:0:b0:31e:b3e1:4478 with SMTP id
 e9-20020ac84e49000000b0031eb3e14478mr24897664qtw.97.1658238032186;
        Tue, 19 Jul 2022 06:40:32 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e?
 ([2607:fea8:95df:9730:a90f:7fcf:f7e0:a30e])
        by smtp.gmail.com with ESMTPSA id
 d66-20020ae9ef45000000b006b5683ee311sm13185556qkg.100.2022.07.19.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 06:40:31 -0700 (PDT)
Message-ID: <3a331d56-ee77-c023-b0f9-2a96bae3098b@gmail.com>
Date: Tue, 19 Jul 2022 09:40:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -> 1.3.24
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
 <1658211328-2951-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1658211328-2951-4-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 13:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97900



On 7/19/22 2:15 AM, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../logcheck/{logcheck_1.3.23.bb => logcheck_1.3.24.bb}       | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>   rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.23.bb => logcheck_1.3.24.bb} (96%)
> 
> diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
> similarity index 96%
> rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
> rename to meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
> index b40d52ab94..ea3dd5a4c9 100644
> --- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
> +++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
> @@ -14,9 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
>   SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
>              file://99_logcheck \
>   "
> -SRC_URI[sha256sum] = "a2188ba549fff4412c82074b271884ff66d25f3fdb2a41916e817ce676855b29"
> -
> -S = "${WORKDIR}/${BPN}"

S is not needed to be set here anymore ? Is this change documented 
somewhere

> +SRC_URI[sha256sum] = "5e304adf2880967c3b155bcf98e4f0809417a16bf91adb372fa065f38ab2c0cf"
>   
>   inherit useradd
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97894): https://lists.openembedded.org/g/openembedded-devel/message/97894
> Mute This Topic: https://lists.openembedded.org/mt/92477643/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

