Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.11239.1626097499317306004
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N0eznXj4;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id v7so18295939pgl.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jul 2021 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=XZ8Qsq7NqEFFO4ZWWe7XrAbbWOTi0EXzna/65Xp5cmo=;
        b=N0eznXj4Gon48HF7giaE6X8Gv4BUHRAJKEJ1Gtu8c3Zj0SZjcsrYgBmIExQfXg3H3F
         AEbBEbroBNBpxvaUgzWSk93shxYTs4jtgdakvM5OeJJHoAMsWZaqY4mqFLil955DV/L4
         UvgBcr3cyTRBQJT0fXOV5SytOEcCTy6cqyfI76oaT3HLUQQyd+AuKfeb9XfiNPZ7+Ypt
         3K6z6NRu1nbtjE31U5nkpHGOqh3ho8/ufJSP0gUe+n+qCmlLpvoQHQo2H019c2FWtste
         JO3h+M32MyOC8wpL1cXRlhu5K+9t8j6ZKx5Kam8pJz9xoheRhlCwmWhZCwStqHSuQOKq
         70Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XZ8Qsq7NqEFFO4ZWWe7XrAbbWOTi0EXzna/65Xp5cmo=;
        b=gtYfglb0Ce8kFCTBJy1regfLAJK3l+d3vh4KqCOxU7JUu04rYZW6BOnCx4Lc1tzKWt
         DE4gkpk/mYzMk+hG4lDDmK32Imb/i4ytCCgdJ60XhryRaatqEJ4W2INo7hEvVBQLuO2W
         ukyADxsn69CM6mgFGkW2nukwF5AwvlVVIpQzMo6YUQ6WfCljDTB/sIIkQmsfqu+v2nLG
         SBKdOsL8TqulTDLc2FEtxLf5JJplopU20TFlJL3FacUT8GnCpxWTG37JFSObRGFPPSaD
         Ub3yoGSwDbUIA2pRMHjg7ZchDQhkDubRw9Skhu2yB+Plmqqp9H2X8Oipnj1f9SbgEK3L
         BsIA==
X-Gm-Message-State: AOAM533lbSmvnr/yswtQKpW5GEJ/P+qTDqlcYYvQfbxqXMim1l1pUiL4
	hVY/Xky3Vl24hgclsKWGE/ZcZ3eDQR/A9A==
X-Google-Smtp-Source: ABdhPJwNZlE+01rj9bCN/fZcuOxBe6QdbkigQ5eTD0JuQK2kSYO3Md8gWZ9g/TSm11SEHQC9c1ndgQ==
X-Received: by 2002:a05:6a00:168a:b029:2fb:6bb0:aba with SMTP id k10-20020a056a00168ab02902fb6bb00abamr54106194pfc.32.1626097498430;
        Mon, 12 Jul 2021 06:44:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:47a9:e029:ea8:ce68? ([2601:202:4180:a5c0:47a9:e029:ea8:ce68])
        by smtp.gmail.com with ESMTPSA id 131sm16330896pfb.164.2021.07.12.06.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 06:44:58 -0700 (PDT)
Subject: Re: [meta-networking][dunfell][PATCH 0/2] ufw: Backport 0.36, update module RRECOMMENDS
To: Jate Sujjavanich <jatedev@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <cover.1626055148.git.jatedev@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <a7901ba7-29c6-507b-3cc4-2be2fc8e1016@gmail.com>
Date: Mon, 12 Jul 2021 06:44:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1626055148.git.jatedev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/11/21 7:08 PM, Jate Sujjavanich wrote:
> Backport ufw 0.36 to dunfell and update kernel module RRECOMMENDS for
> linux-yocto 5.4 in dunfell poky.
This update, is it bug fix only ?

-armin
>
> The following changes since commit c38d2a74f762a792046f3d3c377827b08aade513:
>
>   dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45 -0700)
>
> are available in the Git repository at:
>
>   git://github.com/jatedev/meta-openembedded pr-dunfell-ufw-0.36
>   https://github.com/jatedev/meta-openembedded/tree/pr-dunfell-ufw-0.36
>
> Jate Sujjavanich (2):
>   ufw: bump version to 0.36 and add services
>   ufw: update RRECOMMENDS for linux-yocto 5.4
>
>  .../ufw/ufw/0001-optimize-boot.patch          |  37 ++++--
>  ...option-to-specify-iptables-location.patch} |  41 +++---
>  .../ufw/ufw/0002-lp1044361.patch              | 118 ------------------
>  .../ufw/ufw/0003-fix-typeerror-on-error.patch |  20 ---
>  .../0003-only-make-one-reference-to-env.patch |  73 +++++++++++
>  .../ufw/ufw/0004-lp1039729.patch              |  40 ------
>  .../ufw/ufw/0005-lp1191197.patch              |  32 -----
>  ...setup-only-make-one-reference-to-env.patch |  77 ------------
>  .../recipes-connectivity/ufw/ufw_0.33.bb      |  59 ---------
>  .../recipes-connectivity/ufw/ufw_0.36.bb      |  90 +++++++++++++
>  10 files changed, 209 insertions(+), 378 deletions(-)
>  rename meta-networking/recipes-connectivity/ufw/ufw/{setup-add-an-option-to-specify-iptables-location.patch => 0002-add-an-option-to-specify-iptables-location.patch} (87%)
>  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
>  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
>  create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
>  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
>  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
>  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
>  delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
>  create mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
>

