Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D609C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:40:31 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.60.1667839222358198151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 08:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AQRV85zH;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13be3ef361dso13241870fac.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhJulASNEKTVC20zkAHKmbb6dUZpV5zE5O6YIqud+ls=;
        b=AQRV85zHPsgwXSlnE+eZq/wRFbOJXgs1uUEOf2n+KUPDEK9LVnZpVp+2fUuXC1qwgB
         r+s1srO2pQP/DPOM34ZO+zo25NAAHQHQqXe3foyhfdVWM9wYIx+wqipSF4S4Oi3nYxdt
         AviJS9k0g7YyXATLWbZWenLptR9wdqcEdfuqXVlgn/284Tquuu0Ofb7nMbdWuLhMZ+C2
         /h94/4tnYcGSRc8Y+k4tbw79CRo36p2tveKmCeZUNy+Uw8bgQpe+dP1Yx8eW7WGVL1RZ
         aBb32kfpK0GumcjAle521p+wIf0cqzRzK6sc0rKjIp/jI4bu48XriOxa8gKWuTE8FbP1
         z3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhJulASNEKTVC20zkAHKmbb6dUZpV5zE5O6YIqud+ls=;
        b=PMB/4yWH6rTC/NUhET018fw14f356nRBLAcoDfJ96R76xxqlfm3omDq6ukY6K46FoT
         KUK30Iauywou37z2948N+BvgUOSli3qoLYbH8fuj642pxM2ewRuRzQN8lKIlPKfe4eOX
         F1Z/CQEOFnfvf1XgQ8P2JX5qdmkCUfJTmP3nW7rjZGURpZUi9OTTvO/t3MIWoafFtzsW
         4nAJj2xwPrYUewD+iRzyA2zSVfA9sbQBow1afgq/E9D85D3N0YMH+X3Ykwv0sZC24+YX
         aseTjOx8ejf8rK/qalDkF2XAnbEm57FKYJZnAKMaultMspTAk4VgWnLAhQhu+ySKg75r
         QaEg==
X-Gm-Message-State: ACrzQf21YeEWpagehpACceTYPBmQbH5EfF4Wfvmfozmd0GqFW01SjGjN
	jrXohQoWyL3631AL2HKP2xZvDDsKb8v2q0Nc1Yjn11fAYQU=
X-Google-Smtp-Source: AMsMyM7723etubL2DVB0Y0Cmu/9iJmT8Li9/KRXCQLWKaWlR3yO3ut9MyT/Zg8Anc0S2FRghVygbX75Ihl9e2OYMFCs=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr39457735oae.262.1667839221626; Mon, 07
 Nov 2022 08:40:21 -0800 (PST)
MIME-Version: 1.0
References: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com> <1667268408-9931-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1667268408-9931-5-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 08:39:55 -0800
Message-ID: <CAMKF1sq21yNa_1fiMZYpe7xzpKgMaYPm3oggbPP4DdBfp8x2Hg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-jsonref: upgrade 0.3.0 -> 1.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 16:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99475

I have dropped this in favor of later patch which goes 0.3.0 -> 1.0.1

On Mon, Oct 31, 2022 at 7:07 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-jsonref_0.3.0.bb => python3-jsonref_1.0.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python-jsonref/{python3-jsonref_0.3.0.bb => python3-jsonref_1.0.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
> rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.0.bb
> index 4daaf521fc..caa8b60250 100644
> --- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
> +++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gazpachoking/jsonref"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
>
> -SRC_URI[sha256sum] = "68b330c6815dc0d490dbb3d65ccda265ddde9f7856fd2f3322f971d456ea7549"
> +SRC_URI[sha256sum] = "db1ab1faa75a5ffaa2693104a7deb23471c716fb2edc4db27b7408bf90dff157"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99386): https://lists.openembedded.org/g/openembedded-devel/message/99386
> Mute This Topic: https://lists.openembedded.org/mt/94701241/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

