Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B684FD5332
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:04:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92582.1772186647522888889
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKor48K4;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso16275385e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 02:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772186646; x=1772791446; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vIkb1OuGD2/V6GeVGEq+K0b2Y4fRjPwHz2ABia9Uc8=;
        b=KKor48K45m8+AwmDyQsPYbR/U4IKEFiMZ/fLGkamz+RKWWe45IKrwBMRSuOVBmPq7A
         c2P8Ivvg29U4QdRNWFmPmiQ3gqJapOEys6jCOC3fynm+OJcAmsnYHHAIJOr/SCcnpDyy
         KCw3McadsuVy2ve8DN5J/Gdvz2zKR9DEANwfW1UCHivxwmJFvhgA8AVzEmw34qdiW5zg
         3yFY6BfEJ6ZiqsGrvWA+rYlbsKpK2sucdyCaVgYbsRneBaZohaPMzOpEzez++eaQoO4s
         K6Crnk0geKqv3W9p7QbLL4x3bbG583WrHyQT1CyddXfvqmlafGGSgbxLNN7QC7if7DOY
         sh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772186646; x=1772791446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vIkb1OuGD2/V6GeVGEq+K0b2Y4fRjPwHz2ABia9Uc8=;
        b=Vce1iiWK3yyJhrPSfSrraYSjFDYOhLXFfJ1Yft1DlOGY8hqbEJhFmc9W+uIDTNky/2
         iRBKCMIAMIb8Nzy6swel9QFMq3RwvcG/74vqxBW7EJi5JTLuxlp8MNAZgWtUz9c3gXUF
         4iYJcVwKFBxxXITCuY2PtmJhTo3HBVeKoDgByNZHUVcduDgUHNRzkX8WjafpNr4SiOzu
         fjkvPsEy07XJ0hd5reyuKyIbH5cc3fHMbfrdtYV0bgVlc9aBH78LPbfbZAZDM6DCaarz
         fpUf2NB7YI8rB73x6lLiKi2RFKLCxCJJRmDCpcfB19+BYANY4s2HiaMgjjRb8h7WYAFS
         uLLA==
X-Forwarded-Encrypted: i=1; AJvYcCWzSHeVioZyZseLfxyuUa7d9afrJzn4w/OZYgQaMctoGMAY9WRAvAq9MeoUktF28eLfy1BGqLIIdmf752fKAUPOark=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCnEuBT3mbZMOycYUMpoOsAHD98jXhbvnR0T2oNecCCZz5eGKj
	96Z/dzpxR7qd7jh0AxFLPQPuRtIuafQ8YLo9cqWHCLA24hgrfFbhjamQ
X-Gm-Gg: ATEYQzxXg2wVWLV1cYgo5933xTZMyGu266E1xuZrurIs3nTiqthm2+eM2SZwCGEmsha
	jSxe/hA+ZlxvaQ1VepasKxPCHcHrk6SWl1goq0Lb28U20d/ssafG00P/dKHw7N0+CKHL7cEkdgL
	o+CmxR083z10n3u/2l1LTlPAAePiSXA+MstI1M1nTQHS1Zrf6ORA9vS3sf8wF6Z2sj3C3WnXlqG
	q9cP4sfGjcy+42MbHLafOnsCjT8SLAkFEYSi87ebc2YS2ApmeSEWSl1SS83BddDV1BbutqxfNtr
	hq6m3h9OxH4W6k/RoDuHdA05RLF+opCc2AS+eMm/tdv+hKwQ8/HMvT8Kn1TtcKVCabXgwr3sCly
	np1LmsKR/aTlCLmIH5gjCbB0w0cIrglK2Nxq2rOsjDApSigidvNwOdnYqETLpqvBbQ8oNwYNjw4
	UOIDR3ZUftQYbWUNAt0fYVvS0+g6Nm278=
X-Received: by 2002:a05:600c:b90:b0:483:abeb:7a5c with SMTP id 5b1f17b1804b1-483c9bdb600mr33767925e9.12.1772186645493;
        Fri, 27 Feb 2026 02:04:05 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm134106955e9.3.2026.02.27.02.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:04:04 -0800 (PST)
Message-ID: <adb8bb29-8772-4706-9362-75f6c4d61128@gmail.com>
Date: Fri, 27 Feb 2026 11:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-selinux] [PATCH v1] selinux_common: Correct
 `CVE_PRODUCT` value
To: hetpat@cisco.com, openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, vchavda@cisco.com
References: <20260227051048.3950-1-hetpat@cisco.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260227051048.3950-1-hetpat@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124700

I think this should go to yocto-patches@lists.yoctoproject.org,
otherwise it will get lost most likely. See
https://git.yoctoproject.org/meta-selinux/tree/MAINTAINERS

On 2/27/26 06:10, Het Patel via lists.openembedded.org wrote:
> From: Het Patel <hetpat@cisco.com>
>
> The current `CVE_PRODUCT` value (`kernel:selinux`) is incorrect for
> this recipe.
>
> Root Cause Analysis:
> `CVE-2020-10751` is reported against the `kernel:selinux` CPE, and
> its fix (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb73974172ff)
> applies to the Linux kernel source tree. This change is unrelated to
> the source code used by this recipe.
>
> Change Justification:
> `CVE-2021-36084` is reported against the `selinux_project:selinux`
> CPE. Its fix (https://github.com/SELinuxProject/selinux/commit/f34d3d30c832)
> directly applies to the SELinux source repository used by this recipe,
> confirming the vulnerability is applicable to this product.
>
> Based on this analysis, `CVE_PRODUCT` has been updated to the
> correct value: `selinux_project:selinux`
>
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  recipes-security/selinux/selinux_common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-security/selinux/selinux_common.inc b/recipes-security/selinux/selinux_common.inc
> index a7f704d..aaf0b90 100644
> --- a/recipes-security/selinux/selinux_common.inc
> +++ b/recipes-security/selinux/selinux_common.inc
> @@ -20,4 +20,4 @@ do_install() {
>          SHLIBDIR="${base_libdir}"
>  }
>  
> -CVE_PRODUCT ?= "kernel:selinux"
> +CVE_PRODUCT ?= "selinux_project:selinux"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124691): https://lists.openembedded.org/g/openembedded-devel/message/124691
> Mute This Topic: https://lists.openembedded.org/mt/118026141/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


