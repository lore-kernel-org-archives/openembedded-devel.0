Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319BFC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 18:39:28 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.1049.1677091167337315318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 10:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KxPeL/tF;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id bq17so9025169oib.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 10:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMfzBpPvUKsKw69YgS6Yie7c2paIYxaoegOwxiBsn4Y=;
        b=KxPeL/tFU+twX4SdjnLIP63a/fGlQtyh3VvRBPBbrBBCdSumtmoafDQyNRlTWN8uxx
         anF3JwAtbHvu8q5o+h6D5EzkSTRvjyAVUK1kgHl+E40J6jdDXQIJRhKGcOnzv/tKT/UI
         9ZodO82zX6yILxjRUZaEfdQ7kImfpenll1u9k0aRARAlHatrvV73cZGiVXkLH+zp0rk9
         djZ8M0RyaZYXLBSNunOwKrvrHxFQe685fr+IkzYKMT1FBi/3xVXJ6SaRlhpX8z4Lbxi0
         D+1pv+E+LdpZ0QF+ABkerNlKDut0bngZWK2+9RNiy02k/dQuMJGQ6HyPNPmfWhe/h5y2
         DDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMfzBpPvUKsKw69YgS6Yie7c2paIYxaoegOwxiBsn4Y=;
        b=mnwPPFFBOZSzXEk85fbYg6twBDNYruASP0GYc0eCnKN2hNpIRfCcDH2Aa0lK2R7ovP
         7e22yxCqOmh744I0m95ULIrcPNG6gCQdtxXMCkDNeSGq7sNCrdm0oXsBFaVZCWs4ipGW
         1KNR9FBNJkK4MG1HEdMwjYBoLtmalRfZgYt5qhz4hRyPSLoTfU/QsCsgBVbYPCuTuh4G
         ORmBh3Nmla/yvPegG2WCdY2POhWq7++I7HgX24BngMCfU7zsmOgY3B+8sA2TH1yDdRw1
         Ips8hgnNYDHM4CfZOW7dIz4KtDzzLlVaH1y2B7w4oU3mN+DKXFmqIygdr2cbr4PIRTl5
         7lIg==
X-Gm-Message-State: AO0yUKXvTGbA0iiWn+e09K9gGav6Gkvq3WBETLYzDTr4sTphgWdeC2wI
	mVeoQEZkVBjeuWSHQogPF1UQ2jr7ov/PRUsAiuU=
X-Google-Smtp-Source: AK7set+Rx4syqa9AHcgGwGraV1W0kR2IqggV99cw+4jp8FlTBbUj/2fBIXmRZ0BsVdj0G/EHSUjD3Xp0+d6UabuLiYg=
X-Received: by 2002:a05:6808:331a:b0:37b:592b:ec39 with SMTP id
 ca26-20020a056808331a00b0037b592bec39mr1175075oib.262.1677091165101; Wed, 22
 Feb 2023 10:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20230222165122.1489645-1-JPEWhacker@gmail.com>
In-Reply-To: <20230222165122.1489645-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 10:38:59 -0800
Message-ID: <CAMKF1soNgg3y_4-MXpCQKOL1_Yh356ufU9H7WOvU0dC3u=SQaQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libvpx: Explicitly link with pthread support
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 18:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101220

On Wed, Feb 22, 2023 at 8:51 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Some platforms (e.g. x86) require that the build (host) tools be
> explicitly linked with -pthread to link against the pthread libraries so
> do that here.
>

what is the underlying reason ? does it need some sort of cancellation support ?
maybe add build error snippet to commit to expand on it a bit.

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
> index 066d7cc81..9c04c2a34 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
> @@ -19,6 +19,7 @@ S = "${WORKDIR}/git"
>  ARM_INSTRUCTION_SET = "arm"
>
>  CFLAGS += "-fPIC"
> +BUILD_LDFLAGS += "-pthread"
>
>  export CC
>  export LD = "${CC}"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101217): https://lists.openembedded.org/g/openembedded-devel/message/101217
> Mute This Topic: https://lists.openembedded.org/mt/97163975/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

