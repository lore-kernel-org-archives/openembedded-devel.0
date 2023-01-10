Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6235C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 06:25:03 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.97921.1673331894619962675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 22:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KjZF80X2;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-14455716674so11226695fac.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 22:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIXewU2IXpQyluw+PUNmC54fqh/DlbbIV2Ynd+vkkxM=;
        b=KjZF80X2RLoF+zu5RFZFLZ70d2yjD4JEs054DVulLBTn3E9gBRY9pkNz9AnA18No+i
         jsbqDbHvacqhnYQwd9+8uTs096pay9xTvLZB0c/jnuA/px7Xh9iDoGaPa0pzJdr/wSdG
         MidCJJsriDMxpEI/lhuZ73yr8kbGBWwWdmsFnEL11US1W6qnlgy4f12kKpWthLSLkuRZ
         NYw1acKzin9u7WVzP/MNM8yAaufS+n7MGrA0ps39B1DSip5LtVdHFfbVfhixRkiAKxA1
         RL/6M/8dYYtLbfvYtWYxUNdQK0X+ZLcZHg6iVywHfiXUHVJuQoIhTu3D5l0I1/RTKcRf
         K3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIXewU2IXpQyluw+PUNmC54fqh/DlbbIV2Ynd+vkkxM=;
        b=YDObKXRasdWEusnjDKn6nuLVMR63Ps8UjVN6Hl9hiS2BGZ6dtZWtqkouXyHsKv6WHr
         Hqy2vJo2+8TZJC+9/Kcl3Yycs36jNZOhWtdaYalFrxAhLno0A0Vc+UolPzQNNq3jeAfu
         0cMjI7RTMttduZ6Y3wHwORkbc2ikbhbmhhp1CylOKKpUX9oYh0IMZ59Uu9Lq6INf6M9R
         oes6y8giDM9fiZJbxIWOPi6kIy7RCveosfdOZYmUcNQ6i/+mcZIWub6yv1o4NVl7nQ4a
         EkAtpzdJz5WduwV/Ot/S6SbpNbDNuNI6Kank7NAoOAgbu5vL+M3hiTSA8y2xzDSa/zJO
         2FgQ==
X-Gm-Message-State: AFqh2kpFlZLB0UZcl6Sbl7bXNc2J/L3MFuiv/QIdlmX08Pd2425HdHGX
	NbSgGcErIKpDKAcE2z7HKgA9Oe0RNH0IBvuYw4GnE5HzM7o=
X-Google-Smtp-Source: AMrXdXu23y6jWBSKrRRZSPc6OqxRgqBovO9V8Xt10hVQL04jWb6jMV/JC3prfuy3Abh8tmTM+0CUxf9U9DieSm0ED48=
X-Received: by 2002:a05:6870:b01d:b0:144:e1eb:419 with SMTP id
 y29-20020a056870b01d00b00144e1eb0419mr5036705oae.262.1673331893811; Mon, 09
 Jan 2023 22:24:53 -0800 (PST)
MIME-Version: 1.0
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com> <1673329158-5189-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1673329158-5189-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2023 22:24:28 -0800
Message-ID: <CAMKF1sqYpa5b3fMJGRJST776-LprzrebvEfo=yJQikw4o0QR4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.12.06 -> 23.1.4
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 06:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100510

On Mon, Jan 9, 2023 at 9:39 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> index c87a449f0..a85c74c12 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> @@ -1,3 +1,3 @@
> -PV = "22.12.06"
> -SRCREV = "acf39ff056df8c9e5bfa32cf6f7b5e6b87a90544"
> +PV = "23.1.4"

here also its good to rename the recipes to reflect PV.

> +SRCREV = "af9ceabeef1a10c1004e2741f8c0c090ca59e5af"
>  SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100500): https://lists.openembedded.org/g/openembedded-devel/message/100500
> Mute This Topic: https://lists.openembedded.org/mt/96171758/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

