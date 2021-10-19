Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB98C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:09:29 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.11110.1634656168786287683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R+YVZF7s;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so98763pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=COIMXU99iw6PtNT7n+EBU8q8P67ZvPdfd4gKLJ7QoxQ=;
        b=R+YVZF7ssQxJENYvnrKybfu9F9PXcBzGgSVPG7KO9vkf+DXOG/F2yiRAuJJiHQ04zG
         xLq5nVOKQ2+oFoaogwZJ0w2ldItOItXmP1CGtZIsdIDazxciH0pW64iKmJVjJ13gdEs+
         oOV82VgbLv3oI0IFMN7M+sbQEyzHomv18bRE3jz09eMC/NM9FyP/Ls+jnvc7cuMX+vS9
         iFb+4ZMInRdAEys6eJsx/3zZ3QAWjX+vaZ+CJ/OzlYtxp6FaHTRi2hI1fapyFvDXKrbJ
         QU0SL+7ha9ybHY062HqBKTLmdI6b45CuhaUCP9WyTMmLbZl5jTlVMXzf95K5XeGnlS67
         jNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=COIMXU99iw6PtNT7n+EBU8q8P67ZvPdfd4gKLJ7QoxQ=;
        b=HNoZaYTJQ9fCIhz5A6fU1MgvrldfzTv5uf43BDEyEcVnSHTZCosAHNDujDP+nbXWf3
         679pkGTjAQEn2D63EHBPlJsoWoMjRytqRf3hYSD4C5LZSUNlkBjP3qNroRiqE1qLgRRJ
         BNIdCXTs9tQFfFXNnxvSNEkVN+ZPr1pX+JT32zLG6DTzqbU1c2JTwir46o6s/fbvOzzj
         jbOx46/Mzvyu6NHU3jqnjKxtZwpU3wj6bFZx9udv99gJsWoYej/BNS9LN3nI6txNsJKw
         7iU3Xu3afzs3a5ghu1H6JYtFdP4Dxiy+DOImPxPcDNfpIBU4yRiPFw/vRshmTIqXDJYj
         ofkQ==
X-Gm-Message-State: AOAM53133h+dB8olDh118xBz7smkEi5nS+FJlpgmeMume1LMde996SEA
	5Tn/JZZk9BOijq+02B7uurHQ4bD7Wmo=
X-Google-Smtp-Source: 
 ABdhPJzTnX91LzNlBKCmnhuLY1qEOC9aNNsNXPU3Bc8h9rOQMS8e5pVEDrGhu92ohskvCoXzEtCn3Q==
X-Received: by 2002:a17:902:8d8b:b0:138:e09d:d901 with SMTP id
 v11-20020a1709028d8b00b00138e09dd901mr34488003plo.34.1634656168111;
        Tue, 19 Oct 2021 08:09:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:677f:e53b:886f:cd0?
 ([2601:202:4180:a5c0:677f:e53b:886f:cd0])
        by smtp.gmail.com with ESMTPSA id
 x31sm16579347pfu.40.2021.10.19.08.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:09:27 -0700 (PDT)
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
 upgrade to 2021.8.22
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20211019045923.51357-1-Qi.Chen@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
Date: Tue, 19 Oct 2021 08:09:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019045923.51357-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 15:09:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93467



On 10/18/21 9:59 PM, Chen Qi wrote:
> This upgrade revolves a bunch of CVEs. See more details in:
> https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp.
Seems reasonable to me.

-armin
>
> These CVEs cannot be reolved one by one. Upgrading the package
> is the only reasonable way.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2017.3.23.bb => ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)
>
> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
> similarity index 92%
> rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
> rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
> index 6f5cb6cee..19b2d6ca2 100644
> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
> @@ -10,8 +10,8 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
>             file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
>  "
>  S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> -SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
> -SRC_URI[sha256sum] = "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
> +SRC_URI[md5sum] = "90da343e78877d388eb34cefae6799ae"
> +SRC_URI[sha256sum] = "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
>  
>  UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
>  UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93456): https://lists.openembedded.org/g/openembedded-devel/message/93456
> Mute This Topic: https://lists.openembedded.org/mt/86433129/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


