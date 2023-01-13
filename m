Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABA8C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:01:46 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.93391.1673629302600142713
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o285BP5E;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id x25-20020a056830115900b00670932eff32so12542122otq.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 09:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kVCJsW9Rq7rlZik9eKwIx0xq1aE0C1hE4j/IwEeuuiE=;
        b=o285BP5EeDQK1gdshjb8zrKdf0DtiPGE1KYtXTzIbEXnUEEkQEkSaX4Zzc7it3Q1ao
         lNh0a7JPW/uF8IIrGwWwMgT2kd00xPGhu/G+78W7kN9uAtBISDyINFN8fYnxD9YCjN1Y
         Gj1oI7HU4GREPtv80xda44/I9xnFXWuHN253b15O5YgPTRhM9w+FzB1ECe0GG4htvyFV
         ueIgNf2zbkBWas6zpGRcQx49YzlqlhJq+ptT1wcKYaAmaRBor9Cq90UN5qU0V0e1X8jA
         wZD5bH0Ml90PMkblHqOb7q6S2OUvvzojoXH4BmNJcZbWHlr//fq8EmY19wlSZnSxdUIa
         syDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVCJsW9Rq7rlZik9eKwIx0xq1aE0C1hE4j/IwEeuuiE=;
        b=Gw80Co2xiQNrhdk9AGNrUyqzIv1eCiEYeLKq+v2JYknRFKn4g1vl9kuQwk/EmWhli2
         NypT9o8UUP/xfQM57UTwuDX5UHLzwW1wp5xVi0ruTemWCJ+VmMy8ZVbP9s4oJ/0IGtxo
         toj297/fCsS3gDyi4ZzQGp93Z88zkzPfpQG2EYkcKUJFXUbEeF1XxpNrzsuiWPrD6Cbb
         s9YT72prwUpYoW2ykIPqzM7glhgruiIBbrYJHuWd7U7v+n2W5bnFfvokmukJVS+Tj07E
         MwUV597ssUk9hM1aORHeqJTVF5YeYxUnx4v2tBWyfJsvqYiVjl5T8IpfgbdMK0ZChK63
         W+Qw==
X-Gm-Message-State: AFqh2kqrUoL3lc89bcF9oAlwpZ7pSObH9z7NKQpOH56/MufdK+fOmPf+
	Ufpa2gKxYzCsAsTMOtLkpCJQFCVhJKddznHbNNg=
X-Google-Smtp-Source: AMrXdXuAtDAjNepxNN7eyr/Y7DAJGr/4IF7/bX1tlW0PrG7nKV+tVdHhf4M8qW7VMjdswl/zpUJDA2MfpUcMm1PDP+k=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr4924022otk.111.1673629301201; Fri, 13
 Jan 2023 09:01:41 -0800 (PST)
MIME-Version: 1.0
References: <20230113122629.1300116-1-ross.burton@arm.com>
In-Reply-To: <20230113122629.1300116-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jan 2023 09:01:15 -0800
Message-ID: <CAMKF1sqqPAURqVn5wPcKkNzrNVLT2892X5rOkx1C_NRFRviu5g@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-pytest-forked: update for move from
 picobuild to build
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 17:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100565

On Fri, Jan 13, 2023 at 4:26 AM Ross Burton <ross.burton@arm.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-devtools/python/python3-pytest-forked_1.4.0.bb       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
> index 34dd9c407e..e6ef84d05c 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
> @@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "8b67587c8f98cbbadfdd804539ed5455b6ed03802203485dd2f53c1422
>  inherit pypi python_setuptools_build_meta
>
>  PEP517_PICOBUILD_OPTS = "--loose-depends"

Do we need this option after picobuild is dropped. ?

> +PEP517_BUILD_OPTS = "--skip-dependency-check"
>
>  DEPENDS += "python3-setuptools-scm-native"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100562): https://lists.openembedded.org/g/openembedded-devel/message/100562
> Mute This Topic: https://lists.openembedded.org/mt/96244596/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

