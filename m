Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FD1C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:43:33 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.20839.1678383809507132270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iQSOLN12;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id bg11so2258985oib.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678383809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl+z7m5SKRTUzEL5+jr9OnZoHIdLer1j4a0aUgPsUEc=;
        b=iQSOLN12Njzt0bEzHQyShAMye8Za2BX9V6QMYHbYnE/JxuzPGrP177oHLa2F9xn/Cg
         wq0HNBPe1r8C/936kBG5cy+4OTfoticlFrCnDbfDvj0yZqRMvapVoTugqG8nOYdrdb9/
         Hcl5FRplLxoaRnhEosGBykM7s78A7FndmuIXSvW6LFLu8aEYVGkzrx/mIZnARag9JK3Q
         3ujxARDgiLlbr1LCIeR0T9uDVNl/d3wre24zw2Ct+CWYftmFOHXQfMybb5cEDKkTCv3/
         YcOPtkqHnefoV5J8ZqeyI3fShvpphXLBqadN4MUObM8oBeBqfcqdDT771NbcBl6Zfh5g
         KEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678383809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hl+z7m5SKRTUzEL5+jr9OnZoHIdLer1j4a0aUgPsUEc=;
        b=KG7dHhX9geE82gvUygCVYHP3/zgsM0LDg/SLUZiBjE9Da3hDq3gPyqkc25xnGD2UTq
         wiMTMmJpEqMlHLSyzE1q/bbTR9EAvRLhsMyh0NT4EfMriymWbNUGDymGV9/H+SJMsrZC
         fatGYs52lcxjJzKngglUnTt+lPE7M9Xm6glOPNnEqC3rtA+sjLm7epxnOQRmGocgdjDj
         /DmUK4mDqmO2O63SLdlEu1b5mK5DZyJ4wnbR3Fow5WNj+kEpsRg1S8XdLIx3nlWi1rrx
         XrzJb5cNm3KUpbamS6z2fdYtoHopNKznWyyMT6ci1rcDgTcqwHbtGkwYHAMxmUW4Fho1
         sT0A==
X-Gm-Message-State: AO0yUKXx1rrGf4QxyqKQPKiYyEyZdQDpwh3kscfmrIW63rfbijJre9Kb
	MQiK7GxAbJwhVYIRQu5VC0/xBmUg0X0/bF4m144=
X-Google-Smtp-Source: AK7set+4vVtDwk5d6RhEdFkihSicPBCW8GOsWbxBanXGUDE+jK9SHWP2o8MpbNWNyN2/p0+tRleYf9NF5ZhZ1g/1BBY=
X-Received: by 2002:a05:6808:199f:b0:37a:2bed:5758 with SMTP id
 bj31-20020a056808199f00b0037a2bed5758mr12472861oib.2.1678383808522; Thu, 09
 Mar 2023 09:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20230309083942.1182203-1-changqing.li@windriver.com>
In-Reply-To: <20230309083942.1182203-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2023 09:43:02 -0800
Message-ID: <CAMKF1sqn6r3sFg77F9=jbFBebmjkJ6QWkaiNVCYTqu4Trx7tkw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] redis: upgrade 7.0.8 -> 7.0.9
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101461

already applied

On Thu, Mar 9, 2023 at 12:39=E2=80=AFAM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-extended/redis/{redis_7.0.8.bb =3D> redis_7.0.9.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/redis/{redis_7.0.8.bb =3D> redis_7.0.9.b=
b} (96%)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.8.bb b/meta-oe/reci=
pes-extended/redis/redis_7.0.9.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_7.0.8.bb
> rename to meta-oe/recipes-extended/redis/redis_7.0.9.bb
> index fe1db9f98..423bc2199 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.0.8.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.ta=
r.gz \
>             file://GNU_SOURCE-7.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
>             "
> -SRC_URI[sha256sum] =3D "06a339e491306783dcf55b97f15a5dbcbdc01ccbde6dc230=
27c475cab735e914"
> +SRC_URI[sha256sum] =3D "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a=
84c6f32a3cfb9f65"
>
>  inherit autotools-brokensep update-rc.d systemd useradd
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101438): https://lists.openembedded.org/g/openembedde=
d-devel/message/101438
> Mute This Topic: https://lists.openembedded.org/mt/97492248/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

