Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D073C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 06:37:20 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.8616.1638513438985043957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BtVn1F5l;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v22so2307162qtx.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r2swtzup+UF+bAO9Ss9hW26qY63hCdvucTFJAoV2iug=;
        b=BtVn1F5lIDrEuflkuX+ZyCRWXOBErxrgv20sp94Q/yYTjV5X20Xg7z7WXVDqacahX6
         xvFnbkRe9eob7hptqNKohlnfWXlk3LGDUe2+iv6QrJDmkOdXT0VIHGvqr0TgR0bh8EPM
         3Lou/LsnsGmnkCVvUbHs0GKxBcpEIRk2wPTqMC0+wvnDknyPO86heIaokAy2690DVdK7
         bQcaHnj+uMtp+321HBzFMCFnHsdGMpZcRduzBEJxUdh/M718YDcrMIFbZvc3QOpPZtPt
         Y4xR7iV43sVrvU/Gq6N+9dN3m+UOCUz8zuWkRQIflGSe/GSbVh2IMnx908Y9vmQIuZ03
         fF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r2swtzup+UF+bAO9Ss9hW26qY63hCdvucTFJAoV2iug=;
        b=Z4sUKgmgWRguUYcMe93jIIsXsHXgnuRKa/ZYxq8wgogZ3haaOJ0/awuD1Xmig8YK0n
         TDRxrOfSTr7Fm1F524JGzfHs3n8oy40REuPe7euc671rwjx/7f6MrIqNIgzldHF7YsJ/
         HfonjxR/Ehne165fQ5ro58FtJRBhU4Xnxdf4gxLbNAExKxwYEN1dlapXZoiBh33+WWnU
         a+W2GXrcvl0bfdfHNs7TmLzC92G0ozqWHyZETHyIxyWEDAWuDnrGqWJ8j+YMRGwehXeG
         y0q5XpVWEI9ziQCI4NP2WSfL4Me4D2twnUMVgfs2Kj9vvC96OLjItFAUIlyBmCcY5PNZ
         WAnA==
X-Gm-Message-State: AOAM531dgRJjdRJAkp8y/VCLLgD75ltV+9qQHooeMKvbN0S6QNiVLRTu
	2gwMDkppA1hRECyCqRkLa2KAahxcI3aoyVJ92UI=
X-Google-Smtp-Source: 
 ABdhPJwsqNf80/FQoiZlbS9yeDkJDpKBW+2ekcxb2Dd/bubtM0zLrd49gYJrzIL+xa31WWwdQLmO0pudNuF4/JhgDEc=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr18345477qtf.660.1638513437995;
 Thu, 02 Dec 2021 22:37:17 -0800 (PST)
MIME-Version: 1.0
References: <1638508918-22365-1-git-send-email-xuhuan.fnst@fujitsu.com>
In-Reply-To: <1638508918-22365-1-git-send-email-xuhuan.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Dec 2021 22:36:52 -0800
Message-ID: 
 <CAMKF1soL5JnT2xx8e8cLwZJ2bKfCgd+aCthBWpPCQ5AJHMKsRg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pycparser: upgrade 2.20 ->
 2.21
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 06:37:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94191

On Thu, Dec 2, 2021 at 9:22 PM xuhuan.fnst@fujitsu.com
<xuhuan.fnst@fujitsu.com> wrote:
>
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> changelog:
> =================================================================
>   - Much improved support for C11 (multiple PRs)
>   - Support for parehthesized compount statements
>   - Support for modern Python versions (3.9 and 3.10)
>   - Fix support for structs with nested enums
>   - Multiple small bug fixes
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>  ...{python3-pycparser_2.20.bb => python3-pycparser_2.21.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pycparser_2.20.bb => python3-pycparser_2.21.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
> rename to meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
> index fde868a701..3b8a9cd206 100644
> --- a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
> @@ -1,10 +1,10 @@
>  SUMMARY = "Parser of the C language, written in pure Python"
>  HOMEPAGE = "https://github.com/eliben/pycparser"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"

why did this checksum change ? can you add that to commit msg via
"License-Update" tag ?

>
> -SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
> -SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
> +SRC_URI[md5sum] = "48f7d743bf018f7bb2ffc5fb976d1492"
> +SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94190): https://lists.openembedded.org/g/openembedded-devel/message/94190
> Mute This Topic: https://lists.openembedded.org/mt/87471515/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

