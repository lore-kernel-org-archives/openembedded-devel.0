Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8562AC433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 18:35:53 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.34547.1636310152952148465
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fH/4ODtw;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso7094756pjo.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ZUXiiJnyUAbQyVc8QhaHvD7xjtaMvAjPICtrPtwA4mk=;
        b=fH/4ODtwi7C3EhBM5rSFmGNFgMGfsBaptY/asICQTe0FtfAo4ZHDiYcaCgD+YFpvOp
         LzzJxZrjsuCNyYs1RpGzI6vSuTVrUJUmsJ0p8oyfyhhtY82KyZBAVbQGTwrHkRPVA4N+
         M6pR6Rco+JpXY+wsOQNf9wgGDVEAkqeJHS+0D4AX/vzGG5P6DuLvwz1wzlzVTj6TGKbj
         RZEzlq7EqJ+D+zY9Dp3xHaS5tWVa2yA21D2XF68ur4f2g+vBJQV/hUwsIFIq7YLz73CE
         oE+/+1I3WLca35cVzhEcfXUixKcqaDr5QUd7AGydt7a1W/sZBuB/aqJeNDbh1/JDwCuH
         lAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZUXiiJnyUAbQyVc8QhaHvD7xjtaMvAjPICtrPtwA4mk=;
        b=PtHMDeM14oWmVWRxU1c3m5bkJ9uxL1qZc5Wvk3b+0FEU5hXqjrGL1Mbxr+oLerwf+W
         l9/nqzcK9GzRZ5/F0Dtiug80K3sF96hIkrFlJ9Xhj/mFdt2qRTjCzvHqfOaKABLSFBXJ
         rZXW7f5ziTWoD+gfBJVtI50UtyjRx4QCBgQgxZLTthJgRAJqjfwE0g8HNtO+x16oaAkt
         R5SgUvE08ErD8iX9rScfTJ+ajeIEbr5gE5+buq9tQSEOhSllbAG9ZVqbyiusc9o8c0K4
         BDGvbJvgPOQwPhIKakGQQ3K+l+XvFNQ4iMCN2luA1w0qD5DCsmhtxeOYOBHdU+w2i05D
         aRJw==
X-Gm-Message-State: AOAM532UyNgDc0qH7F05JA4zig9c9m4pi70wOEU3j+8NWnzxwuezWlpQ
	nrtQOXF6pajV/71Q8Z4aMfnUZQAfLWU=
X-Google-Smtp-Source: 
 ABdhPJxrjLzTkk0Nxpk81PHizCTXf5PNUGuqccp8Cip4rHzxq4hOFfu0CL/6Kwkcqj9wKBOTk/QRHQ==
X-Received: by 2002:a17:902:8302:b0:142:66e7:ed6d with SMTP id
 bd2-20020a170902830200b0014266e7ed6dmr9178724plb.83.1636310152239;
        Sun, 07 Nov 2021 10:35:52 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:91fe:57b9:7728:4c4e?
 ([2601:202:4180:a5c0:91fe:57b9:7728:4c4e])
        by smtp.gmail.com with ESMTPSA id
 l6sm14387457pfc.126.2021.11.07.10.35.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 10:35:51 -0800 (PST)
Subject: Re: [oe] [meta-oe][honister][PATCH] recipes: remove tabs and spaces
 in SRC_URI
To: openembedded-devel@lists.openembedded.org
References: <16B5090ECB43B6CF.453@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2316f48e-9935-13d4-1724-e23c200e1cc9@gmail.com>
Date: Sun, 7 Nov 2021 10:35:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16B5090ECB43B6CF.453@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Nov 2021 18:35:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93866

found a typo. v2 will be sent

-armin

On 11/6/21 11:39 AM, Armin Kuster via lists.openembedded.org wrote:
> Missed tabs and spaces in the SRC_URI during
> 'Update SRC_URI branch and protocols' translation.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb         | 2 +-
>  meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
>  meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb                 | 2 +-
>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> index 6ba58829e3..37d5d81238 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
>  PV = "20210324.2+git${SRCPV}"
>  SRCREV = "278e0a071885a22dcd2fd1b5576cc44757299343"
>  BRANCH = "lts_2021_03_24"
> -SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}        ;protocol=https \
> +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
>             file://0001-absl-always-use-asm-sgidefs.h.patch             \
>             file://0002-Remove-maes-option-from-cross-compilation.patch \
>             file://abseil-ppc-fixes.patch \
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> index cbc7a9a5eb..2c9e45fce7 100644
> --- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> @@ -3,7 +3,7 @@ LICENSE = "GPLv2"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master ;protocol=https"
> +SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
>  SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
>  PV = "1.3"
>  
> diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> index 688c63d14a..84f6c3ce24 100644
> --- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> +++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
>  
>  SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
> -SRC_URI = "git://github.com/billfarrow/pcimem.git ;branch=master;protocol=https"
> +SRC_URI = "git://github.com/billfarrow/pcimem.git;branch=master;protocol=https"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index 1b41732ecd..93493c3c3f 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
>  
>  BASE_PV := "${PV}"
>  PV .= "_25"
> -SRC_URI = "git://github.com/ImageMagick/ImageMagick.git ;branch=master;protocol=https"
> +SRC_URI = "git://github.com/ImageMagick/ImageMagic.gitk;branch=master;protocol=https"
>  SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
>  
>  S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93860): https://lists.openembedded.org/g/openembedded-devel/message/93860
> Mute This Topic: https://lists.openembedded.org/mt/86869080/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


